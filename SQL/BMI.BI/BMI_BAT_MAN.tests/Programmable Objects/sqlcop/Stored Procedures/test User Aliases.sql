create procedure [sqlcop].[test User Aliases]
as
begin
	-- Written by George Mastros
	-- February 25, 2012
	-- http://sqlcop.lessthandot.com
	-- http://www.mssqltips.com/tip.asp?tip=1675
	
	set nocount on
	
	declare @Output varchar(max)
    set @Output = ''

    select @Output = @Output + name + char(13) + char(10)
    from   sysusers 
    where  isaliased = 1 
    order by name
        
	if @Output > '' 
		begin
			set @Output = char(13) + char(10) 
						  + 'For more information:  '
						  + 'http://www.mssqltips.com/tip.asp?tip=1675'
						  + char(13) + char(10) 
						  + char(13) + char(10) 
						  + @Output
			exec tSQLt.Fail @Output
		end 
end;