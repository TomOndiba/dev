-- <Migration ID="e5d4489a-2a5f-484c-b94e-36de46600326" />
GO

PRINT N'Altering [dbo].[psaTotsaLoadControlTable]'
GO
ALTER TABLE [dbo].[psaTotsaLoadControlTable] ADD
[Done] [smallint] NULL CONSTRAINT [DF__psaTotsaLo__Done__7B3CED68] DEFAULT ((0))
GO
