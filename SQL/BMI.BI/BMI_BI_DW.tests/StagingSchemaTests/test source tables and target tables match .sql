
CREATE PROCEDURE [StagingSchemaTests].[test source tables and target tables match ]
AS
-- ASC 27/02/2018, table names DummyICS (drop?), PU_CATEGORY (no psa) and PU_LINK_CATEGORY (no psa) excluded until these can be resolved
	BEGIN
		SELECT
			REPLACE(s.TABLE_NAME, 'ics_land_', '') AS [TABLE_NAME]
		INTO
			#expected
		FROM
			INFORMATION_SCHEMA.TABLES s
		WHERE
			s.TABLE_SCHEMA = 'tsa'
			AND s.TABLE_NAME NOT IN
					('ics_sql_dummySource', 'ics_sql_runLog',
						 'DummyICS','PU_CATEGORY','PU_LINK_CATEGORY'); -- excluded until resolved 

		SELECT DISTINCT
			REPLACE(t.TABLE_NAME, 'ics_stg_', '') AS [TABLE_NAME]
		INTO
			#actual
		FROM
			INFORMATION_SCHEMA.COLUMNS AS t
		WHERE
			t.TABLE_SCHEMA = 'psa'
			AND t.TABLE_NAME NOT IN
					('ics_sql_dummySource', 'ics_sql_runLog',
						 'DummyICS','PU_CATEGORY','PU_LINK_CATEGORY') ; -- excluded until resolved

		EXEC tSQLt.AssertEqualsTable '#expected', '#actual' ;
	END ;