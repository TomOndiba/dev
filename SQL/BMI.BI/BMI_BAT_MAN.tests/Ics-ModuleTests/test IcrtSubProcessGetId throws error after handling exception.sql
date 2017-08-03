create   procedure [Ics-ModuleTests].[test IcrtSubProcessGetId throws error after handling exception]
as
begin
	--! Assemble
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler', @CommandToExecute = N'set @ErrorNumber = 999';

	--! Assert
	exec tSQLt.ExpectException @ExpectedErrorNumber = 50000 ;

	--! Act
	exec ics.IcrtSubProcessGetId @IcrtSubProcessName = null, @BatchId = 1
end;