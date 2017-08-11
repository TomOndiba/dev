if object_id('[IcsApp].[SubProcessCheckThreads]') is not null
	drop procedure [IcsApp].[SubProcessCheckThreads];
go
set quoted_identifier on
go
set ansi_nulls on
go
create procedure [IcsApp].[SubProcessCheckThreads]
(	
  @SubProcessName	   varchar(100) 
, @SubProcessRunId	   int
, @Outcome			   varchar(16) = null output
, @Message			   varchar(500) = null output 
, @ExpectedThreadCount int =null output 
, @ActualThreadCount   int =null output 
, @ThreadsSucceeded	   int =null output 
, @ThreadsSkipped	   int =null output 
, @ThreadsStopped	   int =null output 
, @ThreadsFailed	   int =null output    
)

as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		IcsApp.SubProcessCheckThreads
DESCRIPTION:		POC stub procedure
ORIGIN DATE:		26-JUL-2017
ORIGINAL AUTHOR:	Razia Nazir

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
001		26-JUL-2017		RN		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------
002		31-JUL-2017		RN		N/A		Modified OIutput parameters added.

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
	/**/		+ char(10) + '    ICRT SubProcess Name         : ' + coalesce(@SubProcessName, 'NULL')
	/**/		+ char(10) + '    (BAT_MAN) Process Run I	   : ' + coalesce(cast(@SubProcessRunId as varchar(32)), 'NULL') 
	/**/
	/**/	set @_ProgressLog = @_ProgressMessage;
	/*===================================================================================================================*/

	begin try
		set @_Step = 'Validate Inputs';
		set @_StepStartTime = getdate();

		if coalesce(@SubProcessRunId, 0) = 0	raiserror ('@SubProcessRunId can not be null or zero',16,1)
		if coalesce(@SubProcessName, '') = ''	raiserror ('@SubProcessName can not be null or empty',16,1)
		
		set @_Step = 'Build output values';
		set @_StepStartTime = getdate();
	
		select
			@SubProcessRunId	  = [SubProcessRunID]
		  , @Outcome			  = [Outcome]
		  , @Message			  = [Message]
		  , @ExpectedThreadCount  = [ExpectedThreadCount]
		  , @ActualThreadCount	  = [ActualThreadCount]
		  , @ThreadsSucceeded	  = [ThreadsSucceeded]
		  , @ThreadsSkipped		  = [ThreadsSkipped]
		  , @ThreadsStopped		  = [ThreadsStopped]
		  , @ThreadsFailed		  = [ThreadsFailed]
		from
			dbo.StubResultSet
		where
			FunctionName = @_FunctionName ;
	
		/*===================================================================================================================*/
		/**/	set @_ProgressMessage = char(10) + char(10)  + 'Outputs: '
		/**/		+ char(10) + '    Expected Thread Count    : ' + coalesce(cast(@ExpectedThreadCount as varchar(32)), 'NULL')
		/**/		+ char(10) + '    Actual Thread Count      : ' + coalesce(cast(@ActualThreadCount as varchar(32)), 'NULL')
		/**/		+ char(10) + '    Threads Succeeded        : ' + coalesce(cast(@ThreadsSucceeded as varchar(32)), 'NULL')
		/**/		+ char(10) + '    Threads Skipped          : ' + coalesce(cast(@ThreadsSkipped as varchar(32)), 'NULL')
		/**/		+ char(10) + '    Threads Stopped          : ' + coalesce(cast(@ThreadsStopped as varchar(32)), 'NULL')
		/**/		+ char(10) + '    Threads Failed           : ' + coalesce(cast(@ThreadsFailed as varchar(32)), 'NULL')
		/**/
		/**/	set @_ProgressLog = coalesce(@_ProgressLog, '') + @_ProgressMessage ;
		/*===================================================================================================================*/

		--! Return the results as a result set
		select
			@SubProcessRunId	  as [SubProcessRunId]
		  , @Outcome			  as [Outcome]
		  , @Message			  as [Message]
		  , @ExpectedThreadCount  as [ExpectedThreadCount]
		  , @ActualThreadCount	  as [ActualThreadCount]
		  , @ThreadsSucceeded	  as [ThreadsSucceeded]
		  , @ThreadsSkipped	      as [ThreadsSkipped]
		  , @ThreadsStopped	      as [ThreadsStopped]
		  , @ThreadsFailed		  as [ThreadsFailed] ;

		/*===================================================================================================================*/
		/**/	set @_Message = 'Successfully retrurned thread counts for Sub-Process Name: ' + coalesce('"' + @SubProcessName + '"', 'NULL')
		/**/		+ ' and Sub-process Run Id: ' + coalesce(cast(@SubProcessRunId as varchar(32)), 'NULL') 
		/*===================================================================================================================*/
		
	end try
	
	begin catch
		set @_ErrorContext = 'Failed to start new batch run at step: ' + coalesce('[' + @_Step + ']', 'NULL')

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
go

