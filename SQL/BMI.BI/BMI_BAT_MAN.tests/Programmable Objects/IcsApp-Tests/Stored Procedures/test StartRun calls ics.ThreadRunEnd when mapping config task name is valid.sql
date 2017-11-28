IF OBJECT_ID('[IcsApp-Tests].[test StartRun calls ics.ThreadRunEnd when mapping config task name is valid]') IS NOT NULL
	DROP PROCEDURE [IcsApp-Tests].[test StartRun calls ics.ThreadRunEnd when mapping config task name is valid];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [IcsApp-Tests].[test StartRun calls ics.ThreadRunEnd when mapping config task name is valid]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunEnd' ;

	exec IcsApp.StopRun
		  @ProcessName = 'A'
		, @IcrtProcessId = 99
		, @EndState = 'SUCCEEDED'
		, @EndMessage = ''
		, @ProcessRunId = 11
		, @SubProcessName = 'B'
		, @SubProcessRunId = 22
		, @MappingConfigTaskName = 'C'
		, @MappingName = 'D'
		, @ThreadRunId = 33
		, @SuccessSourceRows = 10
		, @FailedSourceRows = 1
		, @SuccessTargetRows = 8
		, @FailedTargetRows = 2
	
	exec tSQLt.AssertEmptyTable 'ics.ProcessRunEnd_SpyProcedureLog' ;
	exec tSQLt.AssertEmptyTable 'ics.SubProcessRunEnd_SpyProcedureLog' ;
end;
GO
