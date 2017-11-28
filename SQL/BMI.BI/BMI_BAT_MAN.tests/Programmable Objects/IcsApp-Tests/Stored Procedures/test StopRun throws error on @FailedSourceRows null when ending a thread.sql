IF OBJECT_ID('[IcsApp-Tests].[test StopRun throws error on @FailedSourceRows null when ending a thread]') IS NOT NULL
	DROP PROCEDURE [IcsApp-Tests].[test StopRun throws error on @FailedSourceRows null when ending a thread];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [IcsApp-Tests].[test StopRun throws error on @FailedSourceRows null when ending a thread]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunEnd' ;

	exec tSQLt.ExpectException @ExpectedMessagePattern = '%Failed Source row count can not be null or negative when closing an open thread for MCT: "C" <<(null)>>%'

	exec IcsApp.StopRun
		  @ProcessName = 'A'
		, @IcrtProcessId = 99
		, @EndState = 'SUCCEEDED'
		, @MappingConfigTaskName = 'C'
		, @MappingName = 'D'
		, @ThreadRunId = 33
		, @SuccessSourceRows = 10
		, @FailedSourceRows = null
		, @SuccessTargetRows = 8
		, @FailedTargetRows = 2
end;
GO
