CREATE TABLE [qvstg].[Product]
(
[ProductKey] [int] NOT NULL,
[IsDeleted] [char] (1) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[DataSourceKey] [int] NOT NULL,
[NativeProductKey] [nvarchar] (50) NOT NULL,
[ProductNumber] [nvarchar] (50) NOT NULL,
[ProductName] [nvarchar] (100) NOT NULL,
[ProductTypeId] [int] NULL,
[ProductTypeName] [nvarchar] (50) NOT NULL,
[ProductGnit] [nvarchar] (50) NOT NULL,
[ProductDescription1] [nvarchar] (100) NOT NULL,
[ProductDescription2] [nvarchar] (100) NOT NULL,
[LocalProductGroup1] [nvarchar] (50) NOT NULL,
[LocalProductGroup2] [nvarchar] (50) NOT NULL,
[LocalProductGroup3] [nvarchar] (50) NOT NULL,
[LocalProductGroup4] [nvarchar] (50) NOT NULL,
[LocalProductGroup5] [nvarchar] (50) NOT NULL,
[NativeProductCategoryKey] [nvarchar] (100) NOT NULL,
[ProductCategoryBaseLevel] [nvarchar] (200) NOT NULL,
[ProductCategoryLevel1] [nvarchar] (200) NOT NULL,
[ProductCategoryLevel2] [nvarchar] (200) NOT NULL,
[ProductCategoryLevel3] [nvarchar] (200) NOT NULL,
[ProductCategoryLevel4] [nvarchar] (200) NOT NULL,
[ProductCategoryLevel5] [nvarchar] (200) NOT NULL
)
GO
ALTER TABLE [qvstg].[Product] ADD CONSTRAINT [CK_qvstg_Product_IsDeleted] CHECK (([IsDeleted]='Y' OR [IsDeleted]='N'))
GO
ALTER TABLE [qvstg].[Product] ADD CONSTRAINT [PK_qvstg_Product] PRIMARY KEY CLUSTERED  ([ProductKey])
GO
ALTER TABLE [qvstg].[Product] ADD CONSTRAINT [AK_qvstg_Product_DataSourceKey_NativeProductKey] UNIQUE NONCLUSTERED  ([DataSourceKey], [NativeProductKey])
GO
