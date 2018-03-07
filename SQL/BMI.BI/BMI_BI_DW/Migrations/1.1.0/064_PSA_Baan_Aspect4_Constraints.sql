-- <Migration ID="e519c82b-f51d-4b32-9e0b-b43470899462" />
GO

PRINT N'Adding constraints to [psa].[ics_stg_aspect4_VAOFTBL]'
GO
ALTER TABLE [psa].[ics_stg_aspect4_VAOFTBL] ADD CONSTRAINT [DF_psa_ics_stg_aspect4_VAOFTBL_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_aspect4_VAOFTBL] ADD CONSTRAINT [DF_psa_ics_stg_aspect4_VAOFTBL_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_aspect4_VARBTBL]'
GO
ALTER TABLE [psa].[ics_stg_aspect4_VARBTBL] ADD CONSTRAINT [DF_psa_ics_stg_aspect4_VARBTBL_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_aspect4_VARBTBL] ADD CONSTRAINT [DF_psa_ics_stg_aspect4_VARBTBL_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_aspect4_VARITBL]'
GO
ALTER TABLE [psa].[ics_stg_aspect4_VARITBL] ADD CONSTRAINT [DF_psa_ics_stg_aspect4_VARITBL_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_aspect4_VARITBL] ADD CONSTRAINT [DF_psa_ics_stg_aspect4_VARITBL_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
PRINT N'Adding constraints to [psa].[ics_stg_baan_tiitm001610]'
GO
ALTER TABLE [psa].[ics_stg_baan_tiitm001610] ADD CONSTRAINT [DF_psa_ics_stg_baan_tiitm001610_IsDeleted] DEFAULT ('N') FOR [IsDeleted]
GO
ALTER TABLE [psa].[ics_stg_baan_tiitm001610] ADD CONSTRAINT [DF_psa_ics_stg_baan_tiitm001610_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
