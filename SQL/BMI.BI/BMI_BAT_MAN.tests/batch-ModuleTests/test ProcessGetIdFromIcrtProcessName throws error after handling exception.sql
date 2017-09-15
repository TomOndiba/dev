create   procedure [batch-ModuleTests].[test ProcessGetIdFromIcrtProcessName throws error after handling exception]
as
begin
	--! Assemble
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler', @CommandToExecute = N'set @ErrorNumber = 999';

	--! Assert
	exec tSQLt.ExpectException @ExpectedErrorNumber = 50000 ;

	--! Act
	exec batch.ProcessGetIdFromIcrtProcessName @IcrtProcessName = null
end;