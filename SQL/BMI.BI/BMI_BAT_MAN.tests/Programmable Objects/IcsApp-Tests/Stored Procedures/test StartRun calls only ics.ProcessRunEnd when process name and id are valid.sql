create   procedure [IcsApp-Tests].[test StartRun calls only ics.ProcessRunEnd when process name and id are valid]
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
		, @SubProcessName = null
		, @SubProcessRunId = null
		, @MappingConfigTaskName = null
		, @MappingName = null
		, @ThreadRunId = null
		, @SuccessSourceRows = null
		, @FailedSourceRows = null
		, @SuccessTargetRows = null
		, @FailedTargetRows = null

	exec tSQLt.AssertEmptyTable 'ics.SubProcessRunEnd_SpyProcedureLog' ;
	exec tSQLt.AssertEmptyTable 'ics.ThreadRunEnd_SpyProcedureLog' ;
end;