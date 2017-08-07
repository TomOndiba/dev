-- <Migration ID="e0abb69c-34a0-4de0-a4ab-d4bd4df65104" />
GO

PRINT N'Dropping [dbo].[ThreadRunEnd]'
GO
IF OBJECT_ID(N'[dbo].[ThreadRunEnd]', 'P') IS NOT NULL
DROP PROCEDURE [dbo].[ThreadRunEnd]
GO
PRINT N'Dropping [dbo].[SubProcessRunEnd]'
GO
IF OBJECT_ID(N'[dbo].[SubProcessRunEnd]', 'P') IS NOT NULL
DROP PROCEDURE [dbo].[SubProcessRunEnd]
GO
PRINT N'Dropping [dbo].[ProcessRunEnd]'
GO
IF OBJECT_ID(N'[dbo].[ProcessRunEnd]', 'P') IS NOT NULL
DROP PROCEDURE [dbo].[ProcessRunEnd]
GO
