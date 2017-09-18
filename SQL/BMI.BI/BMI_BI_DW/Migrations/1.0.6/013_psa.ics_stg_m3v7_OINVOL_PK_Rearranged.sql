-- <Migration ID="863b8bde-3691-44c0-ab22-a2cfba4cd10d" />
GO

PRINT N'Dropping constraints from [psa].[ics_stg_m3v7_OINVOL]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_OINVOL] DROP CONSTRAINT [PK_stg_m3v7_OINVOL]
GO
PRINT N'Altering [psa].[ics_stg_m3v7_OINVOL]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_OINVOL] ALTER COLUMN [ONINPX] [nvarchar] (255) NULL
GO
PRINT N'Creating primary key [PK_stg_m3v7_OINVOL] on [psa].[ics_stg_m3v7_OINVOL]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_OINVOL] ADD CONSTRAINT [PK_stg_m3v7_OINVOL] PRIMARY KEY CLUSTERED  ([ONCONO], [ONDIVI], [ONYEA4], [ONIVNO], [ONIVTP], [ONIVSQ], [ONDLIX], [ONORNO], [ONWHLO], [ONIVRF])
GO
