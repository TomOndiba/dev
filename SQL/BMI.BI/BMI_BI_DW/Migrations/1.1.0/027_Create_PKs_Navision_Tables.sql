-- <Migration ID="dcdd7baf-0cd1-4bff-9ee9-035d6433cb1b" />
GO

PRINT N'Altering [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header] ALTER COLUMN [No_] [varchar] (20) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header] on [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header] ADD CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Header] PRIMARY KEY CLUSTERED  ([No_])
GO
PRINT N'Altering [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line] ALTER COLUMN [Document No_] [varchar] (20) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line] ALTER COLUMN [Line No_] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line] on [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line] ADD CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purch_ Inv_ Line] PRIMARY KEY CLUSTERED  ([Document No_], [Line No_])
GO
PRINT N'Altering [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Header] ALTER COLUMN [Document Type] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Header] ALTER COLUMN [No_] [varchar] (20) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Header] on [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Header] ADD CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Header] PRIMARY KEY CLUSTERED  ([Document Type], [No_])
GO
PRINT N'Altering [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line] ALTER COLUMN [Document No_] [varchar] (20) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line] ALTER COLUMN [Document Type] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line] ALTER COLUMN [Line No_] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line] on [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line] ADD CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line] PRIMARY KEY CLUSTERED  ([Document No_], [Document Type], [Line No_])
GO
PRINT N'Altering [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line Discount]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line Discount] ALTER COLUMN [Currency Code] [varchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line Discount] ALTER COLUMN [Item No_] [varchar] (20) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line Discount] ALTER COLUMN [Minimum Quantity] [decimal] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line Discount] ALTER COLUMN [Starting Date] [datetime] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line Discount] ALTER COLUMN [Unit of Measure Code] [varchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line Discount] ALTER COLUMN [Variant Code] [varchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line Discount] ALTER COLUMN [Vendor No_] [varchar] (20) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line Discount] on [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line Discount]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line Discount] ADD CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Line Discount] PRIMARY KEY CLUSTERED  ([Currency Code], [Item No_], [Minimum Quantity], [Starting Date], [Unit of Measure Code], [Variant Code], [Vendor No_])
GO
PRINT N'Altering [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %] ALTER COLUMN [Item No_] [varchar] (20) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %] ALTER COLUMN [Starting Date] [datetime] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %] ALTER COLUMN [Vendor No_] [varchar] (20) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %] on [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %] ADD CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %] PRIMARY KEY CLUSTERED  ([Item No_], [Starting Date], [Vendor No_])
GO
PRINT N'Altering [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Price]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Price] ALTER COLUMN [Currency Code] [varchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Price] ALTER COLUMN [Item No_] [varchar] (20) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Price] ALTER COLUMN [Minimum Quantity] [decimal] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Price] ALTER COLUMN [Starting Date] [datetime] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Price] ALTER COLUMN [Unit of Measure Code] [varchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Price] ALTER COLUMN [Variant Code] [varchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Price] ALTER COLUMN [Vendor No_] [varchar] (20) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Price] on [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Price]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Price] ADD CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Price] PRIMARY KEY CLUSTERED  ([Currency Code], [Item No_], [Minimum Quantity], [Starting Date], [Unit of Measure Code], [Variant Code], [Vendor No_])
GO
PRINT N'Altering [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser] ALTER COLUMN [Code] [varchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser] on [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser] ADD CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Salesperson_Purchaser] PRIMARY KEY CLUSTERED  ([Code])
GO
PRINT N'Altering [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup] ALTER COLUMN [Primary Key] [varchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup] on [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup] ADD CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchases & Payables Setup] PRIMARY KEY CLUSTERED  ([Primary Key])
GO
PRINT N'Altering [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Code]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Code] ALTER COLUMN [Code] [varchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Code] on [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Code]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Code] ADD CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Code] PRIMARY KEY CLUSTERED  ([Code])
GO
PRINT N'Altering [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Line] ALTER COLUMN [Line No_] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Line] ALTER COLUMN [Standard Purchase Code] [varchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Line] on [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Line] ADD CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Standard Purchase Line] PRIMARY KEY CLUSTERED  ([Line No_], [Standard Purchase Code])
GO
PRINT N'Altering [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header] ALTER COLUMN [No_] [varchar] (20) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header] on [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header] ADD CONSTRAINT [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Header] PRIMARY KEY CLUSTERED  ([No_])
GO
PRINT N'Altering [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Header] ALTER COLUMN [Document Type] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Header] ALTER COLUMN [No_] [varchar] (20) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Header] on [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Header]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Header] ADD CONSTRAINT [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Header] PRIMARY KEY CLUSTERED  ([Document Type], [No_])
GO
PRINT N'Altering [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line] ALTER COLUMN [Document No_] [varchar] (20) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line] ALTER COLUMN [Document Type] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line] ALTER COLUMN [Line No_] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line] on [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line] ADD CONSTRAINT [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line] PRIMARY KEY CLUSTERED  ([Document No_], [Document Type], [Line No_])
GO
PRINT N'Altering [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line] ALTER COLUMN [Document No_] [varchar] (20) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line] ALTER COLUMN [Line No_] [int] NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line] on [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line] ADD CONSTRAINT [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purch_ Inv_ Line] PRIMARY KEY CLUSTERED  ([Document No_], [Line No_])
GO
PRINT N'Altering [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchase Line Discount]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchase Line Discount] ALTER COLUMN [Currency Code] [varchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchase Line Discount] ALTER COLUMN [Item No_] [varchar] (20) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchase Line Discount] ALTER COLUMN [Minimum Quantity] [decimal] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchase Line Discount] ALTER COLUMN [Starting Date] [datetime] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchase Line Discount] ALTER COLUMN [Unit of Measure Code] [varchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchase Line Discount] ALTER COLUMN [Variant Code] [varchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchase Line Discount] ALTER COLUMN [Vendor No_] [varchar] (20) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line Discount] on [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchase Line Discount]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchase Line Discount] ADD CONSTRAINT [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line Discount] PRIMARY KEY CLUSTERED  ([Currency Code], [Item No_], [Minimum Quantity], [Starting Date], [Unit of Measure Code], [Variant Code], [Vendor No_])
GO
PRINT N'Altering [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Price]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Price] ALTER COLUMN [Currency Code] [varchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Price] ALTER COLUMN [Item No_] [varchar] (20) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Price] ALTER COLUMN [Minimum Quantity] [decimal] (18, 0) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Price] ALTER COLUMN [Starting Date] [datetime] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Price] ALTER COLUMN [Unit of Measure Code] [varchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Price] ALTER COLUMN [Variant Code] [varchar] (10) NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Price] ALTER COLUMN [Vendor No_] [varchar] (20) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Price] on [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Price]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Price] ADD CONSTRAINT [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Price] PRIMARY KEY CLUSTERED  ([Currency Code], [Item No_], [Minimum Quantity], [Starting Date], [Unit of Measure Code], [Variant Code], [Vendor No_])
GO
PRINT N'Altering [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup] ALTER COLUMN [Primary Key] [varchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchases & Payables Setup] on [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchases&PayablesSetup] ADD CONSTRAINT [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchases & Payables Setup] PRIMARY KEY CLUSTERED  ([Primary Key])
GO
PRINT N'Altering [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser] ALTER COLUMN [Code] [varchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Salesperson_Purchaser] on [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Salesperson_Purchaser] ADD CONSTRAINT [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Salesperson_Purchaser] PRIMARY KEY CLUSTERED  ([Code])
GO
PRINT N'Altering [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Code]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Code] ALTER COLUMN [Code] [varchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Standard Purchase Code] on [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Code]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Code] ADD CONSTRAINT [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Standard Purchase Code] PRIMARY KEY CLUSTERED  ([Code])
GO
PRINT N'Altering [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Line] ALTER COLUMN [Line No_] [int] NOT NULL
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Line] ALTER COLUMN [Standard Purchase Code] [varchar] (10) NOT NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Standard Purchase Line] on [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Line] ADD CONSTRAINT [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Standard Purchase Line] PRIMARY KEY CLUSTERED  ([Line No_], [Standard Purchase Code])
GO
