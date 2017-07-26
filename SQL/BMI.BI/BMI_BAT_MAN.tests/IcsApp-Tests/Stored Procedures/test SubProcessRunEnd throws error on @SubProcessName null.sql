create procedure [IcsApp-Tests].[test SubProcessRunEnd throws error on @SubProcessName null]
as
	begin
		exec tSQLt.SpyProcedure N'log4.ExceptionHandler', N'Set @ErrorNumber = 1' ;
		exec tSQLt.SpyProcedure N'log4.JournalWriter' ;

		exec tSQLt.ExpectException @ExpectedErrorNumber = 50000 ;

		exec dbo.SubProcessRunEnd
			@ProcessName = 'pn'
		  , @SubProcessName = null 
		  , @SubProcessRunID = 1
		  , @EndState = 'Succeeded'
		  , @EndMessage = 'default'
	end ;