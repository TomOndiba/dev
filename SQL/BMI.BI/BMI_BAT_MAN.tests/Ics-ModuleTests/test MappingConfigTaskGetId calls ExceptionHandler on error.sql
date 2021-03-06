﻿CREATE   procedure [Ics-ModuleTests].[test MappingConfigTaskGetId calls ExceptionHandler on error]
as
begin
	--! Assemble
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler';

	select
		  cast('Failed to get Id for MappingConfigTask: NULL and Mapping: "B" at step: [Validate Inputs] (MappingConfigTask Id: NULL)' as varchar(max)) as [ErrorContext]
		, cast('[ics].[MappingConfigTaskGetId]' as varchar(max)) as [ErrorProcedure]
	into
		#expected

	--! Act
	exec ics.MappingConfigTaskGetId @MappingConfigTaskName = null, @MappingName = 'B'

	--! Assert
	exec tSQLt.AssertEqualsTable '#expected', 'log4.ExceptionHandler_SpyProcedureLog';
end;