-- <Migration ID="dff86676-2a83-4ae9-86f7-caa88b2a9151" />
GO

PRINT N'Dropping [dbo].[ThreadRunStart]'
GO
IF OBJECT_ID(N'[dbo].[ThreadRunStart]', 'P') IS NOT NULL
DROP PROCEDURE [dbo].[ThreadRunStart]
GO
PRINT N'Dropping [dbo].[SubProcessRunStart]'
GO
IF OBJECT_ID(N'[dbo].[SubProcessRunStart]', 'P') IS NOT NULL
DROP PROCEDURE [dbo].[SubProcessRunStart]
GO
PRINT N'Dropping [dbo].[ProcessRunStart]'
GO
IF OBJECT_ID(N'[dbo].[ProcessRunStart]', 'P') IS NOT NULL
DROP PROCEDURE [dbo].[ProcessRunStart]
GO
