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
