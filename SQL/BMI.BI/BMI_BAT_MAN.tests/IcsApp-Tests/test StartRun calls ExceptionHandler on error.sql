CREATE   procedure [IcsApp-Tests].[test StartRun calls ExceptionHandler on error]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler';

	select
		  cast('Failed to record start of run for ICRT Process: "A", ICRT Sub-Process: "B" and MCT Name: NULL at step: [Validate Inputs]' as varchar(max)) as [ErrorContext]
		, cast('[IcsApp].[StartRun]' as varchar(max)) as [ErrorProcedure]
	into
		#expected

	--! Act
	exec IcsApp.StartRun
		@ProcessName = 'A'
	  , @IcrtProcessId = null
	  , @ProcessRunId = 11
	  , @SubProcessName = 'B'
	  , @SubProcessRunId = 22

	--! Assert
	exec tSQLt.AssertEqualsTable '#expected', 'log4.ExceptionHandler_SpyProcedureLog';
end;