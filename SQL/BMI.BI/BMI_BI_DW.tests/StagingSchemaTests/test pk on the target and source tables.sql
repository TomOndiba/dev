CREATE   procedure [StagingSchemaTests].[test pk on the target and source tables]
as
	begin

		select
			object_name(ic.object_id)		 TableName
		  , object_schema_name(ic.object_id) SchemaName
		--, col_name(ic.object_id, ic.column_id) as PK
		into
			#expected
		from
			sys.indexes				 as i
		inner join sys.index_columns as ic
			on i.object_id = ic.object_id
				and i.index_id = ic.index_id
		where
			1 = 1
			and i.is_primary_key = 1
			and object_schema_name(ic.object_id) in
			
					('tsa', 'psa') 

					--except
		select
			TABLE_NAME TableName
		  , TABLE_SCHEMA SchemaName
		into
			#actual
		from
			INFORMATION_SCHEMA.TABLES
		where
			TABLE_SCHEMA in
				('tsa', 'psa') ;

		exec tSQLt.AssertEqualsTable '#expected', '#actual' ;
	end ;