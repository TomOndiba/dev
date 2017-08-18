create    procedure [StagingSchemaTests].[test correct etl columns on psa schema]
as
begin
	;with columnListCte (COLUMN_NAME, COLUMN_DEFAULT, IS_NULLABLE, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, NUMERIC_PRECISION, NUMERIC_SCALE)
	as
	(
				  select 'EtlRecordId'		, null		, 'NO'	, 'bigint'		, null	, 19	, 0
		union all select 'EtlBatchRunId'	, null		, 'NO'	, 'int'			, null	, 10	, 0
		union all select 'EtlStepRunId'		, null		, 'NO'	, 'int'			, null	, 10	, 0
		union all select 'EtlThreadRunId'	, null		, 'NO'	, 'int'			, null	, 10	, 0
		union all select 'DataSourceKey'	, null		, 'NO'	, 'int'			, null	, 10	, 0
		union all select 'EtlSourceTable'	, null		, 'NO'	, 'varchar'		, 200	, null	, null
		union all select 'EtlCreatedOn'		, null		, 'NO'	, 'datetime'	, null	, null	, null
		union all select 'EtlCreatedBy'		, null		, 'NO'	, 'varchar'		, 200	, null	, null
		union all select 'EtlUpdatedOn'		, null		, 'NO'	, 'datetime'	, null	, null	, null
		union all select 'EtlUpdatedBy'		, null		, 'NO'	, 'varchar'		, 200	, null	, null
		union all select 'EtlDeletedOn'		, null		, 'YES'	, 'datetime'	, null	, null	, null
		union all select 'EtlDeletedBy'		, null		, 'YES'	, 'varchar'		, 200	, null	, null
		union all select 'IsDeleted'		, '(''N'')'	, 'NO'	, 'char'		, 1		, null	, null
		union all select 'IsIncomplete'		, '(''N'')'	, 'NO'	, 'char'		, 1		, null	, null
	)
	, expectedCte
	as
	(
		select
			  t.TABLE_NAME
			, cl.COLUMN_NAME
			, cl.COLUMN_DEFAULT
			, cl.IS_NULLABLE
			, cl.DATA_TYPE
			, cl.CHARACTER_MAXIMUM_LENGTH
			, cl.NUMERIC_PRECISION
			, cl.NUMERIC_SCALE
		from
			INFORMATION_SCHEMA.TABLES as t
		cross join columnListCte as cl
		where
				t.TABLE_SCHEMA = 'psa'
			and t.TABLE_NAME like 'ics_stg_%'
	)
	, actualCte
	as
	(
		select
			  ac.TABLE_NAME
			, ac.COLUMN_NAME
			, ac.COLUMN_DEFAULT
			, ac.IS_NULLABLE
			, ac.DATA_TYPE
			, ac.CHARACTER_MAXIMUM_LENGTH
			, ac.NUMERIC_PRECISION
			, ac.NUMERIC_SCALE
		from
			INFORMATION_SCHEMA.COLUMNS as ac
		where
				ac.TABLE_SCHEMA = 'psa'
			and ac.TABLE_NAME like 'ics_stg_%'
			and ac.COLUMN_NAME in (select COLUMN_NAME from columnListCte)
	)
	, sourceCte
	as
	(
		select
			  e.TABLE_NAME as [TableName]
			, e.COLUMN_NAME as [ColumnName]
			, case when a.COLUMN_NAME is null then ' MISSING!!! ' else '' end as [IsColumnPresent]
			, e.DATA_TYPE as [Expected_DataType]
			, a.DATA_TYPE as [Actual_DataType]
			, e.CHARACTER_MAXIMUM_LENGTH as [Expected_CharMaxLength]
			, a.CHARACTER_MAXIMUM_LENGTH as [Actual_CharMaxLength]
			, e.NUMERIC_PRECISION as [Expected_NumericPrecision]
			, a.NUMERIC_PRECISION as [Actual_NumericPrecision]
			, e.NUMERIC_SCALE as [Expected_NumericScale]
			, a.NUMERIC_SCALE as [Actual_NumericScale]
			, e.IS_NULLABLE as [Expected_IsNullable]
			, e.COLUMN_DEFAULT as [Expected_ColumnDefault]
			, a.COLUMN_DEFAULT as [Actual_ColumnDefault]
		from
			expectedCte as e
		full outer join actualCte as a
			on a.TABLE_NAME = e.TABLE_NAME
			and a.COLUMN_NAME = e.COLUMN_NAME
		where
				a.COLUMN_NAME is null
			or a.DATA_TYPE <> e.DATA_TYPE
			or a.IS_NULLABLE <> e.IS_NULLABLE
			or isnull(a.COLUMN_DEFAULT, '') <> isnull(e.COLUMN_DEFAULT, '')
			or isnull(a.CHARACTER_MAXIMUM_LENGTH, -999) <> isnull(e.CHARACTER_MAXIMUM_LENGTH, -999)
			or isnull(a.NUMERIC_PRECISION, 255) <> isnull(e.NUMERIC_PRECISION, 255)
			or isnull(a.NUMERIC_SCALE, 255) <> isnull(e.NUMERIC_SCALE, 255)
	)
	select
		ctx.TableName
	  , ctx.ColumnName
	  , ctx.IsColumnPresent
	  , ctx.Expected_DataType
	  , ctx.Actual_DataType
	  , ctx.Expected_CharMaxLength
	  , ctx.Actual_CharMaxLength
	  , ctx.Expected_NumericPrecision
	  , ctx.Actual_NumericPrecision
	  , ctx.Expected_NumericScale
	  , ctx.Actual_NumericScale
	  , ctx.Expected_IsNullable
	  , ctx.Expected_ColumnDefault
	  , ctx.Actual_ColumnDefault
	into
		#results
	from
		sourceCte as ctx
	order by
		  TableName
		, ColumnName

	--! Add a CR/LF to the end of the message so any failure output is better formatted
	declare @_FailMsg nvarchar(500) = 'One or more ETL Audit columns are not correctly defined on one or more PSA tables.' + char(13) + char(10) ;
	exec tSQLt.AssertEmptyTable N'#results', @_FailMsg ;
end
