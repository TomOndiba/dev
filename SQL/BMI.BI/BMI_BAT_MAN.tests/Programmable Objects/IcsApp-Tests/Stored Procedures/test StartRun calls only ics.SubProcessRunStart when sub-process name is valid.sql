IF OBJECT_ID('[IcsApp-Tests].[test StartRun calls only ics.SubProcessRunStart when sub-process name is valid]') IS NOT NULL
	DROP PROCEDURE [IcsApp-Tests].[test StartRun calls only ics.SubProcessRunStart when sub-process name is valid];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [IcsApp-Tests].[test StartRun calls only ics.SubProcessRunStart when sub-process name is valid]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunStart' ;

	exec IcsApp.StartRun
		@ProcessName = 'A'
	  , @IcrtProcessId = 99
	  , @SubProcessName = 'B'
	  , @ProcessRunId = 11

	exec tSQLt.AssertEmptyTable 'ics.ProcessRunStart_SpyProcedureLog' ;
	exec tSQLt.AssertEmptyTable 'ics.ThreadRunStart_SpyProcedureLog' ;
end;
GO
