CREATE   procedure [tsa-to-psa-tests].[test privy.Dedupe throws error on @SourceTableName empty]
as
	begin
		exec tSQLt.SpyProcedure N'log4.ExceptionHandler', N'Set @ErrorNumber = 1' ;
		exec tSQLt.ExpectException @ExpectedErrorNumber = 50000 ;

		exec privy.TsaToPsaDeDupe @SourceSchemaName ='s', @SourceTableName=''

	end ;