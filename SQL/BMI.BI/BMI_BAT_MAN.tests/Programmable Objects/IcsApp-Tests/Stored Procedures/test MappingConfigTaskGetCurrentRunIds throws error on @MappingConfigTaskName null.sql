IF OBJECT_ID('[IcsApp-Tests].[test MappingConfigTaskGetCurrentRunIds throws error on @MappingConfigTaskName null]') IS NOT NULL
	DROP PROCEDURE [IcsApp-Tests].[test MappingConfigTaskGetCurrentRunIds throws error on @MappingConfigTaskName null];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [IcsApp-Tests].[test MappingConfigTaskGetCurrentRunIds throws error on @MappingConfigTaskName null]
as
begin
	exec tSQLt.ExpectException @ExpectedMessagePattern = '%Mapping Config Task Name must not be null or empty%'

	exec IcsApp.MappingConfigTaskGetCurrentRunIds @MappingConfigTaskName = null
end;
GO
