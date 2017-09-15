create   procedure [IcsApp-Tests].[test StartRun calls only ics.ProcessRunStart when process name and id are valid]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunStart' ;

	exec IcsApp.StartRun
		@ProcessName = 'A'
	  , @IcrtProcessId = 99

	exec tSQLt.AssertEmptyTable 'ics.SubProcessRunStart_SpyProcedureLog' ;
	exec tSQLt.AssertEmptyTable 'ics.ThreadRunStart_SpyProcedureLog' ;
end;