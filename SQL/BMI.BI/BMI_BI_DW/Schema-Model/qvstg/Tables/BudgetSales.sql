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
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'qvstg', 'TABLE', N'BudgetSales', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'qvstg', 'TABLE', N'BudgetSales', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'qvstg', 'TABLE', N'BudgetSales', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'qvstg', 'TABLE', N'BudgetSales', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'A hash (typically MD45 or SHA256) of all non-key, changeable values in this record - used by ETL processes to identify changed rows (included columns are defined within the ETL).', 'SCHEMA', N'qvstg', 'TABLE', N'BudgetSales', 'COLUMN', N'EtlDeltaHash'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record on this table; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'qvstg', 'TABLE', N'BudgetSales', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record on this table; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'qvstg', 'TABLE', N'BudgetSales', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'qvstg', 'TABLE', N'BudgetSales', 'COLUMN', N'IsDeleted'
GO
