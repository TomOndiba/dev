CREATE procedure [sqlcop].[test Column data types (Numeric vs. Int)]
as
begin
	-- Written by George Mastros
	-- February 25, 2012
	-- http://sqlcop.lessthandot.com
	-- http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/always-include-precision-and-scale-with
	
	set nocount on
	
	declare @Output varchar(max)
	set @Output = ''

	select	@Output = @Output + ProblemItem + char(13) + char(10)
	from	(
			select	TABLE_SCHEMA + '.' + TABLE_NAME + '.' + COLUMN_NAME as ProblemItem
            from	INFORMATION_SCHEMA.COLUMNS C
            where	C.DATA_TYPE in ('numeric','decimal') 
					and NUMERIC_SCALE = 0 
					and NUMERIC_PRECISION <= 18
					and TABLE_SCHEMA  not in ('tsa','psa', 'tSQLt','stg', 'discovery')
			) as Problems
	order by ProblemItem

	if @Output > '' 
		begin
			set @Output = char(13) + char(10) 
						  + 'For more information:  '
						  + 'http://blogs.lessthandot.com/index.php/DataMgmt/DataDesign/sql-server-types-numeric-vs-int' 
						  + char(13) + char(10) 
						  + char(13) + char(10) 
						  + @Output
			exec tSQLt.Fail @Output
		end
end;