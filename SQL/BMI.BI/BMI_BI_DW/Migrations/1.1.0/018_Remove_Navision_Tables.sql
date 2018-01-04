-- <Migration ID="7bf9eae8-13d0-4273-b47d-febe1dd62205" />
GO

PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_Code]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_Code] DROP CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Purchase_Code]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_Code]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_Code] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Purchase_Code_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_Code]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_Code] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Purchase_Code_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_Header] DROP CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Purchase_Header]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_Header] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Purchase_Header_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_Header] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Purchase_Header_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_Invoice_Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_Invoice_Header] DROP CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Purchase_Invoice_Header]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_Invoice_Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_Invoice_Header] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Purchase_Invoice_Header_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_Invoice_Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_Invoice_Header] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Purchase_Invoice_Header_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_Invoice_Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_Invoice_Line] DROP CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Purchase_Invoice_Line]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_Invoice_Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_Invoice_Line] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Purchase_Invoice_Line_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_Invoice_Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_Invoice_Line] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Purchase_Invoice_Line_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_Line] DROP CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Purchase_Line]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_Line] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Purchase_Line_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_Line] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Purchase_Line_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_Line_Discount]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_Line_Discount] DROP CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Purchase_Line_Discount]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_Line_Discount]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_Line_Discount] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Purchase_Line_Discount_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_Line_Discount]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_Line_Discount] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Purchase_Line_Discount_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_Payables_Setup]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_Payables_Setup] DROP CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Purchase_Payables_Setup]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_Payables_Setup]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_Payables_Setup] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Purchase_Payables_Setup_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_Payables_Setup]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_Payables_Setup] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Purchase_Payables_Setup_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_PrePayment_Pct]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_PrePayment_Pct] DROP CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Purchase_PrePayment_Pct]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_PrePayment_Pct]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_PrePayment_Pct] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Purchase_PrePayment_Pct_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_PrePayment_Pct]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_PrePayment_Pct] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Purchase_PrePayment_Pct_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_Price]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_Price] DROP CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Purchase_Price]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_Price]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_Price] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Purchase_Price_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Purchase_Price]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_Price] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Purchase_Price_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_SalesPerson_Purchaser]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_SalesPerson_Purchaser] DROP CONSTRAINT [PK_psa_ics_stg_Navision_BGR_SalesPerson_Purchaser]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_SalesPerson_Purchaser]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_SalesPerson_Purchaser] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_SalesPerson_Purchaser_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_SalesPerson_Purchaser]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_SalesPerson_Purchaser] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_SalesPerson_Purchaser_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Std_Purchase_Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Std_Purchase_Line] DROP CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Std_Purchase_Line]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Std_Purchase_Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Std_Purchase_Line] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Std_Purchase_Line_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_BGR_Std_Purchase_Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Std_Purchase_Line] DROP CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Std_Purchase_Line_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Purchase_Code]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Purchase_Code] DROP CONSTRAINT [PK_psa_ics_stg_Navision_ROU_Purchase_Code]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Purchase_Code]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Purchase_Code] DROP CONSTRAINT [DF_psa_ics_stg_Navision_ROU_Purchase_Code_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Purchase_Code]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Purchase_Code] DROP CONSTRAINT [DF_psa_ics_stg_Navision_ROU_Purchase_Code_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Purchase_Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Purchase_Header] DROP CONSTRAINT [PK_psa_ics_stg_Navision_ROU_Purchase_Header]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Purchase_Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Purchase_Header] DROP CONSTRAINT [DF_psa_ics_stg_Navision_ROU_Purchase_Header_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Purchase_Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Purchase_Header] DROP CONSTRAINT [DF_psa_ics_stg_Navision_ROU_Purchase_Header_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Purchase_Invoice_Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Purchase_Invoice_Header] DROP CONSTRAINT [PK_psa_ics_stg_Navision_ROU_Purchase_Invoice_Header]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Purchase_Invoice_Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Purchase_Invoice_Header] DROP CONSTRAINT [DF_psa_ics_stg_Navision_ROU_Purchase_Invoice_Header_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Purchase_Invoice_Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Purchase_Invoice_Header] DROP CONSTRAINT [DF_psa_ics_stg_Navision_ROU_Purchase_Invoice_Header_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Purchase_Invoice_Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Purchase_Invoice_Line] DROP CONSTRAINT [PK_psa_ics_stg_Navision_ROU_Purchase_Invoice_Line]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Purchase_Invoice_Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Purchase_Invoice_Line] DROP CONSTRAINT [DF_psa_ics_stg_Navision_ROU_Purchase_Invoice_Line_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Purchase_Invoice_Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Purchase_Invoice_Line] DROP CONSTRAINT [DF_psa_ics_stg_Navision_ROU_Purchase_Invoice_Line_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Purchase_Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Purchase_Line] DROP CONSTRAINT [PK_psa_ics_stg_Navision_ROU_Purchase_Line]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Purchase_Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Purchase_Line] DROP CONSTRAINT [DF_psa_ics_stg_Navision_ROU_Purchase_Line_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Purchase_Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Purchase_Line] DROP CONSTRAINT [DF_psa_ics_stg_Navision_ROU_Purchase_Line_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Purchase_Line_Discount]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Purchase_Line_Discount] DROP CONSTRAINT [PK_psa_ics_stg_Navision_ROU_Purchase_Line_Discount]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Purchase_Line_Discount]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Purchase_Line_Discount] DROP CONSTRAINT [DF_psa_ics_stg_Navision_ROU_Purchase_Line_Discount_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Purchase_Line_Discount]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Purchase_Line_Discount] DROP CONSTRAINT [DF_psa_ics_stg_Navision_ROU_Purchase_Line_Discount_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Purchase_Payables_Setup]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Purchase_Payables_Setup] DROP CONSTRAINT [PK_psa_ics_stg_Navision_ROU_Purchase_Payables_Setup]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Purchase_Payables_Setup]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Purchase_Payables_Setup] DROP CONSTRAINT [DF_psa_ics_stg_Navision_ROU_Purchase_Payables_Setup_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Purchase_Payables_Setup]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Purchase_Payables_Setup] DROP CONSTRAINT [DF_psa_ics_stg_Navision_ROU_Purchase_Payables_Setup_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Purchase_Price]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Purchase_Price] DROP CONSTRAINT [PK_psa_ics_stg_Navision_ROU_Purchase_Price]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Purchase_Price]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Purchase_Price] DROP CONSTRAINT [DF_psa_ics_stg_Navision_ROU_Purchase_Price_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Purchase_Price]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Purchase_Price] DROP CONSTRAINT [DF_psa_ics_stg_Navision_ROU_Purchase_Price_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_SalesPerson_Purchaser]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_SalesPerson_Purchaser] DROP CONSTRAINT [PK_psa_ics_stg_Navision_ROU_SalesPerson_Purchaser]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_SalesPerson_Purchaser]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_SalesPerson_Purchaser] DROP CONSTRAINT [DF_psa_ics_stg_Navision_ROU_SalesPerson_Purchaser_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_SalesPerson_Purchaser]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_SalesPerson_Purchaser] DROP CONSTRAINT [DF_psa_ics_stg_Navision_ROU_SalesPerson_Purchaser_IsIncomplete]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Std_Purchase_Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Std_Purchase_Line] DROP CONSTRAINT [PK_psa_ics_stg_Navision_ROU_Std_Purchase_Line]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Std_Purchase_Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Std_Purchase_Line] DROP CONSTRAINT [DF_psa_ics_stg_Navision_ROU_Std_Purchase_Line_IsDeleted]
GO
PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Std_Purchase_Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Std_Purchase_Line] DROP CONSTRAINT [DF_psa_ics_stg_Navision_ROU_Std_Purchase_Line_IsIncomplete]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Purchase_Code]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Purchase_Code] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purchase_Code_ExcludedFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Purchase_Code]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Purchase_Code] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purchase_Code_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Purchase_Header]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Purchase_Header] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purchase_Header_ExcludedFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Purchase_Header]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Purchase_Header] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purchase_Header_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Purchase_Invoice_Header]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Purchase_Invoice_Header] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purchase_Invoice_Header_ExcludedFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Purchase_Invoice_Header]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Purchase_Invoice_Header] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purchase_Invoice_Header_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Purchase_Invoice_Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Purchase_Invoice_Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purchase_Invoice_Line_ExcludedFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Purchase_Invoice_Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Purchase_Invoice_Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purchase_Invoice_Line_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Purchase_Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Purchase_Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purchase_Line_ExcludedFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Purchase_Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Purchase_Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purchase_Line_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Purchase_Line_Discount]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Purchase_Line_Discount] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purchase_Line_Discount_ExcludedFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Purchase_Line_Discount]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Purchase_Line_Discount] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purchase_Line_Discount_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Purchase_Payables_Setup]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Purchase_Payables_Setup] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purchase_Payables_Setup_ExcludedFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Purchase_Payables_Setup]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Purchase_Payables_Setup] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purchase_Payables_Setup_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Purchase_PrePayment_Pct]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Purchase_PrePayment_Pct] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purchase_PrePayment_Pct_ExcludedFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Purchase_PrePayment_Pct]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Purchase_PrePayment_Pct] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purchase_PrePayment_Pct_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Purchase_Price]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Purchase_Price] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purchase_Price_ExcludedFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Purchase_Price]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Purchase_Price] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purchase_Price_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_SalesPerson_Purchaser]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_SalesPerson_Purchaser] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_SalesPerson_Purchaser_ExcludedFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_SalesPerson_Purchaser]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_SalesPerson_Purchaser] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_SalesPerson_Purchaser_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Std_Purchase_Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Std_Purchase_Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Std_Purchase_Line_ExcludedFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Std_Purchase_Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Std_Purchase_Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Std_Purchase_Line_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_ROU_Purchase_Code]'
GO
ALTER TABLE [tsa].[ics_land_Navision_ROU_Purchase_Code] DROP CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Purchase_Code_ExcludedFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_ROU_Purchase_Code]'
GO
ALTER TABLE [tsa].[ics_land_Navision_ROU_Purchase_Code] DROP CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Purchase_Code_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_ROU_Purchase_Header]'
GO
ALTER TABLE [tsa].[ics_land_Navision_ROU_Purchase_Header] DROP CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Purchase_Header_ExcludedFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_ROU_Purchase_Header]'
GO
ALTER TABLE [tsa].[ics_land_Navision_ROU_Purchase_Header] DROP CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Purchase_Header_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_ROU_Purchase_Invoice_Header]'
GO
ALTER TABLE [tsa].[ics_land_Navision_ROU_Purchase_Invoice_Header] DROP CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Purchase_Invoice_Header_ExcludedFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_ROU_Purchase_Invoice_Header]'
GO
ALTER TABLE [tsa].[ics_land_Navision_ROU_Purchase_Invoice_Header] DROP CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Purchase_Invoice_Header_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_ROU_Purchase_Invoice_Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_ROU_Purchase_Invoice_Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Purchase_Invoice_Line_ExcludedFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_ROU_Purchase_Invoice_Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_ROU_Purchase_Invoice_Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Purchase_Invoice_Line_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_ROU_Purchase_Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_ROU_Purchase_Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Purchase_Line_ExcludedFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_ROU_Purchase_Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_ROU_Purchase_Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Purchase_Line_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_ROU_Purchase_Line_Discount]'
GO
ALTER TABLE [tsa].[ics_land_Navision_ROU_Purchase_Line_Discount] DROP CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Purchase_Line_Discount_ExcludedFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_ROU_Purchase_Line_Discount]'
GO
ALTER TABLE [tsa].[ics_land_Navision_ROU_Purchase_Line_Discount] DROP CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Purchase_Line_Discount_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_ROU_Purchase_Payables_Setup]'
GO
ALTER TABLE [tsa].[ics_land_Navision_ROU_Purchase_Payables_Setup] DROP CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Purchase_Payables_Setup_ExcludedFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_ROU_Purchase_Payables_Setup]'
GO
ALTER TABLE [tsa].[ics_land_Navision_ROU_Purchase_Payables_Setup] DROP CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Purchase_Payables_Setup_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_ROU_Purchase_Price]'
GO
ALTER TABLE [tsa].[ics_land_Navision_ROU_Purchase_Price] DROP CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Purchase_Price_ExcludedFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_ROU_Purchase_Price]'
GO
ALTER TABLE [tsa].[ics_land_Navision_ROU_Purchase_Price] DROP CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Purchase_Price_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_ROU_SalesPerson_Purchaser]'
GO
ALTER TABLE [tsa].[ics_land_Navision_ROU_SalesPerson_Purchaser] DROP CONSTRAINT [DF_tsa_ics_land_Navision_ROU_SalesPerson_Purchaser_ExcludedFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_ROU_SalesPerson_Purchaser]'
GO
ALTER TABLE [tsa].[ics_land_Navision_ROU_SalesPerson_Purchaser] DROP CONSTRAINT [DF_tsa_ics_land_Navision_ROU_SalesPerson_Purchaser_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_ROU_Std_Purchase_Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_ROU_Std_Purchase_Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Std_Purchase_Line_ExcludedFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_ROU_Std_Purchase_Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_ROU_Std_Purchase_Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Std_Purchase_Line_IsDuplicate]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_BGR_Purchase_Code] from [tsa].[ics_land_Navision_BGR_Purchase_Code]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_BGR_Purchase_Code] ON [tsa].[ics_land_Navision_BGR_Purchase_Code]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_BGR_Purchase_Header] from [tsa].[ics_land_Navision_BGR_Purchase_Header]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_BGR_Purchase_Header] ON [tsa].[ics_land_Navision_BGR_Purchase_Header]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_BGR_Purchase_Invoice_Header] from [tsa].[ics_land_Navision_BGR_Purchase_Invoice_Header]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_BGR_Purchase_Invoice_Header] ON [tsa].[ics_land_Navision_BGR_Purchase_Invoice_Header]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_BGR_Purchase_Invoice_Line] from [tsa].[ics_land_Navision_BGR_Purchase_Invoice_Line]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_BGR_Purchase_Invoice_Line] ON [tsa].[ics_land_Navision_BGR_Purchase_Invoice_Line]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_BGR_Purchase_Line] from [tsa].[ics_land_Navision_BGR_Purchase_Line]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_BGR_Purchase_Line] ON [tsa].[ics_land_Navision_BGR_Purchase_Line]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_BGR_Purchase_Line_Discount] from [tsa].[ics_land_Navision_BGR_Purchase_Line_Discount]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_BGR_Purchase_Line_Discount] ON [tsa].[ics_land_Navision_BGR_Purchase_Line_Discount]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_BGR_Purchase_Payables_Setup] from [tsa].[ics_land_Navision_BGR_Purchase_Payables_Setup]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_BGR_Purchase_Payables_Setup] ON [tsa].[ics_land_Navision_BGR_Purchase_Payables_Setup]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_BGR_Purchase_PrePayment_Pct] from [tsa].[ics_land_Navision_BGR_Purchase_PrePayment_Pct]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_BGR_Purchase_PrePayment_Pct] ON [tsa].[ics_land_Navision_BGR_Purchase_PrePayment_Pct]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_BGR_Purchase_Price] from [tsa].[ics_land_Navision_BGR_Purchase_Price]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_BGR_Purchase_Price] ON [tsa].[ics_land_Navision_BGR_Purchase_Price]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_BGR_SalesPerson_Purchaser] from [tsa].[ics_land_Navision_BGR_SalesPerson_Purchaser]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_BGR_SalesPerson_Purchaser] ON [tsa].[ics_land_Navision_BGR_SalesPerson_Purchaser]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_BGR_Std_Purchase_Line] from [tsa].[ics_land_Navision_BGR_Std_Purchase_Line]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_BGR_Std_Purchase_Line] ON [tsa].[ics_land_Navision_BGR_Std_Purchase_Line]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_ROU_Purchase_Code] from [tsa].[ics_land_Navision_ROU_Purchase_Code]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_ROU_Purchase_Code] ON [tsa].[ics_land_Navision_ROU_Purchase_Code]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_ROU_Purchase_Header] from [tsa].[ics_land_Navision_ROU_Purchase_Header]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_ROU_Purchase_Header] ON [tsa].[ics_land_Navision_ROU_Purchase_Header]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_ROU_Purchase_Invoice_Header] from [tsa].[ics_land_Navision_ROU_Purchase_Invoice_Header]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_ROU_Purchase_Invoice_Header] ON [tsa].[ics_land_Navision_ROU_Purchase_Invoice_Header]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_ROU_Purchase_Invoice_Line] from [tsa].[ics_land_Navision_ROU_Purchase_Invoice_Line]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_ROU_Purchase_Invoice_Line] ON [tsa].[ics_land_Navision_ROU_Purchase_Invoice_Line]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_ROU_Purchase_Line] from [tsa].[ics_land_Navision_ROU_Purchase_Line]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_ROU_Purchase_Line] ON [tsa].[ics_land_Navision_ROU_Purchase_Line]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_ROU_Purchase_Line_Discount] from [tsa].[ics_land_Navision_ROU_Purchase_Line_Discount]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_ROU_Purchase_Line_Discount] ON [tsa].[ics_land_Navision_ROU_Purchase_Line_Discount]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_ROU_Purchase_Payables_Setup] from [tsa].[ics_land_Navision_ROU_Purchase_Payables_Setup]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_ROU_Purchase_Payables_Setup] ON [tsa].[ics_land_Navision_ROU_Purchase_Payables_Setup]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_ROU_Purchase_Price] from [tsa].[ics_land_Navision_ROU_Purchase_Price]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_ROU_Purchase_Price] ON [tsa].[ics_land_Navision_ROU_Purchase_Price]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_ROU_SalesPerson_Purchaser] from [tsa].[ics_land_Navision_ROU_SalesPerson_Purchaser]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_ROU_SalesPerson_Purchaser] ON [tsa].[ics_land_Navision_ROU_SalesPerson_Purchaser]
GO
PRINT N'Dropping index [IndClust_tsa_ics_land_Navision_ROU_Std_Purchase_Line] from [tsa].[ics_land_Navision_ROU_Std_Purchase_Line]'
GO
DROP INDEX [IndClust_tsa_ics_land_Navision_ROU_Std_Purchase_Line] ON [tsa].[ics_land_Navision_ROU_Std_Purchase_Line]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_BGR_Purchase_Payables_Setup]'
GO
DROP TABLE [tsa].[ics_land_Navision_BGR_Purchase_Payables_Setup]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_BGR_Purchase_PrePayment_Pct]'
GO
DROP TABLE [tsa].[ics_land_Navision_BGR_Purchase_PrePayment_Pct]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_BGR_Purchase_Line]'
GO
DROP TABLE [tsa].[ics_land_Navision_BGR_Purchase_Line]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_BGR_Purchase_Header]'
GO
DROP TABLE [tsa].[ics_land_Navision_BGR_Purchase_Header]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_BGR_Purchase_Price]'
GO
DROP TABLE [tsa].[ics_land_Navision_BGR_Purchase_Price]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_BGR_SalesPerson_Purchaser]'
GO
DROP TABLE [tsa].[ics_land_Navision_BGR_SalesPerson_Purchaser]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_BGR_Purchase_Invoice_Line]'
GO
DROP TABLE [tsa].[ics_land_Navision_BGR_Purchase_Invoice_Line]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_BGR_Purchase_Invoice_Line]'
GO
DROP TABLE [psa].[ics_stg_Navision_BGR_Purchase_Invoice_Line]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_BGR_Purchase_Invoice_Header]'
GO
DROP TABLE [tsa].[ics_land_Navision_BGR_Purchase_Invoice_Header]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_BGR_Purchase_Invoice_Header]'
GO
DROP TABLE [psa].[ics_stg_Navision_BGR_Purchase_Invoice_Header]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_BGR_Std_Purchase_Line]'
GO
DROP TABLE [tsa].[ics_land_Navision_BGR_Std_Purchase_Line]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_BGR_Std_Purchase_Line]'
GO
DROP TABLE [psa].[ics_stg_Navision_BGR_Std_Purchase_Line]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_BGR_Purchase_Code]'
GO
DROP TABLE [tsa].[ics_land_Navision_BGR_Purchase_Code]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_BGR_Purchase_Code]'
GO
DROP TABLE [psa].[ics_stg_Navision_BGR_Purchase_Code]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_ROU_Purchase_Price]'
GO
DROP TABLE [psa].[ics_stg_Navision_ROU_Purchase_Price]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_ROU_Purchase_Invoice_Line]'
GO
DROP TABLE [psa].[ics_stg_Navision_ROU_Purchase_Invoice_Line]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_ROU_Purchase_Invoice_Header]'
GO
DROP TABLE [psa].[ics_stg_Navision_ROU_Purchase_Invoice_Header]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_ROU_Purchase_Payables_Setup]'
GO
DROP TABLE [psa].[ics_stg_Navision_ROU_Purchase_Payables_Setup]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_ROU_SalesPerson_Purchaser]'
GO
DROP TABLE [psa].[ics_stg_Navision_ROU_SalesPerson_Purchaser]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_ROU_Std_Purchase_Line]'
GO
DROP TABLE [psa].[ics_stg_Navision_ROU_Std_Purchase_Line]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_ROU_Purchase_Code]'
GO
DROP TABLE [psa].[ics_stg_Navision_ROU_Purchase_Code]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_ROU_Purchase_Line]'
GO
DROP TABLE [psa].[ics_stg_Navision_ROU_Purchase_Line]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_ROU_Purchase_Header]'
GO
DROP TABLE [psa].[ics_stg_Navision_ROU_Purchase_Header]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_ROU_Purchase_Line_Discount]'
GO
DROP TABLE [psa].[ics_stg_Navision_ROU_Purchase_Line_Discount]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_BGR_Purchase_Line_Discount]'
GO
DROP TABLE [psa].[ics_stg_Navision_BGR_Purchase_Line_Discount]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_BGR_Purchase_Payables_Setup]'
GO
DROP TABLE [psa].[ics_stg_Navision_BGR_Purchase_Payables_Setup]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_BGR_Purchase_PrePayment_Pct]'
GO
DROP TABLE [psa].[ics_stg_Navision_BGR_Purchase_PrePayment_Pct]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_BGR_Purchase_Line]'
GO
DROP TABLE [psa].[ics_stg_Navision_BGR_Purchase_Line]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_BGR_Purchase_Header]'
GO
DROP TABLE [psa].[ics_stg_Navision_BGR_Purchase_Header]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_BGR_Purchase_Price]'
GO
DROP TABLE [psa].[ics_stg_Navision_BGR_Purchase_Price]
GO
PRINT N'Dropping [psa].[ics_stg_Navision_BGR_SalesPerson_Purchaser]'
GO
DROP TABLE [psa].[ics_stg_Navision_BGR_SalesPerson_Purchaser]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_ROU_Purchase_Price]'
GO
DROP TABLE [tsa].[ics_land_Navision_ROU_Purchase_Price]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_ROU_Purchase_Invoice_Line]'
GO
DROP TABLE [tsa].[ics_land_Navision_ROU_Purchase_Invoice_Line]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_ROU_Purchase_Invoice_Header]'
GO
DROP TABLE [tsa].[ics_land_Navision_ROU_Purchase_Invoice_Header]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_ROU_Purchase_Payables_Setup]'
GO
DROP TABLE [tsa].[ics_land_Navision_ROU_Purchase_Payables_Setup]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_ROU_SalesPerson_Purchaser]'
GO
DROP TABLE [tsa].[ics_land_Navision_ROU_SalesPerson_Purchaser]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_ROU_Std_Purchase_Line]'
GO
DROP TABLE [tsa].[ics_land_Navision_ROU_Std_Purchase_Line]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_ROU_Purchase_Code]'
GO
DROP TABLE [tsa].[ics_land_Navision_ROU_Purchase_Code]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_ROU_Purchase_Line]'
GO
DROP TABLE [tsa].[ics_land_Navision_ROU_Purchase_Line]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_ROU_Purchase_Header]'
GO
DROP TABLE [tsa].[ics_land_Navision_ROU_Purchase_Header]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_ROU_Purchase_Line_Discount]'
GO
DROP TABLE [tsa].[ics_land_Navision_ROU_Purchase_Line_Discount]
GO
PRINT N'Dropping [tsa].[ics_land_Navision_BGR_Purchase_Line_Discount]'
GO
DROP TABLE [tsa].[ics_land_Navision_BGR_Purchase_Line_Discount]
GO
