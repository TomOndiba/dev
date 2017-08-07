IF OBJECT_ID('[IcsApp].[StartRun]') IS NOT NULL
	DROP PROCEDURE [IcsApp].[StartRun];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [IcsApp].[StartRun]
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
, @Instruction varchar(255) = null out
, @Message varchar(500) = null out
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		IcsApp.StartRun
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
				/**/	set @_ProgressLog = coalesce(@_ProgressLog, '') + 'initiating call to ics.ThreadRunStart...' ;
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
				/**/	set @_ProgressLog = coalesce(@_ProgressLog, '') + 'initiating call to ics.SubProcessRunStart...' ;
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
				/**/	set @_ProgressLog = coalesce(@_ProgressLog, '') + 'initiating call to ics.ProcessRunStart...' ;
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
		/**/	set @_ProgressLog = coalesce(@_ProgressLog, '') + @_ProgressMessage ;
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
