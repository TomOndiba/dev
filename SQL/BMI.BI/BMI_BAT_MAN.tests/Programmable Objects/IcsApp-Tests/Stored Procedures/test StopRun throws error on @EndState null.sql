IF OBJECT_ID('[IcsApp-Tests].[test StopRun throws error on @EndState null]') IS NOT NULL
	DROP PROCEDURE [IcsApp-Tests].[test StopRun throws error on @EndState null];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [IcsApp-Tests].[test StopRun throws error on @EndState null]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunEnd' ;

	exec tSQLt.ExpectException @ExpectedMessagePattern = '%End State value can only be "SUCCEEDED", "FAILED", "SKIPPED", "STOPPED"%'

	exec IcsApp.StopRun
		  @ProcessName = 'A'
		, @IcrtProcessId = 99
		, @EndState = null
		, @EndMessage = ''
		, @ProcessRunId = 11
end;
GO
