IF OBJECT_ID('[batch].[StepGetId]') IS NOT NULL
	DROP PROCEDURE [batch].[StepGetId];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   procedure [batch].[StepGetId]
(
  @IcrtSubProcessId int
, @BatchProcessId int
,@StepName  varchar(100)
, @StepId int = null out
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
FUNCTION NAME:  batch.StepGetId
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
		if coalesce(@IcrtSubProcessId, 0) = 0 raiserror('ICRT Sub Process Id input must not be null or zero', 16, 1);
		if coalesce(@BatchProcessId, 0) = 0 raiserror('Batch Process Id input must not be null or zero', 16, 1);
	

		--! As we have multiple steps, if there no outer transaction,
		--! use an explicit transaction from this point forward 
		if @_TxnIsExternal = 0 begin tran;

		set @_Step = 'Get Id';
		select @StepId = StepId from batch.Step where IcrtSubProcessId=@IcrtSubProcessId 
 and BatchProcessId= @BatchProcessId;

 		if @StepId is null
			begin
				set @_Step = 'Add Missing';

				set @StepId = coalesce((select max(@StepId) from batch.Step) + 1, 1) ;
				insert batch.Step
				(
					StepId
				  , StepName
				  , BatchProcessId
				  , IcrtSubProcessId
				  , Narrative
				  , IsDisabled
				)
				values
				(
					@StepId		-- StepId - int
				  , @StepName		-- StepName - varchar(100)
				  , @BatchProcessId		-- BatchProcessId - int
				  , @IcrtSubProcessId		-- IcrtSubProcessId - int
				  , ''		-- Narrative - varchar(500)
				  , 0	-- IsDisabled - bit
				) 
				
			end

		--!
		--! Only commit transactions started within this procedure
		--!
		if @_TxnIsExternal = 0 and (xact_state() = 1 or @@trancount > 0) commit tran ;
	end try
	begin catch
		set @_ErrorContext = 'Failed to get Sub Process Id for ICRT sub process: ' + coalesce('"' + @StepName + '"', 'NULL')
				+ ' at step: [' + coalesce(@_Step, 'NULL') + ']'
				+ ' (Process Id: ' + coalesce(cast(@BatchProcessId as varchar(16)), 'NULL') + ')' ;

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
