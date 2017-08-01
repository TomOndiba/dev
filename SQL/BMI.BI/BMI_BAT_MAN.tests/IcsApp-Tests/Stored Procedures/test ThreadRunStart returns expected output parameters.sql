create procedure [IcsApp-Tests].[test ThreadRunStart returns expected output parameters]
as
begin
	declare
		@ThreadRunId	   int
	  , @RunType		   varchar(8)
	  , @Instruction	   varchar(250)
	  , @Message		   varchar(500)
	  , @StartCapturePoint varchar(500)
	  , @EndCapturePoint   varchar(500) ;

	exec [dbo].[ThreadRunStart]
		@MappingName = N'mn'
	  , @MappingConfigTaskName = N'mct'
	  , @SubProcessRunID = 1
	  , @ThreadRunId = @ThreadRunId output
	  , @RunType = @RunType output
	  , @Instruction = @Instruction output
	  , @Message = @Message output
	  , @StartCapturePoint = @StartCapturePoint output
	  , @EndCapturePoint = @EndCapturePoint output ;

	exec tSQLt.AssertEquals @Expected = -777, @Actual = @ThreadRunId, @Message = N'Error: @ThreadRunId not matached' ;
	exec tSQLt.AssertEqualsString @Expected = 'Run', @Actual = @RunType, @Message = N'Error: @RunType not matached' ;
	exec tSQLt.AssertEquals @Expected = 'Thread Instruction', @Actual = @Instruction, @Message = N'Error: @Instruction not matched' ;
	exec tSQLt.AssertEqualsString @Expected = 'Thread Message', @Actual = @Message, @Message = N'Error: @Message not matched' ;
	exec tSQLt.AssertEquals @Expected = 'Jul 25 2017 12:00AM', @Actual = @StartCapturePoint, @Message = N'Error: @StartCapturePoint not matched' ;
	exec tSQLt.AssertEqualsString @Expected = 'Jul 25 2017 12:00AM', @Actual = @EndCapturePoint, @Message = N'Error: @EndCapturePoint not matched' ;
end ;
go


