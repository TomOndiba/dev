﻿--!
--! BM_BI_DW Users.sql
--!
set noexec off;
go

set nocount on
go
set xact_abort on
go
set transaction isolation level serializable
go
begin transaction
go

/*
select * from sys.sysusers;
select * from sys.database_principals;
*/

--=====================================================================================================================
--! START OF USER-EDITABLE SECTION
--=====================================================================================================================

if object_id(N'tempdb..#Servers') is not null drop table #Servers;
go
create table #Servers
(
  ServerName sysname not null
, Environment varchar(8) not null
, primary key (ServerName, Environment)
) ;
go

if object_id(N'tempdb..#Roles') is not null drop table #Roles;
go
create table #Roles
(
  RoleName sysname not null
, Environment varchar(8) not null
, primary key (RoleName, Environment)
) ;
go

if object_id(N'tempdb..#Users') is not null drop table #Users;
go
create table #Users
(
  IsActive tinyint not null
, Environment varchar(8) not null
, LoginName sysname not null
, DefaultSchema sysname not null
, DoRevokeDatabaseAccess bit not null
, DoGrantDatabaseAccess bit not null
, primary key (LoginName, Environment)
) ;
go

if object_id(N'tempdb..#RoleMembers') is not null drop table #RoleMembers;
go
create table #RoleMembers
(
  UserName sysname not null
, RoleName sysname not null
, primary key (UserName, RoleName)
) ;
go

--! Actions
declare @_DoDropInactiveUsers bit = 1 ;
declare @_DoDropAllUsers bit = 1 ;
declare @_DoAddDatabaseUsers bit = 1 ;
declare @_DoAddRoleMembers bit = 1 ;
declare @_Debug bit = 1 ;

insert #Servers (ServerName, Environment)
values
	  ('bmibidwh'				, 'ALL')
	, ('bmibidwh'				, 'DEV')
	, ('TEST_NOT_IMPLEMENTED'	, 'ALL')
	, ('TEST_NOT_IMPLEMENTED'	, 'TEST')
	, ('UAT_NOT_IMPLEMENTED'	, 'ALL')
	, ('UAT_NOT_IMPLEMENTED'	, 'PROD')
	, ('bmidwhprod'				, 'ALL')
	, ('bmidwhprod'				, 'PROD')
;

insert #Roles (Environment, RoleName)
values
	  ('ALL'	, 'AppSupportReadOnly')
	, ('ALL'	, 'BatchManagers')
	, ('ALL'	, 'CodeReviewers')
	, ('ALL'	, 'DataFeedReaders')
	, ('ALL'	, 'DataFeedWriters')
	, ('ALL'	, 'PowerBiReporters')
	, ('ALL'	, 'DeploymentManagers')
	, ('DEV'	, 'AppDevelopers')
	, ('TEST'	, 'AppDevelopers')
	, ('PROD'	, 'AppDevelopers')
	, ('DEV'	, 'BusinessAnalysts')
	, ('TEST'	, 'BusinessAnalysts')
	, ('PROD'	, 'BusinessAnalysts')
	, ('DEV'	, 'EtlDevelopers')
	, ('TEST'	, 'EtlDevelopers')
	, ('PROD'	, 'EtlDevelopers')
	, ('DEV'	, 'SqlDevelopers')
	, ('TEST'	, 'SqlDevelopers')
	, ('PROD'	, 'SqlDevelopers')

insert #Users (IsActive, Environment, LoginName, DefaultSchema, DoRevokeDatabaseAccess, DoGrantDatabaseAccess)
values (0, '', '', '', 0, 0)
	--! Application Users
	, (1	, 'DEV'		, 'InfaDev'							, 'dbo'	, 1	, 1)
	, (1	, 'PROD'	, 'InfaProd'						, 'dbo'	, 1	, 1)
	, (1	, 'DEV'		, 'BmiBiDwFeedDev'					, 'dbo'	, 1	, 1)
	, (1	, 'PROD'	, 'BmiBiDwFeedProd'					, 'dbo'	, 1	, 1)
	, (1	, 'DEV'		, 'BmiBiMartFeedDev'				, 'dbo'	, 1	, 1)
	, (1	, 'PROD'	, 'BmiBiMartFeedProd'				, 'dbo'	, 1	, 1)
	, (1	, 'DEV'		, 'PowerBiReaderDev'				, 'dbo'	, 1	, 1)
	, (1	, 'PROD'	, 'PowerBiReaderProd'				, 'dbo'	, 1	, 1)

	--! SQL Developers
