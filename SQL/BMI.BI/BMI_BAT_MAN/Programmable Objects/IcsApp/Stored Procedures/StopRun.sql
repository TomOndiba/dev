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
		set @_StepStartTime = getdate();

		--! ICRT Process name and internal Process Id are required on all calls
		if isnull(@ProcessName, '') = '' raiserror ('ICRT Process Name input must not be null or empty',16,1)
		if isnull(@IcrtProcessId, 0) !> 0 raiserror ('ICRT Process Id must not be null, negative or zero',16,1)
		
		if isnull(@EndState, '') not in ('SUCCEEDED', 'FAILED', 'SKIPPED', 'STOPPED')
			raiserror('End State value can only be "SUCCEEDED", "FAILED", "SKIPPED", "STOPPED"', 16, 1) ;

		--! If the ICRT Sub-process Name and MCT name are both null/empty, then we must be closing
		--! an open (master) process run and the (BAT_MAN) Process Run Id becomes mandatory
		if isnull(@SubProcessName, '') = '' and isnull(@MappingConfigTaskName, '') = '' and isnull(@ProcessRunId, 0) !> 0
			raiserror('(BatMan) Process Run Id can not be null, negative or zero when ending an open process: "%s"', 16, 1, @ProcessName);

		--! If the ICRT Sub-process Name is populated and the MCT name is null/empty, then we must be closing
		--! an open sub-process run and the (BAT_MAN) Sub-rocess Run Id becomes mandatory
		if isnull(@MappingConfigTaskName, '') = '' and len(@SubProcessName) > 0 and isnull(@SubProcessRunId, 0) !> 0
			raiserror('(BatMan) Sub-process Run Id can not be null, negative or zero when ending an open sub-process: "%s"', 16, 1, @SubProcessName);

		--! If the ICS Mapping Config Task name is populated then we are ending an open thread run (BAT_MAN) Thread Run Id becomes mandatory
		if len(@MappingConfigTaskName) > 0 and isnull(@ThreadRunId, 0) !> 0
			raiserror('(BatMan) Thread Run Id can not be null, negative or zero when ending an open thread for MCT: "%s"', 16, 1, @MappingConfigTaskName);

		--! Similarly, if we are closing a thread, the source and target row counts are also mandatory (although can be zero)
		if len(@MappingConfigTaskName) > 0 and not (isnull(@SuccessSourceRows, -1) >= 0)
			raiserror('Source Success row count can not be null or negative when closing an open thread for MCT: "%s" <<%i>>', 16, 1, @MappingConfigTaskName, @SuccessSourceRows);

		if len(@MappingConfigTaskName) > 0 and not (isnull(@FailedSourceRows, -1) >= 0)
			raiserror('Failed Source row count can not be null or negative when closing an open thread for MCT: "%s" <<%i>>', 16, 1, @MappingConfigTaskName, @FailedSourceRows);

		if len(@MappingConfigTaskName) > 0 and not (isnull(@SuccessTargetRows, -1) >= 0)
			raiserror('Target Success row count can not be null or negative when closing an open thread for MCT: "%s" <<%i>>', 16, 1, @MappingConfigTaskName, @SuccessTargetRows);

		if len(@MappingConfigTaskName) > 0 and not (isnull(@FailedTargetRows, -1) >= 0)
			raiserror('Failed Target row count can not be null or negative when closing an open thread for MCT: "%s" <<%i>>', 16, 1, @MappingConfigTaskName, @FailedTargetRows);

		--! Define default values for any remaining inputs
		set @EndMessage = coalesce(@EndMessage, '')

		if @ThreadRunId > 0
			begin
				/*===================================================================================================================*/
				/**/	set @_ProgressLog = coalesce(@_ProgressLog, '') + 'initiating call to ics.SubProcessRunEnd...' ;
				/*===================================================================================================================*/
				
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
		else if @SubProcessRunId > 0
			begin
				/*===================================================================================================================*/
				/**/	set @_ProgressLog = coalesce(@_ProgressLog, '') + 'initiating call to ics.SubProcessRunEnd...' ;
				/*===================================================================================================================*/
				
				exec ics.SubProcessRunEnd
					  @ProcessName = @ProcessName
					, @SubProcessName = @SubProcessName
					, @SubProcessRunId = @SubProcessRunId
					, @EndState = @EndState
					, @EndMessage = @EndMessage
			end
		else if @ProcessRunId > 0
			begin
				/*===================================================================================================================*/
				/**/	set @_ProgressLog = coalesce(@_ProgressLog, '') + 'initiating call to ics.ProcessRunEnd...' ;
				/*===================================================================================================================*/
				
				exec ics.ProcessRunEnd
					  @ProcessName = @ProcessName
					, @ProcessRunId = @ProcessRunId
					, @EndState = @EndState
					, @EndMessage = @EndMessage
			end

		set @_Message = 'Successfully recorded end of run for ICRT Process: ' + coalesce('"' + @ProcessName + '"', 'NULL')
			+ ', ICRT Sub-Process: ' + coalesce('"' + @SubProcessName + '"', 'NULL')
			+ ' and MCT Name: ' + coalesce('"' + @MappingConfigTaskName + '"', 'NULL')
			+ ' with End State: ' + coalesce('[' + @EndState + ']', 'NULL')
	end try
	
	begin catch
		set @_ErrorContext = 'Failed to start run for ICRT Process: ' + coalesce('"' + @ProcessName + '"', 'NULL')
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
