create   procedure [Ics-ModuleTests].[test MappingConfigTaskGetId adds first missing record]
as
begin
	--! Assemble
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;
	exec tSQLt.FakeTable @TableName = N'ics.MappingConfigTask' ;

	declare @_MappingConfigTaskId int = 1, @_MappingName varchar(100) = 'A', @_MappingConfigTaskName varchar(100) = 'B' ;

	select @_MappingConfigTaskId as [MappingConfigTaskId], @_MappingName as [MappingName], @_MappingConfigTaskName as [MappingConfigTaskName] into #expected ;

	--! Act
	exec ics.MappingConfigTaskGetId
		  @MappingConfigTaskName = @_MappingConfigTaskName
		, @MappingName = @_MappingName

	--! Assert
	exec tSQLt.AssertEqualsTable '#expected', 'ics.MappingConfigTask';
end;