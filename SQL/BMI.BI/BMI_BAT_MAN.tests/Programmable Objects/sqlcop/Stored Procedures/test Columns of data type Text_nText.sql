IF OBJECT_ID('[sqlcop].[test Columns of data type Text/nText]') IS NOT NULL
	DROP PROCEDURE [sqlcop].[test Columns of data type Text/nText];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [sqlcop].[test Columns of data type Text/nText]
as
begin
	-- Written by George Mastros
	-- February 25, 2012
	-- http://sqlcop.lessthandot.com
	-- http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/don-t-use-text-datatype-for-sql-2005-and
	
	set nocount on
	
	declare @Output varchar(max)
	set @Output = ''

	select  @Output = @Output + schema_name(o.uid) + '.' + o.name + '.' + col.name + char(13) + char(10)
	from    syscolumns col         
			inner join sysobjects o
				on col.id = o.id         
			inner join systypes           
	 			on col.xtype = systypes.xtype 
	where   o.type = 'U'         
			and objectproperty(o.id, N'IsMSShipped') = 0         
			and systypes.name in ('text','ntext')
			and schema_name(o.uid) <> 'tSQLt'
	order by schema_name(o.uid),o.name, col.name
			
	if @Output > '' 
		begin
			set @Output = char(13) + char(10) 
						  + 'For more information:  '
						  + 'http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/don-t-use-text-datatype-for-sql-2005-and' 
						  + char(13) + char(10) 
						  + char(13) + char(10) 
						  + @Output
			exec tSQLt.Fail @Output
		end
end;
GO
