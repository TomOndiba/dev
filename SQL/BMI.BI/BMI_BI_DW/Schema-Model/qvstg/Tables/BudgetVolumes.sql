CREATE TABLE [qvstg].[BudgetVolumes]
(
[BudgetVolumesKey] [int] NOT NULL IDENTITY(100, 1),
[EtlDeltaHash] [char] (32) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[IsDeleted] [char] (1) NOT NULL,
[LineCount] [int] NOT NULL,
[BusinessUnitKey] [int] NOT NULL,
[ProductCategoryKey] [int] NOT NULL,
[Jan_YTD] [decimal] (28, 4) NULL,
[Feb_YTD] [decimal] (28, 4) NULL,
[Mar_YTD] [decimal] (28, 4) NULL,
[Apr_YTD] [decimal] (28, 4) NULL,
[May_YTD] [decimal] (28, 4) NULL,
[Jun_YTD] [decimal] (28, 4) NULL,
[Jul_YTD] [decimal] (28, 4) NULL,
[Aug_YTD] [decimal] (28, 4) NULL,
[Sep_YTD] [decimal] (28, 4) NULL,
[Oct_YTD] [decimal] (28, 4) NULL,
[Nov_YTD] [decimal] (28, 4) NULL,
[Dec_YTD] [decimal] (28, 4) NULL
)
GO
ALTER TABLE [qvstg].[BudgetVolumes] ADD CONSTRAINT [CK_qvstg_BudgetVolumes_IsDeleted] CHECK (([IsDeleted]='Y' OR [IsDeleted]='N'))
GO
ALTER TABLE [qvstg].[BudgetVolumes] ADD CONSTRAINT [PK_qvstg_BudgetVolumes] PRIMARY KEY CLUSTERED  ([BudgetVolumesKey])
GO
ALTER TABLE [qvstg].[BudgetVolumes] ADD CONSTRAINT [AK_qvstg_BudgetVolumes_BusinessUnitKey_ProductCategoryKey] UNIQUE NONCLUSTERED  ([BusinessUnitKey], [ProductCategoryKey])
GO
CREATE NONCLUSTERED INDEX [NCI_qvstg_BudgetVolumes_LoadFilter] ON [qvstg].[BudgetVolumes] ([BusinessUnitKey], [ProductCategoryKey], [EtlDeltaHash], [IsDeleted])
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'qvstg', 'TABLE', N'BudgetVolumes', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'qvstg', 'TABLE', N'BudgetVolumes', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'qvstg', 'TABLE', N'BudgetVolumes', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'qvstg', 'TABLE', N'BudgetVolumes', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'A hash (typically MD45 or SHA256) of all non-key, changeable values in this record - used by ETL processes to identify changed rows (included columns are defined within the ETL).', 'SCHEMA', N'qvstg', 'TABLE', N'BudgetVolumes', 'COLUMN', N'EtlDeltaHash'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record on this table; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'qvstg', 'TABLE', N'BudgetVolumes', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record on this table; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'qvstg', 'TABLE', N'BudgetVolumes', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'qvstg', 'TABLE', N'BudgetVolumes', 'COLUMN', N'IsDeleted'
GO
