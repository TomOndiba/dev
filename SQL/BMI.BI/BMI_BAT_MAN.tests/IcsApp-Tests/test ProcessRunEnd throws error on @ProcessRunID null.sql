

create procedure [IcsApp-Tests].[test ProcessRunEnd throws error on @ProcessRunID null]
as
	begin
		exec tSQLt.SpyProcedure N'log4.ExceptionHandler', N'Set @ErrorNumber = 1' ;
		exec tSQLt.SpyProcedure N'log4.JournalWriter' ;

		exec tSQLt.ExpectException @ExpectedErrorNumber = 50000 ;

		exec dbo.ProcessRunEnd
			@ProcessName = 'pn'
		  , @ProcessRunID = null
		  , @EndState = 'es'  
		  , @EndMessage = 'default'
		  , @ChangeDataCaptureStart = '24-July-2017'
		  , @ChangeDataCaptureEnd = '24-July-2017' ;

	end ;