CREATE TABLE [qvstg].[BusinessUnit]
(
[BusinessUnitKey] [int] NOT NULL,
[IsDeleted] [char] (1) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[NativeBusinessUnitKey] [nvarchar] (50) NOT NULL,
[StrategicBusinessUnitCode] [nvarchar] (20) NOT NULL,
[SalesCenterSbuCode] [nvarchar] (20) NOT NULL,
[BusinessUnitName] [nvarchar] (100) NOT NULL,
[RegionId] [int] NULL,
[RegionName] [nvarchar] (50) NOT NULL,
[RegionDescription] [nvarchar] (1000) NOT NULL
)
GO
ALTER TABLE [qvstg].[BusinessUnit] ADD CONSTRAINT [CK_qvstg_BusinessUnit_IsDeleted] CHECK (([IsDeleted]='Y' OR [IsDeleted]='N'))
GO
ALTER TABLE [qvstg].[BusinessUnit] ADD CONSTRAINT [PK_qvstg_BusinessUnit] PRIMARY KEY CLUSTERED  ([BusinessUnitKey])
GO
ALTER TABLE [qvstg].[BusinessUnit] ADD CONSTRAINT [AK_qvstg_BusinessUnit_NativeBusinessUnitKey] UNIQUE NONCLUSTERED  ([NativeBusinessUnitKey])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Represents a Strategic Business Unit as imported from the QlikView data store.  An SBU may operate within a single country jurisdiction or across multiple countries; similarly a country may have more than one business unit', 'SCHEMA', N'qvstg', 'TABLE', N'BusinessUnit', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database-specific surrogate key that uniquely identifies a strategic business unit', 'SCHEMA', N'qvstg', 'TABLE', N'BusinessUnit', 'COLUMN', N'BusinessUnitKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The full name of a strategic business unit (not guaranteed unique)', 'SCHEMA', N'qvstg', 'TABLE', N'BusinessUnit', 'COLUMN', N'BusinessUnitName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'qvstg', 'TABLE', N'BusinessUnit', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'qvstg', 'TABLE', N'BusinessUnit', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'qvstg', 'TABLE', N'BusinessUnit', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'qvstg', 'TABLE', N'BusinessUnit', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record on this table; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'qvstg', 'TABLE', N'BusinessUnit', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record on this table; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'qvstg', 'TABLE', N'BusinessUnit', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'qvstg', 'TABLE', N'BusinessUnit', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The unique identifier for a business unit record as maintained in the source system of record indicated by DataSourceKey', 'SCHEMA', N'qvstg', 'TABLE', N'BusinessUnit', 'COLUMN', N'NativeBusinessUnitKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'A longer description associated with a business region that groups one or more stratgeic business units together', 'SCHEMA', N'qvstg', 'TABLE', N'BusinessUnit', 'COLUMN', N'RegionDescription'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Reference to the unique identifier for a business region (in which the SBU is grouped) record as maintained in the source system of record indicated by DataSourceKey', 'SCHEMA', N'qvstg', 'TABLE', N'BusinessUnit', 'COLUMN', N'RegionId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of a business region that groups one or more stratgeic business units together', 'SCHEMA', N'qvstg', 'TABLE', N'BusinessUnit', 'COLUMN', N'RegionName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'A business-friendly code used to identify a business unit in QlikView Sales Center (and hence Power BI et al).  Actually the same as StrategicBusinessUnitCode is most cases.', 'SCHEMA', N'qvstg', 'TABLE', N'BusinessUnit', 'COLUMN', N'SalesCenterSbuCode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The business-friendly code, used regionally, that uniquely identifies a strategic business unit', 'SCHEMA', N'qvstg', 'TABLE', N'BusinessUnit', 'COLUMN', N'StrategicBusinessUnitCode'
GO
