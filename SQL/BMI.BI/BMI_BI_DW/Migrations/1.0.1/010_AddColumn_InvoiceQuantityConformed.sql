-- <Migration ID="098df53e-6dd9-4637-8b2f-d7bf7fdf8db5" />
GO

PRINT N'Altering [qvstg].[Invoice]'
GO
ALTER TABLE [qvstg].[Invoice] ADD
[InvoiceQuantityConformed] [decimal] (12, 2) NULL
GO
