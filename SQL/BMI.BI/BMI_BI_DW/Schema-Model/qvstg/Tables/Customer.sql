CREATE TABLE [qvstg].[Customer]
(
[CustomerKey] [int] NOT NULL,
[IsDeleted] [char] (1) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[DataSourceKey] [int] NULL,
[NativeCustomerKey] [nvarchar] (50) NOT NULL,
[CustomerNumber] [nvarchar] (50) NOT NULL,
[CustomerName] [nvarchar] (100) NOT NULL,
[CustomerAddress1] [nvarchar] (100) NOT NULL,
[CustomerAddress2] [nvarchar] (100) NOT NULL,
[CustomerAddress3] [nvarchar] (100) NOT NULL,
[CustomerZipCode] [nvarchar] (100) NOT NULL,
[CustomerCity] [nvarchar] (100) NOT NULL,
[CustomerCountry] [nvarchar] (100) NOT NULL,
[CustomerVatNumber] [nvarchar] (50) NOT NULL,
[CustomerTypeId] [int] NULL,
[CustomerTypeName] [nvarchar] (100) NOT NULL,
[CustomerGroup1] [nvarchar] (100) NOT NULL,
[CustomerGroup2] [nvarchar] (100) NOT NULL,
[CustomerGroup3] [nvarchar] (100) NOT NULL,
[CustomerGroup4] [nvarchar] (100) NOT NULL,
[CustomerGroup5] [nvarchar] (100) NOT NULL,
[CategoryIsMapped] [char] (1) NOT NULL,
[NativeCustomerCategoryKey] [nvarchar] (100) NOT NULL,
[CustomerCategoryBaseLevel] [nvarchar] (200) NOT NULL,
[CustomerCategoryLevel1] [nvarchar] (100) NOT NULL,
[CustomerCategoryLevel2] [nvarchar] (100) NOT NULL,
[CustomerCategoryLevel3] [nvarchar] (100) NOT NULL,
[CustomerCategoryLevel4] [nvarchar] (100) NOT NULL,
[CustomerCategoryLevel5] [nvarchar] (100) NOT NULL,
[CustomerCategoryLevel6] [nvarchar] (100) NOT NULL,
[CustomerCategoryLevel7] [nvarchar] (100) NOT NULL,
[CustomerCategoryLevel8] [nvarchar] (100) NOT NULL
)
GO
ALTER TABLE [qvstg].[Customer] ADD CONSTRAINT [CK_qvstg_Customer_IsDeleted] CHECK (([IsDeleted]='Y' OR [IsDeleted]='N'))
GO
ALTER TABLE [qvstg].[Customer] ADD CONSTRAINT [PK_qvstg_Customer] PRIMARY KEY CLUSTERED  ([CustomerKey])
GO
ALTER TABLE [qvstg].[Customer] ADD CONSTRAINT [AK_qvstg_Customer_DataSourceKey_NativeCustomerKey] UNIQUE NONCLUSTERED  ([DataSourceKey], [NativeCustomerKey])
GO
EXEC sp_addextendedproperty N'MS_Description', N'A Customer is any legal entity to or through whom Icopal sells products (as imported from the QlikView data store) - including direct sales (e.g. construction company or contractor) or indirect (e.g. specifying architect)', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'The category that is directly associated with a customer in the source system of record. "Base" in this context implies direct association but is no indication of actual level of the named category in any hierarchy.', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerCategoryBaseLevel'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the top level node in the customer category hierarchy.  Will typically always be the generic ultimate parent: "Icopal Customer Groups"', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerCategoryLevel1'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the next level down from CustomerCategoryLevel1 in the customer category hierarchy as defined at source (down to the minimum level of CustomerCategoryBaseLevel)', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerCategoryLevel2'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the next level down from CustomerCategoryLevel2 in the customer category hierarchy as defined at source (down to the minimum level of CustomerCategoryBaseLevel)', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerCategoryLevel3'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the next level down from CustomerCategoryLevel3 in the customer category hierarchy as defined at source (down to the minimum level of CustomerCategoryBaseLevel)', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerCategoryLevel4'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the next level down from CustomerCategoryLevel4 in the customer category hierarchy as defined at source (down to the minimum level of CustomerCategoryBaseLevel)', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerCategoryLevel5'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the next level down from CustomerCategoryLevel5 in the customer category hierarchy as defined at source (down to the minimum level of CustomerCategoryBaseLevel)', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerCategoryLevel6'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the next level down from CustomerCategoryLevel6 in the customer category hierarchy as defined at source (down to the minimum level of CustomerCategoryBaseLevel)', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerCategoryLevel7'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the next level down from CustomerCategoryLevel7 in the customer category hierarchy as defined at source (down to the minimum level of CustomerCategoryBaseLevel)', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerCategoryLevel8'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database-specific surrogate key that uniquely identifies an Icopal customer', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Business-friendly name for a customer in the local language, is not guaranteed unique even within a single source system', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Alternate operational number or code used to uniquely identify a customer within the source business.  May or may not be the same as NativeCustomerKey.', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Reference to the unique identifier for a customer type as identified within the source system of record indicated by DataSourceKey.', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerTypeId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of a customer type used to classify customers within a given source system indicated by DataSourceKey.  Meaning and range of values will vary between sources.', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerTypeName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record on this table; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record on this table; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The unique identifier for a customer record as maintained in the source system of record indicated by DataSourceKey', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'NativeCustomerKey'
GO
