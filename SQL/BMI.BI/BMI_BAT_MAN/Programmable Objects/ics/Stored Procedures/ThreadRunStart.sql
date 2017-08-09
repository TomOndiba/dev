if object_id('[ics].[ThreadRunStart]') is not null
	drop procedure [ics].[ThreadRunStart];
go
set quoted_identifier on
go
set ansi_nulls on
go
create procedure [ics].[ThreadRunStart]
(
  @MappingConfigTaskName varchar(200)
, @MappingName varchar(200)
, @SubProcessRunId int
, @ThreadRunId int = null output
, @RunType varchar(8) = null output
, @Instruction varchar(255) = null output
, @Message varchar(500) = null output
, @StartCapturePoint datetime = null output
, @EndCapturePoint datetime = null output
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		ics.ThreadRunStart
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
001		24-JUL-2017		RN		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------

**********************************************************************************************************************/
--</CommentHeader>

begin
	set nocount on ;

	--! Standard/ExceptionHandler variables
	declare	@_FunctionName nvarchar(255) = quotename(object_schema_name(@@procid)) + '.' + quotename(object_name(@@procid));
	declare	@_Error int = 0;
	declare @_RowCount int = 0;
	declare @_ReturnValue int = 0;
	declare	@_Message nvarchar(512);
	declare	@_ErrorContext nvarchar(512);
	declare	@_Step varchar(128);
	declare	@_ExceptionId int;

	begin try
		set @_Step = 'Fetch dummy values for stub' ;

		select
			  @ThreadRunId = ThreadRunID
			, @RunType = RunType
			, @Instruction = Instruction
			, @Message = [Message]
			, @StartCapturePoint = StartCapturePoint
			, @EndCapturePoint = EndCapturePoint
		from
			dbo.StubResultSet
		where
			FunctionName = @_FunctionName ;
	end try
	begin catch
		set @_ErrorContext = 'Failed to start new thread run'
			+ ' for MCT Name: ' + coalesce('"' + @MappingConfigTaskName + '"', 'NULL')
			+ ' , Mapping: ' + coalesce('"' + @MappingName + '"', 'NULL')
			+ ' and (BatMan) Sub-process Run Id: ' + coalesce(cast(@SubProcessRunId as varchar(32)), 'NULL')
			+ ' at step: ' + coalesce('[' + @_Step + ']', 'NULL')
			+ ' (New Thread Run Id: ' + coalesce(cast(@ThreadRunId as varchar(32)), 'NULL') + ')'

		exec log4.ExceptionHandler
			  @ErrorContext = @_ErrorContext
			, @ErrorProcedure = @_FunctionName
			, @ErrorNumber = @_Error out
			, @ReturnMessage = @_Message out
			, @ExceptionId = @_ExceptionId out ;
	end catch

--/////////////////////////////////////////////////////////////////////////////////////////////////
EndEx:
--/////////////////////////////////////////////////////////////////////////////////////////////////

	--! Finally, throw an exception that will be detected by the caller
	if @_Error > 0 raiserror(@_Message, 16, 99) ;

	set nocount off ;

	--! Return the value of @@ERROR (which will be zero on success)
	return (@_Error) ;
end

GO
EXEC sp_addextendedproperty N'MS_Description', N'Checks that the requested thread is runnable at this time and if so, initiates a new thread run instance within the context of the current sub-process run (adding a row to the table: batch.ThreadRun)', 'SCHEMA', N'ics', 'PROCEDURE', N'ThreadRunStart', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Output, indicates what action the caller should take in relation to this run attempt, always populated.  Will be one of the following four values: "RUN", "SKIP", "STOP" or "ERROR"', 'SCHEMA', N'ics', 'PROCEDURE', N'ThreadRunStart', 'PARAMETER', N'@Instruction'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, the name of the ICS mapping configuration task from which this call originates', 'SCHEMA', N'ics', 'PROCEDURE', N'ThreadRunStart', 'PARAMETER', N'@MappingConfigTaskName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, the name of the ICS mapping from which this call originates', 'SCHEMA', N'ics', 'PROCEDURE', N'ThreadRunStart', 'PARAMETER', N'@MappingName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'A user-friendly message relating to any reason behind the Instruction output – especially if the result is anything other than “RUN”', 'SCHEMA', N'ics', 'PROCEDURE', N'ThreadRunStart', 'PARAMETER', N'@Message'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Output, indicates whether this is a “FULL” or “DELTA” load (and allows the caller to choose the appropriate code path according to expected data quantities.  Always populated.', 'SCHEMA', N'ics', 'PROCEDURE', N'ThreadRunStart', 'PARAMETER', N'@RunType'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, the sub-process run context in which this thread is to be executed', 'SCHEMA', N'ics', 'PROCEDURE', N'ThreadRunStart', 'PARAMETER', N'@SubProcessRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The unique Id for the new thread run context initiated by this procedure, always populated', 'SCHEMA', N'ics', 'PROCEDURE', N'ThreadRunStart', 'PARAMETER', N'@ThreadRunId'
GO
