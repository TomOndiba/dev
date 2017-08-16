CREATE   procedure [tsa-to-psa-tests].[test privy.Dedupe throws error on @SourceTableName null]
as
	begin
		exec tSQLt.SpyProcedure N'log4.ExceptionHandler', N'Set @ErrorNumber = 1' ;
		exec tSQLt.ExpectException @ExpectedErrorNumber = 50000 ;

		exec privy.DeDupe @SourceSchemaName ='s', @SourceTableName=null

	end ;