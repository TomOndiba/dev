WITH pks AS
(
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
		t.name LIKE N'Live Icopal Romania1812%'
		AND
		i.is_primary_key = 1
)
SELECT
	 t.name
	,CONCAT('CREATE UNIQUE NONCLUSTERED INDEX [IndClust_tsa_ics_land_Navision_Rom_'
		,REPLACE(REPLACE(t.name, 'Live Icopal Romania1812$', ''), ' ', '')
		,'] ON [tsa].[ics_land_Navision_Rom_'
		,REPLACE(REPLACE(t.name, 'Live Icopal Romania1812$', ''), ' ', '')
		,'] ('
		,STUFF((SELECT ', ' + '[' + pks.ColumnName + ']' FROM pks WHERE pks.TableName = t.name ORDER BY pks.key_ordinal FOR XML PATH('')),1,1,'')
		,')'
		)
FROM sys.tables t
WHERE t.name IN
(
	'Live Icopal Romania1812$Standard Purchase Code',
	'Live Icopal Romania1812$Purchase Header',
	'Live Icopal Romania1812$Purch_ Inv_ Header',
	'Live Icopal Romania1812$Purch_ Inv_ Line',
	'Live Icopal Romania1812$Purchase Line',
	'Live Icopal Romania1812$Purchase Line Discount',
	'Live Icopal Romania1812$Purchases & Payables Setup',
	'Live Icopal Romania1812$Purchase Price',
	'Live Icopal Romania1812$Salesperson_Purchaser',
	'Live Icopal Romania1812$Standard Purchase Line'
)
