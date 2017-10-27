-- <Migration ID="629b5c87-1bac-4361-96f5-50d26ad16b51" />
GO

PRINT N'Creating discovery schema'
GO
if (schema_id(N'discovery') is null)
	exec(N'create schema [discovery] authorization [dbo];');
go


