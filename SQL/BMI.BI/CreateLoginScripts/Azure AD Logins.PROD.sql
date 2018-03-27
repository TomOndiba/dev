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

/*
if exists(select * from sys.sysusers where name = 'matthew.basoo@icopal.com')
  drop user [matthew.basoo@icopal.com] ;
go
*/

if not exists (select 1 from sys.sysusers where name = 'greg.lucas@icopal.com')
	begin
		create user [greg.lucas@icopal.com] from external provider;
	end
go
alter role [dbmanager] add member [greg.lucas@icopal.com]
go
alter role [loginmanager] add member [greg.lucas@icopal.com]
go
grant alter any user to [greg.lucas@icopal.com]
go

if not exists (select 1 from sys.sysusers where name = 'andrew.couch@icopal.com')
	begin
		create user [andrew.couch@icopal.com] from external provider;
	end
go
alter role [dbmanager] add member [andrew.couch@icopal.com]
go
alter role [loginmanager] add member [andrew.couch@icopal.com]
go
grant alter any user to [andrew.couch@icopal.com]
go

if not exists (select 1 from sys.sysusers where name = 'stephen.lawrenson@icopal.com')
	begin
		create user [stephen.lawrenson@icopal.com] from external provider;
	end
go
alter role [dbmanager] add member [stephen.lawrenson@icopal.com]
go
alter role [loginmanager] add member [stephen.lawrenson@icopal.com]
go
grant alter any user to [stephen.lawrenson@icopal.com]
go

if not exists (select 1 from sys.sysusers where name = 'anthony.smart@icopal.com')
	begin
		create user [anthony.smart@icopal.com] from external provider;
	end
go
if not exists (select 1 from sys.sysusers where name = 'jason.bogart@icopal.com')
	begin
		create user [jason.bogart@icopal.com] from external provider;
	end
go
if not exists (select 1 from sys.sysusers where name = 'tom.manville@icopal.com')
	begin
		create user [tom.manville@icopal.com] from external provider;
	end
go
if not exists (select 1 from sys.sysusers where name = 'mark.bolton@icopal.com')
	begin
		create user [mark.bolton@icopal.com] from external provider;
	end
go
if not exists (select * from sys.sysusers where name = 'bob.abildgaard-joergensen@icopal.com')
	begin
		create user [bob.abildgaard-joergensen@icopal.com] from external provider;
	end
go
if not exists (select * from sys.sysusers where name = 'gary.kearns@icopal.com')
	begin
		create user [gary.kearns@icopal.com] from external provider;
	end
go
