IF OBJECT_ID('[sqlcop].[test Orphaned Users]') IS NOT NULL
	DROP PROCEDURE [sqlcop].[test Orphaned Users];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [sqlcop].[test Orphaned Users]
as
begin
	-- Written by George Mastros
	-- February 25, 2012
	-- http://sqlcop.lessthandot.com
	-- http://wiki.lessthandot.com/index.php/Fix_Orphaned_Database_Users
	
	set nocount on;

	--!
	--!
	--!
	if left(@@version, 19) = 'Microsoft SQL Azure'
		begin
			raiserror('[SQLCop].[test Orphaned Users] not supported on Microsoft SQL Azure', 0, 1) with nowait;
		end
	else
		begin
			declare	@Output varchar(max) = '';

			if is_rolemember('db_owner') = 1
				begin
					declare	@Temp table
					(
					  UserName sysname
					, UserSid varbinary(85)
					);

					insert into @Temp exec sys.sp_change_users_login 'report';

					select
						@Output = @Output + UserName + char(13) + char(10)
					from
						@Temp
					order by
						UserName;
				end;
			else
				set @Output = 'Only members of db_owner can perform this check.';
                   
			if @Output > ''
				begin
					set @Output = char(13) + char(10) + 'For more information:  ' + 'http://wiki.lessthandot.com/index.php/Fix_Orphaned_Database_Users' + char(13) + char(10) + char(13) + char(10) + @Output;
					exec tSQLt.Fail @Output;
				end;  
		end
end;
GO
