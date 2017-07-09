CREATE procedure [sqlcop].[test Ad hoc distributed queries]
as
begin
	-- Written by George Mastros
	-- February 25, 2012
	-- http://sqlcop.lessthandot.com
	-- http://wiki.lessthandot.com/index.php/SQLCop_informational_checks#Ad_Hoc_Distributed_Queries
	
	set nocount on
	
	declare @Output varchar(max)
	set @Output = ''

    select	@Output = 'Status: Ad Hoc Distributed Queries are enabled'
    from	sys.configurations
    where	name = 'Ad Hoc Distributed Queries'
			and value_in_use = 1
           
	if @Output > '' 
		begin
			set @Output = char(13) + char(10) 
						  + 'For more information:  '
						  + 'http://wiki.lessthandot.com/index.php/SQLCop_informational_checks#Ad_Hoc_Distributed_Queries'
						  + char(13) + char(10) 
						  + char(13) + char(10) 
						  + @Output
			exec tSQLt.Fail @Output
		end
end;