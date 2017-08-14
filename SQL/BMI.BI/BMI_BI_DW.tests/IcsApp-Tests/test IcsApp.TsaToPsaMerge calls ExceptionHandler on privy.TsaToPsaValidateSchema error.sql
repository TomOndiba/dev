create   proc [IcsApp-Tests].[test IcsApp.TsaToPsaMerge calls ExceptionHandler on privy.TsaToPsaValidateSchema error]
as
	begin
		exec tSQLt.FakeTable 'dbo.psaTotsaLoadControlTable' ;
		exec tSQLt.SpyProcedure 'privy.TsaToPsaValidateSchema', 'raiserror(''oops'',16,1)' ;
		exec tSQLt.SpyProcedure 'privy.BuildAndRunMerge' ;
		exec tSQLt.SpyProcedure 'log4.ExceptionHandler' ;
					
		select 'Failed to merge to tsa to psa at Step: [Run privy.TsaToPsaValidateSchema]' as ErrorContext ,'[IcsApp].[TsaToPsaMerge]' as 
		ErrorProcedure into #expected;

		execute IcsApp.TsaToPsaMerge 1, 'full' ;

		exec tSQLt.AssertEqualsTable
			'#expected'
		  , 'log4.ExceptionHandler_SpyProcedureLog' ;
	end ;