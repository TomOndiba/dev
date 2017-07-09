CREATE TABLE [stg].[SSIS_BUDGET_ProductCategoryLookup]
(
[ProductCategoryGroupId] [int] NOT NULL,
[ProductCategoryId] [int] NOT NULL,
[ProductCategoryName] [varchar] (50) NOT NULL,
[QlikViewCategoryLevel4Name] [varchar] (50) NOT NULL,
[QlikViewCategoryLevel4Id] [int] NULL,
[QlikViewCategoryLevel3Name] [varchar] (50) NOT NULL,
[QlikViewCategoryLevel3Id] [int] NULL,
[MatchConfidence] [tinyint] NOT NULL
)
GO
ALTER TABLE [stg].[SSIS_BUDGET_ProductCategoryLookup] ADD CONSTRAINT [PK_SSIS_BUDGET_ProductCategoryLookup] PRIMARY KEY CLUSTERED  ([ProductCategoryId])
GO
ALTER TABLE [stg].[SSIS_BUDGET_ProductCategoryLookup] ADD CONSTRAINT [AK_stg_SSIS_BUDGET_ProductCategoryLookup_Name] UNIQUE NONCLUSTERED  ([ProductCategoryName])
GO
ALTER TABLE [stg].[SSIS_BUDGET_ProductCategoryLookup] ADD CONSTRAINT [FK_SSIS_BUDGET_ProductCategoryLookup_ProductCategoryGroup] FOREIGN KEY ([ProductCategoryGroupId]) REFERENCES [stg].[SSIS_BUDGET_ProductCategoryGroupLookup] ([ProductCategoryGroupId])
GO
