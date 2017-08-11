-- <Migration ID="cc1fec6a-3e0e-42ec-ae69-8b8771fba0ac" />
GO

PRINT N'Creating schemas'
GO
if schema_id('IcsApp') is null
	exec(N'create schema [IcsApp] authorization [dbo];');
go
