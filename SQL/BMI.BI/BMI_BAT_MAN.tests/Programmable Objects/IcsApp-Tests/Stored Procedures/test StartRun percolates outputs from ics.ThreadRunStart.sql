create   procedure [IcsApp-Tests].[test StartRun percolates outputs from ics.ThreadRunStart]
as
begin
	declare @_ExpectedThreadRunId int = 44
	declare @_ExpectedRunType varchar(10) = 'FULLISH'
	declare @_ExpectedInstruction varchar(255) = 'STOP'
	declare @_ExpectedMessage varchar(255) = 'Do another thing'
	declare @_ExpectedStartCapturePoint datetime = '20170731 10:00:00'
	declare @_ExpectedEndCapturePoint datetime = '20170831 11:22:33'

	--! Mock all the calls that might be made by this wrapper sproc
	declare @_CmdToRun varchar(1000) = 'select @ThreadRunId = ' + cast(@_ExpectedThreadRunId as varchar(16))
						+ ', @RunType = ''' + @_ExpectedRunType + ''''
						+ ', @Instruction = ''' + @_ExpectedInstruction + ''''
						+ ', @Message = ''' + @_ExpectedMessage + ''''
						+ ', @StartCapturePoint = ''' + format(@_ExpectedStartCapturePoint, 'yyyyMMdd HH:mm:ss') + ''''
						+ ', @EndCapturePoint = ''' + format(@_ExpectedEndCapturePoint, 'yyyyMMdd HH:mm:ss') + ''''

	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.SubProcessRunStart' ;
	exec tSQLt.SpyProcedure @ProcedureName = N'ics.ThreadRunStart', @CommandToExecute = @_CmdToRun ;

	declare @_ActualThreadRunId int
	declare @_ActualInstruction varchar(255)
	declare @_ActualRunType varchar(10)
	declare @_ActualMessage varchar(255)
	declare @_ActualStartCapturePoint datetime
	declare @_ActualEndCapturePoint datetime
	
	exec IcsApp.StartRun
		  @ProcessName = 'A'
		, @IcrtProcessId = 99
		, @ProcessRunId = 22
		, @SubProcessName = 'B'
		, @SubProcessRunId = 33
		, @MappingConfigTaskName = 'C'
		, @MappingName = 'D'
		, @ThreadRunId = @_ActualThreadRunId out
		, @RunType = @_ActualRunType out
		, @Instruction = @_ActualInstruction out
		, @Message = @_ActualMessage out
		, @StartCapturePoint = @_ActualStartCapturePoint out
		, @EndCapturePoint = @_ActualEndCapturePoint out

	--! Assertions
	exec tSQLt.AssertEquals @Expected = @_ExpectedThreadRunId, @Actual = @_ActualThreadRunId, @Message = N'@ThreadRunId output value wrong: ' ;
	exec tSQLt.AssertEqualsString @Expected = @_ExpectedRunType, @Actual = @_ActualRunType, @Message = N'@RunType output value wrong: ' ;
	exec tSQLt.AssertEqualsString @Expected = @_ExpectedInstruction, @Actual = @_ActualInstruction, @Message = N'@Instruction output value wrong: ' ;
	exec tSQLt.AssertEqualsString @Expected = @_ExpectedMessage, @Actual = @_ActualMessage, @Message = N'@Message output value wrong: ' ;
	exec tSQLt.AssertEquals @Expected = @_ExpectedStartCapturePoint, @Actual = @_ActualStartCapturePoint, @Message = N'@StartCapturePoint output value wrong: ' ;
	exec tSQLt.AssertEquals @Expected = @_ExpectedEndCapturePoint, @Actual = @_ActualEndCapturePoint, @Message = N'@EndCapturePoint output value wrong: ' ;
end;