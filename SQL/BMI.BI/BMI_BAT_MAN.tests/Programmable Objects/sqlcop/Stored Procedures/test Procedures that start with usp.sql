create procedure [sqlcop].[test Procedures that start with usp]
as
begin
    set nocount on
    
    declare @Output varchar(max)
    set @Output = ''
  
    select	@Output = @Output + SPECIFIC_SCHEMA + '.' + SPECIFIC_NAME + char(13) + char(10)
    from	INFORMATION_SCHEMA.ROUTINES
    where	SPECIFIC_NAME collate SQL_Latin1_General_CP1_CI_AI like 'usp%'
            and SPECIFIC_NAME collate SQL_Latin1_General_CP1_CI_AI not like '%diagram%'
            and ROUTINE_SCHEMA <> 'tSQLt'
    order by SPECIFIC_SCHEMA,SPECIFIC_NAME

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