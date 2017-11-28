IF OBJECT_ID('[IcsApp-Tests].[test StartRun calls only ics.ProcessRunStart when process name and id are valid]') IS NOT NULL
	DROP PROCEDURE [IcsApp-Tests].[test StartRun calls only ics.ProcessRunStart when process name and id are valid];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [IcsApp-Tests].[test StartRun calls only ics.ProcessRunStart when process name and id are valid]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunStart' ;

	exec IcsApp.StartRun
		@ProcessName = 'A'
	  , @IcrtProcessId = 99

	exec tSQLt.AssertEmptyTable 'ics.SubProcessRunStart_SpyProcedureLog' ;
	exec tSQLt.AssertEmptyTable 'ics.ThreadRunStart_SpyProcedureLog' ;
end;
GO
