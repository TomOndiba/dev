USE [BMI_BI_DW]
GO

/****** Object:  StoredProcedure [cg].[CreatePSATable]    Script Date: 21/12/2017 16:55:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/* Procedure to create PSA table and associated dbo.TsaToPsaLoadControlTable entry
 * 
 * USAGE:
 * @sourceTsaTable = the base table name without the prefix e.g M3V10gen_POL_MWOPOL NOT ics_land_M3V10gen_POL_MWOPOL
 * @dataSourceCode = the DataSourceCode from dbo.DataSource table
 * @doNotCommit = 1 if you just want to see the table definition, anything else to commit the table and insert row to dbo.TsaToPsaLoadControlTable
 *
 * Create the proc then delete it after you've done so that it doesn't get included in the build.
 * TODO: Modify so that it can work from master AND/OR use as a temporary procedure
 *
 * PREREQUISITES:
 * 1. The source table must exist in TSA
 * 2. The source table must have a clustered index over the primary keys called that starts with: IndClust_tsa_ics_land_
 *     so if you know what the primary key(s) are issue a CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_MWOPOL_1] ON [tsa].[ics_land_M3V10gen_POL_MWOPOL] ([BHCONO] ASC, [BHFACI] ASC, [BHPLNO] ASC, [BHWOSQ] ASC)
*/
CREATE PROC [dbo].[CreatePSATable] 
	 @sourceTsaTable NVARCHAR(128)
	,@dataSourceCode NVARCHAR(20)
	,@doNotCommit BIT = 0
AS
SET NOCOUNT ON;

DECLARE @dataSourceKey INT;
DECLARE @tableObjectId INT;
DECLARE @businessKeys TABLE (name NVARCHAR(128), key_ordinal TINYINT);
DECLARE @sql NVARCHAR(MAX) = '';
DECLARE @eol CHAR(2) = CHAR(13) + CHAR(10);
DECLARE @tab CHAR(1) = CHAR(9);

SELECT @dataSourceKey = DataSourceKey
FROM dbo.DataSource
WHERE DataSourceCode = @dataSourceCode;

-- Check if data source exists
IF @dataSourceKey IS NULL THROW 50000, 'ERROR: Data source does not exist', 1;

-- Check if the Tsa table exists
SELECT @tableObjectId = object_id
FROM sys.tables WHERE SCHEMA_NAME(schema_id) = N'tsa' AND name = CONCAT('ics_land_',@sourceTsaTable);

IF @@ROWCOUNT <> 1 	THROW 50000, 'ERROR: Source Tsa table does not exist', 1;

-- Get the business key columns from the Tsa index
INSERT INTO @businessKeys (name, key_ordinal)
SELECT
	 col.name
	,c.key_ordinal
FROM sys.indexes i
	INNER JOIN sys.tables t on i.object_id = t.object_id
	INNER JOIN sys.index_columns c on c.object_id = i.object_id and c.index_id = i.index_id
	INNER JOIN sys.columns col on c.object_id = col.object_id and c.column_id = col.column_id
WHERE
	SCHEMA_NAME(t.schema_id) = N'tsa'
	AND 
	t.object_id = @tableObjectId
	AND
	i.name LIKE N'IndClust_tsa_ics_land_%';

IF NOT EXISTS (SELECT TOP 1 1 FROM @businessKeys) THROW 50000, 'ERROR: No business key index on Tsa table', 1;

