create   procedure [IcsApp-Tests].[test StartRun allows all output parameters to be ignored]
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
	  , @MappingName = ''
	  , @MappingConfigTaskName = ''
end;