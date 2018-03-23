-- <Migration ID="0a2d893c-4b72-4eb2-a749-83fedff8da03" />
GO

PRINT N'Dropping [dbo].[FlattenProductCategories]'
GO
IF OBJECT_ID(N'[dbo].[FlattenProductCategories]', 'P') IS NOT NULL
DROP PROCEDURE [dbo].[FlattenProductCategories]
GO
