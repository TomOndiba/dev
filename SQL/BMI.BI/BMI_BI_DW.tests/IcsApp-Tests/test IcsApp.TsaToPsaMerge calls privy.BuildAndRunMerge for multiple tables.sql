create proc [IcsApp-Tests].[test IcsApp.TsaToPsaMerge calls privy.BuildAndRunMerge for multiple tables]
as
	begin
		exec tSQLt.FakeTable 'dbo.psaTotsaLoadControlTable' ;
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
		union
		select	'Full', 'STable1', 'tsa', 'TTable1', 'psa', null
		union
		select	'Full', 'STable2', 'tsa', 'TTable2', 'psa', null ;


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
		select	2, 'STable1', 'tsa', 'col1', 'TTable1', 'psa', 'col1', 1
		union
		select	3, 'STable3', 'tsa', 'col1', 'TTable3', 'psa', 'col1', 2
		union
		select	4, 'STable2', 'tsa', 'col1', 'TTable2', 'psa', 'col1', 1 ;

		--select * from dbo.psaTotsaLoadControlTable

		execute IcsApp.TsaToPsaMerge 1, 'Full' ;

		exec tSQLt.AssertEqualsTable
			'#expected'
		  , 'privy.TsaToPsaBuildAndRunMerge_SpyProcedureLog' ;

	end ;