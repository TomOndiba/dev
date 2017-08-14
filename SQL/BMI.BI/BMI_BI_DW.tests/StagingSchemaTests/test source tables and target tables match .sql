create   procedure [StagingSchemaTests].[test source tables and target tables match ]
as
begin
	select
		replace(c.TABLE_NAME, 'ICS_LAND_', '') as [TABLE_NAME]
	  --, c.COLUMN_NAME
	  --, c.COLUMN_DEFAULT
	  --, c.IS_NULLABLE
	  --, c.DATA_TYPE
	  --, c.CHARACTER_MAXIMUM_LENGTH
	  --, c.NUMERIC_PRECISION
	  --, c.NUMERIC_SCALE
	  --, c.DATETIME_PRECISION
	  --, c.COLLATION_NAME
	into
		#expected
	from
		INFORMATION_SCHEMA.COLUMNS as c
	where
			c.TABLE_SCHEMA = 'tsa'
		and c.TABLE_NAME not in ('ics_sql_dummySource','ics_sql_runLog')

	select
		replace(c.TABLE_NAME, 'ICS_STG_', '') as [TABLE_NAME]
	  --, c.COLUMN_NAME
	  --, c.COLUMN_DEFAULT
	  --, c.IS_NULLABLE
	  --, c.DATA_TYPE
	  --, c.CHARACTER_MAXIMUM_LENGTH
	  --, c.NUMERIC_PRECISION
	  --, c.NUMERIC_SCALE
	  --, c.DATETIME_PRECISION
	  --, c.COLLATION_NAME
	into
		#actual
	from
		INFORMATION_SCHEMA.COLUMNS as c
	where
			c.TABLE_SCHEMA = 'psa'	
		and c.TABLE_NAME not in ('ics_sql_dummySource','ics_sql_runLog')
		and COLUMN_NAME not in ('EtlRecordId', 'IsIncomplete', 'EtlUpdatedOn', 'EtlUpdatedBy', 'EtlDeletedOn', 'EtlDeletedBy', 'IsDeleted')

	exec tSQLt.AssertEqualsTable '#expected', '#actual' ;
end