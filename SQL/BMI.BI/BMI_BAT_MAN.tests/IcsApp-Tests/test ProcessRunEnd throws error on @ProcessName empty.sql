create procedure [IcsApp-Tests].[test ProcessRunEnd throws error on @ProcessName empty]
as
	begin
		exec tSQLt.SpyProcedure N'log4.ExceptionHandler', N'Set @ErrorNumber = 1' ;
		exec tSQLt.SpyProcedure N'log4.JournalWriter' ;

		exec tSQLt.ExpectException @ExpectedErrorNumber = 50000 ;

		exec dbo.ProcessRunEnd
			@ProcessName = ''
		  , @ProcessRunID = 1
		  , @EndState = 'es'
		  , @EndMessage = 'default'
		  , @ChangeDataCaptureStart = '24-July-2017'
		  , @ChangeDataCaptureEnd = '24-July-2017' ;

	end ;