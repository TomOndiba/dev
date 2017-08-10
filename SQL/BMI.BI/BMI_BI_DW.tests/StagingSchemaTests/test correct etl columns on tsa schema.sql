create    procedure [StagingSchemaTests].[test correct etl columns on tsa schema]
as
	begin
		select distinct
			--replace(c.TABLE_NAME, 'ICS_STG_', '') as 
			[TABLE_NAME]
		  , t.EtlColumns
		into
			#expected
		from
			INFORMATION_SCHEMA.COLUMNS as c
		cross apply
		(
			select
				'EtlBatchRunId' as EtlColumns
			union
			select
				'EtlStepRunId'
			union
			select
				'EtlThreadRunId'
			union
			select
				'DataSourceKey'
			union
			select
				'EtlSourceTable'
			union
			select
				'EtlCreatedOn'
			union
			select
				'EtlCreatedBy'
		
		)							   t
		where
			c.TABLE_SCHEMA = 'tsa'
			and c.TABLE_NAME not in
					('ics_sql_dummySource', 'ics_sql_runLog')
		--order by
		--	TABLE_NAME
		--  , t.EtlColumns ;

		  --except

		select
			--replace(c.TABLE_NAME, 'ICS_STG_', '') as
			 [TABLE_NAME]
		  , c.COLUMN_NAME EtlColumns
		  
		into
			#actual
		from
			INFORMATION_SCHEMA.COLUMNS as c
		where
			c.TABLE_SCHEMA = 'tsa'
			and c.TABLE_NAME not in
					('ics_sql_dummySource', 'ics_sql_runLog')
			and COLUMN_NAME in
					('EtlBatchRunId', 'EtlStepRunId', 'EtlThreadRunId', 'DataSourceKey', 'EtlSourceTable',
					 'EtlCreatedBy','EtlCreatedOn'
					) ;

		exec tSQLt.AssertEqualsTable '#expected', '#actual' ;
	end ;