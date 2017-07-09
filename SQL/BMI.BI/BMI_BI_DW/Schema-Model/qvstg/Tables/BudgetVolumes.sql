CREATE TABLE [qvstg].[BudgetVolumes]
(
[BudgetVolumesKey] [int] NOT NULL IDENTITY(100, 1),
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
[ProductCategoryKey] [int] NOT NULL,
[Jan_YTD] [decimal] (28, 4) NULL,
[Feb_YTD] [decimal] (28, 4) NULL,
[Mar_YTD] [decimal] (28, 4) NULL,
[Apr_YTD] [decimal] (28, 4) NULL,
[May_YTD] [decimal] (28, 4) NULL,
[Jun_YTD] [decimal] (28, 4) NULL,
[Jul_YTD] [decimal] (28, 4) NULL,
[Aug_YTD] [decimal] (28, 4) NULL,
[Sep_YTD] [decimal] (28, 4) NULL,
[Oct_YTD] [decimal] (28, 4) NULL,
[Nov_YTD] [decimal] (28, 4) NULL,
[Dec_YTD] [decimal] (28, 4) NULL
)
GO
ALTER TABLE [qvstg].[BudgetVolumes] ADD CONSTRAINT [CK_qvstg_BudgetVolumes_IsDeleted] CHECK (([IsDeleted]='Y' OR [IsDeleted]='N'))
GO
ALTER TABLE [qvstg].[BudgetVolumes] ADD CONSTRAINT [PK_qvstg_BudgetVolumes] PRIMARY KEY CLUSTERED  ([BudgetVolumesKey])
GO
ALTER TABLE [qvstg].[BudgetVolumes] ADD CONSTRAINT [AK_qvstg_BudgetVolumes_BusinessUnitKey_ProductCategoryKey] UNIQUE NONCLUSTERED  ([BusinessUnitKey], [ProductCategoryKey])
GO
CREATE NONCLUSTERED INDEX [NCI_qvstg_BudgetVolumes_LoadFilter] ON [qvstg].[BudgetVolumes] ([BusinessUnitKey], [ProductCategoryKey], [EtlDeltaHash], [IsDeleted])
GO
