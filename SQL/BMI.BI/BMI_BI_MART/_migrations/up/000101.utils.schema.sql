if schema_id('utils') is null
	exec(N'create schema [utils] authorization [dbo];');
go