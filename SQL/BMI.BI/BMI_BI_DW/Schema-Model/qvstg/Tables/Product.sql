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
EXEC sp_addextendedproperty N'MS_Description', N'Product, material or other goods sold by Icopal (regardless of whether made or bought in)', 'SCHEMA', N'qvstg', 'TABLE', N'Product', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record on this table; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record on this table; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The unique identifier for a product record as maintained in the source system of record indicated by DataSourceKey', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'NativeProductKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The category that is directly associated with a product in the source system of record. "Base" in this context implies direct association but is no indication of actual level of the named category in any hierarchy.', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'ProductCategoryBaseLevel'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the top level node in the product category hierarchy.  Will typically always be the generic ultimate parent: "Icopal Sales Categories"', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'ProductCategoryLevel1'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the next level down from ProductCategoryLevel1 in the product category hierarchy as defined at source (down to the minimum level of ProductCategoryBaseLevel)', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'ProductCategoryLevel2'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the next level down from ProductCategoryLevel2 in the product category hierarchy as defined at source (down to the minimum level of ProductCategoryBaseLevel)', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'ProductCategoryLevel3'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the next level down from ProductCategoryLevel3 in the product category hierarchy as defined at source (down to the minimum level of ProductCategoryBaseLevel)', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'ProductCategoryLevel4'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the next level down from ProductCategoryLevel4 in the product category hierarchy as defined at source (down to the minimum level of ProductCategoryBaseLevel)', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'ProductCategoryLevel5'
GO
EXEC sp_addextendedproperty N'MS_Description', N'More detailed description for a product which may include information about brand, colour, size etc.', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'ProductDescription1'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database-specific surrogate key that uniquely identifies an Icopal product ', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'ProductKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Business-friendly name for a product in the local language, is not guaranteed unique even within a single source system (may also include information about brand, colour, size etc.)', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'ProductName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Alternate operational number or code used to uniquely identify a product within the source business.  May or may not be the same as NativeProductKey.', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'ProductNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Reference to the unique identifier for a product type as identified within the source system of record indicated by DataSourceKey.', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'ProductTypeId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of a customer type used to classify products within a given source system indicated by DataSourceKey.  Meaning and range of values will vary between sources.', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'ProductTypeName'
GO
