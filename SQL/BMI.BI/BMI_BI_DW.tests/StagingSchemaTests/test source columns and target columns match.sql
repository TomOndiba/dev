CREATE procedure [StagingSchemaTests].[test source columns and target columns match]
as
	begin
		;with sourceCte
		 as
		 (
			 select
					replace(c.TABLE_NAME, 'ics_land_', '') as [TABLE_NAME]
				  , c.COLUMN_NAME
				  , c.COLUMN_DEFAULT
				  , c.IS_NULLABLE
				  , c.DATA_TYPE
				  , c.CHARACTER_MAXIMUM_LENGTH
				  , c.NUMERIC_PRECISION
				  , c.NUMERIC_SCALE
				  , c.DATETIME_PRECISION
				  , c.COLLATION_NAME
			 from
					INFORMATION_SCHEMA.COLUMNS as c
			 where
					c.TABLE_SCHEMA = 'tsa'
				 and c.TABLE_NAME not in
						 ('ics_sql_dummySource', 'ics_sql_runLog','JobsExecutionDetails')
				 and c.COLUMN_NAME not in
						 ('EtlBatchRunId', 'EtlStepRunId', 'EtlThreadRunId', 'DataSourceKey', 'EtlSourceTable', 'EtlCreatedOn', 'EtlCreatedBy'
						, 'ExcludeFromMerge', 'IsDuplicate'
						 )
				 and c.COLUMN_NAME not in
					 (
						 select
								col_name(ic.object_id, ic.column_id) as PK
						 from
								sys.indexes			  as i
						 inner join sys.index_columns as ic
							 on i.object_id = ic.object_id
								 and i.index_id = ic.index_id
						 where
								1 = 1
							 and i.is_primary_key = 1
							 and ic.object_id = object_id('psa.' + replace(c.TABLE_NAME, 'ics_land_', 'ics_stg_'))
					 )
			 except
			 select
					replace(c.TABLE_NAME, 'ics_stg_', '') as [TABLE_NAME]
				  , c.COLUMN_NAME
				  , c.COLUMN_DEFAULT
				  , c.IS_NULLABLE
				  , c.DATA_TYPE
				  , c.CHARACTER_MAXIMUM_LENGTH
				  , c.NUMERIC_PRECISION
				  , c.NUMERIC_SCALE
				  , c.DATETIME_PRECISION
				  , c.COLLATION_NAME
			 from
					INFORMATION_SCHEMA.COLUMNS as c
			 where
					c.TABLE_SCHEMA = 'psa'
				 and c.TABLE_NAME not in
						 ('ics_sql_dummySource', 'ics_sql_runLog','JobsExecutionDetails')
				 and c.COLUMN_NAME not in
						 ('EtlBatchRunId', 'EtlStepRunId', 'EtlThreadRunId', 'DataSourceKey', 'EtlSourceTable', 'EtlCreatedOn', 'EtlCreatedBy'
						, 'ExcludeFromMerge', 'IsDuplicate'
						 )
				 and c.COLUMN_NAME not in
						 ('EtlRecordId', 'IsIncomplete', 'EtlUpdatedOn', 'EtlUpdatedBy', 'EtlDeletedOn', 'EtlDeletedBy', 'IsDeleted')
				 --! We're only interested in validating columns for tables that exist in both TSA and PSA schemas, we already have
				 --! a test for mismatched tables
				 and replace(c.TABLE_NAME, 'ics_stg_', '') in
					 (
						 select
								replace(t.TABLE_NAME, 'ics_land_', '')
						 from
								INFORMATION_SCHEMA.TABLES as t
						 where
								t.TABLE_SCHEMA = 'tsa'
					 )
				 and c.COLUMN_NAME not in
					 (
						 select
								col_name(ic.object_id, ic.column_id) as PK
						 from
								sys.indexes			  as i
						 inner join sys.index_columns as ic
							 on i.object_id = ic.object_id
								 and i.index_id = ic.index_id
						 where
								1 = 1
							 and i.is_primary_key = 1
							 and ic.object_id = object_id('psa.' + c.TABLE_NAME)
					 )
		 )
		--!
		--! If there is as little as one failure, this can still take a long time to complete
		--! because tSQLt still prints out all the passing columns so just report on the first
		--! 50 mismatched columns
		--!
		select top 50
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
		into
			#results
		from
			sourceCte as ctx
		order by
			ctx.TABLE_NAME
		  , ctx.COLUMN_NAME ;

		--! Add a CR/LF to the end of the message so any failure output is better formatted
		declare @_FailMsg nvarchar(500) = 'PSA and TSA columns do not match on one or more tables - showing the first 50 failing columns (ordered by table name then column name).'
										  + char(13) + char(10) ;
		exec tSQLt.AssertEmptyTable N'#results', @_FailMsg ;
	end ;
