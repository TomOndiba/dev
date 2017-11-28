IF OBJECT_ID('[sqlcop].[test Tables without a primary key]') IS NOT NULL
	DROP PROCEDURE [sqlcop].[test Tables without a primary key];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [sqlcop].[test Tables without a primary key]
as
begin
	-- Written by George Mastros
	-- February 25, 2012
	-- http://sqlcop.lessthandot.com
	-- http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/best-practice-every-table-should-have-a
	
	set nocount on;
	
	declare	@Output varchar(max) = '';

	select
		@Output = @Output + s.name + '.' + t.name + char(13) + char(10)
	from
		sys.tables as t
	inner join sys.schemas as s
		on s.schema_id = t.schema_id
	left join sys.key_constraints as k -- unique constraint is acceptable too
		on t.object_id = k.parent_object_id
	where
			k.parent_object_id is null
		and s.name not in ('tSQLt', 'TestHelpers')
		and not (s.name = 'dbo' and t.name = '__SchemaSnapshot')
		and not (s.name = 'fred' and t.name like '%ginger%')
	order by
		s.name, t.name

	if @Output > ''
		begin
			set @Output = char(13) + char(10) + 'For more information:  ' + 'http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/best-practice-every-table-should-have-a' + char(13) + char(10) + char(13) + char(10) + @Output
			exec tSQLt.Fail
				@Output
		end	
end;
GO
