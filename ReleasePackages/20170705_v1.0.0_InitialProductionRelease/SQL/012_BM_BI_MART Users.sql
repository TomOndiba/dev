--!
--! BMI_BI_MART Users.sql
--!
set nocount on
go
set xact_abort on
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
  RecordId int not null
, ServerName nvarchar(255) not null
, Environment varchar(8) not null
) ;
go

if object_id(N'tempdb..#Roles') is not null drop table #Roles;
go
create table #Roles
(
  RecordId int not null
, RoleName nvarchar(255) not null
, Environment varchar(8) not null
) ;
go

if object_id(N'tempdb..#Users') is not null drop table #Users;
go
create table #Users
(
  RecordId int not null
, IsActive tinyint not null
, Environment varchar(8) not null
, LoginName nvarchar(255) not null
, DefaultSchema nvarchar(255) not null
, DoRevokeDatabaseAccess bit not null
, DoGrantDatabaseAccess bit not null
, DropProcessed bit not null default (0)
, AddProcessed bit not null default (0)
) ;
go

if object_id(N'tempdb..#RoleMembers') is not null drop table #RoleMembers;
go
create table #RoleMembers
(
  RecordId int not null
, UserName nvarchar(255) not null
, RoleName nvarchar(255) not null
, IsProcessed bit not null default (0)
) ;
go

insert #Servers (RecordId, ServerName, Environment)
select
	  row_number() over(order by ServerName, Environment) as [RecordId]
	, x.ServerName
	, x.Environment
from
	(
				  select cast('' as nvarchar(255)) as [ServerName]	, cast('' as varchar(8)) as [Environment]
		union all select 'bmibidwh'				, 'ALL'
		union all select 'bmibidwh'				, 'DEV'
		union all select 'TEST_NOT_IMPLEMENTED'	, 'ALL'
		union all select 'TEST_NOT_IMPLEMENTED'	, 'TEST'
		union all select 'UAT_NOT_IMPLEMENTED'	, 'ALL'
		union all select 'UAT_NOT_IMPLEMENTED'	, 'PROD'
		union all select 'bmidwhprod'			, 'ALL'
		union all select 'bmidwhprod'			, 'PROD'
	) as x
where
		len(x.ServerName) > 0
	and len(x.Environment) > 0 ;
go

insert #Roles (RecordId, RoleName, Environment)
select
	  row_number() over(order by RoleName, Environment) as [RecordId]
	, x.RoleName
	, x.Environment
from
	(
				  select cast('' as varchar(8)) as [Environment], cast('' as nvarchar(255)) as [RoleName]
		union all select 'ALL'	, 'AppSupportReadOnly'
		union all select 'ALL'	, 'BatchManagers'
		union all select 'ALL'	, 'CodeReviewers'
		union all select 'ALL'	, 'DataFeedReaders'
		union all select 'ALL'	, 'DataFeedWriters'
		union all select 'ALL'	, 'PowerBiReporters'
		union all select 'ALL'	, 'DeploymentManagers'
		union all select 'DEV'	, 'AppDevelopers'
		union all select 'TEST'	, 'AppDevelopers'
		union all select 'PROD'	, 'AppDevelopers'
		union all select 'DEV'	, 'BusinessAnalysts'
		union all select 'TEST'	, 'BusinessAnalysts'
		union all select 'PROD'	, 'BusinessAnalysts'
		union all select 'DEV'	, 'EtlDevelopers'
		union all select 'TEST'	, 'EtlDevelopers'
		union all select 'PROD'	, 'EtlDevelopers'
		union all select 'DEV'	, 'SqlDevelopers'
		union all select 'TEST'	, 'SqlDevelopers'
		union all select 'PROD'	, 'SqlDevelopers'
	) as x
where
		len(x.RoleName) > 0
	and len(x.Environment) > 0 ;
go

insert #Users (RecordId, IsActive, Environment, LoginName, DefaultSchema, DoRevokeDatabaseAccess, DoGrantDatabaseAccess)
select
	  row_number() over(order by LoginName, Environment) as [RecordId]
	, x.IsActive
    , x.Environment
    , x.LoginName
    , x.DefaultSchema
    , x.DoRevokeDatabaseAccess
    , x.DoGrantDatabaseAccess
