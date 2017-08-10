create   procedure [IcsApp-Tests].[test TsaToPsaMerge throws error on @DataSourceKey null]
as
	begin
		exec tSQLt.SpyProcedure N'log4.ExceptionHandler', N'Set @ErrorNumber = 1' ;
		exec tSQLt.ExpectException @ExpectedErrorNumber = 50000 ;

		exec IcsApp.TsaToPsaMerge @DataSourceKey=null

	end ;