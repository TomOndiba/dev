create   procedure [Ics-ModuleTests].[test MappingConfigTaskGetId throws exception on @MappingName empty]
as
begin
	exec tSQLt.ExpectException @ExpectedMessagePattern = '%Mapping Name input must not be null or empty%'
	
	exec ics.MappingConfigTaskGetId @MappingConfigTaskName = 'A', @MappingName = ''
end;