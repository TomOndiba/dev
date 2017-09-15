CREATE procedure [sqlcop].[test Columns with float data type]
as
begin
	-- Written by George Mastros
	-- February 25, 2012
	-- http://sqlcop.lessthandot.com
	-- http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/do-not-use-the-float-data-type
	
	set nocount on
	
	declare @Output varchar(max)
	set @Output = ''
			
	select 	@Output = @Output + TABLE_SCHEMA + '.' + TABLE_NAME + '.' + COLUMN_NAME + char(13) + char(10)
	from	INFORMATION_SCHEMA.COLUMNS
	where	DATA_TYPE in ('float', 'real')
	and TABLE_SCHEMA  not in ('tsa','psa', 'tSQLt','stg')
	order by TABLE_SCHEMA,TABLE_NAME,COLUMN_NAME

	if @Output > '' 
		begin
			set @Output = char(13) + char(10) 
						  + 'For more information:  '
						  + 'http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/do-not-use-the-float-data-type' 
						  + char(13) + char(10) 
						  + char(13) + char(10) 
						  + @Output
			exec tSQLt.Fail @Output
		end
end;