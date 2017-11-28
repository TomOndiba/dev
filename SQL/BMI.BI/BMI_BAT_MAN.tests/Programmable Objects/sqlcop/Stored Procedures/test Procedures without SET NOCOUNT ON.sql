create procedure [sqlcop].[test Procedures without SET NOCOUNT ON]
as
begin
	-- Written by George Mastros
	-- February 25, 2012
	-- http://sqlcop.lessthandot.com
	-- http://wiki.lessthandot.com/index.php/Optimization:_Set_Nocount_On
	
	set nocount on

	declare @Output varchar(max)
	set @Output = ''
  
	select	@Output = @Output + schema_name(ao.[schema_id]) + '.' + ao.name + char(13) + char(10)
	from	sys.all_objects as ao
	where	ao.type = 'P'
			and ao.name not in('sp_helpdiagrams','sp_upgraddiagrams','sp_creatediagram','testProcedures without SET NOCOUNT ON')
			and object_definition(ao.object_id) collate SQL_Latin1_General_CP1_CI_AI not like '%SET NOCOUNT ON%'
			and ao.is_ms_shipped = 0
			and ao.[schema_id] <> schema_id('tSQLt')
			and ao.[schema_id] <> schema_id('sqlcop')
			--! Don't care about this setting for unit tests
			and not exists
				(
					select 1 from sys.extended_properties as ep
					where ep.class_desc = 'SCHEMA'
					and ep.name = 'tSQLt.TestClass'
					and ep.value = 1
					and ep.[major_id] = ao.[schema_id]			
				)		
	order by schema_name(ao.[schema_id]) + '.' + ao.name

	if @Output > '' 
		begin
			set @Output = char(13) + char(10) 
						  + 'For more information:  '
						  + 'http://wiki.lessthandot.com/index.php/Optimization:_Set_Nocount_On'
						  + char(13) + char(10) 
						  + char(13) + char(10) 
						  + @Output
			exec tSQLt.Fail @Output
		end
end;