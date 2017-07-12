--!
--! BMI_BI_DWH.JASON_SANDBOX.users.sql
--!
/*
select * from sys.database_principals;

select * from sys.dm_db_uncontained_entities
select name, containment, containment_desc from sys.databases
*/
--!
--! MAKE SURE WE ARE ON THE RIGHT INSTANCE AND IN THE RIGHT DATABASE
--!
set noexec off
go
if cast(serverproperty('ServerName') as nvarchar(255)) <> 'bmibidwh' or db_name() <> 'JASON_SANDBOX'
	begin
		raiserror('Failed to run users script due incorrect Azure SQL Server instance or database', 16, 1) ;
		set noexec on ;
	end
go

/*
select * from sys.sysusers;
select * from sys.sql_logins;
select * from sys.database_principals;
*/

--if not exists (select 1 from sys.sysusers where name = 'Greg.Lucas@icopal.com')
--	begin
--		create user [Greg.Lucas@icopal.com] from external provider;
--	end
--go
--alter role [db_accessadmin] add member [Greg.Lucas@icopal.com]
--go
--alter role [db_owner] add member [Greg.Lucas@icopal.com]
--go
--grant alter any user to [greg.lucas@icopal.com]
--go

--if exists(select * from sys.database_principals where name = 'INFA_SVC_DEV')
--  drop user [INFA_SVC_DEV] ;
--go
--if exists(select * from sys.database_principals where name = 'InfaDev')
--  drop user [InfaDev] ;
--go

if not exists (select 1 from sys.database_principals where name = 'InfaDev')
	begin
		create user [InfaDev] for login [InfaDev] with default_schema = [dbo];

		alter role [db_owner] add member [InfaDev] ;
	end
go

if not exists (select 1 from sys.database_principals where name = 'Jason.Bogart@icopal.com')
	begin
		create user [Jason.Bogart@icopal.com] from external provider;

		alter role [db_owner] add member [Jason.Bogart@icopal.com] ;
	end
go
if not exists (select 1 from sys.database_principals where name = 'Jarek.Czujak@icopal.com')
	begin
		create user [Jarek.Czujak@icopal.com] from external provider;

		alter role [db_owner] add member [Jarek.Czujak@icopal.com] ;
	end
go
if not exists (select 1 from sys.database_principals where name = 'Vincent.Mitchell@icopal.com')
	begin
		create user [Vincent.Mitchell@icopal.com] from external provider;

		alter role [db_owner] add member [Vincent.Mitchell@icopal.com] ;
	end
go
