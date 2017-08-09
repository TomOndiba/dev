if object_id('[ics].[ProcessRunStart]') is not null
	drop procedure [ics].[ProcessRunStart];
go
set quoted_identifier on
go
set ansi_nulls on
go
create procedure [ics].[ProcessRunStart]
(
  @ProcessName varchar(200)
, @IcrtProcessId int
, @ProcessRunId int = null output
, @RunType varchar(8) = null output
, @Instruction varchar(255) = null output
, @Message varchar(500) = null output
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		ics.ProcessRunStart
DESCRIPTION:		Checks that the requested process is runnable and if so, initiates a new process run instance
					(adding a row to the table: batch.ProcessRun)
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
			  @ProcessRunId = ProcessRunID
			, @RunType = RunType
			, @Instruction = Instruction
			, @Message = [Message]
		from
			dbo.StubResultSet
		where
			FunctionName = @_FunctionName ;
	end try
	begin catch
		set @_ErrorContext = 'Failed to start new process run'
			+ ' for ICRT Process Name: ' + coalesce('"' + @ProcessName + '"', 'NULL')
			+ ' and ICRT Process Id: ' + coalesce(cast(@IcrtProcessId as varchar(32)), 'NULL')
			+ ' at step: ' + coalesce('[' + @_Step + ']', 'NULL')
			+ ' (New Process Run Id: ' + coalesce(cast(@ProcessRunId as varchar(32)), 'NULL') + ')'

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
EXEC sp_addextendedproperty N'MS_Description', N'Checks that the requested process is runnable and if so, initiates a new process run instance (adding a row to the table: batch.ProcessRun)', 'SCHEMA', N'ics', 'PROCEDURE', N'ProcessRunStart', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, the ID of the ICRT execution instance/process that initiated this batch run', 'SCHEMA', N'ics', 'PROCEDURE', N'ProcessRunStart', 'PARAMETER', N'@IcrtProcessId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Output, indicates what action the caller should take in relation to this run attempt, always populated.  Will be one of the following four values: "RUN", "SKIP", "STOP" or "ERROR"', 'SCHEMA', N'ics', 'PROCEDURE', N'ProcessRunStart', 'PARAMETER', N'@Instruction'
GO
EXEC sp_addextendedproperty N'MS_Description', N'A user-friendly message relating to any reason behind the Instruction output – especially if the result is anything other than “RUN”', 'SCHEMA', N'ics', 'PROCEDURE', N'ProcessRunStart', 'PARAMETER', N'@Message'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, the name of the ICRT/ICS process responsible for running the end-to-end data load for a source (from which the Batch Process Id can be derived)', 'SCHEMA', N'ics', 'PROCEDURE', N'ProcessRunStart', 'PARAMETER', N'@ProcessName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The unique Id for the new process run context initiated by this procedure.', 'SCHEMA', N'ics', 'PROCEDURE', N'ProcessRunStart', 'PARAMETER', N'@ProcessRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Output, indicates whether this is a “FULL” or “DELTA” load (and allows the caller to choose the appropriate code path according to expected data quantities.  Always populated.', 'SCHEMA', N'ics', 'PROCEDURE', N'ProcessRunStart', 'PARAMETER', N'@RunType'
GO
