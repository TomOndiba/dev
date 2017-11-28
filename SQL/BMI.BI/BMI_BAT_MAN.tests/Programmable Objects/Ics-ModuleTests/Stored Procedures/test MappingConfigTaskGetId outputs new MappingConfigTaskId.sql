IF OBJECT_ID('[Ics-ModuleTests].[test MappingConfigTaskGetId outputs new MappingConfigTaskId]') IS NOT NULL
	DROP PROCEDURE [Ics-ModuleTests].[test MappingConfigTaskGetId outputs new MappingConfigTaskId];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [Ics-ModuleTests].[test MappingConfigTaskGetId outputs new MappingConfigTaskId]
as
begin
	--! Assemble
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;
	exec tSQLt.FakeTable @TableName = N'ics.MappingConfigTask' ;

	insert ics.MappingConfigTask (MappingConfigTaskId, MappingName, MappingConfigTaskName) values (3, 'A', 'B') ;

	--! Act
	declare @_actual int = 4;
	exec ics.MappingConfigTaskGetId
		  @MappingConfigTaskName = 'C'
		, @MappingName = 'D'
		, @MappingConfigTaskId = @_actual out

	--! Assert
	exec tSQLt.AssertEquals 4, @_actual ;
end;
GO
