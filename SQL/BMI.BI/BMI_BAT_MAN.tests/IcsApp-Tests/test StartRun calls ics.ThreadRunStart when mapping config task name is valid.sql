create   procedure [IcsApp-Tests].[test StartRun calls ics.ThreadRunStart when mapping config task name is valid]
as
begin
	--! Mock all the calls that might be made by this wrapper sproc
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunStart' ;

	declare @_ProcessName varchar(100) = 'A', @_IcrtProcessId int = 99 ;
	declare @_SubProcessName varchar(100) = 'B', @_ProcessRunId int = 11 ;
	declare @_MappingConfigTaskName varchar(100) = 'C', @_MappingName varchar(100) = '', @_SubProcessRunId int = 22 ;

	select @_MappingConfigTaskName as [MappingConfigTaskName], @_MappingName as [MappingName], @_SubProcessRunId as [SubProcessRunId] into #expected ;

	exec IcsApp.StartRun
		@ProcessName = @_ProcessName
	  , @IcrtProcessId = @_IcrtProcessId
	  , @SubProcessName = @_SubProcessName
	  , @ProcessRunId = @_ProcessRunId
	  , @SubProcessRunId = @_SubProcessRunId
	  , @MappingConfigTaskName = @_MappingConfigTaskName
	  , @MappingName = @_MappingName

	exec tSQLt.AssertEqualsTable @Expected = '#expected', @Actual = 'ics.ThreadRunStart_SpyProcedureLog' ;
end;