CREATE procedure [StagingSchemaTests].[test source tables and target tables match ]
as
	begin
		select
			replace(s.TABLE_NAME, 'ICS_LAND_', '') as [TABLE_NAME]
		into
			#expected
		from
			INFORMATION_SCHEMA.TABLES s
		where
			s.TABLE_SCHEMA = 'tsa'
			and s.TABLE_NAME not in
					('ics_sql_dummySource', 'ics_sql_runLog') ;

		select distinct
			replace(t.TABLE_NAME, 'ICS_STG_', '') as [TABLE_NAME]
		into
			#actual
		from
			INFORMATION_SCHEMA.COLUMNS as t
		where
			t.TABLE_SCHEMA = 'psa'
			and t.TABLE_NAME not in
					('ics_sql_dummySource', 'ics_sql_runLog') ;


		exec tSQLt.AssertEqualsTable '#expected', '#actual' ;
	end ;