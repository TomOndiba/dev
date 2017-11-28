create   procedure [IcsApp-Tests].[test StartRun allows null input for all output parameters]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunStart' ;
	
	exec tSQLt.ExpectNoException

	exec IcsApp.StartRun
		@ProcessName = 'A'
	  , @IcrtProcessId = 99
	  , @SubProcessName = ''
	  , @MappingConfigTaskName = ''
	  , @MappingName = ''
	  , @ProcessRunId = null
	  , @SubProcessRunId = null
	  , @ThreadRunId = null
	  , @StartCapturePoint = null
	  , @EndCapturePoint = null
	  , @RunType = null
	  , @Instruction = null
	  , @Message = null
end;