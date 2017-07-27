create   procedure [tsa-to-psa-tests].[test source columns match target]
as
begin
	select
		replace(c.TABLE_NAME, 'ICS_LAND_', '') as [TABLE_NAME]
	  , c.COLUMN_NAME
	  , c.COLUMN_DEFAULT
	  , c.IS_NULLABLE
	  , c.DATA_TYPE
	  , c.CHARACTER_MAXIMUM_LENGTH
	  , c.NUMERIC_PRECISION
	  , c.NUMERIC_SCALE
	  , c.DATETIME_PRECISION
	  , c.COLLATION_NAME
	into
		#expected
	from
		INFORMATION_SCHEMA.COLUMNS as c
	where
		c.TABLE_SCHEMA = 'tsa'

	select
		replace(c.TABLE_NAME, 'ICS_STG_', '') as [TABLE_NAME]
	  , c.COLUMN_NAME
	  , c.COLUMN_DEFAULT
	  , c.IS_NULLABLE
	  , c.DATA_TYPE
	  , c.CHARACTER_MAXIMUM_LENGTH
	  , c.NUMERIC_PRECISION
	  , c.NUMERIC_SCALE
	  , c.DATETIME_PRECISION
	  , c.COLLATION_NAME
	into
		#actual
	from
		INFORMATION_SCHEMA.COLUMNS as c
	where
		c.TABLE_SCHEMA = 'psa'	
	and COLUMN_NAME not in ('EtlRecordId', 'IsIncomplete', 'EtlUpdatedOn', 'EtlUpdatedBy', 'EtlDeletedOn', 'EtlDeletedBy', 'IsDeleted')

	exec tSQLt.AssertEqualsTable '#expected', '#actual' ;
end