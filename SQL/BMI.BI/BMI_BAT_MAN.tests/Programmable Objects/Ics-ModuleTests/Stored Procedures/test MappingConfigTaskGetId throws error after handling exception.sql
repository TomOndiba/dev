create   procedure [Ics-ModuleTests].[test MappingConfigTaskGetId throws error after handling exception]
as
begin
	--! Assemble
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler', @CommandToExecute = N'set @ErrorNumber = 999';

	--! Assert
	exec tSQLt.ExpectException @ExpectedErrorNumber = 50000 ;

	--! Act
	exec ics.MappingConfigTaskGetId @MappingConfigTaskName = null, @MappingName = 'B'
end;