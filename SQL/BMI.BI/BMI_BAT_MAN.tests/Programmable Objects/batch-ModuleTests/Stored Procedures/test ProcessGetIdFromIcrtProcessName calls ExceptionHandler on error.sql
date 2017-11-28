IF OBJECT_ID('[batch-ModuleTests].[test ProcessGetIdFromIcrtProcessName calls ExceptionHandler on error]') IS NOT NULL
	DROP PROCEDURE [batch-ModuleTests].[test ProcessGetIdFromIcrtProcessName calls ExceptionHandler on error];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [batch-ModuleTests].[test ProcessGetIdFromIcrtProcessName calls ExceptionHandler on error]
as
begin
	--! Assemble
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler';

	select
		  cast('Failed to get Batch Process Id for ICRT process: NULL at step: [Validate Inputs] (Process Id: NULL)' as varchar(max)) as [ErrorContext]
		, cast('[batch].[ProcessGetIdFromIcrtProcessName]' as varchar(max)) as [ErrorProcedure]
	into
		#expected

	--! Act
	exec batch.ProcessGetIdFromIcrtProcessName @IcrtProcessName = null

	--! Assert
		exec tSQLt.AssertEqualsTable '#expected', 'log4.ExceptionHandler_SpyProcedureLog';
end;
GO
