IF OBJECT_ID('[IcsApp-Tests].[test StartRun replaces null @EndMessage with empty string]') IS NOT NULL
	DROP PROCEDURE [IcsApp-Tests].[test StartRun replaces null @EndMessage with empty string];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   procedure [IcsApp-Tests].[test StartRun replaces null @EndMessage with empty string]
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
		, @EndMessage = null
		, @ProcessRunId = 11

	declare @_actual varchar(500) = (select EndMessage from ics.ProcessRunEnd_SpyProcedureLog) ;

	exec tSQLt.AssertEqualsString '', @_actual ;
end;
GO
