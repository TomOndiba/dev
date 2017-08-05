create   procedure [IcsApp-Tests].[test StopRun throws error on @ThreadRunId zero when ending a thread (sub-process not present)]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunEnd' ;

	exec tSQLt.ExpectException @ExpectedMessagePattern = '%(BatMan) Thread Run Id can not be null, negative or zero when ending an open thread for MCT: "C"%'

	exec IcsApp.StopRun
		  @ProcessName = 'A'
		, @IcrtProcessId = 99
		, @EndState = 'SUCCEEDED'
		, @EndMessage = ''
		, @ProcessRunId = null
		, @SubProcessName = 'B'
		, @SubProcessRunId = null
		, @MappingConfigTaskName = 'C'
		, @MappingName = 'D'
		, @ThreadRunId = 0
		, @SuccessSourceRows = 10
		, @FailedSourceRows = 1
		, @SuccessTargetRows = 8
		, @FailedTargetRows = 2
end;