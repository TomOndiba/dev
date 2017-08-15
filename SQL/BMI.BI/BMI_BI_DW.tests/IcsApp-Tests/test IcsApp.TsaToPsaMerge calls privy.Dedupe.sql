CREATE    proc [IcsApp-Tests].[test IcsApp.TsaToPsaMerge calls privy.Dedupe]
as
	begin
		exec tSQLt.FakeTable 'dbo.psaTotsaLoadControlTable' ;
		exec tSQLt.SpyProcedure 'privy.TsaToPsaValidateSchema' ;
		exec tSQLt.SpyProcedure 'privy.Dedupe' ;
		exec tSQLt.SpyProcedure 'privy.BuildAndRunMerge' ;

		create table #expected
		(
			sourceTableName	 varchar(255) collate Latin1_General_CI_AS
		  , sourceschemaName varchar(55)  collate Latin1_General_CI_AS
		) ;

		insert into #expected
		(
			sourceTableName
		  , sourceschemaName
		)
		select	'STable', 'tsa' ;



		insert into dbo.psaTotsaLoadControlTable
		(
			ID
		  , SourceTable
		  , SourceSchema
		  , SourcePK
		  , TargetTable
		  , TargetSchema
		  , TargetPK
		  , DataSourceKey
		)
		select	1, 'STable', 'tsa', 'col1', 'TTable', 'psa', 'col1', 1 ;

		execute IcsApp.TsaToPsaMerge 1, 'Full' ;

		exec tSQLt.AssertEqualsTable
			'#expected'
		  , 'privy.Dedupe_SpyProcedureLog' ;

	end ;