IF OBJECT_ID('[dbo].[ThreadRunStart]') IS NOT NULL
	DROP PROCEDURE [dbo].[ThreadRunStart];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   PROCEDURE [dbo].[ThreadRunStart]
(
   
 @MappingName VARCHAR(200) 
, @MappingConfigTaskName VARCHAR(200) 
, @SubProcessRunID int
, @ThreadRunId  int=null output
, @RunType varchar(8) =null output
, @Instruction varchar(255)=null output
, @Message varchar(500)=null output
, @StartCapturePoint  datetime=null output,
  @EndCapturePoint  datetime = null output
 
 )

AS
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		IcsApp.ThreadRunStart
DESCRIPTION:		POC stub procedure
ORIGIN DATE:		24-JUL-2017
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
001		11-JUL-2017		RN		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------
001		31-JUL-2017		RN		N/A		Modified Output parameters added.
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
	declare	@_step varchar(128);
	declare	@_ProgressMessage varchar(2000)
	declare	@_ExceptionId int
	declare @_ProgressLog nvarchar(max);
	declare @_RowsAffected int = 0;
	declare @_ThreadRunId int = null;
	declare @_Instruction varchar(8) = null; -- RUN/SKIP/STOP/ERROR
	declare @_RunType varchar(8) = null; -- DELTA/FULL
	declare	@_CompletionMessage varchar(500) = null
	declare @_StartCapturePoint datetime;
	declare @_EndCapturePoint datetime;

	set @_ProgressMessage = @_FunctionName
			+ ' starting at ' + coalesce(convert(varchar(24), @_SprocStartTime, 120), '') + ' with inputs: '
			
				+ char(10) + '    Mapping Name                     : ' + coalesce(@MappingName, 'NULL')
				+ char(10) + '    Mapping Configuration Task Name  : ' + coalesce(@MappingConfigTaskName, 'NULL')
				+ char(10) + '    Sub Process Run ID               : ' + CAST(coalesce(@SubProcessRunID, 0) AS VARCHAR(255))
				+ char(10)
	set @_ProgressLog = @_ProgressMessage;

	BEGIN TRY
		set @_step= 'Validate Inputs';
		set @_StepStartTime = getdate();

		IF COALESCE(@MappingName, '') = '' RAISERROR ('@MappingName can not be null or empty',16,1)
		IF COALESCE(@MappingConfigTaskName, '') = '' RAISERROR ('@MappingConfigTaskName can not be null or empty',16,1)
		IF COALESCE(@SubProcessRunID, 0) = 0 RAISERROR ('@SubProcessRunID can not be null or zero',16,1)
		--!
		--!
		--!
		set @_step = 'Build output values';
		set @_StepStartTime = getdate();

		SELECT @ThreadRunId = [ThreadRunID],
			   @RunType = RunType,
			   @Instruction = Instruction,
			   @Message = [Message],
			   @StartCapturePoint=[StartCapturePoint],
			   @EndCapturePoint=[EndCapturePoint]
		FROM dbo.StubResultSet
		WHERE FunctionName = @_FunctionName;

		EXEC log4.JournalWriter
			  @Task = 'POC'
			, @FunctionName = @_FunctionName
			, @StepInFunction = @_step
			, @MessageText = @Message
			, @ExtraInfo = @_ProgressLog
			, @Severity = 1024 -- DEBUG

		--! Return the results as a result set
		SELECT
			  @ThreadRunId AS [ThreadRunId]
			, @Instruction AS [Instruction]
			, @RunType AS [RunType]
			, @Message AS [Message]
			, @StartCapturePoint AS StartCapturePoint
			, @EndCapturePoint As EndCapturePoint
	END TRY
	BEGIN CATCH
		SET @_ErrorContext = 'Failed to start new batch run at Step: ' + COALESCE('[' + @_step + ']', 'NULL')
							
		EXEC log4.ExceptionHandler
			  @ErrorContext   = @_ErrorContext
			, @ErrorProcedure = @_FunctionName
			, @ErrorNumber    = @_Error OUT
			, @ReturnMessage  = @_Message OUT
			, @ExceptionId    = @_ExceptionId OUT
			;
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
