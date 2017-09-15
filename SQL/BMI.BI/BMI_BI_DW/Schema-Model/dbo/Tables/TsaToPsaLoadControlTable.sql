CREATE TABLE [dbo].[TsaToPsaLoadControlTable]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[CreatedDate] [datetime] NOT NULL,
[CreatedBy] [nvarchar] (128) NULL,
[SourceDB] [nvarchar] (128) NULL,
[SourceSchema] [nvarchar] (100) NOT NULL,
[SourceTable] [nvarchar] (200) NOT NULL,
[TargetDB] [nvarchar] (128) NULL,
[TargetSchema] [nvarchar] (100) NULL,
[TargetTable] [nvarchar] (200) NULL,
[LoadMode] [varchar] (10) NOT NULL,
[DataSourceKey] [int] NOT NULL,
[SourcePK] [varchar] (max) NULL,
[TargetPK] [varchar] (max) NULL,
[Done] [smallint] NULL CONSTRAINT [DF_psaTotsaLoadControlTable_Done] DEFAULT ((0))
)
GO
ALTER TABLE [dbo].[TsaToPsaLoadControlTable] ADD CONSTRAINT [PK_psaTotsaLoadControlTable] PRIMARY KEY CLUSTERED  ([ID])
GO
