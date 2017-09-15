create   procedure [IcsApp-Tests].[test StopRun throws error on @FailedSourceRows negative when ending a thread]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunEnd' ;

	exec tSQLt.ExpectException @ExpectedMessagePattern = '%Failed Source row count can not be null or negative when closing an open thread for MCT: "C" <<-1>>%'

	exec IcsApp.StopRun
		  @ProcessName = 'A'
		, @IcrtProcessId = 99
		, @EndState = 'SUCCEEDED'
		, @MappingConfigTaskName = 'C'
		, @MappingName = 'D'
		, @ThreadRunId = 33
		, @SuccessSourceRows = 10
		, @FailedSourceRows = -1
		, @SuccessTargetRows = 8
		, @FailedTargetRows = 2
end;