-- Build the Psa create table statement
SET @sql = CONCAT('CREATE TABLE [psa].[ics_stg_', @sourceTsaTable, ']', @eol);
SET @sql += CONCAT('(', @eol);
SET @sql += CONCAT(@tab, ' [EtlRecordId] [bigint] NOT NULL IDENTITY(1, 1)', @eol);
SET @sql += CONCAT(@tab, ',[EtlBatchRunId] [int] NOT NULL', @eol);
SET @sql += CONCAT(@tab, ',[EtlStepRunId] [int] NOT NULL', @eol);
SET @sql += CONCAT(@tab, ',[EtlThreadRunId] [int] NOT NULL', @eol);
SET @sql += CONCAT(@tab, ',[DataSourceKey] [int] NOT NULL', @eol);
SET @sql += CONCAT(@tab, ',[EtlSourceTable] [varchar] (200) NOT NULL', @eol);
SET @sql += CONCAT(@tab, ',[EtlCreatedOn] [datetime] NOT NULL', @eol);
SET @sql += CONCAT(@tab, ',[EtlCreatedBy] [varchar] (200) NOT NULL', @eol);
SET @sql += CONCAT(@tab, ',[EtlUpdatedOn] [datetime] NOT NULL', @eol);
SET @sql += CONCAT(@tab, ',[EtlUpdatedBy] [varchar] (200) NOT NULL', @eol);
SET @sql += CONCAT(@tab, ',[EtlDeletedOn] [datetime] NULL', @eol);
SET @sql += CONCAT(@tab, ',[EtlDeletedBy] [varchar] (200) NULL', @eol);
SET @sql += CONCAT(@tab, ',[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_',@sourceTsaTable,'_IsDeleted] DEFAULT (''N'')', @eol);
SET @sql += CONCAT(@tab, ',[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_',@sourceTsaTable,'_IsIncomplete] DEFAULT (''N'')', @eol);
SELECT @sql += CONCAT(@tab, ',[', columnName, '] ', typeString, IIF(bk.name IS NULL,' NULL', ' NOT NULL'), @eol)
FROM
(
	SELECT
		c.name,
		CONCAT(t.name, ' ',
		 CASE WHEN t.name IN ('char', 'varchar', 'binary', 'varbinary', 'float') THEN CONCAT('(', case when c.max_length = -1 then N'max' else CAST(c.max_length as NVARCHAR(11)) END, ')') END
		,CASE WHEN t.name IN ('nchar', 'nvarchar', 'nbinary') THEN CONCAT('(', case when c.max_length = -1 then 'max' else CAST(c.max_length/2 AS NVARCHAR(11)) end, ')') END
		,CASE WHEN t.name IN ('decimal', 'numeric') THEN CONCAT('(', c.precision , ',', c.scale, ')') END 
		),
		c.column_id
	FROM sys.columns c
		INNER JOIN sys.types t ON c.user_type_id = t.user_type_id
	WHERE
		c.object_id = @tableObjectId
		AND c.name NOT IN (N'EtlBatchRunId', N'EtlStepRunId', N'EtlThreadRunId', N'DataSourceKey', N'EtlSourceTable', N'EtlCreatedOn', N'EtlCreatedBy', N'ExcludeFromMerge', N'IsDuplicate')

) t (columnName, typeString, column_id)
	LEFT OUTER JOIN @businessKeys bk on t.columnName = bk.name 
ORDER BY 
	column_id;

SET @sql += CONCAT(@tab, ',CONSTRAINT [PK_psa_ics_stg_', @sourceTsaTable, '] PRIMARY KEY CLUSTERED (');
SELECT @sql += CONCAT(IIF(key_ordinal = 1, '[', ', ['), k.name, ']')
FROM @businessKeys k
ORDER BY k.key_ordinal;

SET @sql += CONCAT(')', @eol, ');', @eol);

PRINT @sql;

BEGIN TRY
	BEGIN TRAN

	-- Drop the table and delete the control data if it exists
	IF EXISTS (SELECT 1 FROM sys.tables WHERE SCHEMA_NAME(schema_id) = N'psa' AND name = CONCAT(N'ics_stg_', @sourceTsaTable))
	BEGIN
		PRINT '*** Dropping existing table and deleting data from [dbo].[TsaToPsaLoadControlTable]'
		DECLARE @sql2 NVARCHAR(MAX) = CONCAT('DROP TABLE [psa].[ics_stg_', @sourceTsaTable, '];');
		EXEC (@sql2);
		DELETE FROM [dbo].[TsaToPsaLoadControlTable] WHERE [TargetSchema] = N'psa' AND [TargetTable] = CONCAT(N'ics_stg_', @sourceTsaTable);
	END;

	-- Create the table
	EXEC (@sql);
	PRINT '*** Table Created';

	-- Build the insert to control table statements
	INSERT INTO [dbo].[TsaToPsaLoadControlTable]
		([CreatedDate],[CreatedBy],[SourceDB],[SourceSchema],[SourceTable],[TargetDB],[TargetSchema],[TargetTable],[LoadMode],[DataSourceKey],[SourcePK],[TargetPK],[Done])
	SELECT 
		 GETDATE()
		,SUSER_SNAME()
		,DB_NAME()
		,N'tsa'
		,CONCAT('ics_land_', @sourceTsaTable)
		,DB_NAME()
		,N'psa'
		,CONCAT('ics_stg_', @sourceTsaTable)
		,'Full'
		,@dataSourceKey
		,STUFF((SELECT ', ' + name FROM @businessKeys FOR XML PATH('')),1,1,'')
		,STUFF((SELECT ', ' + name FROM @businessKeys FOR XML PATH('')),1,1,'')
		,0;
	PRINT '*** data added to dbo.TasToPsaLoadControlTable';

	IF @doNotCommit = 1
		ROLLBACK TRAN;
	ELSE
		COMMIT TRAN;
END TRY
BEGIN CATCH
    SELECT   
         ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_LINE () AS ErrorLine  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_MESSAGE() AS ErrorMessage; 

	IF @@TRANCOUNT > 0
		ROLLBACK TRAN;

	THROW 50000, 'ERROR: There was an error creating the table or adding the control data', 1;
END CATCH
GO

