--!
--! Azure SQL Logins.PROD.sql
--!

--!
--! MAKE SURE WE ARE ON THE RIGHT INSTANCE AND IN THE RIGHT DATABASE
--!
set noexec off
go
if cast(serverproperty('ServerName') as nvarchar(255)) <> 'bmidwhprod' or db_name() <> 'master'
	begin
		raiserror('Failed to run users script due incorrect Azure SQL Server instance or database', 16, 1) ;
		set noexec on ;
	end
go


--!
--! IMPORTANT NOTE:
--! When creating SQL Logins, we need to grant access to master so that
--! connection strings that do not specify a default database still work
--!

if not exists (select 1 from sys.sql_logins where name = 'InfaProd')
	begin
		create login [InfaProd] with password = 'Gy7&ji89fte$nbHC@fF';
	end
go
if not exists (select 1 from sys.database_principals where name = 'InfaProd')
	begin
		create user [InfaProd] for login [InfaProd] with default_schema = [dbo];
	end
go

if not exists (select 1 from sys.sql_logins where name = 'BmiBiDwFeedProd')
	begin
		create login [BmiBiDwFeedProd] with password = 'Bhy$ln@d8Bb3HLs!';
	end
go
if not exists (select 1 from sys.database_principals where name = 'BmiBiDwFeedProd')
	begin
		create user [BmiBiDwFeedProd] for login [BmiBiDwFeedProd] with default_schema = [dbo];
	end
go

if not exists (select 1 from sys.sql_logins where name = 'BmiBiMartFeedProd')
	begin
		create login [BmiBiMartFeedProd] with password = 'P0ft&gHq%dFfh!pe';
	end
go
if not exists (select 1 from sys.database_principals where name = 'BmiBiMartFeedProd')
	begin
		create user [BmiBiMartFeedProd] for login [BmiBiMartFeedProd] with default_schema = [dbo];
	end
go

if not exists (select 1 from sys.sql_logins where name = 'PowerBiReaderProd')
	begin
		create login [PowerBiReaderProd] with password = 'Huir45$&ghVzMX5D';
	end
go
if not exists (select 1 from sys.database_principals where name = 'PowerBiReaderProd')
	begin
		create user [PowerBiReaderProd] for login [PowerBiReaderProd] with default_schema = [dbo];
	end
go
