if object_id('[ics].[ThreadRunEnd]') is not null
	drop procedure [ics].[ThreadRunEnd];
go
set quoted_identifier on
go
set ansi_nulls on
go
create proc [ics].[ThreadRunEnd]
(
  @MappingConfigTaskName varchar(100)
, @MappingName varchar(100)
, @ThreadRunId int
, @EndState varchar(16)
, @EndMessage varchar(500) = null
, @SuccessSourceRows int
, @FailedSourceRows int
, @SuccessTargetRows int
, @FailedTargetRows int
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		ics.ThreadRunEnd
DESCRIPTION:		POC stub procedure
ORIGIN DATE:		25-JUL-2017
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
		set @_Step = 'Record POC' ;

		/*===============================================================================================*/
		/**/	set @_Message = 'Record end of Thread run - Not Yet Implemented'
		/**/		+ ' for MCT Name: ' + coalesce('"' + @MappingConfigTaskName + '"', 'NULL')
		/**/		+ ' , Mapping: ' + coalesce('"' + @MappingName + '"', 'NULL')
		/**/		+ ' and (BatMan) Thread Run Id: ' + coalesce(cast(@ThreadRunId as varchar(32)), 'NULL')
		/**/		+ ' with End State: ' + coalesce('[' + @EndState + ']', 'NULL')
		/*===============================================================================================*/

	end try
	begin catch
		set @_ErrorContext = 'Failed to record end of thread run'
			+ ' for MCT Name: ' + coalesce('"' + @MappingConfigTaskName + '"', 'NULL')
			+ ' , Mapping: ' + coalesce('"' + @MappingName + '"', 'NULL')
			+ ' and (BatMan) Thread Run Id: ' + coalesce(cast(@ThreadRunId as varchar(32)), 'NULL')
			+ ' with End State: ' + coalesce('[' + @EndState + ']', 'NULL')
			+ ' at step: ' + coalesce('[' + @_Step + ']', 'NULL')

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

	/*===========================================================================*/
	/**/	exec log4.JournalWriter
	/**/		  @Task = 'POC'
	/**/		, @FunctionName = @_FunctionName
	/**/		, @StepInFunction = @_Step
	/**/		, @MessageText = @_Message
	/**/		, @Severity = 1024 -- DEBUG
	/**/		, @ExceptionId = @_ExceptionId
	/*===========================================================================*/

	--! Finally, throw an exception that will be detected by the caller
	if @_Error > 0 raiserror(@_Message, 16, 99) ;
	
	set nocount off ;

	--! Return the value of @@ERROR (which will be zero on success)
	return (@_Error) ;
end ;
go
