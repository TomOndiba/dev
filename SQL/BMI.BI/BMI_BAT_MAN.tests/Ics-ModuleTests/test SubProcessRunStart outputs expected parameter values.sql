create   procedure [Ics-ModuleTests].[test SubProcessRunStart outputs expected parameter values]
as
begin
	--!
	--! Right now this is just a stub so the outputs are "fixed" and stored in a table
	--!
	declare @_ExpectedSubProcessRunId int
	declare @_ExpectedInstruction varchar(255)
	declare @_ExpectedRunType varchar(10)
	declare @_ExpectedMessage varchar(255)

	select
		  @_ExpectedSubProcessRunId = SubProcessRunID
		, @_ExpectedInstruction = Instruction
		, @_ExpectedRunType = RunType
		, @_ExpectedMessage = [Message]
	from
		dbo.StubResultSet
	where
		FunctionName = '[ics].[SubProcessRunStart]'

	--! Act
	declare @_ActualSubProcessRunId int
	declare @_ActualInstruction varchar(255)
	declare @_ActualRunType varchar(10)
	declare @_ActualMessage varchar(255)

	exec ics.SubProcessRunStart
		@ProcessName = 'A'
	  , @SubProcessName = 'B'
	  , @ProcessRunId = 11
	  , @SubProcessRunId = @_ActualSubProcessRunId out
	  , @RunType = @_ActualRunType out
	  , @Instruction = @_ActualInstruction out
	  , @Message = @_ActualMessage out

	--! Assertions
	exec tSQLt.AssertEquals @Expected = @_ExpectedSubProcessRunId, @Actual = @_ActualSubProcessRunId, @Message = N'@SubProcessRunId output value wrong: ' ;
	exec tSQLt.AssertEqualsString @Expected = @_ExpectedRunType, @Actual = @_ActualRunType, @Message = N'@RunType output value wrong: ' ;
	exec tSQLt.AssertEqualsString @Expected = @_ExpectedInstruction, @Actual = @_ActualInstruction, @Message = N'@Instruction output value wrong: ' ;
	exec tSQLt.AssertEqualsString @Expected = @_ExpectedMessage, @Actual = @_ActualMessage, @Message = N'@Message output value wrong: ' ;
end;