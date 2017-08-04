create   procedure [Ics-ModuleTests].[test ThreadRunStart outputs expected parameter values]
as
begin
	--!
	--! Right now this is just a stub so the outputs are "fixed" and stored in a table
	--!
	declare @_ExpectedThreadRunId int
	declare @_ExpectedInstruction varchar(255)
	declare @_ExpectedRunType varchar(10)
	declare @_ExpectedMessage varchar(255)
	declare @_ExpectedStartCapturePoint datetime
	declare @_ExpectedEndCapturePoint datetime

	select
		  @_ExpectedThreadRunId = ThreadRunID
		, @_ExpectedInstruction = Instruction
		, @_ExpectedRunType = RunType
		, @_ExpectedMessage = [Message]
		, @_ExpectedStartCapturePoint = StartCapturePoint
		, @_ExpectedEndCapturePoint = EndCapturePoint
	from
		dbo.StubResultSet
	where
		FunctionName = '[ics].[ThreadRunStart]'

	--! Act
	declare @_ActualThreadRunId int
	declare @_ActualInstruction varchar(255)
	declare @_ActualRunType varchar(10)
	declare @_ActualMessage varchar(255)
	declare @_ActualStartCapturePoint datetime
	declare @_ActualEndCapturePoint datetime

	exec ics.ThreadRunStart
		  @MappingConfigTaskName = 'D'
		, @MappingName = 'C'
		, @SubProcessRunId = 22
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