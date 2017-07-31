if object_id('[dbo].[SubProcessRunEnd]') is not null
	drop procedure [dbo].[SubProcessRunEnd];

go
set quoted_identifier on
go
set ansi_nulls on
go
create proc [dbo].[SubProcessRunEnd]
(
	@ProcessName		   varchar(255)
  , @SubProcessName		   varchar(255)
  , @SubProcessRunID		   int
  , @EndState			   varchar(255)
  , @EndMessage			   varchar(255) = null
  
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		IcsApp.ProcessRunEnd
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
001		25-JUL-2017		RN		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------
**********************************************************************************************************************/
--</CommentHeader>

begin
	--! Standard/ExceptionHandler variables
	declare @_FunctionName nvarchar(255) = quotename(object_schema_name(@@procid)) + '.' + quotename(object_name(@@procid)) ;
	declare @_Error int = 0 ;
	declare @_RowCount int = 0 ;
	declare @_ReturnValue int = 0 ;
	declare @_Message nvarchar(512) ;
	declare @_ErrorContext nvarchar(512) ;
	declare @_SprocStartTime datetime = getdate() ;
	declare @_StepStartTime datetime ;
	declare @_StepEndTime datetime ;
	declare @_step varchar(128) ;
	declare @_ProgressMessage varchar(2000) ;
	declare @_ExceptionId int ;
	declare @_ProgressLog nvarchar(max) ;
	declare @_RowsAffected int = 0 ;
	declare @_SubProcessRunID int = null ;
	declare @_Instruction varchar(8) = null ; -- RUN/SKIP/STOP/ERROR
	declare @_RunType varchar(8) = null ; -- DELTA/FULL
	declare @_CompletionMessage varchar(500) = null ;

	set @_ProgressMessage = @_FunctionName + ' starting at ' + coalesce(convert(varchar(24), @_SprocStartTime, 120), '') + ' with inputs: ' + char(10)
	set @_ProgressLog = @_ProgressMessage ;

	begin try
		set @_step = 'Validate Inputs' ;
		set @_StepStartTime = getdate() ;

		if coalesce(@ProcessName, '') = '' raiserror('@ProcessName can not be null or empty', 16, 1) ;
		if coalesce(@SubProcessName, '') = '' raiserror('@SubProcessName can not be null or empty', 16, 1) ;
		if coalesce(@SubProcessRunID, 0) = 0 raiserror('@SubProcessRunID can not be null or empty', 16, 1) ;
		if @EndState not in ('SUCCEEDED','FAILED','SKIPPED','STOPPED') raiserror('@EndState can not be other than SUCCEEDED or FAILED or SKIPPED or STOPPED', 16, 1)
		if coalesce(@EndState, '') = '' raiserror('@EndState can not be null or empty', 16, 1) ;

		exec log4.JournalWriter
			  @Task = 'POC'
			, @FunctionName = @_FunctionName
			, @StepInFunction = @_step
			, @MessageText = @_CompletionMessage
			, @ExtraInfo = @_ProgressLog
			, @Severity = 1024 ;	-- DEBUG

	end try
	begin catch
		set @_ErrorContext = 'Failed to start new batch run at Step: ' + coalesce('[' + @_step + ']', 'NULL') ;

		exec log4.ExceptionHandler
			@ErrorContext = @_ErrorContext
			, @ErrorProcedure = @_FunctionName
			, @ErrorNumber = @_Error out
			, @ReturnMessage = @_Message out
			, @ExceptionId = @_ExceptionId out ;
	end catch ;

	--/////////////////////////////////////////////////////////////////////////////////////////////////
	EndEx:
	--/////////////////////////////////////////////////////////////////////////////////////////////////

	--! Finally, throw an exception that will be detected by the caller
	if @_Error > 0 raiserror(@_Message, 16, 99) ;
	set nocount off ;

	--! Return the value of @@ERROR (which will be zero on success)
	return (@_Error) ;

end ;

GO
GRANT EXECUTE ON  [dbo].[SubProcessRunEnd] TO [EtlDevelopersDEV]
GO
GRANT EXECUTE ON  [dbo].[SubProcessRunEnd] TO [IcsDataFeeders]
GO
