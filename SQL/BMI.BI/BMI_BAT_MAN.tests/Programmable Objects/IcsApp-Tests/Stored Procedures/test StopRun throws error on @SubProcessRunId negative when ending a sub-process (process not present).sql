IF OBJECT_ID('[IcsApp-Tests].[test StopRun throws error on @SubProcessRunId negative when ending a sub-process (process not present)]') IS NOT NULL
	DROP PROCEDURE [IcsApp-Tests].[test StopRun throws error on @SubProcessRunId negative when ending a sub-process (process not present)];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [IcsApp-Tests].[test StopRun throws error on @SubProcessRunId negative when ending a sub-process (process not present)]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunEnd' ;

	exec tSQLt.ExpectException @ExpectedMessagePattern = '%(BatMan) Sub-process Run Id can not be null, negative or zero when ending an open sub-process: "B"%'

	exec IcsApp.StopRun
		  @ProcessName = 'A'
		, @IcrtProcessId = 99
		, @EndState = 'SUCCEEDED'
		, @EndMessage = ''
		, @SubProcessName = 'B'
		, @SubProcessRunId = -1
end;
GO
