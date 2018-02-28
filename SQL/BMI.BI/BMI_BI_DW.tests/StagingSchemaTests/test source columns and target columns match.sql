
CREATE PROCEDURE [StagingSchemaTests].[test source columns and target columns match]
AS
-- ASC 27/02/2018, table names DummyICS (drop?), PU_CATEGORY (no psa) and PU_LINK_CATEGORY (no psa) excluded until these can be resolved
	BEGIN
		;WITH sourceCte
		 AS
		 (
			 SELECT
					REPLACE(c.TABLE_NAME, 'ics_land_', '') AS [TABLE_NAME]
				  , c.COLUMN_NAME
				  , c.COLUMN_DEFAULT
				  , c.IS_NULLABLE
				  , c.DATA_TYPE
				  , c.CHARACTER_MAXIMUM_LENGTH
				  , c.NUMERIC_PRECISION
				  , c.NUMERIC_SCALE
				  , c.DATETIME_PRECISION
				  , c.COLLATION_NAME
			 FROM
					INFORMATION_SCHEMA.COLUMNS AS c
			 WHERE
					c.TABLE_SCHEMA = 'tsa'
				 AND c.TABLE_NAME NOT IN
						 ('ics_sql_dummySource', 'ics_sql_runLog','JobsExecutionDetails',
						 'DummyICS','PU_CATEGORY','PU_LINK_CATEGORY') -- excluded until resolved
				 AND c.COLUMN_NAME NOT IN
						 ('EtlBatchRunId', 'EtlStepRunId', 'EtlThreadRunId', 'DataSourceKey', 'EtlSourceTable', 'EtlCreatedOn', 'EtlCreatedBy'
						, 'ExcludeFromMerge', 'IsDuplicate'
						 )
				 AND c.COLUMN_NAME NOT IN
					 (
						 SELECT
								COL_NAME(ic.object_id, ic.column_id) AS PK
						 FROM
								sys.indexes			  AS i
						 INNER JOIN sys.index_columns AS ic
							 ON i.object_id = ic.object_id
								 AND i.index_id = ic.index_id
						 WHERE
								1 = 1
							 AND i.is_primary_key = 1
							 AND ic.object_id = OBJECT_ID('psa.' + REPLACE(c.TABLE_NAME, 'ics_land_', 'ics_stg_'))
					 )
			 EXCEPT
			 SELECT
					REPLACE(c.TABLE_NAME, 'ics_stg_', '') AS [TABLE_NAME]
				  , c.COLUMN_NAME
				  , c.COLUMN_DEFAULT
				  , c.IS_NULLABLE
				  , c.DATA_TYPE
				  , c.CHARACTER_MAXIMUM_LENGTH
				  , c.NUMERIC_PRECISION
				  , c.NUMERIC_SCALE
				  , c.DATETIME_PRECISION
				  , c.COLLATION_NAME
			 FROM
					INFORMATION_SCHEMA.COLUMNS AS c
			 WHERE
					c.TABLE_SCHEMA = 'psa'
				 AND c.TABLE_NAME NOT IN
						 ('ics_sql_dummySource', 'ics_sql_runLog','JobsExecutionDetails',
						 'DummyICS','PU_CATEGORY','PU_LINK_CATEGORY') -- excluded until resolved
				 AND c.COLUMN_NAME NOT IN
						 ('EtlBatchRunId', 'EtlStepRunId', 'EtlThreadRunId', 'DataSourceKey', 'EtlSourceTable', 'EtlCreatedOn', 'EtlCreatedBy'
						, 'ExcludeFromMerge', 'IsDuplicate'
						 )
				 AND c.COLUMN_NAME NOT IN
						 ('EtlRecordId', 'IsIncomplete', 'EtlUpdatedOn', 'EtlUpdatedBy', 'EtlDeletedOn', 'EtlDeletedBy', 'IsDeleted')
				 --! We're only interested in validating columns for tables that exist in both TSA and PSA schemas, we already have
				 --! a test for mismatched tables
				 AND REPLACE(c.TABLE_NAME, 'ics_stg_', '') IN
					 (
						 SELECT
								REPLACE(t.TABLE_NAME, 'ics_land_', '')
						 FROM
								INFORMATION_SCHEMA.TABLES AS t
						 WHERE
								t.TABLE_SCHEMA = 'tsa'
					 )
				 AND c.COLUMN_NAME NOT IN
					 (
						 SELECT
								COL_NAME(ic.object_id, ic.column_id) AS PK
						 FROM
								sys.indexes			  AS i
						 INNER JOIN sys.index_columns AS ic
							 ON i.object_id = ic.object_id
								 AND i.index_id = ic.index_id
						 WHERE
								1 = 1
							 AND i.is_primary_key = 1
							 AND ic.object_id = OBJECT_ID('psa.' + c.TABLE_NAME)
					 )
		 )
		--!
		--! If there is as little as one failure, this can still take a long time to complete
		--! because tSQLt still prints out all the passing columns so just report on the first
		--! 50 mismatched columns
		--!
		SELECT TOP 50
			ctx.TABLE_NAME
		  , ctx.COLUMN_NAME
		  , ctx.COLUMN_DEFAULT
		  , ctx.IS_NULLABLE
		  , ctx.DATA_TYPE
		  , ctx.CHARACTER_MAXIMUM_LENGTH
		  , ctx.NUMERIC_PRECISION
		  , ctx.NUMERIC_SCALE
		  , ctx.DATETIME_PRECISION
		  , ctx.COLLATION_NAME
		INTO
			#results
		FROM
			sourceCte AS ctx
		ORDER BY
			ctx.TABLE_NAME
		  , ctx.COLUMN_NAME ;

		--! Add a CR/LF to the end of the message so any failure output is better formatted
		DECLARE @_FailMsg NVARCHAR(500) = 'PSA and TSA columns do not match on one or more tables - showing the first 50 failing columns (ordered by table name then column name).'
										  + CHAR(13) + CHAR(10) ;
		EXEC tSQLt.AssertEmptyTable N'#results', @_FailMsg ;
	END ;
