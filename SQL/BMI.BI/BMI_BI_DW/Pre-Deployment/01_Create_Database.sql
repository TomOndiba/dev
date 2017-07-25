if (db_id(N'$(DatabaseName)') is null)
begin
	print N'Creating $(DatabaseName)...';
end
go
if (db_id(N'$(DatabaseName)') is null)
begin
	create database [$(DatabaseName)] collate Latin1_General_BIN; -- MODIFY THIS STATEMENT TO SPECIFY A COLLATION FOR YOUR DATABASE
end
go

:r "..\..\CreateDatabaseScripts\BMI_BI_DW Database.Options.sql"