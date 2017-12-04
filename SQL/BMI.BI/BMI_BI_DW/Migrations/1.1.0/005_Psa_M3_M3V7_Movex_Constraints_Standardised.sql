-- <Migration ID="26cfcd2a-364f-45fe-8cd7-0d824e165a40" />
GO

PRINT N'Dropping constraints from [psa].[ics_stg_m3_FGINLI]'
GO
ALTER TABLE [psa].[ics_stg_m3_FGINLI] DROP CONSTRAINT [DF_psa_ics_stg_ics_land_m3_FGINLI_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_m3_FGINLI]'
GO
ALTER TABLE [psa].[ics_stg_m3_FGINLI] DROP CONSTRAINT [DF_psa_ics_stg_ics_land_m3_FGINLI_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_m3_FPLEDG]'
GO
ALTER TABLE [psa].[ics_stg_m3_FPLEDG] DROP CONSTRAINT [DF_psa_ics_stg_ics_land_m3_FPLEDG_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_m3_FPLEDG]'
GO
ALTER TABLE [psa].[ics_stg_m3_FPLEDG] DROP CONSTRAINT [DF_psa_ics_stg_ics_land_m3_FPLEDG_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_m3_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_m3_MPLIND] DROP CONSTRAINT [DF_psa_ics_stg_ics_land_m3_MPLIND_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_m3_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_m3_MPLIND] DROP CONSTRAINT [DF_psa_ics_stg_ics_land_m3_MPLIND_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_m3_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_m3_MPLINE] DROP CONSTRAINT [DF_psa_ics_stg_ics_land_m3_MPLINE_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_m3_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_m3_MPLINE] DROP CONSTRAINT [DF_psa_ics_stg_ics_land_m3_MPLINE_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_m3v7_FGINLI]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_FGINLI] DROP CONSTRAINT [DF_psa_ics_stg_ics_land_m3v7_FGINLI_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_m3v7_FGINLI]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_FGINLI] DROP CONSTRAINT [DF_psa_ics_stg_ics_land_m3v7_FGINLI_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_m3v7_FPLEDG]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_FPLEDG] DROP CONSTRAINT [DF_psa_ics_stg_ics_land_m3v7_FPLEDG_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_m3v7_FPLEDG]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_FPLEDG] DROP CONSTRAINT [DF_psa_ics_stg_ics_land_m3v7_FPLEDG_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_m3v7_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_MPLIND] DROP CONSTRAINT [DF_psa_ics_stg_ics_land_m3v7_MPLIND_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_m3v7_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_MPLIND] DROP CONSTRAINT [DF_psa_ics_stg_ics_land_m3v7_MPLIND_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_m3v7_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_MPLINE] DROP CONSTRAINT [DF_psa_ics_stg_ics_land_m3v7_MPLINE_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_m3v7_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_MPLINE] DROP CONSTRAINT [DF_psa_ics_stg_ics_land_m3v7_MPLINE_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_movex_FGINLI]'
GO
ALTER TABLE [psa].[ics_stg_movex_FGINLI] DROP CONSTRAINT [DF_psa_ics_stg_ics_land_movex_FGINLI_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_movex_FGINLI]'
GO
ALTER TABLE [psa].[ics_stg_movex_FGINLI] DROP CONSTRAINT [DF_psa_ics_stg_ics_land_movex_FGINLI_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_movex_FPLEDG]'
GO
ALTER TABLE [psa].[ics_stg_movex_FPLEDG] DROP CONSTRAINT [DF_psa_ics_stg_ics_land_movex_FPLEDG_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_movex_FPLEDG]'
GO
ALTER TABLE [psa].[ics_stg_movex_FPLEDG] DROP CONSTRAINT [DF_psa_ics_stg_ics_land_movex_FPLEDG_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_movex_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_movex_MPLIND] DROP CONSTRAINT [DF_psa_ics_stg_ics_land_movex_MPLIND_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_movex_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_movex_MPLIND] DROP CONSTRAINT [DF_psa_ics_stg_ics_land_movex_MPLIND_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_movex_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_movex_MPLINE] DROP CONSTRAINT [DF_psa_ics_stg_ics_land_movex_MPLINE_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_movex_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_movex_MPLINE] DROP CONSTRAINT [DF_psa_ics_stg_ics_land_movex_MPLINE_IsIncomplete]
GO
PRINT N'Altering [psa].[ics_stg_m3_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_m3_MPLINE] ALTER COLUMN [IBACLI] [decimal] (1, 0) NULL
GO
PRINT N'Adding constraints to [psa].[ics_stg_m3_FGINLI]'
GO
ALTER TABLE [psa].[ics_stg_m3_FGINLI] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3_FGINLI_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_m3_FGINLI] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3_FGINLI_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_m3_FPLEDG]'
GO
ALTER TABLE [psa].[ics_stg_m3_FPLEDG] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3_FPLEDG_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_m3_FPLEDG] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3_FPLEDG_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_m3_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_m3_MPLIND] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3_MPLIND_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_m3_MPLIND] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3_MPLIND_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_m3_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_m3_MPLINE] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3_MPLINE_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_m3_MPLINE] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3_MPLINE_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_m3v7_FGINLI]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_FGINLI] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3v7_FGINLI_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_m3v7_FGINLI] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3v7_FGINLI_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_m3v7_FPLEDG]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_FPLEDG] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3v7_FPLEDG_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_m3v7_FPLEDG] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3v7_FPLEDG_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_m3v7_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_MPLIND] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3v7_MPLIND_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_m3v7_MPLIND] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3v7_MPLIND_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_m3v7_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_MPLINE] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3v7_MPLINE_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_m3v7_MPLINE] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3v7_MPLINE_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_movex_FGINLI]'
GO
ALTER TABLE [psa].[ics_stg_movex_FGINLI] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_movex_FGINLI_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_movex_FGINLI] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_movex_FGINLI_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_movex_FPLEDG]'
GO
ALTER TABLE [psa].[ics_stg_movex_FPLEDG] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_movex_FPLEDG_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_movex_FPLEDG] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_movex_FPLEDG_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_movex_MPLIND]'
GO
ALTER TABLE [psa].[ics_stg_movex_MPLIND] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_movex_MPLIND_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_movex_MPLIND] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_movex_MPLIND_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_movex_MPLINE]'
GO
ALTER TABLE [psa].[ics_stg_movex_MPLINE] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_movex_MPLINE_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_movex_MPLINE] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_movex_MPLINE_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
