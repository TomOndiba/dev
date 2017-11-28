IF OBJECT_ID('[sqlcop].[test Table name problems]') IS NOT NULL
	DROP PROCEDURE [sqlcop].[test Table name problems];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [sqlcop].[test Table name problems]
as
begin
	-- Written by George Mastros
	-- February 25, 2012
	-- http://sqlcop.lessthandot.com
	-- http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/do-not-use-spaces-or-other-invalid-chara
	
	set nocount on
	
	declare @Output varchar(max)
    declare @AcceptableSymbols varchar(100)

    set @AcceptableSymbols = '_$'
	set @Output = ''

	select  @Output = @Output + TABLE_SCHEMA + '.' + TABLE_NAME + char(13) + char(10)
    from    INFORMATION_SCHEMA.TABLES
    where   TABLE_NAME collate SQL_Latin1_General_CP1_CI_AI like '%[^a-z' + @AcceptableSymbols + ']%'
			and TABLE_SCHEMA not in ('tSQLt', 'TestHelpers', 'stg')
			and not (TABLE_SCHEMA = 'fred' and TABLE_NAME = 'Ginger_Deprecated20160415')
	order by TABLE_SCHEMA,TABLE_NAME

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
GO
