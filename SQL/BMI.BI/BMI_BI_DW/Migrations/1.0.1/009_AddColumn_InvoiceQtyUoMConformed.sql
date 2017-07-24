-- <Migration ID="6ec51e92-1659-468f-b881-19c53641ac3f" />
GO

PRINT N'Altering [qvstg].[Invoice]'
GO
ALTER TABLE [qvstg].[Invoice] ADD
[InvoiceQuantityUnitOfMeasureConformed] [varchar] (16) NOT NULL CONSTRAINT [DF_qvstg_Invoice_InvoiceQuantityUnitOfMeasureConformed] DEFAULT ('')
GO
