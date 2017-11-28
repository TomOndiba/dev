IF OBJECT_ID('[sqlcop].[test Varchar Size Problem]') IS NOT NULL
	DROP PROCEDURE [sqlcop].[test Varchar Size Problem];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [sqlcop].[test Varchar Size Problem]
as
begin
	-- Written by George Mastros
	-- February 25, 2012
	-- http://sqlcop.lessthandot.com
	-- http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/MSSQLServer/always-include-size-when-using-varchar-n
	
	set nocount on
	
	declare @Output varchar(max)
	set @Output = ''

	select	@Output = @Output + ProblemItem + char(13) + char(10)
	from	(
			select	distinct su.name + '.' + so.name as ProblemItem
			from	syscomments sc
					inner join sysobjects so
						on  sc.id = so.id
						and so.xtype = 'P'
					inner join sys.schemas su
						on so.uid = su.schema_id
			where	replace(replace(sc.text, ' ', ''), 'varchar]','varchar') collate SQL_Latin1_General_CP1_CI_AI like '%varchar[^(]%'
					and objectproperty(sc.id, N'IsMSSHIPPED') = 0
					and su.schema_id <> schema_id('tSQLt')
					and su.schema_id <> schema_id('sqlcop')
			--! Never check this for any unit tests
			and not exists
				(
					select 1 from sys.extended_properties as ep
					where ep.class_desc = 'SCHEMA'
					and ep.name = 'tSQLt.TestClass'
					and ep.value = 1
					and ep.[major_id] = su.[schema_id]			
				)		
			) as Problems
	order by ProblemItem

	if @Output > '' 
		begin
			set @Output = char(13) + char(10) 
						  + 'For more information:  '
						  + 'http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/MSSQLServer/always-include-size-when-using-varchar-n' 
						  + char(13) + char(10) 
						  + char(13) + char(10) 
						  + @Output
			exec tSQLt.Fail @Output
		end
end;
GO
