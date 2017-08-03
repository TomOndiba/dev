create   procedure [Ics-ModuleTests].[test BatchGetIdFromProcessName calls ExceptionHandler on error]
as
begin
	--! Assemble
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler';

	select
		  cast('Failed to get Batch for ICRT process: NULL at step: [Validate inputs] (Batch Id: NULL)' as varchar(max)) as [ErrorContext]
		, cast('[ics].[BatchGetIdFromProcessName]' as varchar(max)) as [ErrorProcedure]
	into
		#expected

	--! Act
	exec ics.BatchGetIdFromProcessName @IcrtProcessName = null

	--! Assert
	exec tSQLt.AssertEqualsTable '#expected', 'log4.ExceptionHandler_SpyProcedureLog';
end;