create  procedure [IcsApp-Tests].[test SubProcessCheckThreads throws error on @SubProcessRunID null]
as
	begin
		exec tSQLt.SpyProcedure N'log4.ExceptionHandler', N'Set @ErrorNumber = 1' ;
		exec tSQLt.SpyProcedure N'log4.JournalWriter' ;

		exec tSQLt.ExpectException @ExpectedErrorNumber = 50000 ;

		exec [dbo].[SubProcessCheckThreads]
		@SubProcessName  ='spn'
		,@SubProcessRunID  =null


	end ;