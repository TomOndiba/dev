IF OBJECT_ID('[sqlcop].[test Procedures with @@Identity]') IS NOT NULL
	DROP PROCEDURE [sqlcop].[test Procedures with @@Identity];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [sqlcop].[test Procedures with @@Identity]
as
begin
	-- Written by George Mastros
	-- February 25, 2012
	-- http://sqlcop.lessthandot.com
	-- http://wiki.lessthandot.com/index.php/6_Different_Ways_To_Get_The_Current_Identity_Value
	
	set nocount on

	declare @Output varchar(max)
	set @Output = ''

	select	@Output = @Output + schema_name(schema_id) + '.' + name + char(13) + char(10)
	from	sys.all_objects
	where	type = 'P'
			and name not in('sp_helpdiagrams','sp_upgraddiagrams','sp_creatediagram','testProcedures with @@Identity')
			and object_definition(object_id) collate SQL_Latin1_General_CP1_CI_AI like '%@@identity%'
			and is_ms_shipped = 0
			and schema_id <> schema_id('tSQLt')
			and schema_id <> schema_id('sqlcop')
	order by schema_name(schema_id), name 

	if @Output > '' 
		begin
			set @Output = char(13) + char(10) 
						  + 'For more information:  '
						  + 'http://wiki.lessthandot.com/index.php/6_Different_Ways_To_Get_The_Current_Identity_Value'
						  + char(13) + char(10) 
						  + char(13) + char(10) 
						  + @Output
			exec tSQLt.Fail @Output
		end
end;
GO
