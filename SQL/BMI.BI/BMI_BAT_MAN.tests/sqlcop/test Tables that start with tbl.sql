create procedure [sqlcop].[test Tables that start with tbl]
as
begin
	-- Written by George Mastros
	-- February 25, 2012
	-- http://sqlcop.lessthandot.com
	-- http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/MSSQLServer/don-t-prefix-your-table-names-with-tbl
	
	set nocount on
	
	declare @Output varchar(max)
	set @Output = ''

    select	@Output = @Output + TABLE_SCHEMA + '.' + TABLE_NAME + char(13) + char(10)
    from	INFORMATION_SCHEMA.TABLES
    where	TABLE_TYPE = 'BASE TABLE'
			and TABLE_NAME collate SQL_Latin1_General_CP1_CI_AI like 'tbl%'
			and TABLE_SCHEMA <> 'tSQLt'
    order by TABLE_SCHEMA,TABLE_NAME		

	if @Output > '' 
		begin
			set @Output = char(13) + char(10) 
						  + 'For more information:  '
						  + 'http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/MSSQLServer/don-t-prefix-your-table-names-with-tbl' 
						  + char(13) + char(10) 
						  + char(13) + char(10) 
						  + @Output
			exec tSQLt.Fail @Output
		end  
end;