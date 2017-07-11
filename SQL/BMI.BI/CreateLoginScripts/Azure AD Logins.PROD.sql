--!
--! Azure AD Logins.PROD.sql
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

/*
select * from sys.sysusers;
select * from sys.sql_logins;
select * from sys.database_principals;
*/

--if exists(select * from sys.sysusers where name = 'INFA_SVC_DEV@icopal.com')
--  drop user [INFA_SVC_DEV@icopal.com] ;
--go

--if not exists (select 1 from sys.sysusers where name = 'Greg.Lucas@icopal.com')
--	begin
--		create user [Greg.Lucas@icopal.com] from external provider;
--	end
--go
--alter role [dbmanager] add member [Greg.Lucas@icopal.com]
--go
--alter role [loginmanager] add member [Greg.Lucas@icopal.com]
--go
--grant alter any user to [greg.lucas@icopal.com]
--go

if not exists (select 1 from sys.sysusers where name = 'Vincent.Mitchell@icopal.com')
	begin
		create user [Vincent.Mitchell@icopal.com] from external provider;
	end
go
if not exists (select 1 from sys.sysusers where name = 'Jason.Bogart@icopal.com')
	begin
		create user [Jason.Bogart@icopal.com] from external provider;
	end
go
if not exists (select 1 from sys.sysusers where name = 'Jarek.Czujak@icopal.com')
	begin
		create user [Jarek.Czujak@icopal.com] from external provider;
	end
go
if not exists (select 1 from sys.sysusers where name = 'Tom.Manville@icopal.com')
	begin
		create user [Tom.Manville@icopal.com] from external provider;
	end
go
if not exists (select 1 from sys.sysusers where name = 'Mark.Bolton@icopal.com')
	begin
		create user [Mark.Bolton@icopal.com] from external provider;
	end
go
if not exists (select * from sys.sysusers where name = 'bob.abildgaard-joergensen@icopal.com')
	begin
		create user [bob.abildgaard-joergensen@icopal.com] from external provider;
	end
go
if not exists (select * from sys.sysusers where name = 'Gary.Kearns@icopal.com')
	begin
		create user [Gary.Kearns@icopal.com] from external provider;
	end
go

