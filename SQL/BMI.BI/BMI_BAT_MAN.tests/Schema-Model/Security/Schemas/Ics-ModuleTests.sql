CREATE SCHEMA [Ics-ModuleTests]
AUTHORIZATION [dbo]
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'tSQLt.TestClass', @xp, 'SCHEMA', N'Ics-ModuleTests', NULL, NULL, NULL, NULL
GO
