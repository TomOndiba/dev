create   procedure [IcsApp-Tests].[test MappingConfigTaskGetCurrentRunIds throws error on @MappingConfigTaskName null]
as
begin
	exec tSQLt.ExpectException @ExpectedMessagePattern = '%Mapping Config Task Name must not be null or empty%'

	exec IcsApp.MappingConfigTaskGetCurrentRunIds @MappingConfigTaskName = null
end;