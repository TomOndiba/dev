-- <Migration ID="c4cf6b74-2da0-473f-9261-ed4218be271d" />
GO

PRINT N'Adding constraints to [tsa].[ics_land_M3V10gen_POL_MITWHL]'
GO
ALTER TABLE [tsa].[ics_land_M3V10gen_POL_MITWHL] ADD CONSTRAINT [DF_tsa_ics_land_gen_MITWHL_ExcludeFromMerge] DEFAULT ((0)) FOR [ExcludeFromMerge]
GO
ALTER TABLE [tsa].[ics_land_M3V10gen_POL_MITWHL] ADD CONSTRAINT [DF_tsa_ics_land_gen_MITWHL_IsDuplicate] DEFAULT ((0)) FOR [IsDuplicate]
GO
