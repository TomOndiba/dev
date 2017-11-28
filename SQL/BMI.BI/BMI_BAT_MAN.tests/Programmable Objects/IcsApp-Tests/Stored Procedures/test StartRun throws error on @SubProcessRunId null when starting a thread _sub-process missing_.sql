create   procedure [IcsApp-Tests].[test StartRun throws error on @SubProcessRunId null when starting a thread (sub-process missing)]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunStart' ;
	
	exec tSQLt.ExpectException @ExpectedMessagePattern = '%(BatMan) Sub-process Run Id can not be null, negative or zero when starting a new thread: "D"%'
	
	exec IcsApp.StartRun
		@ProcessName = 'A'
	  , @IcrtProcessId = 99
	  , @ProcessRunId = 11
	  , @SubProcessName = ''
	  , @SubProcessRunId = null
	  , @MappingConfigTaskName = 'D'
	  , @MappingName = 'C'
end;