IF OBJECT_ID('[sqlcop].[test Fragmented Indexes]') IS NOT NULL
	DROP PROCEDURE [sqlcop].[test Fragmented Indexes];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [sqlcop].[test Fragmented Indexes]
as
begin
	-- Written by George Mastros
	-- February 25, 2012
	-- http://sqlcop.lessthandot.com
	-- http://wiki.lessthandot.com/index.php/Finding_Fragmentation_Of_An_Index_And_Fixing_It
	
	set nocount on
	
	declare @Output varchar(max)
	set @Output = ''

	create table #Result (ProblemItem varchar(1000))
	
	if exists(select cmptlevel from master.dbo.sysdatabases where dbid = db_id() and cmptlevel > 80)
		if exists(select 1 from fn_my_permissions(null, 'DATABASE') where permission_name = 'VIEW DATABASE STATE')
			begin
				insert into #Result(ProblemItem)
				exec('
						SELECT	OBJECT_NAME(OBJECT_ID) + ''.'' + s.name As ProblemItem
						FROM	sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL , NULL, N''LIMITED'') d
								join sysindexes s
									ON	d.OBJECT_ID = s.id
									and d.index_id = s.indid
						Where	avg_fragmentation_in_percent >= 30
								And OBJECT_NAME(OBJECT_ID) + ''.'' + s.name > ''''
								And page_count > 1000
								Order By Object_Name(OBJECT_ID), s.name')
			end
		else
			set @Output = 'You do not have VIEW DATABASE STATE permissions within this database'
		else
			set @Output = 'Unable to check index fragmentation when compatibility is set to 80 or below'
			  
	if @Output > '' 
		begin
			set @Output = char(13) + char(10) 
						  + 'For more information:  '
						  + 'http://wiki.lessthandot.com/index.php/Finding_Fragmentation_Of_An_Index_And_Fixing_It'
						  + char(13) + char(10) 
						  + char(13) + char(10) 
						  + @Output
			exec tSQLt.Fail @Output
		end	  
end;
GO
