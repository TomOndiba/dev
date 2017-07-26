IF OBJECT_ID('[dbo].[SubProcessCheckThreads]') IS NOT NULL
	DROP PROCEDURE [dbo].[SubProcessCheckThreads];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   PROCEDURE [dbo].[SubProcessCheckThreads]
( 
  @SubProcessName  VARCHAR(200) 
 ,@SubProcessRunID  INT 
 )

AS
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

**********************************************************************************************************************/
--</CommentHeader>

BEGIN
	set nocount on;
	
	--! Standard/ExceptionHandler variables
	declare	@_FunctionName nvarchar(255) = quotename(object_schema_name(@@procid)) + '.' + quotename(object_name(@@procid));
	declare	@_Error int = 0;
	declare @_RowCount int = 0;
	declare @_ReturnValue int = 0;
	declare	@_Message nvarchar(512);
	declare	@_ErrorContext nvarchar(512);
	declare	@_SprocStartTime datetime = getdate()
	declare	@_StepStartTime datetime
	declare	@_StepEndTime datetime
	declare	@_Step varchar(128);
	declare	@_ProgressMessage varchar(2000)
	declare	@_ExceptionId int
	declare @_ProgressLog varchar(max);
	declare @_RowsAffected int = 0;
	declare @_SubProcessRunId int = null;
	declare @_Instruction varchar(255) = null; -- RUN/SKIP/STOP/ERROR
	declare @_RunType varchar(8) = null; -- DELTA/FULL
	declare	@_CompletionMessage varchar(500) = null;
	declare	@_Outcome varchar(255);
	declare	@_ExpectedThreadCount int;
	declare	@_ActualThreadCount int;
	declare	@_ThreadsSucceeded int; 
	declare	@_ThreadsSkipped int;
	declare	@_ThreadsStopped int;
	declare	@_ThreadsFailed int;

	set @_ProgressMessage = @_FunctionName
	+ ' starting at ' + coalesce(convert(varchar(24), @_SprocStartTime, 120), '') + ' with inputs: '
	+ char(10) + '    Process Run ID	                   : ' + CAST(coalesce(@SubProcessRunID, 0) AS VARCHAR(255))

	set @_ProgressLog = @_ProgressMessage;

	BEGIN TRY
		set @_Step = 'Validate Inputs';
		set @_StepStartTime = getdate();

		IF COALESCE(@SubProcessRunID, 0) = 0	RAISERROR ('@SubProcessRunID can not be null or zero',16,1)
		IF COALESCE(@SubProcessName, '') = ''	RAISERROR ('@SubProcessName can not be null or empty',16,1)
		
		set @_Step = 'Build output values';
		set @_StepStartTime = getdate();
	
		SELECT @_SubProcessRunId = [SubProcessRunID],
		@_Outcome=[Outcome],
		@_CompletionMessage = [Message],
		@_ExpectedThreadCount=[ExpectedThreadCount],
		@_ActualThreadCount=[ActualThreadCount],
		@_ThreadsSucceeded=[ThreadsSucceeded],
		@_ThreadsSkipped=[ThreadsSkipped],
		@_ThreadsStopped=[ThreadsStopped],
		@_ThreadsFailed=[ThreadsFailed]  
		FROM dbo.StubResultSet
		WHERE FunctionName = @_FunctionName;
	
		EXEC log4.JournalWriter
			  @Task = 'POC'
			, @FunctionName = @_FunctionName
			, @StepInFunction = @_Step
			, @MessageText = @_CompletionMessage
			, @ExtraInfo = @_ProgressLog
			, @Severity = 1024 -- DEBUG

		--! Return the results as a result set
			SELECT
				@_SubProcessRunId AS [SubProcessRunId]
				,@_Outcome as [Outcome]
				,@_CompletionMessage AS [Message]
				,@_ExpectedThreadCount AS[ExpectedThreadCount]
				,@_ActualThreadCount as [ActualThreadCount]
				,@_ThreadsSucceeded as [ThreadsSucceeded]
				,@_ThreadsSkipped as [ThreadsSkipped]
				,@_ThreadsStopped as [ThreadsStopped]
				,@_ThreadsFailed as [ThreadsFailed] 
		
		END TRY
	
	BEGIN CATCH
		SET @_ErrorContext = 'Failed to start new batch run at step: ' + COALESCE('[' + @_Step + ']', 'NULL')

		EXEC log4.ExceptionHandler
				  @ErrorContext   = @_ErrorContext
				, @ErrorProcedure = @_FunctionName
				, @ErrorNumber    = @_Error OUT
				, @ReturnMessage  = @_Message OUT
				, @ExceptionId    = @_ExceptionId OUT

	END CATCH
	
--/////////////////////////////////////////////////////////////////////////////////////////////////
EndEx:
--/////////////////////////////////////////////////////////////////////////////////////////////////

	--! Finally, throw an exception that will be detected by the caller
	IF @_Error > 0 RAISERROR(@_Message, 16, 99);
	SET NOCOUNT OFF;

	--! Return the value of @@ERROR (which will be zero on success)
	RETURN (@_Error);
	
END
GO
