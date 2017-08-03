create   procedure [sqlcop].[test Decimal Size Problem]
as
begin
    -- Written by George Mastros
    -- February 25, 2012
    -- http://sqlcop.lessthandot.com
    -- http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/always-include-precision-and-scale-with
    
    set nocount on  

    declare @Output varchar(max)
    set @Output = ''
  
    select @Output = @Output + schema_name(schema_id) + '.' + name + char(13) + char(10)
    from	sys.objects as o
    where	schema_id <> schema_id('sqlcop')
            and schema_id <> schema_id('tSQLt')
            and (
            replace(replace(object_definition(object_id), ' ', ''), 'decimal]','decimal') collate SQL_Latin1_General_CP1_CI_AI like '%decimal[^(]%'
            or replace(replace(object_definition(object_id), ' ', ''), 'numeric]','numeric') collate SQL_Latin1_General_CP1_CI_AI like '%[^i][^s]numeric[^(]%'
            )
			and name not like '%%'
			-----------------------------------------------------------
			--! Don't care about this for unit tests
			and not exists
				(
					select 1 from sys.extended_properties as ep
					where ep.class_desc = 'SCHEMA'
					and ep.name = 'tSQLt.TestClass'
					and ep.value = 1
					and ep.[major_id] = o.[schema_id]			
				)		
			-----------------------------------------------------------
    order by schema_name(schema_id), name  

    if @Output > '' 
        begin
            set @Output = char(13) + char(10) 
                          + 'For more information:  '
                          + 'http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/always-include-precision-and-scale-with'
                          + char(13) + char(10) 
                          + char(13) + char(10) 
                          + @Output
            exec tSQLt.Fail @Output
        end  
end;