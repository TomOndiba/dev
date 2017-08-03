if object_id('[dbo].[SubProcessCheckThreads]') is not null
	drop procedure [dbo].[SubProcessCheckThreads];

go
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   procedure [dbo].[SubProcessCheckThreads]
(	
  @SubProcessName	   varchar(200) 
 ,@SubProcessRunID	   int output
, @Outcome			   varchar(255) = null output
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
	+ char(10) + '    Process Run ID	                   : ' + cast(coalesce(@SubProcessRunID, 0) as varchar(255))

	set @_ProgressLog = @_ProgressMessage;

	begin try
		set @_Step = 'Validate Inputs';
		set @_StepStartTime = getdate();

		if coalesce(@SubProcessRunID, 0) = 0	raiserror ('@SubProcessRunID can not be null or zero',16,1)
		if coalesce(@SubProcessName, '') = ''	raiserror ('@SubProcessName can not be null or empty',16,1)
		
		set @_Step = 'Build output values';
		set @_StepStartTime = getdate();
	
		select
			@SubProcessRunID	  = [SubProcessRunID]
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
	
		exec log4.JournalWriter
			@Task = 'POC'
		  , @FunctionName = @_FunctionName
		  , @StepInFunction = @_Step
		  , @MessageText = @Message
		  , @ExtraInfo = @_ProgressLog
		  , @Severity = 1024 ;	-- DEBUG

		--! Return the results as a result set
		select
			@SubProcessRunID	  as [SubProcessRunId]
		  , @Outcome			  as [Outcome]
		  , @Message			  as [Message]
		  , @ExpectedThreadCount  as [ExpectedThreadCount]
		  , @ActualThreadCount	  as [ActualThreadCount]
		  , @ThreadsSucceeded	  as [ThreadsSucceeded]
		  , @ThreadsSkipped	      as [ThreadsSkipped]
		  , @ThreadsStopped	      as [ThreadsStopped]
		  , @ThreadsFailed		  as [ThreadsFailed] ;
		
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

	--! Finally, throw an exception that will be detected by the caller
	if @_Error > 0 raiserror(@_Message, 16, 99);
	set nocount off;

	--! Return the value of @@ERROR (which will be zero on success)
	return (@_Error);
end

GO
GRANT EXECUTE ON  [dbo].[SubProcessCheckThreads] TO [EtlDevelopersDEV]
GO
GRANT EXECUTE ON  [dbo].[SubProcessCheckThreads] TO [IcsDataFeeders]
GO
