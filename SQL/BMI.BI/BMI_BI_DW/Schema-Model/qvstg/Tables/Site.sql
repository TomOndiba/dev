CREATE TABLE [qvstg].[Site]
(
[SiteKey] [int] NOT NULL,
[IsDeleted] [char] (1) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[NativeSiteKey] [nvarchar] (50) NOT NULL,
[SiteName] [nvarchar] (100) NOT NULL,
[SiteDescription] [nvarchar] (1000) NOT NULL,
[BusinessUnitKey] [int] NOT NULL,
[StrategicBusinessUnitCode] [nvarchar] (20) NOT NULL,
[SalesCenterSbuCode] [nvarchar] (20) NOT NULL,
[BusinessUnitName] [nvarchar] (100) NOT NULL,
[RegionId] [int] NULL,
[RegionName] [nvarchar] (50) NOT NULL,
[RegionDescription] [nvarchar] (1000) NOT NULL,
[DataSourceKey] [int] NULL,
[SourceSystemId] [int] NULL,
[SourceSystemName] [nvarchar] (100) NOT NULL
)
GO
ALTER TABLE [qvstg].[Site] ADD CONSTRAINT [CK_qvstg_Site_IsDeleted] CHECK (([IsDeleted]='Y' OR [IsDeleted]='N'))
GO
ALTER TABLE [qvstg].[Site] ADD CONSTRAINT [PK_qvstg_Site] PRIMARY KEY CLUSTERED  ([SiteKey])
GO
ALTER TABLE [qvstg].[Site] ADD CONSTRAINT [AK_qvstg_Site_NativeSiteKey] UNIQUE NONCLUSTERED  ([NativeSiteKey])
GO
