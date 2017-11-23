--!
--! BAT_MAN Web Service Integration Tests (Stare & Compare).sql
--!
--!
declare @_IcrtProcessName varchar(50) = 'Test ICRT Process' ;
declare @_IcrtSubProcessName varchar(50) = 'Test ICRT Sub-process' ;
declare @_MappingConfigTaskName varchar(50) = 'Test Mapping Config Task' ;
declare @_MappingName varchar(50) = 'Test Mapping' ;
declare @_IcrtExecutionId int = 999999

declare @_TODO_Validate_ProcessRunStart bit = 1 ;
declare @_TODO_Validate_SubProcessRunStart bit = 1 ;
declare @_TODO_Validate_ThreadRunStart bit = 1 ;

declare @_TODO_Validate_ProcessRunEnd bit = 1 ;
declare @_TODO_Validate_SubProcessRunEnd bit = 1 ;
declare @_TODO_Validate_ThreadRunEnd bit = 1 ;

select * from dbo.StubResultSet as srs;

begin tran;

declare @_Process_RunId int, @_Process_RunType varchar(8), @_Process_Instruction varchar(16), @_Process_Message varchar(500) ;

--!
--! Exercise ics.ProcessRunStart
--!
exec IcsApp.StartRun
	  @ProcessName = @_IcrtProcessName
	, @IcrtProcessId = @_IcrtExecutionId
	, @ProcessRunId = @_Process_RunId out
	, @RunType = @_Process_RunType out
	, @Instruction = @_Process_Instruction out
	, @Message = @_Process_Message out

if @_TODO_Validate_ProcessRunStart = 1
	begin
		select
			  'ics.ProcessRunStart Outputs' as [ProcessRunStart]
			, @_Process_RunId		as [@_Process_RunId]
			, @_Process_RunType		as [@_Process_RunType]
			, @_Process_Instruction	as [@_Process_Instruction]
			, @_Process_Message		as [@_Process_Message] ;

		select 'batch.Process' as [ProcessRunStart], * from batch.Process where IcrtProcessName = @_IcrtProcessName ;
		select 'batch.ProcessRun' as [ProcessRunStart], * from batch.ProcessRun where ProcessRunId = @_Process_RunId ;
	end

--!
--! Exercise ics.SubProcessRunStart
--!
declare @_SubProcess_RunId int, @_SubProcess_RunType varchar(8), @_SubProcess_Instruction varchar(16), @_SubProcess_Message varchar(500) ;

exec IcsApp.StartRun
	  @ProcessName = @_IcrtProcessName
	, @IcrtProcessId = @_IcrtExecutionId
	, @SubProcessName = @_IcrtSubProcessName
	, @ProcessRunId = @_Process_RunId
	, @SubProcessRunId = @_SubProcess_RunId out
	, @RunType = @_SubProcess_RunType out
	, @Instruction = @_SubProcess_Instruction out
	, @Message = @_SubProcess_Message out

if @_TODO_Validate_SubProcessRunStart = 1
	begin
		select
			  'ics.SubProcessRunStart Outputs' as [SubProcessRunStart]
			, @_SubProcess_RunId		as [@_SubProcess_RunId]
			, @_SubProcess_RunType		as [@_SubProcess_RunType]
			, @_SubProcess_Instruction	as [@_SubProcess_Instruction]
			, @_SubProcess_Message		as [@_SubProcess_Message] ;

		select 'ics.IcrtSubProcess' as [SubProcessRunStart], * from ics.IcrtSubProcess where IcrtSubProcessName = @_IcrtSubProcessName ;
		select 'batch.Step' as [SubProcessRunStart], * from batch.Step where StepName = @_IcrtSubProcessName ;
		select 'batch.StepRun' as [SubProcessRunStart], * from batch.StepRun where StepRunId = @_SubProcess_RunId ;
	end

--!
--! Exercise ics.ThreadRunStart
--!
declare @_Thread_RunId int, @_Thread_RunType varchar(8), @_Thread_Instruction varchar(16), @_Thread_Message varchar(500), @_Thread_StartCapturePoint datetime, @_Thread_EndCapturePoint datetime ;

