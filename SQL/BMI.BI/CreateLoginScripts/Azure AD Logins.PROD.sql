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
--grant alter any user to [Greg.Lucas@icopal.com]
--go

if not exists (select 1 from sys.sysusers where name = 'matthew.basoo@icopal.com')
	begin
		create user [matthew.basoo@icopal.com] from external provider;
	end
go
alter role [dbmanager] add member [matthew.basoo@icopal.com]
go
alter role [loginmanager] add member [matthew.basoo@icopal.com]
go
grant alter any user to [matthew.basoo@icopal.com]
go

if not exists (select 1 from sys.sysusers where name = 'razia.nazir@icopal.com')
	begin
		create user [razia.nazir@icopal.com] from external provider;
	end
go

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

