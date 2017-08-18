-- <Migration ID="430c3664-061b-40e7-a63b-cf32807d2e25" />
GO

PRINT N'Dropping constraints from [dbo].[psaTotsaLoadControlTable]'
GO
ALTER TABLE [dbo].[psaTotsaLoadControlTable] DROP CONSTRAINT [PK_psaTotsaLoadControlTable]
GO
PRINT N'Dropping constraints from [dbo].[psaTotsaLoadControlTable]'
GO
ALTER TABLE [dbo].[psaTotsaLoadControlTable] DROP CONSTRAINT [DF__psaTotsaLo__Done__7B3CED68]
GO
PRINT N'Rebuilding [dbo].[psaTotsaLoadControlTable]'
GO
CREATE TABLE [dbo].[RG_Recovery_1_psaTotsaLoadControlTable]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[CreatedDate] [datetime] NOT NULL,
[CreatedBy] [nvarchar] (128) NULL,
[SourceDB] [nvarchar] (128) NULL,
[SourceSchema] [nvarchar] (100) NOT NULL,
[SourceTable] [nvarchar] (200) NOT NULL,
[TargetDB] [nvarchar] (128) NULL,
[TargetSchema] [nvarchar] (100) NOT NULL,
[TargetTable] [nvarchar] (200) NOT NULL,
[LoadMode] [varchar] (10) NOT NULL,
[DataSourceKey] [int] NOT NULL,
[SourcePK] [varchar] (max) NULL,
[TargetPK] [varchar] (max) NULL,
[Done] [smallint] NULL CONSTRAINT [DF_psaTotsaLoadControlTable_Done] DEFAULT ((0))
)
GO
insert into [dbo].[RG_Recovery_1_psaTotsaLoadControlTable]
(
	[CreatedDate]
  , [CreatedBy]
  , [SourceDB]
  , [SourceSchema]
  , [SourceTable]
  , [TargetDB]
  , [TargetSchema]
  , [TargetTable]
  , [LoadMode]
  , [DataSourceKey]
  , [SourcePK]
  , [TargetPK]
  , [Done]
)
select
	[CreatedDate]
  , [CreatedBy]
  , [SourceDB]
  , [SourceSchema]
  , [SourceTable]
  , [TargetDB]
  , [TargetSchema]
  , [TargetTable]
  , [LoadMode]
  , [DataSourceKey]
  , [SourcePK]
  , [TargetPK]
  , [Done]
from
	[dbo].[psaTotsaLoadControlTable] ;
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[dbo].[psaTotsaLoadControlTable]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[dbo].[RG_Recovery_1_psaTotsaLoadControlTable]', RESEED, @idVal)
GO
DROP TABLE [dbo].[psaTotsaLoadControlTable]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_1_psaTotsaLoadControlTable]', N'psaTotsaLoadControlTable', N'OBJECT'
GO
PRINT N'Creating primary key [PK_psaTotsaLoadControlTable] on [dbo].[psaTotsaLoadControlTable]'
GO
ALTER TABLE [dbo].[psaTotsaLoadControlTable] ADD CONSTRAINT [PK_psaTotsaLoadControlTable] PRIMARY KEY CLUSTERED  ([ID])
GO
