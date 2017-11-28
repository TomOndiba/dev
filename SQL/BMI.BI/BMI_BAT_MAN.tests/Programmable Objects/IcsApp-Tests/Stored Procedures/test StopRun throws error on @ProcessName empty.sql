IF OBJECT_ID('[IcsApp-Tests].[test StopRun throws error on @ProcessName empty]') IS NOT NULL
	DROP PROCEDURE [IcsApp-Tests].[test StopRun throws error on @ProcessName empty];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [IcsApp-Tests].[test StopRun throws error on @ProcessName empty]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunEnd' ;

	exec tSQLt.ExpectException @ExpectedMessagePattern = '%ICRT Process Name input must not be null or empty%'

	exec IcsApp.StopRun
		  @ProcessName = ''
		, @IcrtProcessId = 99
		, @EndState = 'SUCCEEDED'
		, @EndMessage = ''
		, @ProcessRunId = 11
end;
GO
