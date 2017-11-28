create   procedure [IcsApp-Tests].[test StartRun calls only ics.ThreadRunStart when mapping config task name is valid]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunStart' ;

	exec IcsApp.StartRun
		@ProcessName = 'A'
	  , @IcrtProcessId = 99
	  , @SubProcessName = 'B'
	  , @ProcessRunId = 11
	  , @SubProcessRunId = 12
	  , @MappingConfigTaskName = 'C'
	  , @MappingName = 'D'

	exec tSQLt.AssertEmptyTable 'ics.ProcessRunStart_SpyProcedureLog' ;
	exec tSQLt.AssertEmptyTable 'ics.SubProcessRunStart_SpyProcedureLog' ;
end;