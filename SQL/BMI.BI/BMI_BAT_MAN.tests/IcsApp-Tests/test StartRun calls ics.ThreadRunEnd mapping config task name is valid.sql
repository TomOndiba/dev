create   procedure [IcsApp-Tests].[test StartRun calls ics.ThreadRunEnd mapping config task name is valid]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunEnd' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunEnd' ;

	declare @_ProcessName varchar(100) = 'A', @_IcrtProcessId int = 99, @_EndState varchar(16) = 'SUCCEEDED', @_EndMessage varchar(500) = 'Some message' ;
	declare @_MappingConfigTaskName varchar(100) = 'C', @_MappingName varchar(100) = 'D', @_ThreadRunId int = 33 ;
	declare @_SuccessSourceRows int = 10, @_FailedSourceRows int = 1, @_SuccessTargetRows int = 8, @_FailedTargetRows int = 2 ;

	select
		  @_MappingConfigTaskName	as [MappingConfigTaskName]
		, @_MappingName				as [MappingName]
		, @_ThreadRunId				as [ThreadRunId]
		, @_EndState				as [EndState]
		, @_EndMessage				as [EndMessage]
		, @_SuccessSourceRows		as [SuccessSourceRows]
		, @_FailedSourceRows		as [FailedSourceRows]
		, @_SuccessTargetRows		as [SuccessTargetRows]
		, @_FailedTargetRows		as [FailedTargetRows]
	into #expected ;
	
	exec IcsApp.StopRun
		  @ProcessName = @_ProcessName
		, @IcrtProcessId = @_IcrtProcessId
		, @EndState = @_EndState
		, @EndMessage = @_EndMessage
		, @ProcessRunId = null
		, @SubProcessName = null
		, @SubProcessRunId = null
		, @MappingConfigTaskName = @_MappingConfigTaskName
		, @MappingName = @_MappingName
		, @ThreadRunId = @_ThreadRunId
		, @SuccessSourceRows = @_SuccessSourceRows
		, @FailedSourceRows = @_FailedSourceRows
		, @SuccessTargetRows = @_SuccessTargetRows
		, @FailedTargetRows = @_FailedTargetRows

	exec tSQLt.AssertEqualsTable @Expected = '#expected', @Actual = 'ics.ThreadRunEnd_SpyProcedureLog' ;
end;