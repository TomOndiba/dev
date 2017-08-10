IF OBJECT_ID('[ics].[SubProcessRunStart]') IS NOT NULL
	DROP PROCEDURE [ics].[SubProcessRunStart];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [ics].[SubProcessRunStart]
(
  @ProcessName varchar(200)
, @SubProcessName varchar(200)
, @ProcessRunId int
, @SubProcessRunId int = null output
, @RunType varchar(8) = null output
, @Instruction varchar(16) = null output
, @Message varchar(500) = null output
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		ics.SubProcessRunStart
DESCRIPTION:		Checks that the requested sub-process is runnable at this time and if so, initiates a new
					sub-process run instance within the context of the current process run (adding a row to the
					table: batch.StepRun)
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
			  @SubProcessRunId = SubProcessRunID
			, @RunType = RunType
			, @Instruction = Instruction
			, @Message = [Message]
		from
			dbo.StubResultSet
		where
			FunctionName = @_FunctionName ;
	end try
	begin catch
		set @_ErrorContext = 'Failed to start new sub-process run'
			+ ' for ICRT Process: ' + coalesce('"' + @ProcessName + '"', 'NULL')
			+ ' , ICRT Sub-Process: ' + coalesce('"' + @SubProcessName + '"', 'NULL')
			+ ' and (BatMan) Process Run Id: ' + coalesce(cast(@ProcessRunId as varchar(32)), 'NULL')
			+ ' at step: ' + coalesce('[' + @_Step + ']', 'NULL')
			+ ' (New Sub-process Run Id: ' + coalesce(cast(@SubProcessRunId as varchar(32)), 'NULL') + ')'

		exec log4.ExceptionHandler
			  @ErrorContext = @_ErrorContext
			, @ErrorProcedure = @_FunctionName
			, @ErrorNumber = @_Error out
			, @ReturnMessage = @_Message out
			, @ExceptionId = @_ExceptionId out

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
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, the unique Id for the new sub-process run context initiated by this procedure, always populated', 'SCHEMA', N'ics', 'PROCEDURE', N'SubProcessRunStart', 'PARAMETER', N'@SubProcessRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Checks that the requested sub-process is runnable at this time and if so, initiates a new sub-process run instance within the context of the current process run (adding a row to the table: batch.StepRun)', 'SCHEMA', N'ics', 'PROCEDURE', N'SubProcessRunStart', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Output, indicates what action the caller should take in relation to this run attempt, always populated.  Will be one of the following four values: "RUN", "SKIP", "STOP" or "ERROR"', 'SCHEMA', N'ics', 'PROCEDURE', N'SubProcessRunStart', 'PARAMETER', N'@Instruction'
GO
EXEC sp_addextendedproperty N'MS_Description', N'A user-friendly message relating to any reason behind the Instruction output – especially if the result is anything other than “RUN”', 'SCHEMA', N'ics', 'PROCEDURE', N'SubProcessRunStart', 'PARAMETER', N'@Message'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, the name of the ICRT/ICS process responsible for running the end-to-end data load for a source (from which the Batch Process Id can be derived)', 'SCHEMA', N'ics', 'PROCEDURE', N'SubProcessRunStart', 'PARAMETER', N'@ProcessName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The unique Id for the new process run context initiated by this procedure.', 'SCHEMA', N'ics', 'PROCEDURE', N'SubProcessRunStart', 'PARAMETER', N'@ProcessRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Output, indicates whether this is a “FULL” or “DELTA” load (and allows the caller to choose the appropriate code path according to expected data quantities.  Always populated.', 'SCHEMA', N'ics', 'PROCEDURE', N'SubProcessRunStart', 'PARAMETER', N'@RunType'
GO
EXEC sp_addextendedproperty N'MS_Description', N'', 'SCHEMA', N'ics', 'PROCEDURE', N'SubProcessRunStart', 'PARAMETER', N'@SubProcessName'
GO
