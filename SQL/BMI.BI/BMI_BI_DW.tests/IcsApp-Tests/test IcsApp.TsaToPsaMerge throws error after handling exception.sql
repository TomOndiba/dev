create   proc [IcsApp-Tests].[test IcsApp.TsaToPsaMerge throws error after handling exception]
as
	begin
		exec tSQLt.SpyProcedure 'log4.ExceptionHandler','set @ErrorNumber=500' ;
					
		execute tSQLt.ExpectException
		execute IcsApp.TsaToPsaMerge null, 'full' ;
	end ;