--! DO NOT revoke database access for this user to avoid breaking other DBA-level permissions
--	, (1	, 'DEV'		, 'greg.lucas@icopal.com'			, 'dbo'	, 0	, 1)
--	, (1	, 'PROD'	, 'greg.lucas@icopal.com'			, 'dbo'	, 0	, 1)

	--! ETL Developers
	, (1	, 'DEV'		, 'Vincent.Mitchell@icopal.com'		, 'dbo'	, 1	, 1)
	, (1	, 'PROD'	, 'Vincent.Mitchell@icopal.com'		, 'dbo'	, 1	, 1)
	, (1	, 'DEV'		, 'Jason.Bogart@icopal.com'			, 'dbo'	, 1	, 1)
	, (1	, 'PROD'	, 'Jason.Bogart@icopal.com'			, 'dbo'	, 1	, 1)
	, (1	, 'DEV'		, 'Jarek.Czujak@icopal.com'			, 'dbo'	, 1	, 1)
	, (1	, 'PROD'	, 'Jarek.Czujak@icopal.com'			, 'dbo'	, 1	, 1)

	--! App/Report Developers
	, (1	, 'DEV'		, 'Tom.Manville@icopal.com'			, 'dbo'	, 1	, 1)
	, (1	, 'PROD'	, 'Tom.Manville@icopal.com'			, 'dbo'	, 1	, 1)

	--! Business Analysts/Testers/Management
	, (1	, 'DEV'		, 'Mark.Bolton@icopal.com'			, 'dbo'	, 1	, 1)
	, (1	, 'PROD'	, 'Mark.Bolton@icopal.com'			, 'dbo'	, 1	, 1)

	--! Supply Chain Users
	, (1	, 'DEV'		, 'Amelie.Pogson@icopal.com'		, 'dbo'	, 1	, 1)
	, (1	, 'PROD'	, 'Amelie.Pogson@icopal.com'		, 'dbo'	, 1	, 1)
	, (1	, 'DEV'		, 'Andrew.Marshall@icopal.com'		, 'dbo'	, 1	, 1)
	, (1	, 'PROD'	, 'Andrew.Marshall@icopal.com'		, 'dbo'	, 1	, 1)
	, (1	, 'DEV'		, 'Angus.Beattie@icopal.com'		, 'dbo'	, 1	, 1)
	, (1	, 'PROD'	, 'Angus.Beattie@icopal.com'		, 'dbo'	, 1	, 1)
	, (1	, 'DEV'		, 'Anne.DuffyPenny@icopal.com'		, 'dbo'	, 1	, 1)
	, (1	, 'PROD'	, 'Anne.DuffyPenny@icopal.com'		, 'dbo'	, 1	, 1)
	, (1	, 'DEV'		, 'Humayun.Kabir@icopal.com'		, 'dbo'	, 1	, 1)
	, (1	, 'PROD'	, 'Humayun.Kabir@icopal.com'		, 'dbo'	, 1	, 1)
	, (1	, 'DEV'		, 'Patrick.LeBlond@icopal.com'		, 'dbo'	, 1	, 1)
	, (1	, 'PROD'	, 'Patrick.LeBlond@icopal.com'		, 'dbo'	, 1	, 1)
	, (1	, 'DEV'		, 'Redouane.Berksi@icopal.com'		, 'dbo'	, 1	, 1)
	, (1	, 'PROD'	, 'Redouane.Berksi@icopal.com'		, 'dbo'	, 1	, 1)
	, (1	, 'DEV'		, 'Robert.Metcalfe@icopal.com'		, 'dbo'	, 1	, 1)
	, (1	, 'PROD'	, 'Robert.Metcalfe@icopal.com'		, 'dbo'	, 1	, 1)
	, (1	, 'DEV'		, 'Stuart.Walton@icopal.com'		, 'dbo'	, 1	, 1)
	, (1	, 'PROD'	, 'Stuart.Walton@icopal.com'		, 'dbo'	, 1	, 1)
	, (1	, 'DEV'		, 'Tony.Pagett@icopal.com'			, 'dbo'	, 1	, 1)
	, (1	, 'PROD'	, 'Tony.Pagett@icopal.com'			, 'dbo'	, 1	, 1)
	---------------------------------------------------------------------------------------------------

	--! Expired User Accounts
	, (0	, 'DEV'		, 'Jonathan.Holdcroft@icopal.com'	, 'dbo'	, 1	, 0)
	, (0	, 'PROD'	, 'Jonathan.Holdcroft@icopal.com'	, 'dbo'	, 1	, 0)
;

