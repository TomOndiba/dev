IF OBJECT_ID('[IcsApp].[StopRun]') IS NOT NULL
	DROP PROCEDURE [IcsApp].[StopRun];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [IcsApp].[StopRun]
(
--! ICRT/ICS common/mandatory inputs
  @ProcessName varchar(100)
, @IcrtProcessId int 
, @EndState varchar(16)
, @EndMessage varchar(500) = null
--! ICRT master Process level inputs
, @ProcessRunId int = null
--! ICRT Sub-process level inputs
, @SubProcessName varchar(100) = null
, @SubProcessRunId int = null
--! ICRT/ICS Thread level inputs
, @MappingConfigTaskName varchar(100) = null
, @MappingName varchar(100) = null
, @ThreadRunId int = null
, @SuccessSourceRows int = null
, @FailedSourceRows int = null
, @SuccessTargetRows int = null
, @FailedTargetRows int = null
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		IcsApp.StopRun
DESCRIPTION:		ICRT interface/wrapper for ics.ProcessRunStart/SubProcessRunStart/ThreadRunStart
ORIGIN DATE:		04-AUG-2017
ORIGINAL AUTHOR:	Greg M. Lucas

Returns
=======
@@Error - always zero on success

Additional Notes
================
Stubs 

REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		04-AUG-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------

**********************************************************************************************************************/
--</CommentHeader>

begin
	set nocount on;

	--! Standard/ExceptionHandler variables
	declare	@_FunctionName nvarchar(255) = quotename(object_schema_name(@@procid)) + '.' + quotename(object_name(@@procid));
	declare	@_Error int = 0;
	declare @_RowCount int = 0;
	declare @_ReturnValue int = 0;
	declare	@_Message nvarchar(512);
	declare	@_ErrorContext nvarchar(512);
	declare	@_Step varchar(128);
	declare	@_ExceptionId int;

	/*===================================================================================================================*/
	/**/	--! JournalWriter variables
	/**/	declare	@_SprocStartTime datetime = getdate()
	/**/	declare	@_StepStartTime datetime
	/**/	declare	@_StepEndTime datetime
	/**/	declare	@_ProgressMessage varchar(2000)
	/**/	declare @_ProgressLog varchar(max);
	/**/	
	/**/	set @_ProgressMessage = @_FunctionName
	/**/		+ ' starting at ' + coalesce(convert(varchar(24), @_SprocStartTime, 120), '') + ' with inputs: '
	/**/		--! ICRT/ICS common/mandatory inputs
	/**/		+ char(10) + '    ICRT Process Name            : ' + coalesce(@ProcessName, 'NULL')
	/**/		+ char(10) + '    ICRT Process Id	           : ' + coalesce(cast(@IcrtProcessId as varchar(32)), 'NULL') 
	/**/		+ char(10) + '    End State                    : ' + coalesce(@EndState, 'NULL')
	/**/		+ char(10) + '    End Message                  : ' + coalesce(@EndMessage, 'NULL')
	/**/		--! ICRT master Process level inputs
	/**/		+ char(10) + '    Process Run Id	           : ' + coalesce(cast(@ProcessRunId as varchar(32)), 'NULL')
	/**/		--! ICRT Sub-process level inputs
	/**/		+ char(10) + '    ICRT Sub-process Name        : ' + coalesce(@SubProcessName, 'NULL')
	/**/		+ char(10) + '    Sub-process Id	           : ' + coalesce(cast(@SubProcessRunId as varchar(32)), 'NULL')
	/**/		--! ICRT/ICS Thread level inputs
	/**/		+ char(10) + '    ICS Mapping Config Task Name : ' + coalesce(@MappingConfigTaskName, 'NULL')
	/**/		+ char(10) + '    ICS Mapping Name             : ' + coalesce(@MappingName, 'NULL')
	/**/		+ char(10) + '    Thread Run Id                : ' + coalesce(cast(@ThreadRunId as varchar(32)), 'NULL')
	/**/		+ char(10) + '    Success Source Rows          : ' + coalesce(cast(@SuccessSourceRows as varchar(32)), 'NULL')
	/**/		+ char(10) + '    Failed Source Rows           : ' + coalesce(cast(@FailedSourceRows as varchar(32)), 'NULL')
	/**/		+ char(10) + '    Success Target Rows          : ' + coalesce(cast(@SuccessTargetRows as varchar(32)), 'NULL')
	/**/		+ char(10) + '    Failed Target Rows           : ' + coalesce(cast(@FailedTargetRows as varchar(32)), 'NULL')
	/**/
	/**/	set @_ProgressLog = @_ProgressMessage;
	/*===================================================================================================================*/


	begin try
		set @_Step = 'Validate Inputs';

		--! ICRT Process name, ICRT Process Id and End State are required on all calls
		if isnull(@ProcessName, '') = '' raiserror ('ICRT Process Name input must not be null or empty',16,1)
		if isnull(@IcrtProcessId, 0) !> 0 raiserror ('ICRT Process Id must not be null, negative or zero',16,1)
		if isnull(@EndState, '') not in ('SUCCEEDED', 'FAILED', 'SKIPPED', 'STOPPED')
			raiserror('End State value can only be "SUCCEEDED", "FAILED", "SKIPPED", "STOPPED"', 16, 1) ;

		--! Define default values for any remaining inputs
		set @EndMessage = coalesce(@EndMessage, '')

		--! (NB: We test thread inputs before sub-process to ensure the correct error is thrown regardless of which sub-process values are provided)
		if len(@MappingConfigTaskName) > 0
			begin
				--! If the ICS Mapping Config Task name is populated then we are ending an open thread run (BAT_MAN) Thread Run Id becomes mandatory
				if isnull(@ThreadRunId, 0) !> 0
					raiserror('(BatMan) Thread Run Id can not be null, negative or zero when ending an open thread for MCT: "%s"', 16, 1, @MappingConfigTaskName);

				--! Similarly, if we are closing a thread, the source and target row counts are also mandatory (although can be zero)
				if not (isnull(@SuccessSourceRows, -1) >= 0)
					raiserror('Source Success row count can not be null or negative when closing an open thread for MCT: "%s" <<%i>>', 16, 1, @MappingConfigTaskName, @SuccessSourceRows);

				if not (isnull(@FailedSourceRows, -1) >= 0)
					raiserror('Failed Source row count can not be null or negative when closing an open thread for MCT: "%s" <<%i>>', 16, 1, @MappingConfigTaskName, @FailedSourceRows);

				if not (isnull(@SuccessTargetRows, -1) >= 0)
					raiserror('Target Success row count can not be null or negative when closing an open thread for MCT: "%s" <<%i>>', 16, 1, @MappingConfigTaskName, @SuccessTargetRows);

				if not (isnull(@FailedTargetRows, -1) >= 0)
					raiserror('Failed Target row count can not be null or negative when closing an open thread for MCT: "%s" <<%i>>', 16, 1, @MappingConfigTaskName, @FailedTargetRows);

				/*===================================================================================================================*/
				/**/	set @_ProgressLog = coalesce(@_ProgressLog, '') + 'initiating call to ics.SubProcessRunEnd...' ;
				/*===================================================================================================================*/
				
				set @_Step = 'End Thread';

				exec ics.ThreadRunEnd
					  @MappingConfigTaskName = @MappingConfigTaskName
					, @MappingName = @MappingName
					, @ThreadRunId = @ThreadRunId
					, @EndState = @EndState
					, @EndMessage = @EndMessage
					, @SuccessSourceRows = @SuccessSourceRows
					, @FailedSourceRows = @FailedSourceRows
					, @SuccessTargetRows = @SuccessTargetRows
					, @FailedTargetRows = @FailedTargetRows
			end
		else if len(@SubProcessName) > 0
			begin
				--! If the ICRT Sub-process Name is populated and the MCT name is null/empty, then we must be
				--! closing an open sub-process run and the (BAT_MAN) Sub-rocess Run Id becomes mandatory

				if isnull(@SubProcessRunId, 0) !> 0
					raiserror('(BatMan) Sub-process Run Id can not be null, negative or zero when ending an open sub-process: "%s"', 16, 1, @SubProcessName);

				/*===================================================================================================================*/
				/**/	set @_ProgressLog = coalesce(@_ProgressLog, '') + 'initiating call to ics.SubProcessRunEnd...' ;
				/*===================================================================================================================*/
				
				set @_Step = 'End Sub-process';

				exec ics.SubProcessRunEnd
					  @ProcessName = @ProcessName
					, @SubProcessName = @SubProcessName
					, @SubProcessRunId = @SubProcessRunId
					, @EndState = @EndState
					, @EndMessage = @EndMessage
			end
		else
			begin
				--! If the ICRT Sub-process Name and MCT name are both null/empty, then we must be closing
				--! an open (master) process run and the (BAT_MAN) Process Run Id becomes mandatory
				if isnull(@ProcessRunId, 0) !> 0
					raiserror('(BatMan) Process Run Id can not be null, negative or zero when ending an open process: "%s"', 16, 1, @ProcessName);

				/*===================================================================================================================*/
				/**/	set @_ProgressLog = coalesce(@_ProgressLog, '') + 'initiating call to ics.ProcessRunEnd...' ;
				/*===================================================================================================================*/
				
				set @_Step = 'End Process';

				exec ics.ProcessRunEnd
					  @ProcessName = @ProcessName
					, @ProcessRunId = @ProcessRunId
					, @EndState = @EndState
					, @EndMessage = @EndMessage
			end

		/*===================================================================================================================*/
		/**/	set @_Message = 'Successfully recorded end of run for ICRT Process: ' + coalesce('"' + @ProcessName + '"', 'NULL')
		/**/		+ ', ICRT Sub-Process: ' + coalesce('"' + @SubProcessName + '"', 'NULL')
		/**/		+ ' and MCT Name: ' + coalesce('"' + @MappingConfigTaskName + '"', 'NULL')
		/**/		+ ' with End State: ' + coalesce('[' + @EndState + ']', 'NULL')
		/*===================================================================================================================*/
	end try
	
	begin catch
		set @_ErrorContext = 'Failed to record end of run for ICRT Process: ' + coalesce('"' + @ProcessName + '"', 'NULL')
			+ ', ICRT Sub-Process: ' + coalesce('"' + @SubProcessName + '"', 'NULL')
			+ ' and MCT Name: ' + coalesce('"' + @MappingConfigTaskName + '"', 'NULL')
			+ ' at step: ' + coalesce('[' + @_Step + ']', 'NULL')
			+ ' with End State: ' + coalesce('[' + @EndState + ']', 'NULL')

		exec log4.ExceptionHandler
				  @ErrorContext   = @_ErrorContext
				, @ErrorProcedure = @_FunctionName
				, @ErrorNumber    = @_Error out
				, @ReturnMessage  = @_Message out
				, @ExceptionId    = @_ExceptionId out

	end catch
	
--/////////////////////////////////////////////////////////////////////////////////////////////////
EndEx:
--/////////////////////////////////////////////////////////////////////////////////////////////////

	/*===================================================================================================================*/
	/**/	exec log4.JournalWriter
	/**/		  @Task = 'POC'
	/**/		, @FunctionName = @_FunctionName
	/**/		, @StepInFunction = @_Step
	/**/		, @MessageText = @_Message
	/**/		, @ExtraInfo = @_ProgressLog
	/**/		, @Severity = 1024 -- DEBUG
	/*===================================================================================================================*/

	--! Finally, throw an exception that will be detected by the caller
	if @_Error > 0 raiserror(@_Message, 16, 99);

	set nocount off;

	--! Return the value of @@ERROR (which will be zero on success)
	return (@_Error);
end

GO
EXEC sp_addextendedproperty N'MS_Description', N'ICRT interface/wrapper for the ics ProcessRunEnd, SubProcessRunEnd or ThreadRunEnd procedures.  Validates inputs and then, depending on the supplied values calls one and only one of the above procedures based on the following rules:
1) If @MappingConfigTaskName is populated, and if @ThreadRunId & the souirce/target row count inputs are all valid,  then ics.ThreadRunEnd will be called to record the end state of the specified thread run instance (which equates to the execution of a Mapping Config Task in ICS)
2) If @MappingConfigTaskName is null or empty, and if @SubProcessName is populated and @SubProcessRunId is valid, then ics.SubProcessRunEnd will be called to record the end state of the indicated sub-process/step run (which equates to the execution of a subject area-specific ICRT sub-process)
3) If @MappingConfigTaskName and @SubProcessName are both null or empty, and if @ProcessName is populated and @ProcessRunId is valid, then ics.ProcessRunEnd will be called to record the end state of the indicated (master) data load process run (which equates to an execution instance of an overall ICRT process).', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StopRun', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Optional, a message provided by the caller to provide any detail around the reason for success, failure or other stoppage', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StopRun', 'PARAMETER', N'@EndMessage'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, an indicator of the final run state for this run, choose from “SUCCEEDED”, “STOPPED”, “SKIPPED” or “FAILED”', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StopRun', 'PARAMETER', N'@EndState'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The number of source rows rejected or failed by this thread', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StopRun', 'PARAMETER', N'@FailedSourceRows'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, the number of records failed by this thread during “write to target”, represents the total number of source rows that were not processed into the target table at all.', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StopRun', 'PARAMETER', N'@FailedTargetRows'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory at all times.  The Execution Instance ID of the ICRT process that initiated this batch process run', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StopRun', 'PARAMETER', N'@IcrtProcessId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory only if recording the end state of an table-specific data movement task in ICS, otherwise optional/ignore.', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StopRun', 'PARAMETER', N'@MappingConfigTaskName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory only if recording the end state of a table-specific data movement task in ICS i.e. when @MappingConfigTaskName is populated, otherwise optional/ignore.', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StopRun', 'PARAMETER', N'@MappingName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory at all times.  The name of the ICRT/ICS process responsible for running the end-to-end data load for a source (and from which the Batch Process Id can be derived)', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StopRun', 'PARAMETER', N'@ProcessName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory if recording the end state of an ICRT (master) process run i.e. when @MappingConfigTaskName and @SubProcessName are both null or empty.  The Id of the process run context that should be marked as succeeded, failed or otherwise stopped.', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StopRun', 'PARAMETER', N'@ProcessRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory if recording the end state of an ICRT sub-process run i.e. when @MappingConfigTaskName is null or empty, otherwise optional/ignore', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StopRun', 'PARAMETER', N'@SubProcessName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory only if recording the end state of an ICRT sub-process run i.e. when @SubProcessName is populated and @MappingConfigTaskName is null or empty, otherwise optional/ignore.   The Id of the sub-process run context that should be marked as succeeded, failed or otherwise stopped.', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StopRun', 'PARAMETER', N'@SubProcessRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The number of source rows successfully read by this thread', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StopRun', 'PARAMETER', N'@SuccessSourceRows'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, the total number of records written to the target table by this thread, typically the total number of inserts, updates and soft-deletes on a single target table.  This is required so that table level quality gates and execution dependencies can be implemented as needed.', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StopRun', 'PARAMETER', N'@SuccessTargetRows'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory only if recording the end state of a table-specific data movement task in ICS i.e. when @MappingConfigTaskName is populated, otherwise optional/ignore.  The Id of the Thread run context that should be marked as succeeded, failed or otherwise stopped', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StopRun', 'PARAMETER', N'@ThreadRunId'
GO
