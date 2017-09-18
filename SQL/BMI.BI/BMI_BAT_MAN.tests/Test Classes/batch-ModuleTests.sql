CREATE SCHEMA [batch-ModuleTests]
    AUTHORIZATION [dbo];




go
execute sp_addextendedproperty @name = N'tSQLt.TestClass', @value = 1, @level0type = N'SCHEMA', @level0name = N'batch-ModuleTests';

