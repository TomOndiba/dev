IF OBJECT_ID('[Ics-ModuleTests].[test MappingConfigTaskGetId throws exception on @MappingName null]') IS NOT NULL
	DROP PROCEDURE [Ics-ModuleTests].[test MappingConfigTaskGetId throws exception on @MappingName null];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [Ics-ModuleTests].[test MappingConfigTaskGetId throws exception on @MappingName null]
as
begin
	exec tSQLt.ExpectException @ExpectedMessagePattern = '%Mapping Name input must not be null or empty%'
	
	exec ics.MappingConfigTaskGetId  @MappingConfigTaskName = 'A', @MappingName = null
end;
GO
