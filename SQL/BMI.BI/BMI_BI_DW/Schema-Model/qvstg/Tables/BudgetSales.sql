CREATE TABLE [qvstg].[BudgetSales]
(
[BudgetSaleKey] [int] NOT NULL IDENTITY(100, 1),
[EtlDeltaHash] [char] (32) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[IsDeleted] [char] (1) NOT NULL,
[LineCount] [int] NOT NULL,
[BusinessUnitKey] [int] NOT NULL,
[BudgetMonthDateKey] [int] NOT NULL,
[InstallationServices] [decimal] (28, 4) NULL,
[ProducedGoods] [decimal] (28, 4) NULL,
[GroupGoods] [decimal] (28, 4) NULL,
[CommercialGoods] [decimal] (28, 4) NULL,
[ExternalSales] [decimal] (28, 4) NULL,
[IC_Transf_SBU] [decimal] (28, 4) NULL,
[IC_Transf_Region] [decimal] (28, 4) NULL,
[IC_Transf_Abroad] [decimal] (28, 4) NULL,
[IC_Transf_US] [decimal] (28, 4) NULL,
[Total_IC_Sales] [decimal] (28, 4) NULL,
[TotalSalesAndTransfers] [decimal] (28, 4) NULL
)
GO
ALTER TABLE [qvstg].[BudgetSales] ADD CONSTRAINT [CK_qvstg_BudgetSale_IsDeleted] CHECK (([IsDeleted]='Y' OR [IsDeleted]='N'))
GO
ALTER TABLE [qvstg].[BudgetSales] ADD CONSTRAINT [PK_qvstg_BudgetSale] PRIMARY KEY CLUSTERED  ([BudgetSaleKey])
GO
ALTER TABLE [qvstg].[BudgetSales] ADD CONSTRAINT [AK_qvstg_BudgetSale_BusinessUnitKey_BudgetMonthDateKey] UNIQUE NONCLUSTERED  ([BusinessUnitKey], [BudgetMonthDateKey])
GO
CREATE NONCLUSTERED INDEX [NCI_qvstg_BudgetSale_LoadFilter] ON [qvstg].[BudgetSales] ([BusinessUnitKey], [BudgetMonthDateKey], [EtlDeltaHash], [IsDeleted])
GO
