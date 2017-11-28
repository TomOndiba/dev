create   procedure [Ics-ModuleTests].[test MappingConfigTaskGetId throws exception on @MappingConfigTaskName null]
as
begin
	exec tSQLt.ExpectException @ExpectedMessagePattern = '%Mapping Config Task Name input must not be null or empty%'
	
	exec ics.MappingConfigTaskGetId  @MappingConfigTaskName = null, @MappingName = 'B'
end;