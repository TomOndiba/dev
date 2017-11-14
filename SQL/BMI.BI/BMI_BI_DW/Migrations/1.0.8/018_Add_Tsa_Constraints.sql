-- <Migration ID="77607d26-fb2c-4874-bdf6-77498875b060" />

GO
PRINT N'Adding constraints to [tsa].[ics_land_m3_CIDADR]'
GO
ALTER TABLE [tsa].[ics_land_m3_CIDADR] ADD CONSTRAINT [DF_tsa_ics_land_m3_CIDADR_ExcludeFromMerge] DEFAULT ((0)) FOR [ExcludeFromMerge]
GO
ALTER TABLE [tsa].[ics_land_m3_CIDADR] ADD CONSTRAINT [DF_tsa_ics_land_m3_CIDADR_IsDuplicate] DEFAULT ((0)) FOR [IsDuplicate]
GO
PRINT N'Adding constraints to [tsa].[ics_land_m3_CIDMAS]'
GO
ALTER TABLE [tsa].[ics_land_m3_CIDMAS] ADD CONSTRAINT [DF_tsa_ics_land_m3_CIDMAS_ExcludeFromMerge] DEFAULT ((0)) FOR [ExcludeFromMerge]
GO
ALTER TABLE [tsa].[ics_land_m3_CIDMAS] ADD CONSTRAINT [DF_tsa_ics_land_m3_CIDMAS_IsDuplicate] DEFAULT ((0)) FOR [IsDuplicate]
GO
PRINT N'Adding constraints to [tsa].[ics_land_m3_CMNDIV]'
GO
ALTER TABLE [tsa].[ics_land_m3_CMNDIV] ADD CONSTRAINT [DF_tsa_ics_land_m3_CMNDIV_ExcludeFromMerge] DEFAULT ((0)) FOR [ExcludeFromMerge]
GO
ALTER TABLE [tsa].[ics_land_m3_CMNDIV] ADD CONSTRAINT [DF_tsa_ics_land_m3_CMNDIV_IsDuplicate] DEFAULT ((0)) FOR [IsDuplicate]
GO
PRINT N'Adding constraints to [tsa].[ics_land_m3_MITWHL]'
GO
ALTER TABLE [tsa].[ics_land_m3_MITWHL] ADD CONSTRAINT [DF_tsa_ics_land_m3_MITWHL_ExcludeFromMerge] DEFAULT ((0)) FOR [ExcludeFromMerge]
GO
ALTER TABLE [tsa].[ics_land_m3_MITWHL] ADD CONSTRAINT [DF_tsa_ics_land_m3_MITWHL_IsDuplicate] DEFAULT ((0)) FOR [IsDuplicate]
GO
PRINT N'Adding constraints to [tsa].[ics_land_m3v7_CIDADR]'
GO
ALTER TABLE [tsa].[ics_land_m3v7_CIDADR] ADD CONSTRAINT [DF_tsa_ics_land_m3v7_CIDADR_ExcludeFromMerge] DEFAULT ((0)) FOR [ExcludeFromMerge]
GO
ALTER TABLE [tsa].[ics_land_m3v7_CIDADR] ADD CONSTRAINT [DF_tsa_ics_land_m3v7_CIDADR_IsDuplicate] DEFAULT ((0)) FOR [IsDuplicate]
GO
PRINT N'Adding constraints to [tsa].[ics_land_m3v7_CIDMAS]'
GO
ALTER TABLE [tsa].[ics_land_m3v7_CIDMAS] ADD CONSTRAINT [DF_tsa_ics_land_m3v7_CIDMAS_ExcludeFromMerge] DEFAULT ((0)) FOR [ExcludeFromMerge]
GO
ALTER TABLE [tsa].[ics_land_m3v7_CIDMAS] ADD CONSTRAINT [DF_tsa_ics_land_m3v7_CIDMAS_IsDuplicate] DEFAULT ((0)) FOR [IsDuplicate]
GO
PRINT N'Adding constraints to [tsa].[ics_land_m3v7_MITWHL]'
GO
ALTER TABLE [tsa].[ics_land_m3v7_MITWHL] ADD CONSTRAINT [DF_tsa_ics_land_m3v7_MITWHL_ExcludeFromMerge] DEFAULT ((0)) FOR [ExcludeFromMerge]
GO
ALTER TABLE [tsa].[ics_land_m3v7_MITWHL] ADD CONSTRAINT [DF_tsa_ics_land_m3v7_MITWHL_IsDuplicate] DEFAULT ((0)) FOR [IsDuplicate]
GO
