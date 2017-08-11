CREATE procedure [IcsApp-Tests].[test SubProcessCheckThreads throws error on @ProcessName empty]
as
begin
	exec tSQLt.SpyProcedure N'log4.ExceptionHandler', N'Set @ErrorNumber = 1' ;
	exec tSQLt.SpyProcedure N'log4.JournalWriter' ;

	exec tSQLt.ExpectException @ExpectedErrorNumber = 50000 ;

	exec IcsApp.SubProcessCheckThreads @SubProcessName = '', @SubProcessRunID = 1 ;
end ;