IF OBJECT_ID('[ics].[IcrtSubProcessGetId]') IS NOT NULL
	DROP PROCEDURE [ics].[IcrtSubProcessGetId];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [ics].[IcrtSubProcessGetId]
(
  @IcrtSubProcessName varchar(100)
, @BatchProcessId int
, @IcrtSubProcessId int = null out
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
FUNCTION NAME:  ics.IcrtSubProcessGetId
DESCRIPTION:    Creates an entry for the specified ICRT sub-process if not already present then outputs the Id
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    02-AUG-2017

Additional Notes
================

REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		02-AUG-2017		GML		N/A		Created
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
		if coalesce(@IcrtSubProcessName, '') = '' raiserror('ICRT Sub-process Name input must not be null or empty', 16, 1);
		if coalesce(@BatchProcessId, 0) !> 0 raiserror('Batch Process Id (derived from ICRT process name) must be greater than zero', 16, 1);

		--! As we have multiple steps, if there no outer transaction,
		--! use an explicit transaction from this point forward 
		if @_TxnIsExternal = 0 begin tran;

		set @_Step = 'Get Id';
		select @IcrtSubProcessId = IcrtSubProcessId from ics.IcrtSubProcess where IcrtSubProcessName = @IcrtSubProcessName ;

		if @IcrtSubProcessId is null
			begin
				set @_Step = 'Add Missing';

				set @IcrtSubProcessId = coalesce((select max(IcrtSubProcessId) from ics.IcrtSubProcess) + 1, 1) ;
				
				insert ics.IcrtSubProcess(IcrtSubProcessId, IcrtSubProcessName, BatchProcessId) values (@IcrtSubProcessId, @IcrtSubProcessName, @BatchProcessId);
			end

		--!
		--! Only commit transactions started within this procedure
		--!
		if @_TxnIsExternal = 0 and (xact_state() = 1 or @@trancount > 0) commit tran ;
	end try
	begin catch
		set @_ErrorContext = 'Failed to get Id for IcrtSubProcess: ' + coalesce('"' + @IcrtSubProcessName + '"', 'NULL')
				+ ' and Batch Process Id: ' + coalesce(cast(@BatchProcessId as varchar(16)), 'NULL')
				+ ' at step: [' + coalesce(@_Step, 'NULL') + ']'
				+ ' (IcrtSubProcess Id: ' + coalesce(cast(@IcrtSubProcessId as varchar(16)), 'NULL') + ')' ;

		--! If we have an uncommittable transaction (see BOL), or a deadlock we can't
		--! do anything else until we roll that back. Alternatively, if we started
		--! the transaction we should roll it back otherwise or let the caller handle
		--! its own external txn 
		if (xact_state() = -1) or (xact_state() = 1 and error_number() = 1205) or (xact_state() = 1 and @_TxnIsExternal = 0)
			begin
				rollback tran;
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
EXEC sp_addextendedproperty N'MS_Description', N'Database-specific unique identifier for the batch process that is associated with the (master) process of this sub-process', 'SCHEMA', N'ics', 'PROCEDURE', N'IcrtSubProcessGetId', 'PARAMETER', N'@BatchProcessId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Creates an entry for the specified ICRT sub-process if not already present then outputs the Id', 'SCHEMA', N'ics', 'PROCEDURE', N'IcrtSubProcessGetId', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database-specific unique identifier for an ICRT sub-process', 'SCHEMA', N'ics', 'PROCEDURE', N'IcrtSubProcessGetId', 'PARAMETER', N'@IcrtSubProcessId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The unique physical name of the ICRT sub-process', 'SCHEMA', N'ics', 'PROCEDURE', N'IcrtSubProcessGetId', 'PARAMETER', N'@IcrtSubProcessName'
GO
