IF OBJECT_ID('[Ics-ModuleTests].[test MappingConfigTaskGetId adds subsequent missing record]') IS NOT NULL
	DROP PROCEDURE [Ics-ModuleTests].[test MappingConfigTaskGetId adds subsequent missing record];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [Ics-ModuleTests].[test MappingConfigTaskGetId adds subsequent missing record]
as
begin
	--! Assemble
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler' ;
	exec tSQLt.FakeTable @TableName = N'ics.MappingConfigTask' ;

	declare @_MappingConfigTaskId_A int = 3, @_MappingName_A varchar(100) = 'A', @_MappingConfigTaskName_A varchar(100) = 'B' ;
	declare @_MappingConfigTaskId_B int = 4, @_MappingName_B varchar(100) = 'C', @_MappingConfigTaskName_B varchar(100) = 'D' ;

	insert ics.MappingConfigTask (MappingConfigTaskId, MappingName, MappingConfigTaskName) values (@_MappingConfigTaskId_A, @_MappingName_A, @_MappingConfigTaskName_A) ;

	; with sourceCte (MappingConfigTaskId, MappingName, MappingConfigTaskName)
	as
	(
				  select @_MappingConfigTaskId_A, @_MappingName_A, @_MappingConfigTaskName_A
		union all select @_MappingConfigTaskId_B, @_MappingName_B, @_MappingConfigTaskName_B
	)
	select * into #expected from sourceCte;

	--! Act
	exec ics.MappingConfigTaskGetId
		  @MappingConfigTaskName = @_MappingConfigTaskName_B
		, @MappingName = @_MappingName_B

	--! Assert
	exec tSQLt.AssertEqualsTable '#expected', 'ics.MappingConfigTask';
end;
GO
