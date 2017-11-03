CREATE TABLE [qvstg].[PaymentTerm]
(
[PaymentTermKey] [int] NOT NULL,
[IsDeleted] [char] (1) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[NativePaymentTermKey] [nvarchar] (50) NOT NULL,
[PaymentTermName] [nvarchar] (100) NOT NULL,
[PaymentTermDays] [int] NULL,
[PaymentTermDescription] [nvarchar] (500) NOT NULL
)
GO
ALTER TABLE [qvstg].[PaymentTerm] ADD CONSTRAINT [CK_qvstg_PaymentTerm_IsDeleted] CHECK (([IsDeleted]='Y' OR [IsDeleted]='N'))
GO
ALTER TABLE [qvstg].[PaymentTerm] ADD CONSTRAINT [PK_qvstg_PaymentTerm] PRIMARY KEY CLUSTERED  ([PaymentTermKey])
GO
ALTER TABLE [qvstg].[PaymentTerm] ADD CONSTRAINT [AK_qvstg_PaymentTerm_NativePaymentTermKey] UNIQUE NONCLUSTERED  ([NativePaymentTermKey])
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'qvstg', 'TABLE', N'PaymentTerm', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'qvstg', 'TABLE', N'PaymentTerm', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'qvstg', 'TABLE', N'PaymentTerm', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'qvstg', 'TABLE', N'PaymentTerm', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record on this table; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'qvstg', 'TABLE', N'PaymentTerm', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record on this table; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'qvstg', 'TABLE', N'PaymentTerm', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'qvstg', 'TABLE', N'PaymentTerm', 'COLUMN', N'IsDeleted'
GO