from
	(
				  select
					  cast(0 as tinyint) as [IsActive]
					, cast('' as varchar(8)) as [Environment]
					, cast('' as nvarchar(255)) as [LoginName]
					, cast('' as nvarchar(255)) as [DefaultSchema]
					, cast(0 as bit) as [DoRevokeDatabaseAccess]
					, cast(0 as bit) as [DoGrantDatabaseAccess]
		---------------------------------------------------------------------------------------------------
		union all select 1	, 'DEV'		, 'InfaDev'							, 'dbo'	, 1	, 1
		union all select 1	, 'PROD'	, 'InfaProd'						, 'dbo'	, 1	, 1
		union all select 1	, 'DEV'		, 'BmiBiMartFeedDev'				, 'dbo'	, 1	, 1
		union all select 1	, 'PROD'	, 'BmiBiMartFeedProd'				, 'dbo'	, 1	, 1
		union all select 1	, 'DEV'		, 'PowerBiReaderDev'				, 'dbo'	, 1	, 1
		union all select 1	, 'PROD'	, 'PowerBiReaderProd'				, 'dbo'	, 1	, 1
		---------------------------------------------------------------------------------------------------
		--! DO NOT revoke database access for this user to avoid breaking other DBA-level permissions
		--union all select 1	, 'DEV'		, 'greg.lucas@icopal.com'			, 'dbo'	, 0	, 1
		--union all select 1	, 'PROD'	, 'greg.lucas@icopal.com'			, 'dbo'	, 0	, 1
		--! SQL Developers
		---------------------------------------------------------------------------------------------------
		--! ETL Developers
		union all select 1	, 'DEV'		, 'vincent.mitchell@icopal.com'		, 'dbo'	, 1	, 1
		union all select 1	, 'PROD'	, 'vincent.mitchell@icopal.com'		, 'dbo'	, 1	, 1
		union all select 1	, 'DEV'		, 'jason.bogart@icopal.com'			, 'dbo'	, 1	, 1
		union all select 1	, 'PROD'	, 'jason.bogart@icopal.com'			, 'dbo'	, 1	, 1
		union all select 1	, 'DEV'		, 'jarek.czujak@icopal.com'			, 'dbo'	, 1	, 1
		union all select 1	, 'PROD'	, 'jarek.czujak@icopal.com'			, 'dbo'	, 1	, 1
		---------------------------------------------------------------------------------------------------
		--! App/Report Developers
		union all select 1	, 'DEV'		, 'tom.manville@icopal.com'			, 'dbo'	, 1	, 1
		union all select 1	, 'PROD'	, 'tom.manville@icopal.com'			, 'dbo'	, 1	, 1
		---------------------------------------------------------------------------------------------------
		--! Business Analysts/Testers/Management
		union all select 1	, 'DEV'		, 'mark.bolton@icopal.com'			, 'dbo'	, 1	, 1
		union all select 1	, 'PROD'	, 'mark.bolton@icopal.com'			, 'dbo'	, 1	, 1
		---------------------------------------------------------------------------------------------------
		--! Expired User Accounts
		union all select 0	, 'DEV'		, 'jonathan.holdcroft@icopal.com'	, 'dbo'	, 1	, 0
		union all select 0	, 'PROD'	, 'jonathan.holdcroft@icopal.com'	, 'dbo'	, 1	, 0
		---------------------------------------------------------------------------------------------------
		--! Supply Chain Users
		union all select 0	, 'DEV'		, 'Amelie.Pogson@icopal.com'		, 'dbo' , 1 , 0
		union all select 0	, 'PROD'	, 'Amelie.Pogson@icopal.com'		, 'dbo' , 1 , 0
		union all select 0	, 'DEV'		, 'Andrew.Marshall@icopal.com'		, 'dbo' , 1 , 0
		union all select 0	, 'PROD'	, 'Andrew.Marshall@icopal.com'		, 'dbo' , 1 , 0
		union all select 0	, 'DEV'		, 'Angus.Beattie@icopal.com'		, 'dbo' , 1 , 0
		union all select 0	, 'PROD'	, 'Angus.Beattie@icopal.com'		, 'dbo' , 1 , 0
		union all select 0	, 'DEV'		, 'Anne.DuffyPenny@icopal.com'		, 'dbo' , 1 , 0
		union all select 0	, 'PROD'	, 'Anne.DuffyPenny@icopal.com'		, 'dbo' , 1 , 0
		union all select 0	, 'DEV'		, 'Humayun.Kabir@icopal.com'		, 'dbo' , 1 , 0
		union all select 0	, 'PROD'	, 'Humayun.Kabir@icopal.com'		, 'dbo' , 1 , 0
		union all select 0	, 'DEV'		, 'Patrick.LeBlond@icopal.com'		, 'dbo' , 1 , 0
		union all select 0	, 'PROD'	, 'Patrick.LeBlond@icopal.com'		, 'dbo' , 1 , 0
		union all select 0	, 'DEV'		, 'Redouane.Berksi@icopal.com'		, 'dbo' , 1 , 0
		union all select 0	, 'PROD'	, 'Redouane.Berksi@icopal.com'		, 'dbo' , 1 , 0
		union all select 0	, 'DEV'		, 'Robert.Metcalfe@icopal.com'		, 'dbo' , 1 , 0
		union all select 0	, 'PROD'	, 'Robert.Metcalfe@icopal.com'		, 'dbo' , 1 , 0
		union all select 0	, 'DEV'		, 'Stuart.Walton@icopal.com'		, 'dbo' , 1 , 0
		union all select 0	, 'PROD'	, 'Stuart.Walton@icopal.com'		, 'dbo' , 1 , 0
		union all select 0	, 'DEV'		, 'Tony.Pagett@icopal.com'			, 'dbo' , 1 , 0
		union all select 0	, 'PROD'	, 'Tony.Pagett@icopal.com'			, 'dbo' , 1 , 0
		---------------------------------------------------------------------------------------------------
	) as x
