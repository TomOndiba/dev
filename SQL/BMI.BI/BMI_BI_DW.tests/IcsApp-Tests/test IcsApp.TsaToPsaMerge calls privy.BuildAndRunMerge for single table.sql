CREATE proc [IcsApp-Tests].[test IcsApp.TsaToPsaMerge calls privy.BuildAndRunMerge for single table]
 as
	begin
		exec tSQLt.FakeTable 'dbo.TsaToPsaLoadControlTable' ;
		exec tSQLt.SpyProcedure 'privy.TsaToPsaValidateSchema' ;
		exec tSQLt.SpyProcedure 'privy.TsaToPsaBuildAndRunMerge' ;
		exec tSQLt.SpyProcedure 'privy.TsaToPsaDeDupe' ;

		create table #expected
		(
			RunType			 varchar(25)  collate Latin1_General_BIN
		  , SourceTableName	 varchar(255) collate Latin1_General_BIN
		  , SourceSchemaName varchar(55)  collate Latin1_General_BIN
		  , TargetTableName	 varchar(255) collate Latin1_General_BIN
		  , TargetSchemaName varchar(255) collate Latin1_General_BIN
		  , LoadDateTime	 smalldatetime
		) ;

		insert into #expected
		(
			RunType
		  , SourceTableName
		  , SourceSchemaName
		  , TargetTableName
		  , TargetSchemaName
		  , LoadDateTime
		)
		select	'Full', 'STable', 'tsa', 'TTable', 'psa', null
	
	


		insert into dbo.TsaToPsaLoadControlTable
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
	
		execute IcsApp.TsaToPsaMerge 1, 'Full' ;

		exec tSQLt.AssertEqualsTable
			'#expected'
		  , 'privy.TsaToPsaBuildAndRunMerge_SpyProcedureLog' ;

	end ;