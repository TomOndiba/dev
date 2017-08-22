
CREATE   proc [IcsApp-Tests].[test IcsApp.TsaToPsaMerge calls privy.TsaToPsaValidateSchema]
as
	begin
		exec tSQLt.FakeTable 'dbo.TsaToPsaLoadControlTable' ;
		exec tSQLt.SpyProcedure 'privy.TsaToPsaValidateSchema' ;
		exec tSQLt.SpyProcedure 'privy.TsaToPsaBuildAndRunMerge' ;

		select cast(1 as int) as DataSourceKey into #expected;

		execute IcsApp.TsaToPsaMerge 1, 'full' ;

		exec tSQLt.AssertEqualsTable
			'#expected'
		  , 'privy.TsaToPsaValidateSchema_SpyProcedureLog' ;
	end ;