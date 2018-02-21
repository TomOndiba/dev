--!
--! profBIS_View Users.sql
--!
set noexec off;
go
use [profBIS_View]
go

--! Always drop the users first so we can re-set all permissions
--if exists (select 1 from dbo.sysusers where name = 'BmiBiEtlExtractor') drop user [BmiBiEtlExtractor];
--if exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukglu') drop user [GROUPICOPAL\ukglu];
if exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukaou') drop user [GROUPICOPAL\ukaou];
if exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\uksla') drop user [GROUPICOPAL\uksla];
if exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukasm') drop user [GROUPICOPAL\ukasm];
if exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukjbo') drop user [GROUPICOPAL\ukjbo];
if exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\uktma') drop user [GROUPICOPAL\uktma];
if exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukrna') drop user [GROUPICOPAL\ukrna];
if exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukvmi') drop user [GROUPICOPAL\ukvmi];
if exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukjcz') drop user [GROUPICOPAL\ukjcz];
go

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

if not exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukaou')
	create user [GROUPICOPAL\ukaou] for login [GROUPICOPAL\ukaou] with default_schema = [dbo];
go
exec sp_addrolemember N'DeploymentManagers', N'GROUPICOPAL\ukaou' ;
exec sp_addrolemember N'SqlDevelopers', N'GROUPICOPAL\ukaou' ;
exec sp_addrolemember N'db_owner', N'GROUPICOPAL\ukaou' ;
go

if not exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\uksla')
	create user [GROUPICOPAL\uksla] for login [GROUPICOPAL\uksla] with default_schema = [dbo];
go
exec sp_addrolemember N'DeploymentManagers', N'GROUPICOPAL\uksla' ;
exec sp_addrolemember N'SqlDevelopers', N'GROUPICOPAL\uksla' ;
exec sp_addrolemember N'db_owner', N'GROUPICOPAL\uksla' ;
go

if not exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukrna')
	create user [GROUPICOPAL\ukrna] for login [GROUPICOPAL\ukrna] with default_schema = [dbo];
go
exec sp_addrolemember N'DeploymentManagers', N'GROUPICOPAL\ukrna' ;
exec sp_addrolemember N'SqlDevelopers', N'GROUPICOPAL\ukrna' ;
exec sp_addrolemember N'db_owner', N'GROUPICOPAL\ukrna' ;
go

if not exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukasm')
	create user [GROUPICOPAL\ukasm] for login [GROUPICOPAL\ukasm] with default_schema = [dbo];
go
exec sp_addrolemember N'EtlDevelopers', N'GROUPICOPAL\ukasm' ;
go

if not exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukjbo')
	create user [GROUPICOPAL\ukjbo] for login [GROUPICOPAL\ukjbo] with default_schema = [dbo];
go
exec sp_addrolemember N'EtlDevelopers', N'GROUPICOPAL\ukjbo' ;
go
if not exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\uktma')
	create user [GROUPICOPAL\uktma] for login [GROUPICOPAL\uktma] with default_schema = [dbo];
go
exec sp_addrolemember N'EtlDevelopers', N'GROUPICOPAL\uktma' ;
go

use [profBIS_View]
go
grant showplan to [GROUPICOPAL\ukglu];
grant showplan to [GROUPICOPAL\ukaou];
grant showplan to [GROUPICOPAL\uksla];
grant showplan to [GROUPICOPAL\ukrna];
grant showplan to [GROUPICOPAL\ukjbo];
grant showplan to [GROUPICOPAL\ukasm];
go
