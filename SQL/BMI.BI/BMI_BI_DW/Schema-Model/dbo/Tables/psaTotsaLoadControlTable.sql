CREATE TABLE [dbo].[psaTotsaLoadControlTable]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[CreatedDate] [datetime] NOT NULL,
[CreatedBy] [nvarchar] (128) NULL,
[SourceDB] [nvarchar] (128) NULL,
[SourceSchema] [sys].[sysname] NULL,
[SourceTable] [sys].[sysname] NOT NULL,
[SourcePK] [varchar] (max) NULL,
[TargetDB] [nvarchar] (128) NULL,
[TargetSchema] [sys].[sysname] NULL,
[TargetTable] [sys].[sysname] NULL,
[TargetPK] [varchar] (max) NULL,
[LoadMode] [varchar] (10) NOT NULL,
[DataSourceKey] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[psaTotsaLoadControlTable] ADD CONSTRAINT [PK_psaTotsaLoadControlTable] PRIMARY KEY CLUSTERED  ([ID])
GO
