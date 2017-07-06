exec sp_addrolemember N'db_owner', N'DeploymentManagers' ;
go
exec sp_addrolemember N'db_datawriter', N'DeploymentManagers' ;
go
exec sp_addrolemember N'db_datawriter', N'SqlDevelopers' ;
go

exec sp_addrolemember N'db_datareader', N'DeploymentManagers' ;
go
exec sp_addrolemember N'db_datareader', N'SqlDevelopers' ;
go
