create procedure [IcsApp-Tests].[test ProcessRunEnd calls ExceptionalHandler on error]
as
	begin
		create table [IcsApp-Tests].Expected1
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


		insert into [IcsApp-Tests].Expected1
		(
			ErrorContext
		  , ErrorProcedure
		  , ErrorNumber
		)
		values
		(
			'Failed to start new batch run at step: [Validate Inputs]', '[dbo].[ProcessRunEnd]', 0
		) ;



		exec tSQLt.SpyProcedure N'log4.ExceptionHandler' ;

		exec dbo.ProcessRunEnd
			@ProcessName = ''
		  , @ProcessRunID = 1
		  , @EndState = 'es'
		  , @EndMessage = 'default'
		  , @ChangeDataCaptureStart = '24-July-2017'
		  , @ChangeDataCaptureEnd = '24-July-2017' ;

		exec tSQLt.AssertEqualsTable
			@Expected = '[IcsApp-Tests].Expected1'
		  , @Actual = N'log4.ExceptionHandler_spyprocedureLog' ;

	end ;



--EXEC  tsqlt.run '[IcsApp-Tests].[test ThreadRunStart calls ExceptionalHandler on error]'