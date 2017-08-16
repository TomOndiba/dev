-- <Migration ID="8c1425f3-da8d-43f6-a2ef-0ae373bf9e7f" />
GO

PRINT N'Dropping [privy].[DeDupe]'
GO
IF OBJECT_ID(N'[privy].[DeDupe]', 'P') IS NOT NULL
DROP PROCEDURE [privy].[DeDupe]
GO
PRINT N'Dropping [privy].[BuildAndRunMerge]'
GO
IF OBJECT_ID(N'[privy].[BuildAndRunMerge]', 'P') IS NOT NULL
DROP PROCEDURE [privy].[BuildAndRunMerge]
GO
