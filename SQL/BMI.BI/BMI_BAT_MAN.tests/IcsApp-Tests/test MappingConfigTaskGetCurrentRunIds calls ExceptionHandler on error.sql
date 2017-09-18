CREATE   procedure [IcsApp-Tests].[test MappingConfigTaskGetCurrentRunIds calls ExceptionHandler on error]
as
begin
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler';

	select
		  cast('Failed to output current run Ids for MCT Name: NULL at step: [Validate Inputs]' as varchar(max)) as [ErrorContext]
		, cast('[IcsApp].[MappingConfigTaskGetCurrentRunIds]' as varchar(max)) as [ErrorProcedure]
	into
		#expected

	--! Act
	exec IcsApp.MappingConfigTaskGetCurrentRunIds @MappingConfigTaskName = null ;

	--! Assert
	exec tSQLt.AssertEqualsTable '#expected', 'log4.ExceptionHandler_SpyProcedureLog';
end;