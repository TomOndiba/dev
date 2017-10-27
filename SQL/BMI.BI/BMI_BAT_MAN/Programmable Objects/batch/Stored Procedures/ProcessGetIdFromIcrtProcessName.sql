IF OBJECT_ID('[batch].[ProcessGetIdFromIcrtProcessName]') IS NOT NULL
	DROP PROCEDURE [batch].[ProcessGetIdFromIcrtProcessName];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [batch].[ProcessGetIdFromIcrtProcessName]
(
  @IcrtProcessName varchar(100)
, @BatchProcessName varchar(100) = null
, @BatchProcessId int = null out
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
FUNCTION NAME:  batch.ProcessGetIdFromIcrtProcessName
DESCRIPTION:    Outputs the Id for the Batch Process indicated by the specified ICRT Process (creating a new entry
				if not found)
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    03-AUG-2017

Additional Notes
================

REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		03-AUG-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------

**********************************************************************************************************************/
--</CommentHeader>

begin
	set nocount on;

	--! Standard/ExceptionHandler variables
	declare	@_FunctionName nvarchar(255) = quotename(object_schema_name(@@procid)) + '.' + quotename(object_name(@@procid));
	declare	@_Error int = 0;
	declare @_RowCount int = 0;
	declare	@_ErrorContext nvarchar(512);
	declare	@_Message nvarchar(512);
	declare	@_Step varchar(128);

	--! Find out if we are already in a transaction
	declare	@_TxnIsExternal bit = case when @@trancount > 0 then 1 else 0 end;

	begin try
		set @_Step = 'Validate Inputs';
		if coalesce(@IcrtProcessName, '') = '' raiserror('ICRT Process Name input must not be null or empty', 16, 1);

		--! We need to allow a Batch Process name to be provided but if it isn't, use the ICRT Process Name
		set @BatchProcessName = isnull(nullif(@BatchProcessName, ''), @IcrtProcessName);

		--! As we have multiple steps, if there no outer transaction,
		--! use an explicit transaction from this point forward 
		if @_TxnIsExternal = 0 begin tran;

		set @_Step = 'Get Id';
		select @BatchProcessId = BatchProcessId from batch.Process where IcrtProcessName = @IcrtProcessName ;

		if @BatchProcessId is null
			begin
				set @_Step = 'Add Missing';

				set @BatchProcessId = coalesce((select max(BatchProcessId) from batch.Process) + 1, 1) ;
				insert batch.Process(BatchProcessId, BatchProcessName, IcrtProcessName) values (@BatchProcessId, @BatchProcessName, @IcrtProcessName);
				
			end

		--!
		--! Only commit transactions started within this procedure
		--!
		if @_TxnIsExternal = 0 and (xact_state() = 1 or @@trancount > 0) commit tran ;
	end try
	begin catch
		set @_ErrorContext = 'Failed to get Batch Process Id for ICRT process: ' + coalesce('"' + @IcrtProcessName + '"', 'NULL')
				+ ' at step: [' + coalesce(@_Step, 'NULL') + ']'
				+ ' (Process Id: ' + coalesce(cast(@BatchProcessId as varchar(16)), 'NULL') + ')' ;

		--! If we have an uncommittable transaction (see BOL), or a deadlock we can't
		--! do anything else until we roll that back. Alternatively, if we started
		--! the transaction we should roll it back otherwise or let the caller handle
		--! its own external txn 
		if (xact_state() = -1) or (xact_state() = 1 and error_number() = 1205) or (xact_state() = 1 and @_TxnIsExternal = 0)
			begin


			select 'roll'
				--rollback tran;
				set @_ErrorContext = @_ErrorContext + ' (Forced roll back all changes)';
			end

		exec log4.ExceptionHandler
				  @ErrorContext   = @_ErrorContext
				, @ErrorProcedure = @_FunctionName
				, @ErrorNumber    = @_Error out
				, @ReturnMessage  = @_Message out
		;
	end catch

--/////////////////////////////////////////////////////////////////////////////////////////////////
EndEx:
--/////////////////////////////////////////////////////////////////////////////////////////////////

	--! Finally, throw an exception that will be detected by the caller
	if @_Error > 0 raiserror(@_Message, 16, 99);

	set nocount off;

	--! Return the value of @@ERROR (which will be zero on success)
	return (@_Error);
end
GO
EXEC sp_addextendedproperty N'MS_Description', N'Outputs the Id for the Batch Process indicated by the specified ICRT Process (creating a new entry if not found)', 'SCHEMA', N'batch', 'PROCEDURE', N'ProcessGetIdFromIcrtProcessName', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Optional output, the database-specific unique identifier for batch process that is managed/run by the specified ICRT process', 'SCHEMA', N'batch', 'PROCEDURE', N'ProcessGetIdFromIcrtProcessName', 'PARAMETER', N'@BatchProcessId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Optional, the user-friendly name for a Batch Process', 'SCHEMA', N'batch', 'PROCEDURE', N'ProcessGetIdFromIcrtProcessName', 'PARAMETER', N'@BatchProcessName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, the unique physical name of the ICRT process that is responsible for running a batch', 'SCHEMA', N'batch', 'PROCEDURE', N'ProcessGetIdFromIcrtProcessName', 'PARAMETER', N'@IcrtProcessName'
GO
