IF OBJECT_ID('[sqlcop].[test Forwarded Records]') IS NOT NULL
	DROP PROCEDURE [sqlcop].[test Forwarded Records];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [sqlcop].[test Forwarded Records]
as
begin
	-- Written by George Mastros
	-- February 25, 2012
	-- http://sqlcop.lessthandot.com
	-- http://wiki.lessthandot.com/index.php/Finding_Forwarded_Records_SQL_Server_2008
	
	set nocount on
	
	declare @Output varchar(max)
	set @Output = ''

    if exists(select cmptlevel from master.dbo.sysdatabases where dbid = db_id() and cmptlevel > 80)
		begin
			create table #Results(ProblemItem varchar(1000))
			
			insert into #Results(ProblemItem)
			exec ('	SELECT	SCHEMA_NAME(O.Schema_Id) + ''.'' + O.name As ProblemItem
					FROM	sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL, ''DETAILED'') AS ps
							INNER JOIN sys.indexes AS i      
								ON ps.OBJECT_ID = i.OBJECT_ID
								AND ps.index_id = i.index_id
							INNER JOIN sys.objects as O
								On i.OBJECT_ID = O.OBJECT_ID
					WHERE  ps.forwarded_record_count > 0
					Order By SCHEMA_NAME(O.Schema_Id),O.name')
			
			if exists(select 1 from #Results)
				select	@Output = @Output + ProblemItem + char(13) + char(10)
				from	#Results
			
		end
    else
      set @Output = 'Unable to check index forwarded records when compatibility is set to 80 or below'

	if @Output > '' 
		begin
			set @Output = char(13) + char(10) 
						  + 'For more information:  '
						  + 'http://wiki.lessthandot.com/index.php/Finding_Forwarded_Records_SQL_Server_2008'
						  + char(13) + char(10) 
						  + char(13) + char(10) 
						  + @Output
			exec tSQLt.Fail @Output
		end	  
  
end;
GO
