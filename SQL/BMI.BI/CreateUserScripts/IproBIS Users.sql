--!
--! IproBIS Users.sql
--!
set noexec off;
go
use [IproBIS]
go

--! Always drop the users first so we can re-set all permissions
if exists (select 1 from dbo.sysusers where name = 'BmiBiEtlExtractor') drop user [BmiBiEtlExtractor];
if exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukglu') drop user [GROUPICOPAL\ukglu];
if exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukvmi') drop user [GROUPICOPAL\ukvmi];
if exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukjcz') drop user [GROUPICOPAL\ukjcz];
if exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukjbo') drop user [GROUPICOPAL\ukjbo];
if exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\uktma') drop user [GROUPICOPAL\uktma];
if exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukrna') drop user [GROUPICOPAL\ukrna];
go

if not exists (select 1 from dbo.sysusers where name = 'BmiBiEtlExtractor')
	create user [BmiBiEtlExtractor] for login [BmiBiEtlExtractor] with default_schema = [etl];
go
if not exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukglu')
	create user [GROUPICOPAL\ukglu] for login [GROUPICOPAL\ukglu] with default_schema = [dbo];
go
if not exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukvmi')
	create user [GROUPICOPAL\ukvmi] for login [GROUPICOPAL\ukvmi] with default_schema = [dbo];
go
if not exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukjcz')
	create user [GROUPICOPAL\ukjcz] for login [GROUPICOPAL\ukjcz] with default_schema = [dbo];
go
if not exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukjbo')
	create user [GROUPICOPAL\ukjbo] for login [GROUPICOPAL\ukjbo] with default_schema = [dbo];
go
if not exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\uktma')
	create user [GROUPICOPAL\uktma] for login [GROUPICOPAL\uktma] with default_schema = [dbo];
go
if not exists (select 1 from dbo.sysusers where name = 'GROUPICOPAL\ukrna')
	create user [GROUPICOPAL\ukrna] for login [GROUPICOPAL\ukrna] with default_schema = [dbo];
go

exec sp_addrolemember N'db_datareader', N'BmiBiEtlExtractor' ;
exec sp_addrolemember N'db_datareader', N'GROUPICOPAL\ukglu' ;
exec sp_addrolemember N'db_datareader', N'GROUPICOPAL\ukvmi' ;
exec sp_addrolemember N'db_datareader', N'GROUPICOPAL\ukjcz' ;
exec sp_addrolemember N'db_datareader', N'GROUPICOPAL\ukjbo' ;
exec sp_addrolemember N'db_datareader', N'GROUPICOPAL\uktma' ;
exec sp_addrolemember N'db_datareader', N'GROUPICOPAL\ukrna' ;
go

grant view definition to [BmiBiEtlExtractor];
grant view definition to [GROUPICOPAL\ukglu];
grant view definition to [GROUPICOPAL\ukvmi];
grant view definition to [GROUPICOPAL\ukjcz];
grant view definition to [GROUPICOPAL\ukjbo];
grant view definition to [GROUPICOPAL\uktma];
grant view definition to [GROUPICOPAL\ukrna];
go

use [IproBIS]
go
grant showplan to [GROUPICOPAL\ukglu];
grant showplan to [GROUPICOPAL\ukvmi];
grant showplan to [GROUPICOPAL\ukjbo];
grant showplan to [GROUPICOPAL\ukrna];
go

