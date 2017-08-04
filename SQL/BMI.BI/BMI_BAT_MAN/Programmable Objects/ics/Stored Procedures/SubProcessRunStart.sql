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
, @ProcessRunID int
, @SubProcessRunId int = null output
, @RunType varchar(8) = null output
, @Instruction varchar(255) = null output
, @Message varchar(500) = null output
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		ics.SubProcessRunStart
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
		set @_ErrorContext = 'Failed to start new sub-process run at step: ' + coalesce('[' + @_Step + ']', 'NULL')

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
