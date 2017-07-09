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
