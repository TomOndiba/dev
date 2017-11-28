create   procedure [IcsApp-Tests].[test MappingConfigTaskGetCurrentRunIds throws error after handling exception]
as
begin
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler', @CommandToExecute = N'set @ErrorNumber = 999';

	exec tSQLt.ExpectException @ExpectedErrorNumber = 50000 ;

	exec IcsApp.MappingConfigTaskGetCurrentRunIds @MappingConfigTaskName = null ;
end;