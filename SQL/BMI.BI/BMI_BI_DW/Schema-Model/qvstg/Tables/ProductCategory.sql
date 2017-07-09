CREATE TABLE [qvstg].[ProductCategory]
(
[ProductCategoryKey] [int] NOT NULL,
[IsDeleted] [char] (1) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[NativeProductCategoryKey] [nvarchar] (50) NOT NULL,
[ProductCategoryId] [int] NOT NULL,
[ProductCategoryName] [nvarchar] (100) NOT NULL,
[NodeDepth] [tinyint] NOT NULL,
[Level3Id] [int] NOT NULL,
[Level3Name] [nvarchar] (100) NOT NULL,
[Level2Id] [int] NOT NULL,
[Level2Name] [nvarchar] (100) NOT NULL,
[Level1Id] [int] NOT NULL,
[Level1Name] [nvarchar] (100) NOT NULL,
[ProductCategoryDescription] [nvarchar] (500) NOT NULL
)
GO
ALTER TABLE [qvstg].[ProductCategory] ADD CONSTRAINT [CK_qvstg_ProductCategory_IsDeleted] CHECK (([IsDeleted]='Y' OR [IsDeleted]='N'))
GO
ALTER TABLE [qvstg].[ProductCategory] ADD CONSTRAINT [PK_qvstg_ProductCategory] PRIMARY KEY CLUSTERED  ([ProductCategoryKey])
GO
ALTER TABLE [qvstg].[ProductCategory] ADD CONSTRAINT [AK_qvstg_ProductCategory_NativeProductCategoryKey] UNIQUE NONCLUSTERED  ([NativeProductCategoryKey])
GO
