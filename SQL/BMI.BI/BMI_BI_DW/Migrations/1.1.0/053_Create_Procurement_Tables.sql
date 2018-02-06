-- <Migration ID="50cae356-7865-4b2b-89ab-fe0afc371cd2" />
GO

PRINT N'Creating [discovery].[ProcurementSnapshot]'
GO
CREATE TABLE [discovery].[ProcurementSnapshot]
(
[Division] [nvarchar] (255) NULL,
[CompanyNumber] [nvarchar] (255) NULL,
[Facility] [nvarchar] (255) NULL,
[Warehouse] [nvarchar] (255) NULL,
[PurchaseOrder] [nvarchar] (255) NULL,
[POType] [nvarchar] (255) NULL,
[LowestStatus] [nvarchar] (255) NULL,
[HighestStatus] [nvarchar] (255) NULL,
[Supplier] [nvarchar] (255) NULL,
[Currency] [nvarchar] (255) NULL,
[PurchaseLine] [nvarchar] (255) NULL,
[Item] [nvarchar] (255) NULL,
[OrderedQty] [nvarchar] (255) NULL,
[ReceivedQuantity] [nvarchar] (255) NULL,
[ApprovedQty] [nvarchar] (255) NULL,
[RejectedQty] [nvarchar] (255) NULL,
[StoredQty] [nvarchar] (255) NULL,
[PurchaseOrderUnit] [nvarchar] (255) NULL,
[PurchasePriceUnit] [nvarchar] (255) NULL,
[LineAmountOrderCurrency] [nvarchar] (255) NULL,
[RequestedDeliveryDate] [nvarchar] (255) NULL,
[ConfirmedDeliveryDate] [nvarchar] (255) NULL,
[PlanningDeliveryDate] [nvarchar] (255) NULL,
[StandardUnitofMeasure] [nvarchar] (255) NULL,
[StandardUnitofQty] [nvarchar] (255) NULL,
[ReportingUnitofMeasure] [nvarchar] (255) NULL,
[ReportingUnitofQty] [nvarchar] (255) NULL,
[product_category_direct] [nvarchar] (255) NULL,
[product_category_level_1] [nvarchar] (255) NULL,
[product_category_level_2] [nvarchar] (255) NULL,
[product_category_level_3] [nvarchar] (255) NULL,
[product_category_level_4] [nvarchar] (255) NULL,
[product_category_level_5] [nvarchar] (255) NULL,
[EntryDate] [nvarchar] (25) NULL,
[ChangeDate] [nvarchar] (255) NULL,
[DataSource] [nvarchar] (255) NULL,
[DataSourceKey] [int] NULL,
[DateDataExtracted] [datetime] NULL
)
GO
PRINT N'Creating [dbo].[PU_CATEGORY]'
GO
CREATE TABLE [dbo].[PU_CATEGORY]
(
[CATEGORY_ID] [int] NOT NULL,
[CATEGORY_NAME] [varchar] (100) NULL,
[PARENT_ID] [int] NULL,
[CREATE_BY] [varchar] (100) NULL,
[CREATE_DATE] [datetime] NULL,
[UPDATE_BY] [varchar] (100) NULL,
[UPDATE_DATE] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_PU_CATEGORY_1] on [dbo].[PU_CATEGORY]'
GO
ALTER TABLE [dbo].[PU_CATEGORY] ADD CONSTRAINT [PK_PU_CATEGORY_1] PRIMARY KEY CLUSTERED  ([CATEGORY_ID])
GO
PRINT N'Creating [dbo].[PU_LINK_CATEGORY]'
GO
CREATE TABLE [dbo].[PU_LINK_CATEGORY]
(
[CATEGORY_ID] [int] NOT NULL,
[SYSTEM_ID] [int] NOT NULL,
[MATERIAL_CODE] [varchar] (50) NOT NULL,
[CREATE_BY] [varchar] (100) NULL,
[CREATE_DATE] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_PU_LINK_CATEGORY_1] on [dbo].[PU_LINK_CATEGORY]'
GO
ALTER TABLE [dbo].[PU_LINK_CATEGORY] ADD CONSTRAINT [PK_PU_LINK_CATEGORY_1] PRIMARY KEY CLUSTERED  ([CATEGORY_ID], [SYSTEM_ID], [MATERIAL_CODE])
GO
PRINT N'Adding foreign keys to [dbo].[PU_CATEGORY]'
GO
ALTER TABLE [dbo].[PU_CATEGORY] ADD CONSTRAINT [FK_PU_CATEGORY_PU_CATEGORY] FOREIGN KEY ([PARENT_ID]) REFERENCES [dbo].[PU_CATEGORY] ([CATEGORY_ID])
GO
PRINT N'Adding foreign keys to [dbo].[PU_LINK_CATEGORY]'
GO
ALTER TABLE [dbo].[PU_LINK_CATEGORY] ADD CONSTRAINT [FK_PU_LINK_CATEGORY_PU_CATEGORY] FOREIGN KEY ([CATEGORY_ID]) REFERENCES [dbo].[PU_CATEGORY] ([CATEGORY_ID])
GO
