﻿CREATE      PROCEDURE [IcsApp-Tests].[test SubProcessRunStart throws error on @SubProcessName empty]
AS
BEGIN
	EXEC tSQLt.SpyProcedure N'log4.ExceptionHandler', N'Set @ErrorNumber = 1';
	EXEC tSQLt.SpyProcedure N'log4.JournalWriter';

	EXEC tSQLt.ExpectException @ExpectedErrorNumber = 50000

	EXEC dbo.SubProcessRunStart
	@ProcessName = 'pn', 
	@SubProcessName='',
	@ProcessRunID=1

END;