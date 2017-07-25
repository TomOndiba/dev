-- <Migration ID="eb9c3ec3-0992-410e-875a-d11f195dd2b6" />
GO

PRINT N'Altering [dbo].[StubResultSet]'
GO
ALTER TABLE [dbo].[StubResultSet] ADD
[StartCapturePoint] [datetime] NULL,
[EndCapturePoint] [datetime] NULL
GO