where
		len(x.LoginName) > 0
	and len(x.Environment) > 0 ;
go

insert #RoleMembers (RecordId, UserName, RoleName)
select
	  row_number() over(order by UserName, RoleName) as [RecordId]
	, x.UserName
	, x.RoleName
from
	(
				  select cast('' as nvarchar(255)) as [UserName], cast('' as nvarchar(255)) as [RoleName]
		--! SQL Developers
		union all select 'greg.lucas@icopal.com'		, 'SqlDevelopers'
		union all select 'greg.lucas@icopal.com'		, 'BatchManagers'
		union all select 'greg.lucas@icopal.com'		, 'CodeReviewers'

		--! ETL Developers
		union all select 'vincent.mitchell@icopal.com'	, 'EtlDevelopers'
		union all select 'vincent.mitchell@icopal.com'	, 'BatchManagers'
		union all select 'vincent.mitchell@icopal.com'	, 'CodeReviewers'
		union all select 'jason.bogart@icopal.com'		, 'EtlDevelopers'
		union all select 'jason.bogart@icopal.com'		, 'BatchManagers'
		union all select 'jason.bogart@icopal.com'		, 'CodeReviewers'
		union all select 'jarek.czujak@icopal.com'		, 'EtlDevelopers'
		union all select 'jarek.czujak@icopal.com'		, 'BatchManagers'
		union all select 'jarek.czujak@icopal.com'		, 'CodeReviewers'

		--! App/Report Developers
		union all select 'tom.manville@icopal.com'		, 'AppDevelopers'

		--! Business Analysts/testers/management
		union all select 'mark.bolton@icopal.com'		, 'BusinessAnalysts'

		--! Supply Chain Users
		union all select 'Amelie.Pogson@icopal.com'		, 'PowerBiReporters'
		union all select 'Andrew.Marshall@icopal.com'	, 'PowerBiReporters'
		union all select 'Angus.Beattie@icopal.com'		, 'PowerBiReporters'
		union all select 'Anne.DuffyPenny@icopal.com'	, 'PowerBiReporters'
		union all select 'Humayun.Kabir@icopal.com'		, 'PowerBiReporters'
		union all select 'Patrick.LeBlond@icopal.com'	, 'PowerBiReporters'
		union all select 'Redouane.Berksi@icopal.com'	, 'PowerBiReporters'
		union all select 'Robert.Metcalfe@icopal.com'	, 'PowerBiReporters'
		union all select 'Stuart.Walton@icopal.com'		, 'PowerBiReporters'
		union all select 'Tony.Pagett@icopal.com'		, 'PowerBiReporters'

		--! Other Roles
		union all select 'greg.lucas@icopal.com'		, 'DeploymentManagers'
		union all select 'InfaDev'						, 'DataFeedReaders'
		union all select 'InfaProd'						, 'DataFeedReaders'
		union all select 'BmiBiMartFeedDev'				, 'DataFeedWriters'
		union all select 'BmiBiMartFeedProd'			, 'DataFeedWriters'
		union all select 'PowerBiReaderDev'				, 'PowerBiReporters'
		union all select 'PowerBiReaderProd'			, 'PowerBiReporters'
	) as x
