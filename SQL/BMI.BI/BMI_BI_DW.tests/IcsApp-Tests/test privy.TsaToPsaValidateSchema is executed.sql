create   proc [IcsApp-Tests].[test privy.TsaToPsaValidateSchema is executed]
as
	begin
	
		create table #expected
		(
			DataSourceKey int
		) ;

		insert into #expected select	1 ;
		
		exec tSQLt.SpyProcedure 'privy.TsaToPsaValidateSchema' ;
		execute IcsApp.TsaToPsaMerge 1, 'full' ;

		exec tSQLt.AssertEqualsTable
			'#expected'
		  , 'privy.TsaToPsaValidateSchema_SpyProcedureLog' ;
	end ;