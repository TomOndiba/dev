create   procedure [IcsApp-Tests].[test StopRun throws error on @EndState empty]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunEnd' ;

	exec tSQLt.ExpectException @ExpectedMessagePattern = '%End State value can only be "SUCCEEDED", "FAILED", "SKIPPED", "STOPPED"%'

	exec IcsApp.StopRun
		  @ProcessName = 'A'
		, @IcrtProcessId = 99
		, @EndState = ''
		, @EndMessage = ''
		, @ProcessRunId = 11
		, @SubProcessName = 'B'
		, @SubProcessRunId = 22
		, @MappingConfigTaskName = 'C'
		, @MappingName = 'D'
		, @ThreadRunId = 33
		, @SuccessSourceRows = 10
		, @FailedSourceRows = 1
		, @SuccessTargetRows = 8
		, @FailedTargetRows = 2
end;