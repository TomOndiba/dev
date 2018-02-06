-- <Migration ID="97f90964-aa7c-400c-87b5-583e1e263c61" />
GO

PRINT N'Dropping index [IndClust_tsa_ics_land_SAP_GBR_EKBE_1] from [tsa].[ics_land_SAP_GBR_EKBE]'
GO
DROP INDEX [IndClust_tsa_ics_land_SAP_GBR_EKBE_1] ON [tsa].[ics_land_SAP_GBR_EKBE]
GO
PRINT N'Altering [psa].[ics_stg_SAP_GBR_EKBE]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKBE] ALTER COLUMN [BUDAT] [datetime2] NULL
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKBE] ALTER COLUMN [CPUDT] [datetime2] NULL
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKBE] ALTER COLUMN [CPUTM] [datetime2] NULL
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKBE] ALTER COLUMN [BLDAT] [datetime2] NULL
GO
PRINT N'Altering [tsa].[ics_land_SAP_GBR_EKBE]'
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_EKBE] ALTER COLUMN [BUDAT] [datetime2] NULL
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_EKBE] ALTER COLUMN [CPUDT] [datetime2] NULL
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_EKBE] ALTER COLUMN [CPUTM] [datetime2] NULL
GO
ALTER TABLE [tsa].[ics_land_SAP_GBR_EKBE] ALTER COLUMN [BLDAT] [datetime2] NULL
GO
