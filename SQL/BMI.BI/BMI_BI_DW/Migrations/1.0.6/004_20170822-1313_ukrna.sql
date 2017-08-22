-- <Migration ID="7916c9a4-3c0f-44e5-bad5-348cdae4a15c" />
GO

PRINT N'Dropping constraints from [dbo].[psaTotsaLoadControlTable]'
GO
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PK_psaTotsaLoadControlTable]', 'PK') AND parent_object_id = OBJECT_ID(N'[dbo].[psaTotsaLoadControlTable]', 'U'))
ALTER TABLE [dbo].[psaTotsaLoadControlTable] DROP CONSTRAINT [PK_psaTotsaLoadControlTable]
GO
PRINT N'Dropping constraints from [dbo].[psaTotsaLoadControlTable]'
GO
IF EXISTS (SELECT 1 FROM sys.columns WHERE name = N'Done' AND object_id = OBJECT_ID(N'[dbo].[psaTotsaLoadControlTable]', 'U') AND default_object_id = OBJECT_ID(N'[dbo].[DF_psaTotsaLoadControlTable_Done]', 'D'))
ALTER TABLE [dbo].[psaTotsaLoadControlTable] DROP CONSTRAINT [DF_psaTotsaLoadControlTable_Done]
GO
PRINT N'Dropping [dbo].[PopulatepsaTotsaLoadControlTable]'
GO
IF OBJECT_ID(N'[dbo].[PopulatepsaTotsaLoadControlTable]', 'P') IS NOT NULL
DROP PROCEDURE [dbo].[PopulatepsaTotsaLoadControlTable]
GO
PRINT N'Dropping [dbo].[psaTotsaLoadControlTable]'
GO
IF OBJECT_ID(N'[dbo].[psaTotsaLoadControlTable]', 'U') IS NOT NULL
DROP TABLE [dbo].[psaTotsaLoadControlTable]
GO
PRINT N'Creating [dbo].[TsaToPsaLoadControlTable]'
GO
IF OBJECT_ID(N'[dbo].[TsaToPsaLoadControlTable]', 'U') IS NULL
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
PRINT N'Creating primary key [PK_psaTotsaLoadControlTable] on [dbo].[TsaToPsaLoadControlTable]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'PK_psaTotsaLoadControlTable' AND object_id = OBJECT_ID(N'[dbo].[TsaToPsaLoadControlTable]'))
ALTER TABLE [dbo].[TsaToPsaLoadControlTable] ADD CONSTRAINT [PK_psaTotsaLoadControlTable] PRIMARY KEY CLUSTERED  ([ID])
GO
PRINT N'Creating primary key [PK_stg_m3v7_MITPOP] on [psa].[ics_stg_m3v7_MITPOP]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'PK_stg_m3v7_MITPOP' AND object_id = OBJECT_ID(N'[psa].[ics_stg_m3v7_MITPOP]'))
ALTER TABLE [psa].[ics_stg_m3v7_MITPOP] ADD CONSTRAINT [PK_stg_m3v7_MITPOP] PRIMARY KEY CLUSTERED  ([MPCONO], [MPITNO], [MPE0PA], [MPPOPN])
GO
PRINT N'Creating primary key [PK_stg_m3v7_OOHEAD] on [psa].[ics_stg_m3v7_OOHEAD]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'PK_stg_m3v7_OOHEAD' AND object_id = OBJECT_ID(N'[psa].[ics_stg_m3v7_OOHEAD]'))
ALTER TABLE [psa].[ics_stg_m3v7_OOHEAD] ADD CONSTRAINT [PK_stg_m3v7_OOHEAD] PRIMARY KEY CLUSTERED  ([OACONO], [OAORNO])
GO
PRINT N'Creating primary key [PK_stg_m3v7_OSBSTD] on [psa].[ics_stg_m3v7_OSBSTD]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'PK_stg_m3v7_OSBSTD' AND object_id = OBJECT_ID(N'[psa].[ics_stg_m3v7_OSBSTD]'))
ALTER TABLE [psa].[ics_stg_m3v7_OSBSTD] ADD CONSTRAINT [PK_stg_m3v7_OSBSTD] PRIMARY KEY CLUSTERED  ([UCCONO], [UCORNO], [UCPONR], [UCDIVI], [UCWHLO], [UCDLIX])
GO
