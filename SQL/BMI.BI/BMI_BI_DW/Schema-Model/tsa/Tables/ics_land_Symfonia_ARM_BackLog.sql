CREATE TABLE [tsa].[ics_land_Symfonia_ARM_BackLog]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_ARM_BackLog_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_ARM_BackLog_IsDuplicate] DEFAULT ((0)),
[AmountLocal] [float] NULL,
[Bonus] [varchar] (1) NULL,
[ExpectedInvDate] [datetime] NULL,
[id] [int] NULL,
[InternalOrderNr] [varchar] (40) NULL,
[InvoiceShipTo] [varchar] (4) NULL,
[InvoiceSoldTo] [varchar] (4) NULL,
[ItemNo] [varchar] (40) NULL,
[ItemQty] [float] NULL,
[ItemUOM] [varchar] (8) NULL,
[LineBonus] [varchar] (1) NULL,
[lineid] [int] NULL,
[LineNr] [smallint] NULL,
[LocalCurrency] [varchar] (3) NULL,
[OrderCurrency] [varchar] (3) NULL,
[OrderLineAmount] [float] NULL,
[OrderLineType] [varchar] (1) NULL,
[OrderNr] [varchar] (80) NULL,
[OrginalQty] [float] NULL,
[SalesCompanyId] [int] NULL,
[SalesPersonId] [int] NULL,
[SalesPersonName] [nvarchar] (128) NULL,
[StatItemQty] [float] NULL,
[StatItemUOM] [varchar] (8) NULL,
[SysId] [int] NULL
)
GO
