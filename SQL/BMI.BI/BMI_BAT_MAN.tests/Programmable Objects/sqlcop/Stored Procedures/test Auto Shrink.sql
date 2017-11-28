IF OBJECT_ID('[sqlcop].[test Auto Shrink]') IS NOT NULL
	DROP PROCEDURE [sqlcop].[test Auto Shrink];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [sqlcop].[test Auto Shrink]
as
begin
	-- Written by George Mastros
	-- February 25, 2012
	-- http://sqlcop.lessthandot.com
	-- http://www.sqlskills.com/blogs/paul/post/Auto-shrink-e28093-turn-it-OFF!.aspx
	
	set nocount on
	
	declare @Output varchar(max)
	set @Output = ''

    select @Output = @Output + 'Database set to Auto Shrink' + char(13) + char(10)
    where  DatabaseProperty(db_name(), 'IsAutoShrink') = 1
    
	if @Output > '' 
		begin
			set @Output = char(13) + char(10) 
						  + 'For more information:  '
						  + 'http://www.sqlskills.com/blogs/paul/post/Auto-shrink-e28093-turn-it-OFF!.aspx'
						  + char(13) + char(10) 
						  + char(13) + char(10) 
						  + @Output
			exec tSQLt.Fail @Output
		end
end;
GO
