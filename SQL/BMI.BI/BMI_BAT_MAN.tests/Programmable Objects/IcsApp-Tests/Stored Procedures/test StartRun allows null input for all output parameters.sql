IF OBJECT_ID('[IcsApp-Tests].[test StartRun allows null input for all output parameters]') IS NOT NULL
	DROP PROCEDURE [IcsApp-Tests].[test StartRun allows null input for all output parameters];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [IcsApp-Tests].[test StartRun allows null input for all output parameters]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunStart' ;
	
	exec tSQLt.ExpectNoException

	exec IcsApp.StartRun
		@ProcessName = 'A'
	  , @IcrtProcessId = 99
	  , @SubProcessName = ''
	  , @MappingConfigTaskName = ''
	  , @MappingName = ''
	  , @ProcessRunId = null
	  , @SubProcessRunId = null
	  , @ThreadRunId = null
	  , @StartCapturePoint = null
	  , @EndCapturePoint = null
	  , @RunType = null
	  , @Instruction = null
	  , @Message = null
end;
GO
