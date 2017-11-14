-- <Migration ID="134fdeda-2c27-44b3-b813-780d9731c67a" />
GO
-- <Migration ID="045340db-1807-41fe-85d0-702306eaa860" />
GO

ALTER TABLE [psa].[ics_stg_m3_CIDADR] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3_CIDADR_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_m3_CIDADR] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3_CIDADR_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_m3_CIDMAS]'
GO
ALTER TABLE [psa].[ics_stg_m3_CIDMAS] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3_CIDMAS_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_m3_CIDMAS] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3_CIDMAS_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_m3_CMNDIV]'
GO
ALTER TABLE [psa].[ics_stg_m3_CMNDIV] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3_CMNDIV_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_m3_CMNDIV] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3_CMNDIV_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_m3_MITWHL]'
GO
ALTER TABLE [psa].[ics_stg_m3_MITWHL] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3_MITWHL_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_m3_MITWHL] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3_MITWHL_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_m3v7_CIDADR]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_CIDADR] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3v7_CIDADR_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_m3v7_CIDADR] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3v7_CIDADR_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_m3v7_CIDMAS]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_CIDMAS] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3v7_CIDMAS_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_m3v7_CIDMAS] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3v7_CIDMAS_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_m3v7_MITWHL]'
GO
ALTER TABLE [psa].[ics_stg_m3v7_MITWHL] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3v7_MITWHL_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_m3v7_MITWHL] ADD CONSTRAINT [DF_psa_ics_stg_ics_stg_m3v7_MITWHL_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [tsa].[ics_land_m3_CIDADR]'
