create procedure [sqlcop].[test Views that start with vw]
as
begin
	set nocount on
	
	declare @Output varchar(max)
	set @Output = ''

    select	@Output = @Output + TABLE_SCHEMA + '.' + TABLE_NAME + char(13) + char(10)
    from	INFORMATION_SCHEMA.VIEWS
    where	TABLE_NAME collate SQL_Latin1_General_CP1_CI_AI like 'VW%'
			and TABLE_SCHEMA <> 'tSQLt'
    order by TABLE_SCHEMA,TABLE_NAME		

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