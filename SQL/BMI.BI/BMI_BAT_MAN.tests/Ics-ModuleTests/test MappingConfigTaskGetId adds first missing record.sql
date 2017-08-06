CREATE procedure [Ics-ModuleTests].[test MappingConfigTaskGetId adds first missing record]
as
begin
	--!
	--! NOTE: DO NOT fake the ics.MappingConfigTask table for this INSERT check
	--! so that if any new NOT NULL colunns are added in the future but not
	--! catered for by default constraint or changes in ics.MappingConfigTaskGetId
	--! then this test will fail
	--! But do make sure the target table (and any dependants) are empty or null
	--!
	update privy.Thread set MappingConfigTaskId = null where MappingConfigTaskId is not null;
	delete ics.MappingConfigTask where 1 = 1;

	declare @_MappingConfigTaskId int = 1, @_MappingName varchar(100) = 'A', @_MappingConfigTaskName varchar(100) = 'B' ;

	select @_MappingConfigTaskId as [MappingConfigTaskId], @_MappingName as [MappingName], @_MappingConfigTaskName as [MappingConfigTaskName] into #expected ;

	--! Act
	exec ics.MappingConfigTaskGetId
		  @MappingConfigTaskName = @_MappingConfigTaskName
		, @MappingName = @_MappingName

	--! Assert
	exec tSQLt.AssertEqualsTable '#expected', 'ics.MappingConfigTask';
end;