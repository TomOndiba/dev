CREATE     PROCEDURE [IcsApp-Tests].[test SubProcessRunStart throws error on @ProcessRunID null]
AS
BEGIN
	EXEC tSQLt.SpyProcedure N'log4.ExceptionHandler', N'Set @ErrorNumber = 1';
	EXEC tSQLt.SpyProcedure N'log4.JournalWriter';

	EXEC tSQLt.ExpectException @ExpectedErrorNumber = 50000

	EXEC dbo.SubProcessRunStart
	@ProcessName = 'pn', 
	@SubProcessName='spn',
	@ProcessRunID=NULL 

END;