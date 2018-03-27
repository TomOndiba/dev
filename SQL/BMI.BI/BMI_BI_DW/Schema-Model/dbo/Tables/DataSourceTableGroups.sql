CREATE TABLE [dbo].[DataSourceTableGroups]
(
[ROWID] [int] NOT NULL IDENTITY(1, 1),
[DataSourceKey] [int] NULL,
[ERP_System] [varchar] (50) NOT NULL,
[Source_Company] [varchar] (50) NULL,
[Source_Country] [varchar] (3) NULL,
[Subject_Area] [varchar] (25) NULL,
[TableFilter] AS (((([ERP_System]+'_')+isnull([Source_Company]+'_',''))+isnull([Source_Country],''))+isnull('_'+[Subject_Area],'')) PERSISTED NOT NULL
)
GO
ALTER TABLE [dbo].[DataSourceTableGroups] ADD CONSTRAINT [PK_DataSourceTableGroups] PRIMARY KEY CLUSTERED  ([ROWID])
GO
