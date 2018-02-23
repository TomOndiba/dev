--!
--! Azure AD Admins.BMI_BAT_MAN_PROD.sql
--!

--!
--! MAKE SURE WE ARE ON THE RIGHT INSTANCE AND IN THE RIGHT DATABASE
--!
set noexec off
go
if cast(serverproperty('ServerName') as nvarchar(255)) <> 'bmidwhprod' or db_name() <> 'BMI_BAT_MAN_PROD'
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

/*
if exists (select 1 from sys.sysusers where name = 'matthew.basoo@icopal.com')
	drop user [matthew.basoo@icopal.com] from external provider;
go
*/

--if not exists (select 1 from sys.sysusers where name = 'Greg.Lucas@icopal.com')
--	begin
--		create user [Greg.Lucas@icopal.com] from external provider;
--	end
--go
--exec sp_addrolemember N'db_accessadmin', N'Greg.Lucas@icopal.com' ;
--go
--exec sp_addrolemember N'db_owner', N'Greg.Lucas@icopal.com' ;
--go
--grant alter any user to [greg.lucas@icopal.com]
--go

--!
--!
--!
if not exists (select 1 from sys.sysusers where name = 'andrew.couch@icopal.com')
	begin
		create user [andrew.couch@icopal.com] from external provider;
	end
go
alter role [db_accessadmin] add member [andrew.couch@icopal.com]
go
alter role [db_owner] add member [andrew.couch@icopal.com]
go
grant alter any user to [andrew.couch@icopal.com]
go

--!
--!
--!
--if not exists (select 1 from sys.sysusers where name = 'stephen.lawrenson@icopal.com')
--	begin
--		create user [stephen.lawrenson@icopal.com] from external provider;
--	end
--go
--alter role [db_accessadmin] add member [stephen.lawrenson@icopal.com]
--go
--alter role [db_owner] add member [stephen.lawrenson@icopal.com]
--go
--grant alter any user to [stephen.lawrenson@icopal.com]
--go

--!
--! Razia created this DB and is the owner (i.e. aliased as dbo so cannot be added as razia.nazir@icopal.com)
--!
--if not exists (select 1 from sys.sysusers where name = 'razia.nazir@icopal.com')
--	begin
--		create user [razia.nazir@icopal.com] from external provider;
--	end
--go
--alter role [db_accessadmin] add member [razia.nazir@icopal.com]
--go
--alter role [db_owner] add member [razia.nazir@icopal.com]
--go
--grant alter any user to [razia.nazir@icopal.com]
--go
