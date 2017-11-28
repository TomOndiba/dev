IF OBJECT_ID('[IcsApp-Tests].[test MappingConfigTaskGetCurrentRunIds stub outputs expected parameter values]') IS NOT NULL
	DROP PROCEDURE [IcsApp-Tests].[test MappingConfigTaskGetCurrentRunIds stub outputs expected parameter values];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [IcsApp-Tests].[test MappingConfigTaskGetCurrentRunIds stub outputs expected parameter values]
as
begin
	declare @_ExpectedProcessRunId int = (select ProcessRunID from dbo.StubResultSet where FunctionName = '[IcsApp].[MappingConfigTaskGetCurrentRunIds]') ;
	declare @_ExpectedSubProcessRunId int = (select SubProcessRunID from dbo.StubResultSet where FunctionName = '[IcsApp].[MappingConfigTaskGetCurrentRunIds]') ;
	declare @_ExpectedThreadRunId int = (select ThreadRunID from dbo.StubResultSet where FunctionName = '[IcsApp].[MappingConfigTaskGetCurrentRunIds]') ;

	select
		  @_ExpectedProcessRunId	as [ProcessRunId]
		, @_ExpectedSubProcessRunId	as [SubProcessRunId]
		, @_ExpectedThreadRunId		as [ThreadRunId]
	into
		#expected

	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler', @CommandToExecute = N'set @ErrorNumber = 999';

	declare @_ActualProcessRunId int, @_ActualSubProcessRunId int, @_ActualThreadRunId int ;

	exec IcsApp.MappingConfigTaskGetCurrentRunIds
		  @MappingConfigTaskName = 'Non-existent MCT Name (for stub test)'
		, @ProcessRunId = @_ActualProcessRunId output
		, @SubProcessRunId = @_ActualSubProcessRunId output
		, @ThreadRunId = @_ActualThreadRunId output ;

	select
		  @_ActualProcessRunId		as [ProcessRunId]
		, @_ActualSubProcessRunId	as [SubProcessRunId]
		, @_ActualThreadRunId		as [ThreadRunId]
	into
		#actual

	exec tSQLt.AssertEqualsTable '#expected', '#actual' ;
end;
GO
