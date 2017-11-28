CREATE procedure [Ics-ModuleTests].[test IcrtSubProcessGetId calls ExceptionHandler on error]
as
begin
	--! Assemble
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler';

	select
		  cast('Failed to get Id for IcrtSubProcess: NULL and Batch Process Id: 1 at step: [Validate Inputs] (IcrtSubProcess Id: NULL)' as varchar(max)) as [ErrorContext]
		, cast('[ics].[IcrtSubProcessGetId]' as varchar(max)) as [ErrorProcedure]
	into
		#expected

	--! Act
	exec ics.IcrtSubProcessGetId @IcrtSubProcessName = null, @BatchProcessId = 1

	--! Assert
	exec tSQLt.AssertEqualsTable '#expected', 'log4.ExceptionHandler_SpyProcedureLog';
end;