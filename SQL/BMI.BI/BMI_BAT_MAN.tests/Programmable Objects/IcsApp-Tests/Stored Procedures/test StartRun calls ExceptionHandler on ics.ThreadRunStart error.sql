IF OBJECT_ID('[IcsApp-Tests].[test StartRun calls ExceptionHandler on ics.ThreadRunStart error]') IS NOT NULL
	DROP PROCEDURE [IcsApp-Tests].[test StartRun calls ExceptionHandler on ics.ThreadRunStart error];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [IcsApp-Tests].[test StartRun calls ExceptionHandler on ics.ThreadRunStart error]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunStart', @CommandToExecute = 'raiserror(''Oops!'', 16, 1);' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler';

	select
		  cast('Failed to record start of run for ICRT Process: "A", ICRT Sub-Process: NULL and MCT Name: "C" at step: [Start Thread]' as varchar(max)) as [ErrorContext]
		, cast('[IcsApp].[StartRun]' as varchar(max)) as [ErrorProcedure]
	into
		#expected

	exec IcsApp.StartRun
		@ProcessName = 'A'
	  , @IcrtProcessId = 99
	  , @MappingConfigTaskName = 'C'
	  , @MappingName = 'D'
	  , @ProcessRunId = 11
	  , @SubProcessRunId = 22

	--! Assert
	exec tSQLt.AssertEqualsTable '#expected', 'log4.ExceptionHandler_SpyProcedureLog';
end;
GO
