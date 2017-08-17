CREATE procedure [sqlcop].[test Wide Table]
as
begin
	-- Written by George Mastros
	-- February 25, 2012
	-- http://sqlcop.lessthandot.com
	-- http://wiki.lessthandot.com/index.php/SQLCop_wide_table_check
	
	set nocount on
	
	declare @Output varchar(max)
	set @Output = ''

	select  @Output = @Output + C.TABLE_SCHEMA + '.' + C.TABLE_NAME + char(13) + char(10)
	from    INFORMATION_SCHEMA.TABLES T
			inner join INFORMATION_SCHEMA.COLUMNS C
			  on  T.TABLE_NAME = C.TABLE_NAME
			  and T.TABLE_SCHEMA = C.TABLE_SCHEMA
			  and T.TABLE_TYPE = 'BASE TABLE'
			inner join systypes S
				on C.DATA_TYPE = S.name
	where  c.TABLE_SCHEMA  not in ('tsa','psa', 'tSQLt','stg')

	group by C.TABLE_SCHEMA,C.TABLE_NAME
	having sum(isnull(nullif(convert(bigint,S.length), 8000), 0) + isnull(nullif(C.CHARACTER_MAXIMUM_LENGTH, 2147483647), 0)) > 8060
	order by C.TABLE_SCHEMA,C.TABLE_NAME

	if @Output > '' 
		begin
			set @Output = char(13) + char(10) 
						  + 'For more information:  '
						  + 'http://wiki.lessthandot.com/index.php/SQLCop_wide_table_check' 
						  + char(13) + char(10) 
						  + char(13) + char(10) 
						  + @Output
			exec tSQLt.Fail @Output
		end	
end;