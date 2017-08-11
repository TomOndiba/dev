create   procedure [IcsApp-Tests].[test StartRun calls ics.ProcessRunEnd when process name and id are valid]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunEnd' ;

	declare @_ProcessName varchar(100) = 'A', @_IcrtProcessId int = 99, @_EndState varchar(16) = 'SUCCEEDED', @_EndMessage varchar(500) = 'Some message' ;
	declare @_ProcessRunId int = 11;

	select
		  @_ProcessName		as [ProcessName]
		, @_ProcessRunId	as [ProcessRunId]
		, @_EndState		as [EndState]
		, @_EndMessage		as [EndMessage]
	into #expected ;
	
	exec IcsApp.StopRun
		  @ProcessName = @_ProcessName
		, @IcrtProcessId = @_IcrtProcessId
		, @EndState = @_EndState
		, @EndMessage = @_EndMessage
		, @ProcessRunId = @_ProcessRunId

	exec tSQLt.AssertEqualsTable @Expected = '#expected', @Actual = 'ics.ProcessRunEnd_SpyProcedureLog' ;
end;