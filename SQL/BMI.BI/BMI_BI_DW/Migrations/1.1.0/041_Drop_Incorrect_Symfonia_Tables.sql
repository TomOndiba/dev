-- <Migration ID="6b219086-19fd-4b50-8195-939788f686f3" />
GO

PRINT N'Dropping constraints from [psa].[ics_stg_Symfonia_ARM_BackLog]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ARM_BackLog] DROP CONSTRAINT [DF_psa_ics_stg_Symfonia_ARM_BackLog_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Symfonia_ARM_BackLog]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ARM_BackLog] DROP CONSTRAINT [DF_psa_ics_stg_Symfonia_ARM_BackLog_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Symfonia_ARM_Customerfile]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ARM_Customerfile] DROP CONSTRAINT [DF_psa_ics_stg_Symfonia_ARM_Customerfile_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Symfonia_ARM_Customerfile]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ARM_Customerfile] DROP CONSTRAINT [DF_psa_ics_stg_Symfonia_ARM_Customerfile_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Symfonia_ARM_Items]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ARM_Items] DROP CONSTRAINT [DF_psa_ics_stg_Symfonia_ARM_Items_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Symfonia_ARM_Items]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ARM_Items] DROP CONSTRAINT [DF_psa_ics_stg_Symfonia_ARM_Items_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Symfonia_ARM_SalesInvoiceTrans]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ARM_SalesInvoiceTrans] DROP CONSTRAINT [DF_psa_ics_stg_Symfonia_ARM_SalesInvoiceTrans_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Symfonia_ARM_SalesInvoiceTrans]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ARM_SalesInvoiceTrans] DROP CONSTRAINT [DF_psa_ics_stg_Symfonia_ARM_SalesInvoiceTrans_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Symfonia_ARM_ShipNotInvoiced]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ARM_ShipNotInvoiced] DROP CONSTRAINT [DF_psa_ics_stg_Symfonia_ARM_ShipNotInvoiced_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Symfonia_ARM_ShipNotInvoiced]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ARM_ShipNotInvoiced] DROP CONSTRAINT [DF_psa_ics_stg_Symfonia_ARM_ShipNotInvoiced_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Symfonia_UR]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_UR] DROP CONSTRAINT [DF_psa_ics_stg_Symfonia_UR_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Symfonia_UR]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_UR] DROP CONSTRAINT [DF_psa_ics_stg_Symfonia_UR_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Symfonia_WR]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_WR] DROP CONSTRAINT [DF_psa_ics_stg_Symfonia_WR_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Symfonia_WR]'
GO
ALTER TABLE [psa].[ics_stg_Symfonia_WR] DROP CONSTRAINT [DF_psa_ics_stg_Symfonia_WR_IsIncomplete]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Symfonia_ARM_BackLog]'
GO
ALTER TABLE [tsa].[ics_land_Symfonia_ARM_BackLog] DROP CONSTRAINT [DF_tsa_ics_land_Symfonia_ARM_BackLog_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Symfonia_ARM_BackLog]'
GO
ALTER TABLE [tsa].[ics_land_Symfonia_ARM_BackLog] DROP CONSTRAINT [DF_tsa_ics_land_Symfonia_ARM_BackLog_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Symfonia_ARM_Customerfile]'
GO
ALTER TABLE [tsa].[ics_land_Symfonia_ARM_Customerfile] DROP CONSTRAINT [DF_tsa_ics_land_Symfonia_ARM_Customerfile_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Symfonia_ARM_Customerfile]'
GO
ALTER TABLE [tsa].[ics_land_Symfonia_ARM_Customerfile] DROP CONSTRAINT [DF_tsa_ics_land_Symfonia_ARM_Customerfile_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Symfonia_ARM_Items]'
GO
ALTER TABLE [tsa].[ics_land_Symfonia_ARM_Items] DROP CONSTRAINT [DF_tsa_ics_land_Symfonia_ARM_Items_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Symfonia_ARM_Items]'
GO
ALTER TABLE [tsa].[ics_land_Symfonia_ARM_Items] DROP CONSTRAINT [DF_tsa_ics_land_Symfonia_ARM_Items_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Symfonia_ARM_SalesInvoiceTrans]'
GO
ALTER TABLE [tsa].[ics_land_Symfonia_ARM_SalesInvoiceTrans] DROP CONSTRAINT [DF_tsa_ics_land_Symfonia_ARM_SalesInvoiceTrans_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Symfonia_ARM_SalesInvoiceTrans]'
GO
ALTER TABLE [tsa].[ics_land_Symfonia_ARM_SalesInvoiceTrans] DROP CONSTRAINT [DF_tsa_ics_land_Symfonia_ARM_SalesInvoiceTrans_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Symfonia_ARM_ShipNotInvoiced]'
GO
ALTER TABLE [tsa].[ics_land_Symfonia_ARM_ShipNotInvoiced] DROP CONSTRAINT [DF_tsa_ics_land_Symfonia_ARM_ShipNotInvoiced_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Symfonia_ARM_ShipNotInvoiced]'
GO
ALTER TABLE [tsa].[ics_land_Symfonia_ARM_ShipNotInvoiced] DROP CONSTRAINT [DF_tsa_ics_land_Symfonia_ARM_ShipNotInvoiced_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Symfonia_UR]'
GO
ALTER TABLE [tsa].[ics_land_Symfonia_UR] DROP CONSTRAINT [DF_tsa_ics_land_Symfonia_UR_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Symfonia_UR]'
GO
ALTER TABLE [tsa].[ics_land_Symfonia_UR] DROP CONSTRAINT [DF_tsa_ics_land_Symfonia_UR_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Symfonia_WR]'
GO
ALTER TABLE [tsa].[ics_land_Symfonia_WR] DROP CONSTRAINT [DF_tsa_ics_land_Symfonia_WR_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Symfonia_WR]'
GO
ALTER TABLE [tsa].[ics_land_Symfonia_WR] DROP CONSTRAINT [DF_tsa_ics_land_Symfonia_WR_IsDuplicate]
GO
PRINT N'Dropping [psa].[ics_stg_Symfonia_ARM_Items]'
GO
DROP TABLE [psa].[ics_stg_Symfonia_ARM_Items]
GO
PRINT N'Dropping [tsa].[ics_land_Symfonia_ARM_ShipNotInvoiced]'
GO
DROP TABLE [tsa].[ics_land_Symfonia_ARM_ShipNotInvoiced]
GO
PRINT N'Dropping [psa].[ics_stg_Symfonia_ARM_Customerfile]'
GO
DROP TABLE [psa].[ics_stg_Symfonia_ARM_Customerfile]
GO
PRINT N'Dropping [tsa].[ics_land_Symfonia_ARM_SalesInvoiceTrans]'
GO
DROP TABLE [tsa].[ics_land_Symfonia_ARM_SalesInvoiceTrans]
GO
PRINT N'Dropping [tsa].[ics_land_Symfonia_ARM_Items]'
GO
DROP TABLE [tsa].[ics_land_Symfonia_ARM_Items]
GO
PRINT N'Dropping [tsa].[ics_land_Symfonia_ARM_Customerfile]'
GO
DROP TABLE [tsa].[ics_land_Symfonia_ARM_Customerfile]
GO
PRINT N'Dropping [tsa].[ics_land_Symfonia_ARM_BackLog]'
GO
DROP TABLE [tsa].[ics_land_Symfonia_ARM_BackLog]
GO
PRINT N'Dropping [psa].[ics_stg_Symfonia_WR]'
GO
DROP TABLE [psa].[ics_stg_Symfonia_WR]
GO
PRINT N'Dropping [tsa].[ics_land_Symfonia_WR]'
GO
DROP TABLE [tsa].[ics_land_Symfonia_WR]
GO
PRINT N'Dropping [psa].[ics_stg_Symfonia_ARM_BackLog]'
GO
DROP TABLE [psa].[ics_stg_Symfonia_ARM_BackLog]
GO
PRINT N'Dropping [psa].[ics_stg_Symfonia_UR]'
GO
DROP TABLE [psa].[ics_stg_Symfonia_UR]
GO
PRINT N'Dropping [tsa].[ics_land_Symfonia_UR]'
GO
DROP TABLE [tsa].[ics_land_Symfonia_UR]
GO
PRINT N'Dropping [psa].[ics_stg_Symfonia_ARM_ShipNotInvoiced]'
GO
DROP TABLE [psa].[ics_stg_Symfonia_ARM_ShipNotInvoiced]
GO
PRINT N'Dropping [psa].[ics_stg_Symfonia_ARM_SalesInvoiceTrans]'
GO
DROP TABLE [psa].[ics_stg_Symfonia_ARM_SalesInvoiceTrans]
GO
