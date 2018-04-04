-- <Migration ID="c5487d28-f096-467e-8b6f-07ecfb625955" />
GO

/****** Object:  Table [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Price]    Script Date: 20/03/2018 14:50:49 ******/
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Price]
GO
/****** Object:  Table [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Line]    Script Date: 20/03/2018 14:50:49 ******/
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Line]
GO
/****** Object:  Table [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Header]    Script Date: 20/03/2018 14:50:50 ******/
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Header]
GO
/****** Object:  Table [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line]    Script Date: 20/03/2018 14:50:50 ******/
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line]
GO
/****** Object:  Table [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header]    Script Date: 20/03/2018 14:50:50 ******/
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header]
GO
/****** Object:  Table [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Line]    Script Date: 20/03/2018 14:50:50 ******/
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Line]
GO
/****** Object:  Table [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Code]    Script Date: 20/03/2018 14:50:50 ******/
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Code]
GO
/****** Object:  Table [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser]    Script Date: 20/03/2018 14:50:50 ******/
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser]
GO
/****** Object:  Table [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup]    Script Date: 20/03/2018 14:50:50 ******/
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup]
GO
/****** Object:  Table [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Purchase Line Discount]    Script Date: 20/03/2018 14:50:50 ******/
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Purchase Line Discount]
GO
/****** Object:  Table [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Line]    Script Date: 20/03/2018 14:50:50 ******/
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Line]
GO
/****** Object:  Table [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Code]    Script Date: 20/03/2018 14:50:51 ******/
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Code]
GO
/****** Object:  Table [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser]    Script Date: 20/03/2018 14:50:51 ******/
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser]
GO
/****** Object:  Table [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup]    Script Date: 20/03/2018 14:50:51 ******/
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup]
GO
/****** Object:  Table [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Price]    Script Date: 20/03/2018 14:50:51 ******/
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Price]
GO
/****** Object:  Table [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %]    Script Date: 20/03/2018 14:50:51 ******/
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %]
GO
/****** Object:  Table [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line Discount]    Script Date: 20/03/2018 14:50:51 ******/
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line Discount]
GO
/****** Object:  Table [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line]    Script Date: 20/03/2018 14:50:51 ******/
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line]
GO
/****** Object:  Table [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Header]    Script Date: 20/03/2018 14:50:51 ******/
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Header]
GO
/****** Object:  Table [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line]    Script Date: 20/03/2018 14:50:51 ******/
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line]
GO
/****** Object:  Table [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header]    Script Date: 20/03/2018 14:50:51 ******/
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header]
GO

DROP TABLE IF EXISTS [tsa].[ics_land_Navision_BGR_Std_Purchase_Line]
GO

DROP TABLE IF EXISTS [tsa].[ics_land_Navision_BGR_Purch_And_Payables_Setup]
GO
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_BGR_Purch_Header]
GO					  
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_BGR_Purch_Inv_Header]
GO					  
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_BGR_Purch_Price]
GO					  
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_BGR_Salesperson_Purchaser]
GO					  
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_BGR_Standard_Purch_Line]
GO					  
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_ROU_Standard_Purch_Line]
GO					  
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_ROU_Purch_And_Payables_Setup]
GO					  
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_ROU_Purch_Header]
GO					  
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_ROU_Purch_Inv_Header]
GO					  
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_ROU_Purch_Inv_Line]
GO					  
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_ROU_Purch_Line]
GO					  
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_ROU_Purch_Price]
GO					  
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_ROU_Salesperson_Purchaser]
go
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_BGR_Purch_Inv_Line]
GO
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_BGR_Purch_ Inv_ Line]
GO
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_BGR_Purch_Code]
GO
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_BGR_Purch_Line]
GO
DROP TABLE IF EXISTS [tsa].[ics_land_Navision_ROU_Purch_Line_Discount]
go
