--!
--! Azure SQL Logins.DEV.sql
--!

--!
--! MAKE SURE WE ARE ON THE RIGHT INSTANCE AND IN THE RIGHT DATABASE
--!
set noexec off
go

if cast(serverproperty('ServerName') as nvarchar(255)) <> 'bmibidwh' or db_name() <> 'master'
	begin
		raiserror('Failed to run users script due incorrect Azure SQL Server instance or database', 16, 1) ;
		set noexec on ;
	end
go

--if exists(select * from sys.database_principals where name = 'InfaDev')
--  drop user [InfaDev] ;
--go
--if exists(select * from sys.sql_logins where name = 'InfaDev')
--  drop login [InfaDev] ;
--go

--!
--! IMPORTANT NOTE:
--! When creating SQL Logins, we need to grant access to master so that
--! connection strings that do not specify a default database still work
--!

--!
--!
--!
if not exists (select 1 from sys.sql_logins where name = 'InfaDev')
	create login [InfaDev] with password = 'Pow£r$ent3r@' ;
else
	alter login [InfaDev] with password = 'Pow£r$ent3r@' ;
go
if not exists (select 1 from sys.database_principals where name = 'InfaDev')
	create user [InfaDev] for login [InfaDev] with default_schema = [dbo];
go

--!
--!
--!
if not exists (select 1 from sys.sql_logins where name = 'BmiBiDwFeedDev')
	create login [BmiBiDwFeedDev] with password = 'BvcGfdTre%43' ;
else
	alter login [BmiBiDwFeedDev] with password = 'BvcGfdTre%43' ;
go
if not exists (select 1 from sys.database_principals where name = 'BmiBiDwFeedDev')
	create user [BmiBiDwFeedDev] for login [BmiBiDwFeedDev] with default_schema = [dbo];
go

--!
--!
--!
if not exists (select 1 from sys.sql_logins where name = 'BmiBiMartFeedDev')
	create login [BmiBiMartFeedDev] with password = 'MnbJhgUyt&65' ;
else
	alter login [BmiBiMartFeedDev] with password = 'MnbJhgUyt&65' ;
go
if not exists (select 1 from sys.database_principals where name = 'BmiBiMartFeedDev')
	create user [BmiBiMartFeedDev] for login [BmiBiMartFeedDev] with default_schema = [dbo];
go

--!
--!
--!
if not exists (select 1 from sys.sql_logins where name = 'PowerBiReaderDev')
	create login [PowerBiReaderDev] with password = 'p0w3r8!R3aDer' ;
else
	alter login [PowerBiReaderDev] with password = 'p0w3r8!R3aDer' ;
go
if not exists (select 1 from sys.database_principals where name = 'PowerBiReaderDev')
	create user [PowerBiReaderDev] for login [PowerBiReaderDev] with default_schema = [dbo];
go
