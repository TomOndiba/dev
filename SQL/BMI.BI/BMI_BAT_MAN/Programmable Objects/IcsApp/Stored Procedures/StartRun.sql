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
		set @_StepStartTime = getdate();

		--! ICRT Process name and internal Process Id are required on all calls
		if coalesce(@ProcessName, '') = '' raiserror ('(ICRT) Process Name input must not be null or empty',16,1)
		if coalesce(@IcrtProcessId, 0) !> 0 raiserror ('ICRT Process Id can not be null or zero',16,1)
		
		--! If the ICS Map[ping Config Task name is populated then we are strting a new thread run
		--! and the (BAT_MAN) Sub-Process Run Id becomes mandatory
		--! (NB: We test thread inputs before sub-process to ensure the correct error is thrown regardless of whhich sub-process values are provided)
		if len(@MappingConfigTaskName) > 0 and coalesce(@SubProcessRunId, 0) !> 0
			raiserror('(BatMan) Sub-process Run Id can not be null or zero when starting a new thread: "%s"', 16, 1, @MappingConfigTaskName);

		--! If the ICRT Sub-process Name is populated, then we are starting a new sub-process run
		--! and the (BAT_MAN) Process Run Id becomes mandatory
		if len(@SubProcessName) > 0 and coalesce(@ProcessRunId, 0) !> 0
			raiserror('(BatMan) Process Run Id can not be null or zero when starting a new sub process: "%s"', 16, 1, @SubProcessName);

		if len(@ProcessName) > 0 and @IcrtProcessId > 0 and coalesce(@SubProcessName, '') = '' and coalesce(@MappingConfigTaskName, '') = '' and coalesce(@MappingName, '') = ''
			begin
				/*===================================================================================================================*/
				/**/	set @_ProgressLog = coalesce(@_ProgressLog, '') + 'initiating call to ics.ProcessRunStart...' ;
				/*===================================================================================================================*/
				
				exec ics.ProcessRunStart
					@ProcessName = @ProcessName
				  , @IcrtProcessId = @IcrtProcessId
				  , @ProcessRunId = @ProcessRunId out
				  , @RunType = @RunType out
				  , @Instruction = @Instruction out
				  , @Message = @Message out
			end

		if len(@SubProcessName) > 0 and @ProcessRunId > 0  and coalesce(@MappingConfigTaskName, '') = '' and coalesce(@MappingName, '') = ''
			begin
				/*===================================================================================================================*/
				/**/	set @_ProgressLog = coalesce(@_ProgressLog, '') + 'initiating call to ics.SubProcessRunStart...' ;
				/*===================================================================================================================*/
				
				exec ics.SubProcessRunStart
					@ProcessName = @ProcessName
				  , @SubProcessName = @SubProcessName
				  , @ProcessRunID = @ProcessRunId
				  , @SubProcessRunId = @SubProcessRunId out
				  , @RunType = @RunType out
				  , @Instruction = @Instruction out
				  , @Message = @Message out
			end

		if @SubProcessRunId > 0 and len(@MappingConfigTaskName) > 0
			begin
				/*===================================================================================================================*/
				/**/	set @_ProgressLog = coalesce(@_ProgressLog, '') + 'initiating call to ics.ThreadRunStart...' ;
				/*===================================================================================================================*/
				
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
		set @_ErrorContext = 'Failed to start run for ICRT Process: ' + coalesce('"' + @ProcessName + '"', 'NULL')
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