insert #RoleMembers (UserName, RoleName)
values ('', '')
	--! SQL Developers
	, ('greg.lucas@icopal.com'			, 'SqlDevelopers')
	, ('greg.lucas@icopal.com'			, 'BatchManagers')
	, ('greg.lucas@icopal.com'			, 'CodeReviewers')

	--! ETL Developers
	, ('Vincent.Mitchell@icopal.com'	, 'EtlDevelopers')
	, ('Vincent.Mitchell@icopal.com'	, 'BatchManagers')
	, ('Vincent.Mitchell@icopal.com'	, 'CodeReviewers')
	, ('Jason.Bogart@icopal.com'		, 'EtlDevelopers')
	, ('Jason.Bogart@icopal.com'		, 'BatchManagers')
	, ('Jason.Bogart@icopal.com'		, 'CodeReviewers')
	, ('Jarek.Czujak@icopal.com'		, 'EtlDevelopers')
	, ('Jarek.Czujak@icopal.com'		, 'BatchManagers')
	, ('Jarek.Czujak@icopal.com'		, 'CodeReviewers')

	--! App/Report Developers
	, ('Tom.Manville@icopal.com'		, 'AppDevelopers')

	--! Business Analysts/Testers/Management
	, ('Mark.Bolton@icopal.com'			, 'BusinessAnalysts')

	--! Supply Chain Users
	, ('Amelie.Pogson@icopal.com'		, 'PowerBiReporters')
	, ('Andrew.Marshall@icopal.com'		, 'PowerBiReporters')
	, ('Angus.Beattie@icopal.com'		, 'PowerBiReporters')
	, ('Anne.DuffyPenny@icopal.com'		, 'PowerBiReporters')
	, ('Humayun.Kabir@icopal.com'		, 'PowerBiReporters')
	, ('Patrick.LeBlond@icopal.com'		, 'PowerBiReporters')
	, ('Redouane.Berksi@icopal.com'		, 'PowerBiReporters')
	, ('Robert.Metcalfe@icopal.com'		, 'PowerBiReporters')
	, ('Stuart.Walton@icopal.com'		, 'PowerBiReporters')
	, ('Tony.Pagett@icopal.com'			, 'PowerBiReporters')

	--! Other Roles
	, ('greg.lucas@icopal.com'			, 'DeploymentManagers')

	, ('InfaDev'						, 'DataFeedWriters')
	, ('InfaProd'						, 'DataFeedWriters')
	, ('BmiBiDwFeedDev'					, 'DataFeedWriters')
	, ('BmiBiDwFeedProd'				, 'DataFeedWriters')
	, ('BmiBiMartFeedDev'				, 'DataFeedWriters')
	, ('BmiBiMartFeedProd'				, 'DataFeedWriters')
	, ('PowerBiReaderDev'				, 'PowerBiReporters')
	, ('PowerBiReaderProd'				, 'PowerBiReporters')

	, (''		, 'DeploymentManagers')
	, (''		, 'CodeReviewers')
	, (''		, 'DataFeedWriters')
	, (''		, 'AppSupportReadOnly')
;

--=====================================================================================================================
--! END OF USER-EDITABLE SECTION
--=====================================================================================================================

declare @_Error int = 0 ;
declare @_Step varchar (128)
declare @_Message varchar  (512)
declare @_LoopCount int
declare @_CursorStatus smallint ;

--! Variables
declare @_ServerName sysname = @@servername ;
declare @_CurrentEnvironment varchar(8) ;
declare @_DatabaseName sysname = db_name() ;
declare @_LoginName sysname ;
declare @_DefaultSchema sysname ;
declare @_DatabaseUserName sysname ;
declare @_DatabaseRoleName sysname ;
declare @_SqlCommand nvarchar(max);

