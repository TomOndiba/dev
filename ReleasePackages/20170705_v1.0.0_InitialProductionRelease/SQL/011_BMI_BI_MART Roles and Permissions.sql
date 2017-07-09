--!
--! BMI_BI_MART Roles and Permissions.sql
--!

--!
--! Create any required data feed/ETL roles so we can grant the required permissions
--!
if not exists (select * from sys.database_principals where type = 'R' and name = 'DataFeedReaders')
	exec(N'create role [DataFeedReaders] authorization [dbo];') ;
go

grant select on schema :: [INFORMATION_SCHEMA] to [DataFeedReaders];
grant select on schema :: [dbo] to [DataFeedReaders];
go
if schema_id('qvi') is not null
	begin
		exec (N'grant execute, select on schema :: [qvi] to [DataFeedReaders];');
	end
go


if not exists (select * from sys.database_principals where type = 'R' and name = 'DataFeedWriters')
	exec(N'create role [DataFeedWriters] authorization [dbo];') ;
go

grant select on schema :: [INFORMATION_SCHEMA] to [DataFeedWriters];
grant select on schema :: [dbo] to [DataFeedWriters];
go
if schema_id('qvi') is not null
	begin
		--! ALTER permission is required to allow TRUNCATE
		--exec (N'grant alter on schema :: qvi to [DataFeedWriters];');
		exec (N'grant select, insert, update on schema :: [qvi] to [DataFeedWriters];');
	end
go


--!
--! Create a batch managers role to allow support users to change selected load-related metadata etc.
--!
if not exists (select * from sys.database_principals where type = 'R' and name = 'BatchManagers')
	exec(N'create role [BatchManagers] authorization [dbo];') ;
go

if schema_id('qvi') is not null exec (N'grant select on schema :: [qvi] to [BatchManagers];') ;
if objectpropertyex(object_id(N'dbo.refDataSource'), N'IsUserTable') is not null exec (N'grant select on dbo.refDataSource to [BatchManagers];') ;
if objectpropertyex(object_id(N'dbo.dimDate'), N'IsUserTable') is not null exec (N'grant select on dbo.dimDate to [BatchManagers];') ;
go

--!
--! Create role to support the Power BI Reporting service.
--!
if not exists (select * from sys.database_principals where type = 'R' and name = 'PowerBiReporters')
	exec(N'create role [PowerBiReporters] authorization [dbo];') ;
go

if schema_id('pbi') is not null exec (N'grant select on schema :: [pbi] to [PowerBiReporters];') ;
go

--!
--! Create read-only role for App Support Team 
--!
if not exists (select * from sys.database_principals where type = 'R' and name = 'AppSupportReadOnly')
	exec(N'create role [AppSupportReadOnly] authorization [dbo];') ;
go
exec sp_addrolemember N'db_datareader', N'AppSupportReadOnly' ;
go
if schema_id('pbi') is not null exec (N'grant select on schema :: [pbi] to [AppSupportReadOnly];') ;
if schema_id('qvi') is not null exec (N'grant select on schema :: [qvi] to [AppSupportReadOnly];') ;
go

--!
--! Create a role to allow read-only access to the actual code
--!
if not exists (select * from sys.database_principals where type = 'R' and name = 'CodeReviewers')
	exec(N'create role [CodeReviewers] authorization [dbo];') ;
go
grant view definition to [CodeReviewers];
go

--!
--! Create the super-user role used for deployment in all environments
--!
if not exists (select * from sys.database_principals where type = 'R' and name = 'DeploymentManagers')
	exec(N'create role [DeploymentManagers] authorization [dbo];') ;
go
exec sp_addrolemember N'db_datareader', N'DeploymentManagers' ;
exec sp_addrolemember N'db_datawriter', N'DeploymentManagers' ;
exec sp_addrolemember N'db_owner', N'DeploymentManagers' ;
go

--!
--! Create any remaining environment-specific roles
--!
if not exists (select * from sys.database_principals where type = 'R' and name = 'SqlDevelopersDEV')
	exec(N'create role [SqlDevelopersDEV] authorization [dbo];') ;
if not exists (select * from sys.database_principals where type = 'R' and name = 'SqlDevelopersTEST')
	exec(N'create role [SqlDevelopersTEST] authorization [dbo];') ;
if not exists (select * from sys.database_principals where type = 'R' and name = 'SqlDevelopersPROD')
	exec(N'create role [SqlDevelopersPROD] authorization [dbo];') ;
go

grant execute to [SqlDevelopersDEV];
go
exec sp_addrolemember N'db_datareader', N'SqlDevelopersDEV' ;
exec sp_addrolemember N'db_datawriter', N'SqlDevelopersDEV' ;
exec sp_addrolemember N'db_owner', N'SqlDevelopersDEV' ;
go

