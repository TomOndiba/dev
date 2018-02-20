﻿--!
--! DKSQL1 Logins.sql
--!
set noexec off;
go
use [master]
go
if not exists (select 1 from sys.server_principals where [name] = 'BmiBiEtlExtractor' and [type] = 'S')
	create login [BmiBiEtlExtractor] with password = 'VbnFghRty$56'
		, check_expiration = off
		, check_policy = off
		, default_language = British
		, default_database = [profBIS_View];
else
	alter login [BmiBiEtlExtractor]
		with password = 'VbnFghRty$56'
			, check_expiration = off
			, check_policy = off
			, default_language = British
			, default_database = [profBIS_View] ;
go

if exists (select 1 from sys.[server_principals] where [name] = 'GROUPICOPAL\ukvmi' and [type] = 'U')
	drop login [GROUPICOPAL\ukvmi] ;
go
if exists (select 1 from sys.[server_principals] where [name] = 'GROUPICOPAL\ukjcz' and [type] = 'U')
	drop login [GROUPICOPAL\ukjcz] ;
go

if not exists (select 1 from sys.[server_principals] where [name] = 'GROUPICOPAL\ukglu' and [type] = 'U')
	create login [GROUPICOPAL\ukglu] from windows with default_language = British, default_database = [profBIS_View];
else
	alter login [GROUPICOPAL\ukglu] with default_language = British, default_database = [profBIS_View];
go
if not exists (select 1 from sys.[server_principals] where [name] = 'GROUPICOPAL\ukaou' and [type] = 'U')
	create login [GROUPICOPAL\ukaou] from windows with default_language = British, default_database = [profBIS_View];
else
	alter login [GROUPICOPAL\ukaou] with default_language = British, default_database = [profBIS_View];
go
if not exists (select 1 from sys.[server_principals] where [name] = 'GROUPICOPAL\ukasm' and [type] = 'U')
	create login [GROUPICOPAL\ukasm] from windows with default_language = British, default_database = [profBIS_View];
else
	alter login [GROUPICOPAL\ukasm] with default_language = British, default_database = [profBIS_View];
go
if not exists (select 1 from sys.[server_principals] where [name] = 'GROUPICOPAL\ukjbo' and [type] = 'U')
	create login [GROUPICOPAL\ukjbo] from windows with default_language = British, default_database = [profBIS_View];
else
	alter login [GROUPICOPAL\ukjbo] with default_language = British, default_database = [profBIS_View];
go
if not exists (select 1 from sys.[server_principals] where [name] = 'GROUPICOPAL\ukrna' and [type] = 'U')
	create login [GROUPICOPAL\ukrna] from windows with default_language = British, default_database = [profBIS_View];
else
	alter login [GROUPICOPAL\ukrna] with default_language = British, default_database = [profBIS_View];
go
if not exists (select 1 from sys.[server_principals] where [name] = 'GROUPICOPAL\uktma' and [type] = 'U')
	create login [GROUPICOPAL\uktma] from windows with default_language = British, default_database = [profBIS_View];
else
	alter login [GROUPICOPAL\uktma] with default_language = British, default_database = [profBIS_View];
go

use [master]
go
grant view server state to [GROUPICOPAL\ukglu];
grant view server state to [GROUPICOPAL\ukaou];
grant view server state to [GROUPICOPAL\ukjbo];
grant view server state to [GROUPICOPAL\ukrna];
go
