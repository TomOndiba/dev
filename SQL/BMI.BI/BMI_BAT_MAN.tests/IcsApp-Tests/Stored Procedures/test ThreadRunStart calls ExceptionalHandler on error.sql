create procedure [IcsApp-Tests].[test ThreadRunStart calls ExceptionalHandler on error]
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
			'Failed to start new batch run at step: [Validate Inputs]', '[dbo].[ThreadRunStart]', 0
		) ;

		exec tSQLt.SpyProcedure N'log4.ExceptionHandler' ;

		exec dbo.ThreadRunStart
			@MappingName = ''
		  , @MappingConfigTaskName = 'd'
		  , @SubProcessRunID = 1 ;

		exec tSQLt.AssertEqualsTable
			@Expected = '[IcsApp-Tests].Expected1'
		  , @Actual = N'log4.ExceptionHandler_spyprocedureLog' ;
	end ;
go
