create   procedure [IcsApp-Tests].[test StartRun calls ExceptionHandler on ics.ProcessRunEnd error]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunEnd', @CommandToExecute = 'raiserror(''Oops!'', 16, 1);';
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler';

	select
		  cast('Failed to record end of run for ICRT Process: "A", ICRT Sub-Process: NULL and MCT Name: NULL at step: [End Process] with End State: [SUCCEEDED]' as varchar(max)) as [ErrorContext]
		, cast('[IcsApp].[StopRun]' as varchar(max)) as [ErrorProcedure]
	into
		#expected

	exec IcsApp.StopRun
		  @ProcessName = 'A'
		, @IcrtProcessId = 99
		, @EndState = 'SUCCEEDED'
		, @EndMessage = ''
		, @ProcessRunId = 11

	--! Assert
	exec tSQLt.AssertEqualsTable '#expected', 'log4.ExceptionHandler_SpyProcedureLog';
end;