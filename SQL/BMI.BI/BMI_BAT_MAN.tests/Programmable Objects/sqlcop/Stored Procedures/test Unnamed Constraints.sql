IF OBJECT_ID('[sqlcop].[test Unnamed Constraints]') IS NOT NULL
	DROP PROCEDURE [sqlcop].[test Unnamed Constraints];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [sqlcop].[test Unnamed Constraints]
as
begin
	-- Written by George Mastros
	-- February 25, 2012
	-- http://sqlcop.lessthandot.com
	-- http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/how-to-name-default-constraints-and-how-
	
	set nocount on
	
	declare @Output varchar(max)
	set @Output = ''

	select	@Output = @Output + CONSTRAINT_SCHEMA + '.' + CONSTRAINT_NAME + char(13) + char(10)
	from	INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE
	where	CONSTRAINT_NAME collate SQL_Latin1_General_CP1_CI_AI like '%[_][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]'
			and TABLE_NAME <> 'sysdiagrams'
			and CONSTRAINT_SCHEMA <> 'tSQLt'
	order by CONSTRAINT_SCHEMA,CONSTRAINT_NAME

	if @Output > '' 
		begin
			set @Output = char(13) + char(10) 
						  + 'For more information:  '
						  + 'http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/how-to-name-default-constraints-and-how-' 
						  + char(13) + char(10) 
						  + char(13) + char(10) 
						  + @Output
			exec tSQLt.Fail @Output
		end	  
end;
GO
