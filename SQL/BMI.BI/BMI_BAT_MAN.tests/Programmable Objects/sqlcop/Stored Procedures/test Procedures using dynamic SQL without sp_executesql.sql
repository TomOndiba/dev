IF OBJECT_ID('[sqlcop].[test Procedures using dynamic SQL without sp_executesql]') IS NOT NULL
	DROP PROCEDURE [sqlcop].[test Procedures using dynamic SQL without sp_executesql];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [sqlcop].[test Procedures using dynamic SQL without sp_executesql]
as
begin
	-- Written by George Mastros
	-- February 25, 2012
	-- http://sqlcop.lessthandot.com
	-- http://blogs.lessthandot.com/index.php/DataMgmt/DataDesign/avoid-conversions-in-execution-plans-by-
	
	set nocount on
	
	declare @Output varchar(max)
	set @Output = ''

	select	@Output = @Output + schema_name(so.uid) + '.' + so.name + char(13) + char(10)
	from	sys.sql_modules sm
			inner join sys.sysobjects so
				on  sm.object_id = so.id
				and so.type = 'P'
	where	so.uid <> schema_id('tSQLt')
			and so.uid <> schema_id('SQLCop')
			and replace(sm.definition, ' ', '') collate SQL_Latin1_General_CP1_CI_AI like '%Exec(%'
			and replace(sm.definition, ' ', '') collate SQL_Latin1_General_CP1_CI_AI not like '%sp_Executesql%'
			and objectproperty(so.id, N'IsMSShipped') = 0
			-----------------------------------------------------------
			--! Don't care about this for unit tests
			and not exists
				(
					select 1 from sys.extended_properties as ep
					where ep.class_desc = 'SCHEMA'
					and ep.name = 'tSQLt.TestClass'
					and ep.value = 1
					and ep.[major_id] = schema_id(schema_name(so.uid))		
				)		
			-----------------------------------------------------------
	order by schema_name(so.uid),so.name

	if @Output > '' 
		begin
			set @Output = char(13) + char(10) 
						  + 'For more information:  '
						  + 'http://blogs.lessthandot.com/index.php/DataMgmt/DataDesign/avoid-conversions-in-execution-plans-by-'
						  + char(13) + char(10) 
						  + char(13) + char(10) 
						  + @Output
			exec tSQLt.Fail @Output
		end
end;
GO
