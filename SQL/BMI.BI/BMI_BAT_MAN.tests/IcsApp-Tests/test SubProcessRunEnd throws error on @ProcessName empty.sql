create procedure [IcsApp-Tests].[test SubProcessRunEnd throws error on @ProcessName empty]
as
	begin
		exec tSQLt.SpyProcedure N'log4.ExceptionHandler', N'Set @ErrorNumber = 1' ;
		exec tSQLt.SpyProcedure N'log4.JournalWriter' ;

		exec tSQLt.ExpectException @ExpectedErrorNumber = 50000 ;

		exec dbo.SubProcessRunEnd
			@ProcessName = ''
		  , @SubProcessName = 'sp'
		  , @SubProcessRunID = 1
		  , @EndState = 'es'
		  , @EndMessage = 'default'
	end ;