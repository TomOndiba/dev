if schema_id('pbi') is null
	exec(N'create schema [pbi] authorization [dbo];');
go