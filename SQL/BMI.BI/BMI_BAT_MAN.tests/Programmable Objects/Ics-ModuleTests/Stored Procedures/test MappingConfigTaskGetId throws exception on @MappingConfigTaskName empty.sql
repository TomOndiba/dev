IF OBJECT_ID('[Ics-ModuleTests].[test MappingConfigTaskGetId throws exception on @MappingConfigTaskName empty]') IS NOT NULL
	DROP PROCEDURE [Ics-ModuleTests].[test MappingConfigTaskGetId throws exception on @MappingConfigTaskName empty];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [Ics-ModuleTests].[test MappingConfigTaskGetId throws exception on @MappingConfigTaskName empty]
as
begin
	exec tSQLt.ExpectException @ExpectedMessagePattern = '%Mapping Config Task Name input must not be null or empty%'
	
	exec ics.MappingConfigTaskGetId @MappingConfigTaskName = '', @MappingName = 'B'
end;
GO
