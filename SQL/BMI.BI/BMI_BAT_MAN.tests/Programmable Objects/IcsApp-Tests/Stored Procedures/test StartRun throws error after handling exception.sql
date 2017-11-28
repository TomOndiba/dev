IF OBJECT_ID('[IcsApp-Tests].[test StartRun throws error after handling exception]') IS NOT NULL
	DROP PROCEDURE [IcsApp-Tests].[test StartRun throws error after handling exception];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [IcsApp-Tests].[test StartRun throws error after handling exception]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler', @CommandToExecute = N'set @ErrorNumber = 999';

	exec tSQLt.ExpectException @ExpectedErrorNumber = 50000 ;

	--! Act
	exec IcsApp.StartRun @ProcessName = NULL, @IcrtProcessId = 99
end;
GO
