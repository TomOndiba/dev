CREATE procedure [sqlcop].[test Column Name Problems]
as
begin
	-- Written by George Mastros
	-- February 25, 2012
	-- http://sqlcop.lessthandot.com
	-- http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/do-not-use-spaces-or-other-invalid-chara
	
	set nocount on
	
	declare @Output varchar(max)
	set @Output = ''
			
	select 	@Output = @Output + TABLE_SCHEMA + '.' + TABLE_NAME + '.' + COLUMN_NAME + char(13) + char(10)
	from	INFORMATION_SCHEMA.COLUMNS
	where	COLUMN_NAME collate SQL_Latin1_General_CP1_CI_AI like '%[^a-z0-9_$]%'
			and TABLE_SCHEMA not in ('tSQLt', 'TestHelpers', 'stg', 'tsa','psa','discovery')
	order by TABLE_SCHEMA,TABLE_NAME,COLUMN_NAME

	if @Output > '' 
		begin
			set @Output = char(13) + char(10) 
						  + 'For more information:  '
						  + 'http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/do-not-use-spaces-or-other-invalid-chara' 
						  + char(13) + char(10) 
						  + char(13) + char(10) 
						  + @Output
			exec tSQLt.Fail @Output
		end
end;