-- Get the CreatePSATable statements
SELECT CONCAT('EXEC cg.CreatePSATable @sourceTsaTable=N''',t.name,''', @dataSourceCode=N''Nav-ROU''')
FROM sys.tables t
WHERE t.name LIKE '%ics_land_Navision_Rom%'

-- Get the drop table statements for the tsa tables
SELECT CONCAT('IF EXISTS (SELECT 1 FROM sys.tables WHERE SCHEMA_NAME(schema_id)=N''tsa'' name=N''',t.name,''') DROP TABLE [',SCHEMA_NAME(t.schema_id),'].[',t.name,'];')
FROM sys.tables t
WHERE t.name LIKE '%ics_land_Navision_Rom%'

