IF OBJECT_ID('[IcsApp].[MappingConfigTaskGetCurrentRunIds]') IS NOT NULL
	DROP PROCEDURE [IcsApp].[MappingConfigTaskGetCurrentRunIds];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [IcsApp].[MappingConfigTaskGetCurrentRunIds]
(
  @MappingConfigTaskName varchar(100)
, @ThreadRunId  int = null out
, @SubProcessRunId int = null out
, @ProcessRunId int = null out
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		IcsApp.MappingConfigTaskGetCurrentRunIds
DESCRIPTION:		Outputs the current/most recent open Thread, Step and Process Run Ids for the specified Mapping
					Config Task.  If there is no thread, all values will be null, if any of the related Process or
					Step runs are NULL, they too will be returned as null
ORIGIN DATE:		14-AUG-2017
ORIGINAL AUTHOR:	Greg M. Lucas

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
001		14-AUG-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------

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

	begin try
		set @_Step = 'Validate Inputs';

		if coalesce(@MappingConfigTaskName, '') = ''
			raiserror('Mapping Config Task Name must not be null or empty', 16, 1) ;

		set @_Step = 'Fetch dummy values for stub' ;

		select
			  @ThreadRunId = ThreadRunID
			, @SubProcessRunId = SubProcessRunID
			, @ProcessRunId = ProcessRunID
		from
			dbo.StubResultSet
		where
			FunctionName = @_FunctionName ;
	end try
	begin catch
		set @_ErrorContext = 'Failed to output current run Ids for MCT Name: ' + coalesce('"' + @MappingConfigTaskName + '"', 'NULL')
			+ ' at step: ' + coalesce('[' + @_Step + ']', 'NULL')

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
EXEC sp_addextendedproperty N'MS_Description', N'Outputs the current/most recent open Thread, Step and Process Run Ids for the specified Mapping Config Task.  If there is no thread, all values will be null, if any of the related Process or Step runs are NULL, they too will be returned as null', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'MappingConfigTaskGetCurrentRunIds', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Output, the unique Id for the current or latest open (master) process run context for the open thread run dictated by the specified Mapping Config Task. If there is no open process associated with this thread, the output will be null', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'MappingConfigTaskGetCurrentRunIds', 'PARAMETER', N'@ProcessRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Output, the unique Id for the current or latest open step/sub-process run context for the open thread run dictated by the specified Mapping Config Task. If there is no open step associated with this thread, the output will be null', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'MappingConfigTaskGetCurrentRunIds', 'PARAMETER', N'@SubProcessRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Output, the unique Id for the current or latest open thread run context for the specified Mapping Config Task. If this MCT has NO open threads, than this and all other outputs will be null.', 'SCHEMA', N'IcsApp', 'PROCEDURE', N'MappingConfigTaskGetCurrentRunIds', 'PARAMETER', N'@ThreadRunId'
GO
