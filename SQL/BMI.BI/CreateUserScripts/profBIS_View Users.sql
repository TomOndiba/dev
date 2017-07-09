--!
--! profBIS_View Users.sql
--!
set noexec off;
go
use [profBIS_View]
go

--! Always drop the users first so we can re-set all permissions
--if exists (select 1 from dbo.sysusers where name = 'BmiBiEtlExtractor') drop user [BmiBiEtlExtractor];
--if exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukvmi') drop user [GROUPICOPAL\ukvmi];
--if exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukjcz') drop user [GROUPICOPAL\ukjcz];
--if exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukjbo') drop user [GROUPICOPAL\ukjbo];
--go

if not exists (select 1 from dbo.sysusers where name = 'BmiBiEtlExtractor')
	create user [BmiBiEtlExtractor] for login [BmiBiEtlExtractor] with default_schema = [etl];
go
grant view definition to [BmiBiEtlExtractor];
go
exec sp_addrolemember N'EtlReaders', N'BmiBiEtlExtractor' ;
go

if not exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukglu')
	create user [GROUPICOPAL\ukglu] for login [GROUPICOPAL\ukglu] with default_schema = [dbo];
go
exec sp_addrolemember N'DeploymentManagers', N'GROUPICOPAL\ukglu' ;
exec sp_addrolemember N'SqlDevelopers', N'GROUPICOPAL\ukglu' ;
exec sp_addrolemember N'db_owner', N'GROUPICOPAL\ukglu' ;
go

if not exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukvmi')
	create user [GROUPICOPAL\ukvmi] for login [GROUPICOPAL\ukvmi] with default_schema = [dbo];
go
exec sp_addrolemember N'EtlDevelopers', N'GROUPICOPAL\ukvmi' ;
go

if not exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukjcz')
	create user [GROUPICOPAL\ukjcz] for login [GROUPICOPAL\ukjcz] with default_schema = [dbo];
go
exec sp_addrolemember N'EtlDevelopers', N'GROUPICOPAL\ukjcz' ;
go

if not exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukjbo')
	create user [GROUPICOPAL\ukjbo] for login [GROUPICOPAL\ukjbo] with default_schema = [dbo];
go
exec sp_addrolemember N'EtlDevelopers', N'GROUPICOPAL\ukjbo' ;
go

