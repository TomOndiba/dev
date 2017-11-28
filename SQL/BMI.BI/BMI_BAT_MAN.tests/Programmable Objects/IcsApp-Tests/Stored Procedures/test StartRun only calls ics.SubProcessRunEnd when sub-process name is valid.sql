create   procedure [IcsApp-Tests].[test StartRun only calls ics.SubProcessRunEnd when sub-process name is valid]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunEnd' ;

	exec IcsApp.StopRun
		  @ProcessName = 'A'
		, @IcrtProcessId = 99
		, @EndState = 'SUCCEEDED'
		, @EndMessage = ''
		, @ProcessRunId = 11
		, @SubProcessName = 'B'
		, @SubProcessRunId = 22
		, @MappingConfigTaskName = null
		, @MappingName = null
		, @ThreadRunId = null
		, @SuccessSourceRows = null
		, @FailedSourceRows = null
		, @SuccessTargetRows = null
		, @FailedTargetRows = null

	exec tSQLt.AssertEmptyTable 'ics.ProcessRunEnd_SpyProcedureLog' ;
	exec tSQLt.AssertEmptyTable 'ics.ThreadRunEnd_SpyProcedureLog' ;
end;