begin try
	--!
	--! Validations
	--!
	if not exists (select 1 from #Servers where ServerName = @_ServerName)
		raiserror ('Current server name <<%s>> is not in the expected list of servers', 16, 1, @_ServerName) with nowait;

	--!
	--! What environment are we operating in?
	--!
	select @_CurrentEnvironment = Environment from #Servers where ServerName = @_ServerName and Environment <> 'ALL'

	raiserror('CURRENT SERVER: %s;  CURRENT ENVIRONMENT: %s', 0, 1, @_ServerName, @_CurrentEnvironment) with nowait ;

--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
DropDatabaseUsers:
--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	set @_Step = 'Drop Database Users' ;
	if @_DoDropAllUsers = 1 or @_DoDropInactiveUsers = 1
		begin
			if @_Debug = 1
				select distinct
					  @_Step as [Step]
					, u.LoginName
					, u.Environment
					, s.ServerName
					, u.IsActive
				from
					#Users as u
				inner join #Servers as s
					on s.Environment = u.Environment
				inner join sys.database_principals as dp
					on dp.name collate Latin1_General_BIN = u.LoginName collate Latin1_General_BIN
				where
						len(u.LoginName) > 0
					and s.ServerName = @_ServerName
					and u.DoRevokeDatabaseAccess = 1
					and u.IsActive = case
										when @_DoDropAllUsers = 1 then u.IsActive
										when @_DoDropInactiveUsers = 1 then 0
										else 99
									  end

			begin try
				declare dropUsersCursor cursor for
					select
						distinct u.LoginName
					from
						#Users as u
					inner join #Servers as s
						on s.Environment = u.Environment
					inner join sys.database_principals as dp
						on dp.name collate Latin1_General_BIN = u.LoginName collate Latin1_General_BIN
					where
							len(u.LoginName) > 0
						and s.ServerName = @_ServerName
						and u.DoRevokeDatabaseAccess = 1
						and u.IsActive = case
											when @_DoDropAllUsers = 1 then u.IsActive
											when @_DoDropInactiveUsers = 1 then 0
											else 99
										  end

				open dropUsersCursor

				fetch next from dropUsersCursor into @_DatabaseUserName

				while @@fetch_status = 0
					begin
						set @_SqlCommand = 'drop user [' + @_DatabaseUserName + '];' ;

						raiserror('Running CMD: <<< %s >>>...', 0, 1, @_SqlCommand) with nowait ;

						exec (@_SqlCommand) ;

						set @_SqlCommand = null ;

						fetch next from dropUsersCursor into @_DatabaseUserName
					end

				close dropUsersCursor

				deallocate dropUsersCursor
			end try
			begin catch
				select error_message() as [ERROR_MESSAGE];
				
				set @_CursorStatus = cursor_status('global','dropUsersCursor');
				select @_CursorStatus as [CURSOR_STATUS];

				if @_CursorStatus >- 1
					begin
						close dropUsersCursor;
						deallocate dropUsersCursor;
					end
				else if @_CursorStatus in (-1, -2)
					deallocate dropUsersCursor;

				select cursor_status('global','dropUsersCursor')  as [CURSOR_STATUS];

				throw;
			end catch

		end
	else
		raiserror('[%s] step skipped as disabled', 0, 1, @_Step) ; 



--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
AddDatabaseUsers:
--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	set @_Step = 'Add Database Users' ;
	if @_DoAddDatabaseUsers = 1
		begin
			if @_Debug = 1
				select distinct
					  @_Step as [Step]
					, u.LoginName
					, u.DefaultSchema
					, u.Environment
					, s.ServerName
				from
					#Users as u
				inner join #Servers as s
					on s.Environment = u.Environment
				left join sys.database_principals as dp
					on dp.name collate Latin1_General_BIN = u.LoginName collate Latin1_General_BIN
				where
						len(u.LoginName) > 0
					and s.ServerName = @_ServerName
					and s.Environment = @_CurrentEnvironment
					and u.IsActive = 1
					and u.DoGrantDatabaseAccess = 1
					and dp.principal_id is null

			begin try
				declare addUsersCursor cursor for
					select
						distinct u.LoginName, u.DefaultSchema
					from
						#Users as u
					inner join #Servers as s
						on s.Environment = u.Environment
					left join sys.database_principals as dp
						on dp.name collate Latin1_General_BIN = u.LoginName collate Latin1_General_BIN
					where
							len(u.LoginName) > 0
						and s.ServerName = @_ServerName
						and u.IsActive = 1
						and u.DoGrantDatabaseAccess = 1
						and dp.principal_id is null

				open addUsersCursor

				fetch next from addUsersCursor into @_DatabaseUserName, @_DefaultSchema ;

				while @@fetch_status = 0
					begin
						set @_SqlCommand = 'create user [' + @_DatabaseUserName + ']'
							+ case
								when @_DatabaseUserName like '%@icopal.com'
									then ' from external provider'
								else ' for login [' + @_DatabaseUserName + ']'
							  end
							+ ' with default_schema = [' + @_DefaultSchema + '];' ;

						raiserror('Running CMD: <<< %s >>>...', 0, 1, @_SqlCommand) with nowait ;

						exec (@_SqlCommand) ;

						set @_SqlCommand = null ;

						fetch next from addUsersCursor into @_DatabaseUserName, @_DefaultSchema ;
					end

				close addUsersCursor

				deallocate addUsersCursor
			end try
			begin catch
				select error_message() as [ERROR_MESSAGE];
				
				set @_CursorStatus = cursor_status('global','addUsersCursor');
				select @_CursorStatus as [CURSOR_STATUS];

				if @_CursorStatus >- 1
					begin
						close addUsersCursor;
						deallocate addUsersCursor;
					end
				else if @_CursorStatus in (-1, -2)
					deallocate addUsersCursor;

				select cursor_status('global','addUsersCursor')  as [CURSOR_STATUS];

				throw;
			end catch

		end
	else
		raiserror('[%s] step skipped as disabled', 0, 1, @_Step) ; 


--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
AddRoleMembers:
--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	set @_Step = 'Add Role Members' ;
	if @_DoAddRoleMembers = 1
		begin
			if @_Debug = 1
				select distinct
					  @_Step as [Step]
					, u.LoginName
					, u.Environment
					, r.RoleName
					, r.RoleName + coalesce(nullif(s.Environment, 'ALL'), '') as [EffectiveRoleName]
					, s.ServerName
					, u.IsActive
				from
					#Users as u
				inner join #RoleMembers as m
					on m.UserName = u.LoginName
				inner join #Roles as r
					on r.RoleName = m.RoleName
				inner join #Servers as s
					on s.Environment = r.Environment
				inner join sys.database_principals as dp
					on dp.name collate Latin1_General_BIN = u.LoginName collate Latin1_General_BIN
				where
						len(u.LoginName) > 0
					and len(m.RoleName) > 0
					and u.IsActive = 1
					and s.ServerName = @_ServerName
					and u.Environment = @_CurrentEnvironment
				order by
					  [LoginName]
					, [EffectiveRoleName]

			begin try
				declare addRoleMembersCursor cursor for
					select distinct
						  u.LoginName
						, r.RoleName + coalesce(nullif(s.Environment, 'ALL'), '')
					from
						#Users as u
					inner join #RoleMembers as m
						on m.UserName = u.LoginName
					inner join #Roles as r
						on r.RoleName = m.RoleName
					inner join #Servers as s
						on s.Environment = r.Environment
					inner join sys.database_principals as dp
						on dp.name collate Latin1_General_BIN = u.LoginName collate Latin1_General_BIN
					where
							len(u.LoginName) > 0
						and len(m.RoleName) > 0
						and u.IsActive = 1
						and s.ServerName = @_ServerName
						and u.Environment = @_CurrentEnvironment ;

				open addRoleMembersCursor

				fetch next from addRoleMembersCursor into @_DatabaseUserName, @_DatabaseRoleName

				while @@fetch_status = 0
					begin
						raiserror('Adding user %s to database role %s...', 0, 1, @_DatabaseUserName, @_DatabaseRoleName) with nowait ;

						exec sp_addrolemember @_DatabaseRoleName, @_DatabaseUserName ;

						fetch next from addRoleMembersCursor into @_DatabaseUserName, @_DatabaseRoleName
					end

				close addRoleMembersCursor

				deallocate addRoleMembersCursor
			end try
			begin catch
				select error_message() as [ERROR_MESSAGE];
				
				set @_CursorStatus = cursor_status('global','addRoleMembersCursor');
				select @_CursorStatus as [CURSOR_STATUS];

				if @_CursorStatus >- 1
					begin
						close addRoleMembersCursor;
						deallocate addRoleMembersCursor;
					end
				else if @_CursorStatus in (-1, -2)
					deallocate addRoleMembersCursor;

				select cursor_status('global','addRoleMembersCursor')  as [CURSOR_STATUS];

				throw;
			end catch

		end
	else
		raiserror('[%s] step skipped as disabled', 0, 1, @_Step) ; 

	--raiserror('ERROR THROWN TO FORCE ROLLBACK', 16, 1) ;

--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
EndEx:
--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


	if @@trancount > 0 commit transaction;
	raiserror('Successfully completed application of non-app user permissions', 0, 1) with nowait ;
end try
begin catch
	if @@trancount > 0 rollback transaction;

	select error_number() as [ERROR_NUMBER], error_message() as [ERROR_MESSAGE];

	throw;
end catch

--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
CleanUp:
--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
go

if object_id(N'tempdb..#Servers') is not null drop table #Servers;
go
if object_id(N'tempdb..#Roles') is not null drop table #Roles;
go
if object_id(N'tempdb..#Users') is not null drop table #Users;
go
if object_id(N'tempdb..#RoleMembers') is not null drop table #RoleMembers;
go
