create procedure [sqlcop].[test Procedures using xp_cmdshell]
as
begin
	set nocount on

	declare @Output varchar(max)
	set @Output = ''

	select	@Output = @Output + schema_name([schema_id]) + '.' + name + char(13) + char(10)
	from	sys.all_objects
	where	type = 'P'
			and name not in ('test Procedures using xp_cmdshell')
			and object_definition(object_id) collate SQL_Latin1_General_CP1_CI_AI like '%xp_cmdshell%'
			and is_ms_shipped = 0
			and schema_id <> schema_id('tSQLt')
			and schema_id <> schema_id('sqlcop')
	order by schema_name(schema_id), name 

	if @Output > '' 
		begin
			set @Output = char(13) + char(10) 
						  + 'For more information:  '
						  + char(13) + char(10) 
						  + char(13) + char(10) 
						  + @Output
			exec tSQLt.Fail @Output
		end
end;