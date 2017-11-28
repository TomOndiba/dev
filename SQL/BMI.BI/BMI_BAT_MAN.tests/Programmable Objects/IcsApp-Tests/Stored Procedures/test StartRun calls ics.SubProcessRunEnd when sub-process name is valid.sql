create   procedure [IcsApp-Tests].[test StartRun calls ics.SubProcessRunEnd when sub-process name is valid]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunEnd' ;

	declare @_ProcessName varchar(100) = 'A', @_IcrtProcessId int = 99, @_EndState varchar(16) = 'SUCCEEDED', @_EndMessage varchar(500) = 'Some message' ;
	declare @_SubProcessName varchar(100) = 'B', @_SubProcessRunId int = 22 ;

	select
		  @_ProcessName		as [ProcessName]
		, @_SubProcessName	as [SubProcessName]
		, @_SubProcessRunId	as [SubProcessRunId]
		, @_EndState		as [EndState]
		, @_EndMessage		as [EndMessage]
	into #expected ;
	
	exec IcsApp.StopRun
		  @ProcessName = @_ProcessName
		, @IcrtProcessId = @_IcrtProcessId
		, @EndState = @_EndState
		, @EndMessage = @_EndMessage
		, @SubProcessName = @_SubProcessName
		, @SubProcessRunId = @_SubProcessRunId

	exec tSQLt.AssertEqualsTable @Expected = '#expected', @Actual = 'ics.SubProcessRunEnd_SpyProcedureLog' ;
end;