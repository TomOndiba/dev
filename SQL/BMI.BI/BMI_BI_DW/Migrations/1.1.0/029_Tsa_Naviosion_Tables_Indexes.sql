-- <Migration ID="d78be05b-41d1-4726-a662-f407751ed090" />
GO

PRINT N'Creating index [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header_1] on [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header_1] ON [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header] ([No_])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line_1] on [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line_1] ON [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line] ([Document No_], [Line No_])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Header_1] on [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Header]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Header_1] ON [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Header] ([Document Type], [No_])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line Discount_1] on [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line Discount]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line Discount_1] ON [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line Discount] ([Currency Code], [Item No_], [Minimum Quantity], [Starting Date], [Unit of Measure Code], [Variant Code], [Vendor No_])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line_1] on [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line_1] ON [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line] ([Document No_], [Document Type], [Line No_])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %_1] on [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %_1] ON [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %] ([Item No_], [Starting Date], [Vendor No_])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Price_1] on [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Price]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Price_1] ON [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Price] ([Currency Code], [Item No_], [Minimum Quantity], [Starting Date], [Unit of Measure Code], [Variant Code], [Vendor No_])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup_1] on [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup_1] ON [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup] ([Primary Key])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser_1] on [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser_1] ON [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser] ([Code])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Code_1] on [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Code]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Code_1] ON [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Code] ([Code])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Line_1] on [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Line]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Line_1] ON [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Line] ([Line No_], [Standard Purchase Code])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania$Purchase Line Discount_1] on [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Purchase Line Discount]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania$Purchase Line Discount_1] ON [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Purchase Line Discount] ([Currency Code], [Item No_], [Minimum Quantity], [Starting Date], [Unit of Measure Code], [Variant Code], [Vendor No_])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup_1] on [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup_1] ON [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup] ([Primary Key])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser_1] on [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser_1] ON [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser] ([Code])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Code_1] on [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Code]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Code_1] ON [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Code] ([Code])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Line_1] on [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Line]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Line_1] ON [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Line] ([Line No_], [Standard Purchase Code])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header_1] on [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header_1] ON [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header] ([No_])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line_1] on [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line_1] ON [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line] ([Document No_], [Line No_])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Header_1] on [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Header]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Header_1] ON [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Header] ([Document Type], [No_])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Line_1] on [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Line]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Line_1] ON [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Line] ([Document No_], [Document Type], [Line No_])
GO
PRINT N'Creating index [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Price_1] on [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Price]'
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Price_1] ON [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Price] ([Currency Code], [Item No_], [Minimum Quantity], [Starting Date], [Unit of Measure Code], [Variant Code], [Vendor No_])
GO
