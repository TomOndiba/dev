-- <Migration ID="21ea5065-2424-42a4-9b4a-eef0bd0c1ca9" />
GO

PRINT N'Creating index [IndClust_tsa_ics_land_Navision_Rom_Purchase_Code] on [tsa].[ics_land_Navision_Rom_Purchase_Code]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IndClust_tsa_ics_land_Navision_Rom_Purchase_Code] ON [tsa].[ics_land_Navision_Rom_Purchase_Code] ([Code])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_Rom_Purchase_Header] on [tsa].[ics_land_Navision_Rom_Purchase_Header]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IndClust_tsa_ics_land_Navision_Rom_Purchase_Header] ON [tsa].[ics_land_Navision_Rom_Purchase_Header] ([Document Type], [No_])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_Rom_Purchase_Invoice_Header] on [tsa].[ics_land_Navision_Rom_Purchase_Invoice_Header]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IndClust_tsa_ics_land_Navision_Rom_Purchase_Invoice_Header] ON [tsa].[ics_land_Navision_Rom_Purchase_Invoice_Header] ([No_])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_Rom_Purchase_Invoice_Line] on [tsa].[ics_land_Navision_Rom_Purchase_Invoice_Line]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IndClust_tsa_ics_land_Navision_Rom_Purchase_Invoice_Line] ON [tsa].[ics_land_Navision_Rom_Purchase_Invoice_Line] ([Document No_], [Line No_])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_Rom_Purchase_Line] on [tsa].[ics_land_Navision_Rom_Purchase_Line]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IndClust_tsa_ics_land_Navision_Rom_Purchase_Line] ON [tsa].[ics_land_Navision_Rom_Purchase_Line] ([Document Type], [Document No_], [Line No_])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_Rom_Purchase_Line_Discount] on [tsa].[ics_land_Navision_Rom_Purchase_Line_Discount]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IndClust_tsa_ics_land_Navision_Rom_Purchase_Line_Discount] ON [tsa].[ics_land_Navision_Rom_Purchase_Line_Discount] ([Item No_], [Vendor No_], [Starting Date], [Currency Code], [Variant Code], [Unit of Measure Code], [Minimum Quantity])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_Rom_Purchase_Payables_Setup] on [tsa].[ics_land_Navision_Rom_Purchase_Payables_Setup]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IndClust_tsa_ics_land_Navision_Rom_Purchase_Payables_Setup] ON [tsa].[ics_land_Navision_Rom_Purchase_Payables_Setup] ([Primary_Key])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_Rom_Purchase_Price] on [tsa].[ics_land_Navision_Rom_Purchase_Price]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IndClust_tsa_ics_land_Navision_Rom_Purchase_Price] ON [tsa].[ics_land_Navision_Rom_Purchase_Price] ([Item No_], [Vendor No_], [Starting Date], [Currency Code], [Variant Code], [Unit of Measure Code], [Minimum Quantity])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_Rom_SalesPerson_Purchaser] on [tsa].[ics_land_Navision_Rom_SalesPerson_Purchaser]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IndClust_tsa_ics_land_Navision_Rom_SalesPerson_Purchaser] ON [tsa].[ics_land_Navision_Rom_SalesPerson_Purchaser] ([Code])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_Rom_Std_Purchase_Line] on [tsa].[ics_land_Navision_Rom_Std_Purchase_Line]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IndClust_tsa_ics_land_Navision_Rom_Std_Purchase_Line] ON [tsa].[ics_land_Navision_Rom_Std_Purchase_Line] ([Standard Purchase Code], [Line No_])
GO
