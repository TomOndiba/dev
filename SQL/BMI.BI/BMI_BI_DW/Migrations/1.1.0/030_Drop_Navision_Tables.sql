-- <Migration ID="6db36fb9-3e65-4de5-a6c9-1cf0c08611f0" />
GO

PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header] DROP CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line] DROP CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Header] DROP CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Header]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Header] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Header_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Header] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Header_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line Discount]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line Discount] DROP CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line Discount]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line Discount]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line Discount] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line Discount_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line Discount]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line Discount] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line Discount_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line] DROP CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %] DROP CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Price]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Price] DROP CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Price]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Price]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Price] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Price_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Price]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Price] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Price_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup] DROP CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser] DROP CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Code]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Code] DROP CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Code]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Code]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Code] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Code_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Code]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Code] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Code_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Line] DROP CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Line]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Line] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Line_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Line] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Line_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchase Line Discount]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchase Line Discount] DROP CONSTRAINT [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line Discount]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchase Line Discount]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchase Line Discount] DROP CONSTRAINT [DF_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line Discount_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchase Line Discount]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchase Line Discount] DROP CONSTRAINT [DF_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line Discount_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup] DROP CONSTRAINT [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchases & Payables Setup]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup] DROP CONSTRAINT [DF_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchases & Payables Setup_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup] DROP CONSTRAINT [DF_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchases & Payables Setup_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser] DROP CONSTRAINT [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Salesperson_Purchaser]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser] DROP CONSTRAINT [DF_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Salesperson_Purchaser_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser] DROP CONSTRAINT [DF_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Salesperson_Purchaser_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Code]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Code] DROP CONSTRAINT [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Standard Purchase Code]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Code]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Code] DROP CONSTRAINT [DF_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Standard Purchase Code_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Code]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Code] DROP CONSTRAINT [DF_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Standard Purchase Code_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Line] DROP CONSTRAINT [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Standard Purchase Line]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Line] DROP CONSTRAINT [DF_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Standard Purchase Line_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Line] DROP CONSTRAINT [DF_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Standard Purchase Line_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header] DROP CONSTRAINT [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header] DROP CONSTRAINT [DF_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header] DROP CONSTRAINT [DF_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line] DROP CONSTRAINT [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line] DROP CONSTRAINT [DF_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line] DROP CONSTRAINT [DF_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Header] DROP CONSTRAINT [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Header]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Header] DROP CONSTRAINT [DF_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Header_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Header] DROP CONSTRAINT [DF_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Header_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line] DROP CONSTRAINT [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line] DROP CONSTRAINT [DF_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line] DROP CONSTRAINT [DF_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Price]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Price] DROP CONSTRAINT [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Price]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Price]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Price] DROP CONSTRAINT [DF_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Price_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Price]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Price] DROP CONSTRAINT [DF_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Price_IsIncomplete]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Header]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Header] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Header_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Header]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Header] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Header_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line Discount]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line Discount] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line Discount_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line Discount]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line Discount] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line Discount_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Price]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Price] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Price_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Price]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Price] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Price_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Code]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Code] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Code_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Code]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Code] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Code_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Line_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Line_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Purchase Line Discount]'
GO
ALTER TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Purchase Line Discount] DROP CONSTRAINT [DF_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Line Discount_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Purchase Line Discount]'
GO
ALTER TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Purchase Line Discount] DROP CONSTRAINT [DF_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Line Discount_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup]'
GO
ALTER TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup] DROP CONSTRAINT [DF_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purchases & Payables Setup_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup]'
GO
ALTER TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup] DROP CONSTRAINT [DF_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purchases & Payables Setup_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser]'
GO
ALTER TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser] DROP CONSTRAINT [DF_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Salesperson_Purchaser_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser]'
GO
ALTER TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser] DROP CONSTRAINT [DF_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Salesperson_Purchaser_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Code]'
GO
ALTER TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Code] DROP CONSTRAINT [DF_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Standard Purchase Code_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Code]'
GO
ALTER TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Code] DROP CONSTRAINT [DF_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Standard Purchase Code_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Standard Purchase Line_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Standard Purchase Line_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header]'
GO
ALTER TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header] DROP CONSTRAINT [DF_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header]'
GO
ALTER TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header] DROP CONSTRAINT [DF_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Header]'
GO
ALTER TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Header] DROP CONSTRAINT [DF_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Header_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Header]'
GO
ALTER TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Header] DROP CONSTRAINT [DF_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Header_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Line_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Line_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Price]'
GO
ALTER TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Price] DROP CONSTRAINT [DF_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Price_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Price]'
GO
ALTER TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Price] DROP CONSTRAINT [DF_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Price_IsDuplicate]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header_1] from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header_1] ON [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line_1] from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line_1] ON [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Header_1] from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Header]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Header_1] ON [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Header]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line Discount_1] from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line Discount]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line Discount_1] ON [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line Discount]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line_1] from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line_1] ON [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %_1] from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %_1] ON [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Price_1] from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Price]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Price_1] ON [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Price]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup_1] from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup_1] ON [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser_1] from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser_1] ON [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Code_1] from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Code]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Code_1] ON [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Code]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Line_1] from [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Line]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Line_1] ON [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Line]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania$Purchase Line Discount_1] from [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Purchase Line Discount]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania$Purchase Line Discount_1] ON [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Purchase Line Discount]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup_1] from [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup_1] ON [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser_1] from [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser_1] ON [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Code_1] from [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Code]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Code_1] ON [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Code]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Line_1] from [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Line]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Line_1] ON [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Line]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header_1] from [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header_1] ON [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line_1] from [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line_1] ON [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Header_1] from [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Header]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Header_1] ON [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Header]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Line_1] from [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Line]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Line_1] ON [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Line]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Price_1] from [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Price]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Price_1] ON [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Price]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header]'
GO
DROP TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Line]'
GO
DROP TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Line]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Code]'
GO
DROP TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Code]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup]'
GO
DROP TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser]'
GO
DROP TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Price]'
GO
DROP TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Price]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %]'
GO
DROP TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line Discount]'
GO
DROP TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line Discount]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line]'
GO
DROP TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Header]'
GO
DROP TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Header]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line]'
GO
DROP TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header]'
GO
DROP TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Price]'
GO
DROP TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Price]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %]'
GO
DROP TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line Discount]'
GO
DROP TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line Discount]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line]'
GO
DROP TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Header]'
GO
DROP TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Header]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line]'
GO
DROP TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header]'
GO
DROP TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Line]'
GO
DROP TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Line]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Code]'
GO
DROP TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Code]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser]'
GO
DROP TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup]'
GO
DROP TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Price]'
GO
DROP TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Price]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Purchase Line Discount]'
GO
DROP TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Purchase Line Discount]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line]'
GO
DROP TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Line]'
GO
DROP TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Line]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Header]'
GO
DROP TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Header]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header]'
GO
DROP TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Line]'
GO
DROP TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Line]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser]'
GO
DROP TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup]'
GO
DROP TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Code]'
GO
DROP TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Code]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Line]'
GO
DROP TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Line]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Code]'
GO
DROP TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Code]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser]'
GO
DROP TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup]'
GO
DROP TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Price]'
GO
DROP TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Price]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchase Line Discount]'
GO
DROP TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchase Line Discount]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line]'
GO
DROP TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line]'
GO
DROP TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Header]'
GO
DROP TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Header]
GO
