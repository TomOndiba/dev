IF OBJECT_ID('[IcsApp-Tests].[test StopRun @EndState allows "FAILED"]') IS NOT NULL
	DROP PROCEDURE [IcsApp-Tests].[test StopRun @EndState allows "FAILED"];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [IcsApp-Tests].[test StopRun @EndState allows "FAILED"]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunEnd' ;

	exec tSQLt.ExpectNoException;

	exec IcsApp.StopRun
		  @ProcessName = 'A'
		, @IcrtProcessId = 99
		, @EndState = 'FAILED'
		, @EndMessage = ''
		, @ProcessRunId = 11
end;
GO
