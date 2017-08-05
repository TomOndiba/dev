create   procedure [IcsApp-Tests].[test StartRun throws error on @IcrtProcessId zero]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunStart' ;
	
	exec tSQLt.ExpectException @ExpectedMessagePattern = '%ICRT Process Id must not be null, negative or zero%'
	
	exec IcsApp.StartRun
		@ProcessName = 'A'
	  , @IcrtProcessId = 0
	  , @SubProcessName = 'B'
	  , @MappingConfigTaskName = 'D'
	  , @MappingName = 'C'
	  , @ProcessRunId = 11
	  , @SubProcessRunId = 22
	  , @ThreadRunId = 33
	  , @StartCapturePoint = '20170701'
	  , @EndCapturePoint = '20170705'
	  , @RunType = ''
	  , @Instruction = ''
	  , @Message = ''
end;