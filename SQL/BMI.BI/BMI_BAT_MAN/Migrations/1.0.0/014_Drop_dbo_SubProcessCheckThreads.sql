-- <Migration ID="65918870-2fd8-4aa5-9a4d-79088123474b" />
GO

PRINT N'Dropping [dbo].[SubProcessCheckThreads]'
GO
IF OBJECT_ID(N'[dbo].[SubProcessCheckThreads]', 'P') IS NOT NULL
DROP PROCEDURE [dbo].[SubProcessCheckThreads]
GO
