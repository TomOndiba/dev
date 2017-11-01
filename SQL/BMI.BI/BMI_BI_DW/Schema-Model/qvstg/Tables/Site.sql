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
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'qvstg', 'TABLE', N'Site', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'qvstg', 'TABLE', N'Site', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'qvstg', 'TABLE', N'Site', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'qvstg', 'TABLE', N'Site', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'qvstg', 'TABLE', N'Site', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record on this table; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'qvstg', 'TABLE', N'Site', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record on this table; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'qvstg', 'TABLE', N'Site', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'qvstg', 'TABLE', N'Site', 'COLUMN', N'IsDeleted'
GO
