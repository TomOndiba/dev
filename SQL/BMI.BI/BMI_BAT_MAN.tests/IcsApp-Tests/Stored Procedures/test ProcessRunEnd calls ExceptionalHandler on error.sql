CREATE procedure [IcsApp-Tests].[test ProcessRunEnd calls ExceptionalHandler on error]
as
	begin
		create table [IcsApp-Tests].Expected
		(
			ErrorContext   nvarchar(512)  null
		  , ErrorProcedure nvarchar(128)  null
		  , ErrorNumber	   int			  null
		  , ErrorSeverity  int			  null
		  , ErrorState	   int			  null
		  , ErrorLine	   int			  null
		  , ErrorMessage   nvarchar(4000) null
		  , ReturnMessage  nvarchar(1000) null
		  , ExceptionId	   int			  null
		) ;


		insert into [IcsApp-Tests].Expected
		(
			ErrorContext
		  , ErrorProcedure
		  , ErrorNumber
		)
		values
		(
			'Failed to start new batch run at step: [Validate Inputs]', '[dbo].[SubProcessRunEnd]', 0
		) ;



		exec tSQLt.SpyProcedure N'log4.ExceptionHandler' ;

		exec dbo.SubProcessRunEnd
			@ProcessName = 'pn'
		  , @SubProcessName = 'spn' 
		  , @SubProcessRunID = 0
		  , @EndState = 'Succeeded'
		  , @EndMessage = 'default'

		exec tSQLt.AssertEqualsTable
			@Expected = '[IcsApp-Tests].Expected'
		  , @Actual = N'log4.ExceptionHandler_spyprocedureLog' ;

	end ;