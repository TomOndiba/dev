CREATE procedure [batch-ModuleTests].[test ProcessGetIdFromIcrtProcessName calls ExceptionHandler on error]
as
begin
	--! Assemble
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler';

	select
		  cast('Failed to get Batch Process Id for ICRT process: NULL at step: [Validate inputs] (Process Id: NULL)' as varchar(max)) as [ErrorContext]
		, cast('[batch].[ProcessGetIdFromIcrtProcessName]' as varchar(max)) as [ErrorProcedure]
	into
		#expected

	--! Act
	exec batch.ProcessGetIdFromIcrtProcessName @IcrtProcessName = null

	--! Assert
	exec tSQLt.AssertEqualsTable '#expected', 'log4.ExceptionHandler_SpyProcedureLog';
end;