grant showplan to [SqlDevelopersTEST]
go
grant execute to [SqlDevelopersTEST];
go
exec sp_addrolemember N'db_datareader', N'SqlDevelopersTEST' ;
exec sp_addrolemember N'db_datawriter', N'SqlDevelopersTEST' ;
exec sp_addrolemember N'db_ddladmin', N'SqlDevelopersTEST' ;
go

grant view definition to [SqlDevelopersPROD];
go
grant showplan to [SqlDevelopersPROD]
go
exec sp_addrolemember N'db_datareader', N'SqlDevelopersPROD' ;
go


--!
--!
--!
if not exists (select * from sys.database_principals where type = 'R' and name = 'EtlDevelopersDEV')
	exec(N'create role [EtlDevelopersDEV] authorization [dbo];') ;
if not exists (select * from sys.database_principals where type = 'R' and name = 'EtlDevelopersTEST')
	exec(N'create role [EtlDevelopersTEST] authorization [dbo];') ;
if not exists (select * from sys.database_principals where type = 'R' and name = 'EtlDevelopersPROD')
	exec(N'create role [EtlDevelopersPROD] authorization [dbo];') ;
go

grant view definition to [EtlDevelopersDEV];
grant view database state to [EtlDevelopersDEV];
grant showplan to [EtlDevelopersDEV]
go
exec sp_addrolemember N'db_datareader', N'EtlDevelopersDEV' ;
exec sp_addrolemember N'CodeReviewers', N'EtlDevelopersDEV' ;
go

grant view definition to [EtlDevelopersTEST];
grant view database state to [EtlDevelopersTEST];
grant showplan to [EtlDevelopersTEST]
go
exec sp_addrolemember N'db_datareader', N'EtlDevelopersTEST' ;
go

grant view definition to [EtlDevelopersPROD];
go
grant showplan to [EtlDevelopersPROD]
go
if schema_id('qvi') is not null exec (N'grant select on schema :: [qvi] to [EtlDevelopersPROD];');
if schema_id('pbi') is not null exec (N'grant select on schema :: [pbi] to [EtlDevelopersPROD];') ;
go

--!
--!
--!
if not exists (select * from sys.database_principals where type = 'R' and name = 'AppDevelopersDEV')
	exec(N'create role [AppDevelopersDEV] authorization [dbo];') ;
if not exists (select * from sys.database_principals where type = 'R' and name = 'AppDevelopersTEST')
	exec(N'create role [AppDevelopersTEST] authorization [dbo];') ;
if not exists (select * from sys.database_principals where type = 'R' and name = 'AppDevelopersPROD')
	exec(N'create role [AppDevelopersPROD] authorization [dbo];') ;
go

grant view definition to [AppDevelopersDEV];
go
grant showplan to [AppDevelopersDEV]
go
exec sp_addrolemember N'db_datawriter', N'AppDevelopersDEV' ;
exec sp_addrolemember N'db_datareader', N'AppDevelopersDEV' ;
go

grant view definition to [AppDevelopersTEST];
go
grant showplan to [AppDevelopersTEST]
go
exec sp_addrolemember N'db_datareader', N'AppDevelopersTEST' ;
go

grant view definition to [AppDevelopersPROD];
go
grant showplan to [AppDevelopersPROD]
go
if schema_id('qvi') is not null exec (N'grant select on schema :: [qvi] to [AppDevelopersPROD];');
if schema_id('pbi') is not null exec (N'grant select on schema :: [pbi] to [AppDevelopersPROD];') ;
go

--!
--!
--!
if not exists (select * from sys.database_principals where type = 'R' and name = 'BusinessAnalystsDEV')
	exec(N'create role [BusinessAnalystsDEV] authorization [dbo];') ;
if not exists (select * from sys.database_principals where type = 'R' and name = 'BusinessAnalystsTEST')
	exec(N'create role [BusinessAnalystsTEST] authorization [dbo];') ;
if not exists (select * from sys.database_principals where type = 'R' and name = 'BusinessAnalystsPROD')
	exec(N'create role [BusinessAnalystsPROD] authorization [dbo];') ;
go

grant view definition to [BusinessAnalystsDEV];
go
exec sp_addrolemember N'db_datareader', N'BusinessAnalystsDEV' ;
go

grant view definition to [BusinessAnalystsTEST];
go
exec sp_addrolemember N'db_datareader', N'BusinessAnalystsTEST' ;
go

grant view definition to [BusinessAnalystsPROD];
go
if schema_id('qvi') is not null exec (N'grant select on schema :: [qvi] to [BusinessAnalystsPROD];');
if schema_id('pbi') is not null exec (N'grant select on schema :: [pbi] to [BusinessAnalystsPROD];') ;
go

