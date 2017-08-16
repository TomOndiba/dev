CREATE   proc [tsa-to-psa-tests].[test privy.Dedupe flags duplicate rows]
as
	begin

		exec tSQLt.FakeTable 'dbo.psaTotsaLoadControlTable' ;

		create table expected
		(
			col1			   varchar(25)	collate Latin1_General_CI_AS
		  , col2			   varchar(255) collate Latin1_General_CI_AS
		  , col3			   varchar(55)	collate Latin1_General_CI_AS
		  , ck1				   int
		  , ck2				   int
		  , ck3				   int
		  , ExcludeFromMerge   bit		default 0
		  , IsDuplicate		   bit		default 0
		) ;

		insert into expected
		(
			col1
		  , col2
		  , col3
		  , ck1
		  , ck2
		  , ck3
		  , ExcludeFromMerge
		  , IsDuplicate
		)
		select	'col1', 'col2', 'col3', 1, 1, 1, 1, 1
		union all
		select	'col1', 'col2', 'col3', 1, 1, 1, 1, 1
		union all
		select	'col1', 'col2', 'col3', 1, 1, 1, 1, 1
		union all
		select	'col1', 'col2', 'col3', 1, 2, 2, 1, 1
		union all
		select	'col1', 'col2', 'col3', 1, 2, 2, 1, 1
		union all
		select	'col1', 'col2', 'col3', 1, 3, 2, 0, 0 ;
		 ;
		
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
		select	1, 'STable', 'tsa', 'ck1,ck2,ck3', 'TTable', 'psa', 'ck1,ck2,ck3', 1 ;

		create table tsa.STable
		(
			col1			   varchar(25)	collate Latin1_General_CI_AS
		  , col2			   varchar(255) collate Latin1_General_CI_AS
		  , col3			   varchar(55)	collate Latin1_General_CI_AS
		  , ck1				   int
		  , ck2				   int
		  , ck3				   int
		  , ExcludeFromMerge   smallint		default 0
		  , IsDuplicate smallint		default 0
		) ;

		insert into tsa.STable
		(
			col1
		  , col2
		  , col3
		  , ck1
		  , ck2
		  , ck3
		)
		select	'col1', 'col2', 'col3', 1, 1, 1
		union all
		select	'col1', 'col2', 'col3', 1, 1, 1
		union all
		select	'col1', 'col2', 'col3', 1, 1, 1
		union all
		select	'col1', 'col2', 'col3', 1, 2, 2
		union all
		select	'col1', 'col2', 'col3', 1, 2, 2 
		union all
		select	'col1', 'col2', 'col3', 1, 3, 2 ;

		exec privy.DeDupe @sourceschemaName = 'tsa', @sourceTableName = 'STable' ;
		exec tSQLt.AssertEqualsTable @Expected = 'expected', @Actual = 'tsa.STable' ;

end ;