SELECT
	 t.name as TableName
	,i.name
	,col.name as ColumnName
	,c.key_ordinal
FROM sys.indexes i
	INNER JOIN sys.tables t on i.object_id = t.object_id
	INNER JOIN sys.index_columns c on c.object_id = i.object_id and c.index_id = i.index_id
	INNER JOIN sys.columns col on c.object_id = col.object_id and c.column_id = col.column_id
WHERE
	SCHEMA_NAME(t.schema_id) = N'dbo'
	AND 
	t.name LIKE N'Icopal Bulgaria%'
	AND
	i.is_primary_key = 1
ORDER BY
	t.name, c.key_ordinal
