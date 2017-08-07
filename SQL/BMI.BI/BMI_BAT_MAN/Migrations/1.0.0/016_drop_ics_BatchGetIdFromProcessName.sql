-- <Migration ID="b30bd577-92f3-4dbb-bd48-985d496f2400" />
GO

PRINT N'Dropping [ics].[BatchGetIdFromProcessName]'
GO
IF OBJECT_ID(N'[ics].[BatchGetIdFromProcessName]', 'P') IS NOT NULL
DROP PROCEDURE [ics].[BatchGetIdFromProcessName]
GO
