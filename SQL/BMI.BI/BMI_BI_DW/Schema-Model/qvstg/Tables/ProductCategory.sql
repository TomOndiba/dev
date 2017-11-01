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
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added.', 'SCHEMA', N'qvstg', 'TABLE', N'ProductCategory', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record.', 'SCHEMA', N'qvstg', 'TABLE', N'ProductCategory', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'qvstg', 'TABLE', N'ProductCategory', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'qvstg', 'TABLE', N'ProductCategory', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'qvstg', 'TABLE', N'ProductCategory', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'qvstg', 'TABLE', N'ProductCategory', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'qvstg', 'TABLE', N'ProductCategory', 'COLUMN', N'IsDeleted'
GO
