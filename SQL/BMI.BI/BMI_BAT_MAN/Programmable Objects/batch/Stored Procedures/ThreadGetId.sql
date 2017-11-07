IF OBJECT_ID('[batch].[ThreadGetId]') IS NOT NULL
	DROP PROCEDURE [batch].[ThreadGetId];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   procedure [batch].[ThreadGetId]
(
@ThreadName varchar(255),
@StepId  int,
@MappingConfigTaskId int,
@ThreadId int = null out 
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
FUNCTION NAME:  batch.ThreadGetId
DESCRIPTION:    Creates an entry for the specified  thread if not already present then outputs the Id
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
		if coalesce(@ThreadName, '') = '' raiserror('Thread Name input must not be null or empty', 16, 1);
		if coalesce(@MappingConfigTaskId, 0) !> 0 raiserror('Mapping Config Task Id must be greater than zero', 16, 1);
		if coalesce(@StepId, 0) !> 0 raiserror('Step Id must be greater than zero', 16, 1);

		--! As we have multiple steps, if there no outer transaction,
		--! use an explicit transaction from this point forward     
		if @_TxnIsExternal = 0 begin tran;

		set @_Step = 'Get Id';
		select @ThreadId = ThreadId from [batch].[Thread] where ThreadName = @ThreadName ;

		if @ThreadId is null
			begin
				set @_Step = 'Add Missing';

				set @ThreadId = coalesce((select max(ThreadId) from batch.Thread) + 1, 1) ;
				insert batch.Thread(ThreadId, ThreadName, StepId) values (@ThreadId, @ThreadName, @StepId);
			end

		--!
		--! Only commit transactions started within this procedure
		--!
		if @_TxnIsExternal = 0 and (xact_state() = 1 or @@trancount > 0) commit tran ;
	end try
	begin catch
		set @_ErrorContext = 
		
		'Failed to get Thread Id for thread: ' + coalesce('"' + @ThreadName + '"', 'NULL')
				+ ' and  Step Id: ' + coalesce(cast(@StepId as varchar(16)), 'NULL')
				+ ' at step: [' + coalesce(@_Step, 'NULL') + ']'
				+  ')' ;

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
