create     proc [IcsApp-Tests].[test IcsApp.TsaToPsaMerge calls privy.BuildAndRunMerge for single table]
 as
	begin
		exec tSQLt.FakeTable 'dbo.psaTotsaLoadControlTable' ;
		exec tSQLt.SpyProcedure 'privy.TsaToPsaValidateSchema' ;
		exec tSQLt.SpyProcedure 'privy.BuildAndRunMerge' ;

		create table #expected
		(
			RunType			 varchar(25)  collate Latin1_General_CI_AS
		  , sourceTableName	 varchar(255) collate Latin1_General_CI_AS
		  , sourceschemaName varchar(55)  collate Latin1_General_CI_AS
		  , targetTableName	 varchar(255) collate Latin1_General_CI_AS
		  , TargetSchemaName varchar(255) collate Latin1_General_CI_AS
		  , LoadDateTime	 smalldatetime
		) ;

		insert into #expected
		(
			RunType
		  , sourceTableName
		  , sourceschemaName
		  , targetTableName
		  , TargetSchemaName
		  , LoadDateTime
		)
		select	'Full', 'STable', 'tsa', 'TTable', 'psa', null
	
	


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
		select	1, 'STable', 'tsa', 'col1', 'TTable', 'psa', 'col1', 1
		union
		select	3, 'STable3', 'tsa', 'col1', 'TTable3', 'psa', 'col1', 2
	

		--select * from dbo.psaTotsaLoadControlTable

		execute IcsApp.TsaToPsaMerge 1, 'Full' ;

		exec tSQLt.AssertEqualsTable
			'#expected'
		  , 'privy.BuildAndRunMerge_SpyProcedureLog' ;

	end ;