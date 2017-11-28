IF OBJECT_ID('[IcsApp-Tests].[test StopRun throws error on @IcrtProcessId zero]') IS NOT NULL
	DROP PROCEDURE [IcsApp-Tests].[test StopRun throws error on @IcrtProcessId zero];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [IcsApp-Tests].[test StopRun throws error on @IcrtProcessId zero]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunEnd' ;

	exec tSQLt.ExpectException @ExpectedMessagePattern = '%ICRT Process Id must not be null, negative or zero%'

	exec IcsApp.StopRun
		  @ProcessName = 'A'
		, @IcrtProcessId = 0
		, @EndState = 'SUCCEEDED'
		, @EndMessage = ''
		, @ProcessRunId = 11
end;
GO
