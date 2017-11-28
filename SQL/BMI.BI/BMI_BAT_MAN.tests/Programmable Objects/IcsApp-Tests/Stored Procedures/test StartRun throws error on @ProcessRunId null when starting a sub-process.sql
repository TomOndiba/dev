IF OBJECT_ID('[IcsApp-Tests].[test StartRun throws error on @ProcessRunId null when starting a sub-process]') IS NOT NULL
	DROP PROCEDURE [IcsApp-Tests].[test StartRun throws error on @ProcessRunId null when starting a sub-process];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [IcsApp-Tests].[test StartRun throws error on @ProcessRunId null when starting a sub-process]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunStart' ;
	
	exec tSQLt.ExpectException @ExpectedMessagePattern = '%(BatMan) Process Run Id can not be null, negative or zero when starting a new sub process: "B"%'
	
	exec IcsApp.StartRun
		@ProcessName = 'A'
	  , @IcrtProcessId = 99
	  , @SubProcessName = 'B'
	  , @ProcessRunId = null
end;
GO
