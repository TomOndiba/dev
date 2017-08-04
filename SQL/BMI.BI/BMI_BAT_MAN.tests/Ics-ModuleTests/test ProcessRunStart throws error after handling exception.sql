create   procedure [Ics-ModuleTests].[test ProcessRunStart throws error after handling exception]
as
begin
	--! Assemble
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler', @CommandToExecute = N'set @ErrorNumber = 999';

	--! Assert
	exec tSQLt.ExpectException @ExpectedErrorNumber = 207 ;

	--! For now, as this is just a stub, the only way we can force an error is to drop a dependant column
	--! on the stub results table - we will need to refactor this test when that stub table is replaced
	alter table dbo.StubResultSet drop column ProcessRunID;

	--! Act
	exec ics.ProcessRunStart
		@ProcessName = 'A'
	  , @IcrtProcessId = 99
end;