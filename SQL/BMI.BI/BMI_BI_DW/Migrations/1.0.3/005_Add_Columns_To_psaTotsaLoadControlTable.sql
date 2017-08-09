-- <Migration ID="b2fc2f26-37f0-459b-b257-fdaf04410f2d" />
GO

PRINT N'Altering [dbo].[psaTotsaLoadControlTable]'
GO
ALTER TABLE [dbo].[psaTotsaLoadControlTable] ADD
[SourcePK] [varchar] (max) NULL,
[TargetPK] [varchar] (max) NULL
GO
