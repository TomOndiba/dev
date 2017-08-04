create   procedure [IcsApp-Tests].[test StartRun calls ics.SubProcessRunStart when sub-process name is valid]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunStart' ;

	declare @_ProcessName varchar(100) = 'A', @_IcrtProcessId int = 99 ;
	declare @_SubProcessName varchar(100) = 'B', @_ProcessRunId int = 11 ;

	select @_ProcessName as [ProcessName], @_SubProcessName as [SubProcessName], @_ProcessRunId as [ProcessRunId] into #expected ;
	
	exec IcsApp.StartRun
		@ProcessName = @_ProcessName
	  , @IcrtProcessId = @_IcrtProcessId
	  , @SubProcessName = @_SubProcessName
	  , @ProcessRunId = @_ProcessRunId

	exec tSQLt.AssertEqualsTable @Expected = '#expected', @Actual = 'ics.SubProcessRunStart_SpyProcedureLog' ;
end;