where
		len(x.UserName) > 0
	and len(x.RoleName) > 0 ;
go

;

--! Actions
declare @_DoDropInactiveUsers bit = 1 ;
declare @_DoDropAllUsers bit = 1 ;
declare @_DoAddDatabaseUsers bit = 1 ;
declare @_DoAddRoleMembers bit = 1 ;
declare @_Debug bit = 1 ;

--=====================================================================================================================
--! END OF USER-EDITABLE SECTION
--=====================================================================================================================

declare @_Error int = 0 ;
declare @_Step varchar (128)
declare @_Message varchar  (512)
declare @_LoopCount int
declare @_CursorStatus smallint ;

--! Variables
declare @_CurrentRecordId int ;
declare @_ServerName nvarchar(255) = cast(serverproperty('ServerName') as nvarchar(255)) ;
declare @_CurrentEnvironment varchar(8) ;
declare @_DatabaseName nvarchar(255) = db_name() ;
declare @_LoginName nvarchar(255) ;
declare @_DefaultSchema nvarchar(255) ;
declare @_DatabaseUserName nvarchar(255) ;
declare @_DatabaseRoleName nvarchar(255) ;
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
	set @_CurrentEnvironment = (select Environment from #Servers where ServerName = @_ServerName and Environment <> 'ALL')

	raiserror('CURRENT SERVER: %s;  CURRENT ENVIRONMENT: %s', 0, 1, @_ServerName, @_CurrentEnvironment) with nowait ;

	--!
	--! As we can't constrain our #temp tables in Azure SQLDW with primary keys,
	--! check that the data is valid here.
	--!
	if exists (select ServerName, Environment, count(*) from #Servers group by ServerName, Environment having count(*) > 1)
		raiserror ('[ServerName + Environment] is duplicated in #Servers but is expected to be unique', 16, 1) with nowait;

	if exists (select RoleName, Environment, count(*) from #Roles group by RoleName, Environment having count(*) > 1)
		raiserror ('[RoleName + Environment] is duplicated in #Roles but is expected to be unique', 16, 1) with nowait;

	if exists (select LoginName, Environment, count(*) from #Users group by LoginName, Environment having count(*) > 1)
		raiserror ('[LoginName + Environment] is duplicated in #Users but is expected to be unique', 16, 1) with nowait;

	if exists (select UserName, RoleName, count(*) from #RoleMembers group by UserName, RoleName having count(*) > 1)
		raiserror ('[UserName + RoleName] is duplicated in #RoleMembers but is expected to be unique', 16, 1) with nowait;

--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--DropDatabaseUsers:
--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	set @_Step = 'Drop Database Users' ;
	if @_DoDropAllUsers = 1 or @_DoDropInactiveUsers = 1
		begin
			if @_Debug = 1
				select distinct
					  @_Step as [Step]
					, u.RecordId
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
					and u.DropProcessed = 0
					and u.DoRevokeDatabaseAccess = 1
					and s.ServerName = @_ServerName
					and u.IsActive = case
										when @_DoDropAllUsers = 1 then u.IsActive
										when @_DoDropInactiveUsers = 1 then 0
										else 99
									  end
				order by
					  u.Environment
					, u.LoginName

			begin try
				set @_CurrentRecordId = null ;
				set @_CurrentRecordId = 
					(
						select top 1
							u.RecordId
						from
							#Users as u
						inner join #Servers as s
							on s.Environment = u.Environment
						inner join sys.database_principals as dp
							on dp.name collate Latin1_General_BIN = u.LoginName collate Latin1_General_BIN
						where
								u.DropProcessed = 0
							and u.DoRevokeDatabaseAccess = 1
							and s.ServerName = @_ServerName
							and u.IsActive = case
												when @_DoDropAllUsers = 1 then u.IsActive
												when @_DoDropInactiveUsers = 1 then 0
												else 99
											  end
						order by
							  u.Environment
							, u.LoginName
					)

				while @_CurrentRecordId > 0
					begin
						set @_SqlCommand = 
							(
								select 'drop user [' + LoginName + '];' from #Users where RecordId = @_CurrentRecordId
							)
					
						raiserror('Running CMD: <<< %s >>>...', 0, 1, @_SqlCommand) with nowait ;

						exec (@_SqlCommand) ;

						--! Mark this row as processed
						update #Users set DropProcessed = 1 where RecordId = @_CurrentRecordId;

						--! Get the next row (if any)
						set @_CurrentRecordId = null ;
						set @_CurrentRecordId = 
							(
								select top 1
									u.RecordId
								from
									#Users as u
								inner join #Servers as s
									on s.Environment = u.Environment
								inner join sys.database_principals as dp
									on dp.name collate Latin1_General_BIN = u.LoginName collate Latin1_General_BIN
								where
										u.DropProcessed = 0
									and u.DoRevokeDatabaseAccess = 1
									and s.ServerName = @_ServerName
									and u.IsActive = case
														when @_DoDropAllUsers = 1 then u.IsActive
														when @_DoDropInactiveUsers = 1 then 0
														else 99
													  end
								order by
									  u.Environment
									, u.LoginName
							)
						end
			end try
			begin catch
				select error_number() as [ERROR_NUMBER], error_message() as [ERROR_MESSAGE];
				throw;
			end catch
		end
	else
		raiserror('[%s] step skipped as disabled', 0, 1, @_Step) ; 


--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--AddDatabaseUsers:
--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	set @_Step = 'Add Database Users' ;
	if @_DoAddDatabaseUsers = 1
		begin
			if @_Debug = 1
				select distinct
					  @_Step as [Step]
					, u.RecordId
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
					and u.AddProcessed = 0
					and s.ServerName = @_ServerName
					and s.Environment = @_CurrentEnvironment
					and u.IsActive = 1
					and u.DoGrantDatabaseAccess = 1
					and dp.principal_id is null

			begin try
				set @_CurrentRecordId = null ;
				set @_CurrentRecordId = 
					(
						select top 1
							u.RecordId
						from
							#Users as u
						inner join #Servers as s
							on s.Environment = u.Environment
						left join sys.database_principals as dp
							on dp.name collate Latin1_General_BIN = u.LoginName collate Latin1_General_BIN
						where
								u.AddProcessed = 0
							and s.ServerName = @_ServerName
							and u.IsActive = 1
							and u.DoGrantDatabaseAccess = 1
							and dp.principal_id is null
					)

				while @_CurrentRecordId > 0
					begin
						set @_SqlCommand = 
							(
								select
									  'create user [' + u.LoginName + ']'
									+ case
										when u.LoginName like '%@icopal.com'
											then ' from external provider'
										else ' for login [' + u.LoginName + ']'
									  end
									+ ' with default_schema = [' + u.DefaultSchema + '];'
								from
									#Users as u
								where
									RecordId = @_CurrentRecordId
							)
					
						raiserror('Running CMD: <<< %s >>>...', 0, 1, @_SqlCommand) with nowait ;

						exec (@_SqlCommand) ;

						--! Mark this row as processed
						update #Users set AddProcessed = 1 where RecordId = @_CurrentRecordId;

						--! Get the next row (if any)
						set @_CurrentRecordId = null ;
						set @_CurrentRecordId = 
							(
								select top 1
									u.RecordId
								from
									#Users as u
								inner join #Servers as s
									on s.Environment = u.Environment
								left join sys.database_principals as dp
									on dp.name collate Latin1_General_BIN = u.LoginName collate Latin1_General_BIN
								where
										u.AddProcessed = 0
									and s.ServerName = @_ServerName
									and u.IsActive = 1
									and u.DoGrantDatabaseAccess = 1
									and dp.principal_id is null
							)
					end

			end try
			begin catch
				select error_number() as [ERROR_NUMBER], error_message() as [ERROR_MESSAGE];
				throw;
			end catch

		end
	else
		raiserror('[%s] step skipped as disabled', 0, 1, @_Step) ; 


--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--AddRoleMembers:
--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	set @_Step = 'Add Role Members' ;
	if @_DoAddRoleMembers = 1
		begin
			if @_Debug = 1
				select
					  @_Step as [Step]
					, m.RecordId
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
						m.IsProcessed = 0
					and u.IsActive = 1
					and s.ServerName = @_ServerName
					and u.Environment = @_CurrentEnvironment
				order by
					  [LoginName]
					, [EffectiveRoleName]

			begin try
				set @_CurrentRecordId = null ;
				set @_CurrentRecordId = 
					(
						select top 1
							m.RecordId
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
								len(m.RoleName) > 0
							and m.IsProcessed = 0
							and u.IsActive = 1
							and s.ServerName = @_ServerName
							and u.Environment = @_CurrentEnvironment
						order by
							  m.RecordId
					)

				while @_CurrentRecordId > 0
					begin
						set @_DatabaseUserName = (select UserName from #RoleMembers where RecordId = @_CurrentRecordId)

						set @_DatabaseRoleName =
							(
								select
									m.RoleName + coalesce(nullif(s.Environment, 'ALL'), '')
								from
									#Users as u
								inner join #RoleMembers as m
									on m.UserName = u.LoginName
								inner join #Roles as r
									on r.RoleName = m.RoleName
								inner join #Servers as s
									on s.Environment = r.Environment
								where
										m.RecordId = @_CurrentRecordId
									and s.ServerName = @_ServerName
									and u.Environment = @_CurrentEnvironment
							)

						raiserror('Adding user %s to database role %s...', 0, 1, @_DatabaseUserName, @_DatabaseRoleName) with nowait ;

						exec sp_addrolemember @_DatabaseRoleName, @_DatabaseUserName ;

						--! Mark this row as processed
						update #RoleMembers set IsProcessed = 1 where RecordId = @_CurrentRecordId;

						----! Get the next row (if any)
						set @_CurrentRecordId = null ;
						set @_CurrentRecordId = 
							(
								select top 1
									m.RecordId
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
										len(m.RoleName) > 0
									and m.IsProcessed = 0
									and u.IsActive = 1
									and s.ServerName = @_ServerName
									and u.Environment = @_CurrentEnvironment
								order by
									  m.RecordId
							)
					end
			end try
			begin catch
				select error_number() as [ERROR_NUMBER], error_message() as [ERROR_MESSAGE];
				throw;
			end catch

		end
	else
		raiserror('[%s] step skipped as disabled', 0, 1, @_Step) ; 


--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--EndEx:
--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	raiserror('Successfully completed application of all user access and role membership', 0, 1) with nowait ;
end try
begin catch
	select error_number() as [ERROR_NUMBER], error_message() as [ERROR_MESSAGE];
	throw;
end catch
go

--!
--! Clean up
--!
if object_id(N'tempdb..#Servers') is not null drop table #Servers;
go
if object_id(N'tempdb..#Roles') is not null drop table #Roles;
go
if object_id(N'tempdb..#Users') is not null drop table #Users;
go
if object_id(N'tempdb..#RoleMembers') is not null drop table #RoleMembers;
go
