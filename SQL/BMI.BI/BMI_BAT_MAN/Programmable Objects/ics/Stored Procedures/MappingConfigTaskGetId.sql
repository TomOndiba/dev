IF OBJECT_ID('[ics].[MappingConfigTaskGetId]') IS NOT NULL
	DROP PROCEDURE [ics].[MappingConfigTaskGetId];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [ics].[MappingConfigTaskGetId]
(
  @MappingConfigTaskName varchar(100)
, @MappingName varchar(100)
, @MappingConfigTaskId int = null out
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
FUNCTION NAME:  ics.MappingConfigTaskGetId
DESCRIPTION:    Creates an entry for the specified ICS Mapping Config Task if not already present then outputs the Id
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
		if coalesce(@MappingConfigTaskName, '') = '' raiserror('Mapping Config Task Name input must not be null or empty', 16, 1);
		if coalesce(@MappingName, '') = '' raiserror('Mapping Name input must not be null or empty', 16, 1);

		--! As we have multiple steps, if there no outer transaction,
		--! use an explicit transaction from this point forward 
		if @_TxnIsExternal = 0 begin tran;

		set @_Step = 'Get Id';
		select @MappingConfigTaskId = MappingConfigTaskId from ics.MappingConfigTask where MappingConfigTaskName = @MappingConfigTaskName and MappingName = @MappingName;

		if @MappingConfigTaskId is null
			begin
				set @_Step = 'Add Missing';

				set @MappingConfigTaskId = coalesce((select max(MappingConfigTaskId) from ics.MappingConfigTask) + 1, 1) ;
				
				insert ics.MappingConfigTask(MappingConfigTaskId, MappingConfigTaskName, MappingName) values (@MappingConfigTaskId, @MappingConfigTaskName, @MappingName);
			end

		--!
		--! Only commit transactions started within this procedure
		--!
		if @_TxnIsExternal = 0 and (xact_state() = 1 or @@trancount > 0) commit tran ;
	end try
	begin catch
		set @_ErrorContext = 'Failed to get Id for MappingConfigTask: ' + coalesce('"' + @MappingConfigTaskName + '"', 'NULL')
				+ ' and Mapping: ' + coalesce('"' + @MappingName + '"', 'NULL')
				+ ' at step: [' + coalesce(@_Step, 'NULL') + ']'
				+ ' (MappingConfigTask Id: ' + coalesce(cast(@MappingConfigTaskId as varchar(16)), 'NULL') + ')' ;

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
EXEC sp_addextendedproperty N'MS_Description', N'Creates an entry for the specified ICS Mapping Config Task if not already present then outputs the Id', 'SCHEMA', N'ics', 'PROCEDURE', N'MappingConfigTaskGetId', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database-specific unique identifier for an ICS Mapping Config Task', 'SCHEMA', N'ics', 'PROCEDURE', N'MappingConfigTaskGetId', 'PARAMETER', N'@MappingConfigTaskId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The unique physical name of the ICS Mapping Config Task', 'SCHEMA', N'ics', 'PROCEDURE', N'MappingConfigTaskGetId', 'PARAMETER', N'@MappingConfigTaskName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The physical name of the ICS Mapping contained in the ICS MappingsConfig Task', 'SCHEMA', N'ics', 'PROCEDURE', N'MappingConfigTaskGetId', 'PARAMETER', N'@MappingName'
GO
