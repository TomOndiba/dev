if object_id('[IcsApp].[StartRun]') is not null
	drop procedure [IcsApp].[StartRun];
go
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [IcsApp].[StartRun]
(
--! ICRT master Process level inputs
  @ProcessName varchar(100) 
, @IcrtProcessId int 
--! ICRT Sub-process level inputs
, @SubProcessName  varchar(100) = null
--! ICRT/ICS Thread level inputs
, @MappingConfigTaskName varchar(100) = null
, @MappingName varchar(100) = null
--! ICRT master Process-specific outputs
, @ProcessRunId int = null out
--! ICRT Sub-process-specific outputs
, @SubProcessRunId int = null out
--! ICRT/ICS Thread-specific outputs
, @ThreadRunId  int = null out
, @StartCapturePoint  datetime = null out
, @EndCapturePoint  datetime = null out
--! ICRT/ICS common outputs
, @RunType varchar(8) = null out
, @Instruction varchar(16) = null out
, @Message varchar(500) = null out
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		IcsApp.StartRun
DESCRIPTION:		ICRT interface/wrapper for ics.ProcessRunStart/SubProcessRunStart/ThreadRunStart procedures
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
	/**/		--! ICRT master Process level inputs
	/**/		+ char(10) + '    ICRT Process Name            : ' + coalesce(@ProcessName, 'NULL')
	/**/		+ char(10) + '    ICRT Process ID	           : ' + coalesce(cast(@IcrtProcessId as varchar(32)), 'NULL') 
	/**/		--! ICRT Sub-process level inputs
	/**/		+ char(10) + '    ICRT Sub-process Name        : ' + coalesce(@SubProcessName, 'NULL')
	/**/		--! ICRT/ICS Thread level inputs
	/**/		+ char(10) + '    ICS Mapping Config Task Name : ' + coalesce(@MappingConfigTaskName, 'NULL')
	/**/		+ char(10) + '    ICS Mapping Name             : ' + coalesce(@MappingName, 'NULL')
	/**/		--! ICRT master Process-specific outputs
	/**/		+ char(10) + '    Process Run ID (in)	       : ' + coalesce(cast(@ProcessRunId as varchar(32)), 'NULL')
	/**/		--! ICRT Sub-process-specific outputs
	/**/		+ char(10) + '    Sub-process ID (in)	       : ' + coalesce(cast(@SubProcessRunId as varchar(32)), 'NULL')
	/**/		--! ICRT/ICS Thread-specific outputs
	/**/		+ char(10) + '    Thread Run ID (in)	       : ' + coalesce(cast(@ThreadRunId as varchar(32)), 'NULL')
	/**/		+ char(10) + '    Start Capture Point (in)	   : ' + coalesce(format(@StartCapturePoint, 'yyyy-MM-dd HH:mm:ss.mmmm'), 'NULL')
	/**/		+ char(10) + '    End Capture Point (in)	   : ' + coalesce(format(@EndCapturePoint, 'yyyy-MM-dd HH:mm:ss.mmmm'), 'NULL')
	/**/		--! ICRT/ICS common outputs
	/**/		+ char(10) + '    Run Type (in)                : ' + coalesce(@RunType, 'NULL')
	/**/		+ char(10) + '    Instruction (in)             : ' + coalesce(@Instruction, 'NULL')
	/**/
	/**/	set @_ProgressLog = @_ProgressMessage;
	/*===================================================================================================================*/

	begin try
		set @_Step = 'Validate Inputs';

		--! ICRT Process name and ICRT Process Id are required on all calls
		if isnull(@ProcessName, '') = '' raiserror ('ICRT Process Name input must not be null or empty',16,1)
		if isnull(@IcrtProcessId, 0) !> 0 raiserror ('ICRT Process Id must not be null, negative or zero',16,1)

		--! (NB: We test thread inputs before sub-process to ensure the correct error is thrown regardless of which sub-process values are provided)
		if len(@MappingConfigTaskName) > 0
			begin
				--! If the ICS Mapping Config Task name is populated then we are starting a new thread run
				--! and the (BAT_MAN) Sub-Process Run Id becomes mandatory
				if coalesce(@SubProcessRunId, 0) !> 0
					raiserror('(BatMan) Sub-process Run Id can not be null, negative or zero when starting a new thread: "%s"', 16, 1, @MappingConfigTaskName);

				if isnull(@MappingName, '') = '' raiserror ('Mapping Name input can not be null or empty when starting a new thread: "%s"', 16, 1, @MappingConfigTaskName);

				/*===================================================================================================================*/
				/**/	set @_ProgressLog = coalesce(@_ProgressLog, '') + char(10) +  'initiating call to ics.ThreadRunStart...' ;
				/*===================================================================================================================*/
				
				set @_Step = 'Start Thread';

				exec ics.ThreadRunStart
					  @MappingConfigTaskName = @MappingConfigTaskName
					, @MappingName = @MappingName
					, @SubProcessRunId = @SubProcessRunId
					, @ThreadRunId = @ThreadRunId out
					, @RunType = @RunType out
					, @Instruction = @Instruction out
					, @Message = @Message out
					, @StartCapturePoint = @StartCapturePoint out
					, @EndCapturePoint = @EndCapturePoint out
			end
		else if len(@SubProcessName) > 0
			begin
				--! If the ICRT Sub-process Name is populated, then we are starting a new sub-process run
				--! and the (BAT_MAN) Process Run Id becomes mandatory
				if coalesce(@ProcessRunId, 0) !> 0
					raiserror('(BatMan) Process Run Id can not be null, negative or zero when starting a new sub process: "%s"', 16, 1, @SubProcessName);

				/*===================================================================================================================*/
				/**/	set @_ProgressLog = coalesce(@_ProgressLog, '') + char(10) +  'initiating call to ics.SubProcessRunStart...' ;
				/*===================================================================================================================*/
				
				set @_Step = 'Start Sub-process';

				exec ics.SubProcessRunStart
					@ProcessName = @ProcessName
				  , @SubProcessName = @SubProcessName
				  , @ProcessRunId = @ProcessRunId
				  , @SubProcessRunId = @SubProcessRunId out
				  , @RunType = @RunType out
				  , @Instruction = @Instruction out
				  , @Message = @Message out
			end
		else
			begin
				--! If the ICRT Sub-process Name and MCT name are both null/empty, then we must be starting
				--! a new (master) process run and the (BAT_MAN) Process Run Id becomes mandatory

				/*===================================================================================================================*/
				/**/	set @_ProgressLog = coalesce(@_ProgressLog, '') + char(10) +  'initiating call to ics.ProcessRunStart...' ;
				/*===================================================================================================================*/
				
				set @_Step = 'Start Process';

				exec ics.ProcessRunStart
					@ProcessName = @ProcessName
				  , @IcrtProcessId = @IcrtProcessId
				  , @ProcessRunId = @ProcessRunId out
				  , @RunType = @RunType out
				  , @Instruction = @Instruction out
				  , @Message = @Message out
			end

		/*===================================================================================================================*/
		/**/	set @_ProgressMessage = char(10) + char(10)  + 'Outputs: '
		/**/		--! ICRT master Process-specific outputs
		/**/		+ char(10) + '    Process Run ID (out)	       : ' + coalesce(cast(@ProcessRunId as varchar(32)), 'NULL')
		/**/		--! ICRT Sub-process-specific outputs
		/**/		+ char(10) + '    Sub-process ID (out)	       : ' + coalesce(cast(@SubProcessRunId as varchar(32)), 'NULL')
		/**/		--! ICRT/ICS Thread-specific outputs
		/**/		+ char(10) + '    Thread Run ID (out)	       : ' + coalesce(cast(@ThreadRunId as varchar(32)), 'NULL')
		/**/		+ char(10) + '    Start Capture Point (out)	   : ' + coalesce(format(@StartCapturePoint, 'yyyy-MM-dd HH:mm:ss.mmmm'), 'NULL')
		/**/		+ char(10) + '    End Capture Point (out)	   : ' + coalesce(format(@EndCapturePoint, 'yyyy-MM-dd HH:mm:ss.mmmm'), 'NULL')
		/**/		--! ICRT/ICS common outputs
		/**/		+ char(10) + '    Run Type (out)                : ' + coalesce(@RunType, 'NULL')
		/**/		+ char(10) + '    Instruction (out)             : ' + coalesce(@Instruction, 'NULL')
		/**/
		/**/	set @_ProgressLog = coalesce(@_ProgressLog, '') + char(10) +  @_ProgressMessage ;
		/*===================================================================================================================*/

	end try
	
	begin catch
		set @_ErrorContext = 'Failed to record start of run for ICRT Process: ' + coalesce('"' + @ProcessName + '"', 'NULL')
			+ ', ICRT Sub-Process: ' + coalesce('"' + @SubProcessName + '"', 'NULL')
			+ ' and MCT Name: ' + coalesce('"' + @MappingConfigTaskName + '"', 'NULL')
			+ ' at step: ' + coalesce('[' + @_Step + ']', 'NULL')

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
	/**/		, @MessageText = @Message
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
exec sp_addextendedproperty N'MS_Description', N'ICRT interface/wrapper for the ics.ProcessRunStart, SubProcessRunStart or ThreadRunStart procedures.  Validates inputs and then, depending on the supplied values calls one and only one of the above procedures.
1) If @MappingConfigTaskName is populated, and if @SubProcessRunId & @MappingName are valid,  then ics.ThreadRunStart will be called to record the start of a new thread run instance (which equates to the execution of a Mapping Config Task in ICS)
2) If @MappingConfigTaskName is null or empty, and if @SubProcessName is populated, and if @ProcessRunId is valid, then ics.SubProcessRunStart will be called to record the start of a new sub-process/step run (which equates to the execution of a subject area-specific ICRT sub-process)
3) If @MappingConfigTaskName and @SubProcessName are both null or empty, and if @ProcessName is populated and @IcrtProcessId is valid, then ics.ProcessRunStart will be called to record the start of a new (master) data load process run (which equates to an execution instance of an overall ICRT process).  NB: In the MVP version of BAT_MAN this step will also include a check to ensure that there is not already a running instance of the specified process - which would result in an @Instruction of “STOP” being output)', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StartRun', null, null
go
exec sp_addextendedproperty N'MS_Description', N'Optional, output only for MCT/Thread runs. The point in time at source up to and including which to capture any changes, may be NULL if delta/CDC loads are not implemented for this table.  ICS Note: Source Query Predicate will be: “<= EndCapturePoint”', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StartRun', 'PARAMETER', N'@EndCapturePoint'
go
exec sp_addextendedproperty N'MS_Description', N'Mandatory at all times.  The Execution Instance ID of the ICRT process that initiated this batch process run', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StartRun', 'PARAMETER', N'@IcrtProcessId'
go
exec sp_addextendedproperty N'MS_Description', N'Output, indicates what action the caller should take in relation to this run attempt, always populated.  Will be one of the following four values: "RUN", "SKIP", "STOP" or "ERROR"', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StartRun', 'PARAMETER', N'@Instruction'
go
exec sp_addextendedproperty N'MS_Description', N'Mandatory if the intention is to record the start of a table-specific data movement task in ICS, otherwise optional/ignore.  The name of the mapping configuration task within ICS responsible for loading or transforming the data for one table (from which the Thread Id may be derived)', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StartRun', 'PARAMETER', N'@MappingConfigTaskName'
go
exec sp_addextendedproperty N'MS_Description', N'Mandatory only if recording the start of a table-specific data movement task i.e. when @MappingConfigTaskName is also populated, otherwise optional/ignore', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StartRun', 'PARAMETER', N'@MappingName'
go
exec sp_addextendedproperty N'MS_Description', N'A user-friendly message relating to any reason behind the Instruction output – especially if the result is anything other than “RUN”', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StartRun', 'PARAMETER', N'@Message'
go
exec sp_addextendedproperty N'MS_Description', N'Mandatory at all times.  The name of the ICRT/ICS process responsible for running the end-to-end data load for a source (and from which the Batch Process Id can be derived)', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StartRun', 'PARAMETER', N'@ProcessName'
go
exec sp_addextendedproperty N'MS_Description', N'Mandatory input if recording the start of a sub-process run i.e. when @SubProcessName is populated; the (BAT_MAN) Process Run context within which a new sub-process is to be executed.  Otherwise optional/output if recording the start of an ICRT (master) process i.e. when @SubProcessName and @MappingConfigTaskName are both null or empty.  The unique Id for the new process run context initiated by this ics.ProcessRunStart, always populated on success.', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StartRun', 'PARAMETER', N'@ProcessRunId'
go
exec sp_addextendedproperty N'MS_Description', N'Output, indicates whether this is a “FULL” or “DELTA” load (and allows the caller to choose the appropriate code path according to expected data quantities.  Always populated.', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StartRun', 'PARAMETER', N'@RunType'
go
exec sp_addextendedproperty N'MS_Description', N'Optional, output only for MCT/Thread runs. The point in time at source from which to capture any changes, may be NULL if delta/CDC loads are not implemented for this table.  ICS Note: Source Query Predicate will be: “ > StartCapturePoint”', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StartRun', 'PARAMETER', N'@StartCapturePoint'
go
exec sp_addextendedproperty N'MS_Description', N'Mandatory if the intention is to record the start of a subject area-specific sub-process/step run, otherwise optional/ignore.  The name of the ICRT sub-process responsible for running this step within the overall end-to-end data load for a source (from which the Step Id may be derived)', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StartRun', 'PARAMETER', N'@SubProcessName'
go
exec sp_addextendedproperty N'MS_Description', N'Mandatory only if recording the start of a table-specific data movement task i.e when @MappingConfigTaskName is populated; the (BAT_MAN) Sub-process/step run context within which a new MCT Thread is to be executed.  Otherwise optional/output if recording the start of an ICRT sub-process i.e. when @SubProcessName is populated and @MappingConfigTaskName is null or empty.  The unique Id for the new sub-process run context initiated by this procedure, always populated on success for new sub-process and thread runs.', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StartRun', 'PARAMETER', N'@SubProcessRunId'
go
exec sp_addextendedproperty N'MS_Description', N'Optional, output only if recording the start of an ICS MCT run i.e. when @MappingConfigTaskName is populated on success.  The unique Id for the new thread run context initiated for this MCT execution context.', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'StartRun', 'PARAMETER', N'@ThreadRunId'
go
