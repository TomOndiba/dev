IF OBJECT_ID('[Ics-ModuleTests].[test MappingConfigTaskGetId throws error after handling exception]') IS NOT NULL
	DROP PROCEDURE [Ics-ModuleTests].[test MappingConfigTaskGetId throws error after handling exception];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [Ics-ModuleTests].[test MappingConfigTaskGetId throws error after handling exception]
as
begin
	--! Assemble
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler', @CommandToExecute = N'set @ErrorNumber = 999';

	--! Assert
	exec tSQLt.ExpectException @ExpectedErrorNumber = 50000 ;

	--! Act
	exec ics.MappingConfigTaskGetId @MappingConfigTaskName = null, @MappingName = 'B'
end;
GO