exec IcsApp.StartRun
	  @ProcessName = @_IcrtProcessName
	, @IcrtProcessId = @_IcrtExecutionId
	, @MappingConfigTaskName = @_MappingConfigTaskName
	, @MappingName = @_MappingName
	, @SubProcessRunId = @_SubProcess_RunId
	, @ThreadRunId = @_Thread_RunId out
	, @StartCapturePoint = @_Thread_StartCapturePoint out
	, @EndCapturePoint = @_Thread_EndCapturePoint out
	, @RunType = @_Thread_RunType out
	, @Instruction = @_Thread_Instruction out
	, @Message = @_Thread_Message out

if @_TODO_Validate_ThreadRunStart = 1
	begin
		select
			  'ics.ThreadRunStart Outputs'	as [ThreadRunStart]
			, @_Thread_RunId				as [@_Thread_RunId]
			, @_Thread_RunType				as [@_Thread_RunType]
			, @_Thread_Instruction			as [@_Thread_Instruction]
			, @_Thread_Message				as [@_Thread_Message]
			, @_Thread_StartCapturePoint	as [@_Thread_StartCapturePoint]
			, @_Thread_EndCapturePoint		as [@_Thread_EndCapturePoint]

		select 'ics.MappingConfigTask' as [ThreadRunStart], * from ics.MappingConfigTask where MappingConfigTaskName = @_MappingConfigTaskName ;
		select 'batch.Thread' as [ThreadRunStart], * from batch.Thread --where MappingConfigTaskId in (select MappingConfigTaskId from ics.MappingConfigTask where MappingConfigTaskName = @_MappingConfigTaskName)
		select 'batch.ThreadRun' as [ThreadRunStart], * from batch.ThreadRun where ThreadRunId = @_Thread_RunId ;
	end

--!
--! Exercise ics.ThreadRunEnd
--!
exec IcsApp.StopRun
	  @ProcessName = @_IcrtProcessName
	, @IcrtProcessId = @_IcrtExecutionId
	, @EndState = 'SUCCEEDED'
	, @EndMessage = 'This was a good result (thread)'
	, @ProcessRunId = @_Process_RunId
	, @SubProcessName = @_IcrtSubProcessName
	, @SubProcessRunId = @_SubProcess_RunId
	, @MappingConfigTaskName = @_MappingConfigTaskName
	, @MappingName = @_MappingName
	, @ThreadRunId = @_Thread_RunId
	, @SuccessSourceRows = 2
	, @FailedSourceRows = 4
	, @SuccessTargetRows = 6
	, @FailedTargetRows = 8


if @_TODO_Validate_ThreadRunEnd = 1
	begin
		select 'batch.ThreadRun' as [ThreadRunEnd], * from batch.ThreadRun where ThreadRunId = @_Thread_RunId ;
	end

--!
--! Exercise ics.SubProcessRunEnd
--!
exec IcsApp.StopRun
	  @ProcessName = @_IcrtProcessName
	, @IcrtProcessId = @_IcrtExecutionId
	, @EndState = 'SUCCEEDED'
	, @EndMessage = 'This was a good result (thread)'
	, @ProcessRunId = @_Process_RunId
	, @SubProcessName = @_IcrtSubProcessName
	, @SubProcessRunId = @_SubProcess_RunId
	, @MappingConfigTaskName = null
	, @MappingName = null
	, @ThreadRunId = null
	, @SuccessSourceRows = null
	, @FailedSourceRows = null
	, @SuccessTargetRows = null
	, @FailedTargetRows = null

if @_TODO_Validate_SubProcessRunEnd = 1
	begin
		select 'batch.StepRun' as [SubProcessRunEnd], * from batch.StepRun where StepRunId = @_SubProcess_RunId ;
	end

--!
--! Exercise ics.ProcessRunEnd
--!
exec IcsApp.StopRun
	  @ProcessName = @_IcrtProcessName
	, @IcrtProcessId = @_IcrtExecutionId
	, @EndState = 'SUCCEEDED'
	, @EndMessage = 'This was a good result (thread)'
	, @ProcessRunId = @_Process_RunId
	, @SubProcessName = null
	, @SubProcessRunId = null
	, @MappingConfigTaskName = null
	, @MappingName = null
	, @ThreadRunId = null
	, @SuccessSourceRows = null
	, @FailedSourceRows = null
	, @SuccessTargetRows = null
	, @FailedTargetRows = null

if @_TODO_Validate_ProcessRunEnd = 1
	begin
		select 'batch.ProcessRun' as [ProcessRunEnd], * from batch.ProcessRun where ProcessRunId = @_Process_RunId ;
	end


rollback tran;
go