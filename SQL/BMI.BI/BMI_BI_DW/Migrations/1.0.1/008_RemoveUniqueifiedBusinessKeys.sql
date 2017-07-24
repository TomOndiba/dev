-- <Migration ID="2c98d0be-61cb-4776-9ba5-152add0adee2" />
GO

PRINT N'Dropping constraints from [qvstg].[Invoice]'
GO
ALTER TABLE [qvstg].[Invoice] DROP CONSTRAINT [AK_qvstg_Invoice_UniqueifiedBusinessKey]
GO
PRINT N'Dropping constraints from [qvstg].[OrderBacklog]'
GO
ALTER TABLE [qvstg].[OrderBacklog] DROP CONSTRAINT [AK_qvstg_OrderBacklog_UniqueifiedBusinessKey]
GO
PRINT N'Dropping constraints from [qvstg].[OrderShippedNotInvoiced]'
GO
ALTER TABLE [qvstg].[OrderShippedNotInvoiced] DROP CONSTRAINT [AK_qvstg_OrderShippedNotInvoiced_UniqueifiedBusinessKey]
GO
