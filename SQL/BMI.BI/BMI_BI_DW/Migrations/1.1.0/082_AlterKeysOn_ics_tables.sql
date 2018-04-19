-- <Migration ID="7bd81238-49e5-4433-9fd5-1996b9198d21" />
GO

PRINT N'Dropping extended properties'
GO
EXEC sp_dropextendedproperty N'IncludeInMerge', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_ibs_est_procure_SROGRT', NULL, NULL
GO
EXEC sp_dropextendedproperty N'IncludeInMerge', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_ibs_est_procure_SROORPPL', NULL, NULL
GO
EXEC sp_dropextendedproperty N'IncludeInMerge', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_ibs_fin_procure_SROGRT', NULL, NULL
GO
EXEC sp_dropextendedproperty N'IncludeInMerge', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_ibs_fin_procure_SROORPPL', NULL, NULL
GO
EXEC sp_dropextendedproperty N'IncludeInMerge', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_ibs_lat_procure_SROGRT', NULL, NULL
GO
EXEC sp_dropextendedproperty N'IncludeInMerge', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_ibs_lat_procure_SROORPPL', NULL, NULL
GO
EXEC sp_dropextendedproperty N'IncludeInMerge', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_ibs_lit_procure_SROGRT', NULL, NULL
GO
EXEC sp_dropextendedproperty N'IncludeInMerge', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_ibs_lit_procure_SROORPPL', NULL, NULL
GO
PRINT N'Dropping constraints from [psa].[ics_stg_ibs_est_procure_SROGRT]'
GO
ALTER TABLE [psa].[ics_stg_ibs_est_procure_SROGRT] DROP CONSTRAINT [pk_psa_ics_stg_ibs_est_procure_SROGRT]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_ibs_est_procure_SROORPPL]'
GO
ALTER TABLE [psa].[ics_stg_ibs_est_procure_SROORPPL] DROP CONSTRAINT [pk_psa_ics_stg_ibs_est_procure_SROORPPL]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_ibs_fin_procure_SROGRT]'
GO
ALTER TABLE [psa].[ics_stg_ibs_fin_procure_SROGRT] DROP CONSTRAINT [pk_psa_ics_stg_ibs_fin_procure_SROGRT]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_ibs_fin_procure_SROORPPL]'
GO
ALTER TABLE [psa].[ics_stg_ibs_fin_procure_SROORPPL] DROP CONSTRAINT [pk_psa_ics_stg_ibs_fin_procure_SROORPPL]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_ibs_lat_procure_SROGRT]'
GO
ALTER TABLE [psa].[ics_stg_ibs_lat_procure_SROGRT] DROP CONSTRAINT [pk_psa_ics_stg_ibs_lat_procure_SROGRT]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_ibs_lat_procure_SROORPPL]'
GO
ALTER TABLE [psa].[ics_stg_ibs_lat_procure_SROORPPL] DROP CONSTRAINT [pk_psa_ics_stg_ibs_lat_procure_SROORPPL]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_ibs_lit_procure_SROGRT]'
GO
ALTER TABLE [psa].[ics_stg_ibs_lit_procure_SROGRT] DROP CONSTRAINT [pk_psa_ics_stg_ibs_lit_procure_SROGRT]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_ibs_lit_procure_SROORPPL]'
GO
ALTER TABLE [psa].[ics_stg_ibs_lit_procure_SROORPPL] DROP CONSTRAINT [pk_psa_ics_stg_ibs_lit_procure_SROORPPL]
GO
PRINT N'Altering [psa].[ics_stg_ibs_est_procure_SROORPPL]'
GO
ALTER TABLE [psa].[ics_stg_ibs_est_procure_SROORPPL] ALTER COLUMN [OLLINE] [decimal] (5, 0) NOT NULL
GO
PRINT N'Creating primary key [pk_psa_ics_stg_ibs_est_procure_SROORPPL] on [psa].[ics_stg_ibs_est_procure_SROORPPL]'
GO
ALTER TABLE [psa].[ics_stg_ibs_est_procure_SROORPPL] ADD CONSTRAINT [pk_psa_ics_stg_ibs_est_procure_SROORPPL] PRIMARY KEY CLUSTERED  ([OLORNO], [OLPRDC], [OLLINE])
GO
PRINT N'Altering [psa].[ics_stg_ibs_est_procure_SROGRT]'
GO
ALTER TABLE [psa].[ics_stg_ibs_est_procure_SROGRT] ALTER COLUMN [GRLINE] [decimal] (5, 0) NOT NULL
GO
PRINT N'Creating primary key [pk_psa_ics_stg_ibs_est_procure_SROGRT] on [psa].[ics_stg_ibs_est_procure_SROGRT]'
GO
ALTER TABLE [psa].[ics_stg_ibs_est_procure_SROGRT] ADD CONSTRAINT [pk_psa_ics_stg_ibs_est_procure_SROGRT] PRIMARY KEY CLUSTERED  ([GRORNO], [GRPRDC], [GRLINE])
GO
PRINT N'Altering [psa].[ics_stg_ibs_fin_procure_SROORPPL]'
GO
ALTER TABLE [psa].[ics_stg_ibs_fin_procure_SROORPPL] ALTER COLUMN [OLLINE] [decimal] (5, 0) NOT NULL
GO
PRINT N'Creating primary key [pk_psa_ics_stg_ibs_fin_procure_SROORPPL] on [psa].[ics_stg_ibs_fin_procure_SROORPPL]'
GO
ALTER TABLE [psa].[ics_stg_ibs_fin_procure_SROORPPL] ADD CONSTRAINT [pk_psa_ics_stg_ibs_fin_procure_SROORPPL] PRIMARY KEY CLUSTERED  ([OLORNO], [OLPRDC], [OLLINE])
GO
PRINT N'Altering [psa].[ics_stg_ibs_fin_procure_SROGRT]'
GO
ALTER TABLE [psa].[ics_stg_ibs_fin_procure_SROGRT] ALTER COLUMN [GRLINE] [decimal] (5, 0) NOT NULL
GO
PRINT N'Creating primary key [pk_psa_ics_stg_ibs_fin_procure_SROGRT] on [psa].[ics_stg_ibs_fin_procure_SROGRT]'
GO
ALTER TABLE [psa].[ics_stg_ibs_fin_procure_SROGRT] ADD CONSTRAINT [pk_psa_ics_stg_ibs_fin_procure_SROGRT] PRIMARY KEY CLUSTERED  ([GRORNO], [GRPRDC], [GRLINE])
GO
PRINT N'Altering [psa].[ics_stg_ibs_lat_procure_SROORPPL]'
GO
ALTER TABLE [psa].[ics_stg_ibs_lat_procure_SROORPPL] ALTER COLUMN [OLLINE] [decimal] (5, 0) NOT NULL
GO
PRINT N'Creating primary key [pk_psa_ics_stg_ibs_lat_procure_SROORPPL] on [psa].[ics_stg_ibs_lat_procure_SROORPPL]'
GO
ALTER TABLE [psa].[ics_stg_ibs_lat_procure_SROORPPL] ADD CONSTRAINT [pk_psa_ics_stg_ibs_lat_procure_SROORPPL] PRIMARY KEY CLUSTERED  ([OLORNO], [OLPRDC], [OLLINE])
GO
PRINT N'Altering [psa].[ics_stg_ibs_lat_procure_SROGRT]'
GO
ALTER TABLE [psa].[ics_stg_ibs_lat_procure_SROGRT] ALTER COLUMN [GRLINE] [decimal] (5, 0) NOT NULL
GO
PRINT N'Creating primary key [pk_psa_ics_stg_ibs_lat_procure_SROGRT] on [psa].[ics_stg_ibs_lat_procure_SROGRT]'
GO
ALTER TABLE [psa].[ics_stg_ibs_lat_procure_SROGRT] ADD CONSTRAINT [pk_psa_ics_stg_ibs_lat_procure_SROGRT] PRIMARY KEY CLUSTERED  ([GRORNO], [GRPRDC], [GRLINE])
GO
PRINT N'Altering [psa].[ics_stg_ibs_lit_procure_SROORPPL]'
GO
ALTER TABLE [psa].[ics_stg_ibs_lit_procure_SROORPPL] ALTER COLUMN [OLLINE] [decimal] (5, 0) NOT NULL
GO
PRINT N'Creating primary key [pk_psa_ics_stg_ibs_lit_procure_SROORPPL] on [psa].[ics_stg_ibs_lit_procure_SROORPPL]'
GO
ALTER TABLE [psa].[ics_stg_ibs_lit_procure_SROORPPL] ADD CONSTRAINT [pk_psa_ics_stg_ibs_lit_procure_SROORPPL] PRIMARY KEY CLUSTERED  ([OLORNO], [OLPRDC], [OLLINE])
GO
PRINT N'Altering [psa].[ics_stg_ibs_lit_procure_SROGRT]'
GO
ALTER TABLE [psa].[ics_stg_ibs_lit_procure_SROGRT] ALTER COLUMN [GRLINE] [decimal] (5, 0) NOT NULL
GO
PRINT N'Creating primary key [pk_psa_ics_stg_ibs_lit_procure_SROGRT] on [psa].[ics_stg_ibs_lit_procure_SROGRT]'
GO
ALTER TABLE [psa].[ics_stg_ibs_lit_procure_SROGRT] ADD CONSTRAINT [pk_psa_ics_stg_ibs_lit_procure_SROGRT] PRIMARY KEY CLUSTERED  ([GRORNO], [GRPRDC], [GRLINE])
GO
