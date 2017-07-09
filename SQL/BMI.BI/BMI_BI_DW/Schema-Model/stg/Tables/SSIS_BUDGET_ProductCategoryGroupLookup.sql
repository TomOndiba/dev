CREATE TABLE [stg].[SSIS_BUDGET_ProductCategoryGroupLookup]
(
[ProductCategoryGroupId] [int] NOT NULL,
[ProductCategoryGroupName] [varchar] (50) NOT NULL,
[QlikViewCategoryLevel2Name] [varchar] (50) NOT NULL,
[QlikViewCategoryLevel2Id] [int] NULL
)
GO
ALTER TABLE [stg].[SSIS_BUDGET_ProductCategoryGroupLookup] ADD CONSTRAINT [PK_stg_SSIS_BUDGET_ProductCategoryGroupLookup] PRIMARY KEY CLUSTERED  ([ProductCategoryGroupId])
GO
ALTER TABLE [stg].[SSIS_BUDGET_ProductCategoryGroupLookup] ADD CONSTRAINT [AK_stg_SSIS_BUDGET_ProductCategoryGroupLookup_Name] UNIQUE NONCLUSTERED  ([ProductCategoryGroupName])
GO
