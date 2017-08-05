create   procedure [IcsApp-Tests].[test StopRun throws error on @IcrtProcessId negative]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunEnd' ;

	exec tSQLt.ExpectException @ExpectedMessagePattern = '%ICRT Process Id must not be null, negative or zero%'

	exec IcsApp.StopRun
		  @ProcessName = 'A'
		, @IcrtProcessId = -1
		, @EndState = 'SUCCEEDED'
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