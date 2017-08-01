


create PROCEDURE [IcsApp-Tests].[test ThreadRunStart returns expected  output parameters]
AS
BEGIN

DECLARE	@ThreadRunId int,
		@RunType varchar(8),
		@Instruction varchar(250),
		@Message varchar(500),
		@StartCapturePoint varchar(500),
		@EndCapturePoint varchar(500)

EXEC	[dbo].[ThreadRunStart]
		@MappingName = N'mn',
		@MappingConfigTaskName = N'mct',
		@SubProcessRunID = 1,
		@ThreadRunId = @ThreadRunId OUTPUT,
		@RunType = @RunType OUTPUT,
		@Instruction = @Instruction OUTPUT,
		@Message = @Message OUTPUT,
		@StartCapturePoint = @StartCapturePoint OUTPUT,
		@EndCapturePoint = @EndCapturePoint OUTPUT


		
exec tsqlt.AssertEquals @Expected = -777,  @Actual=@ThreadRunId, @Message = N'Error: @ThreadRunId not matached'

exec tsqlt.AssertEqualsString @Expected = 'Run', @Actual= @RunType, @Message = N'Error: @RunType not matached'

exec tsqlt.AssertEquals @Expected = 'Thread Instruction', @Actual= @Instruction, @Message = N'Error: @Instruction not matched'

exec tsqlt.AssertEqualsString @Expected = 'Thread Message',  @Actual=@Message, @Message = N'Error: @Message not matched'

exec tsqlt.AssertEquals @Expected ='Jul 25 2017 12:00AM' ,@Actual= @StartCapturePoint, @Message = N'Error: @StartCapturePoint not matched'

exec tsqlt.AssertEqualsString @Expected = 'Jul 25 2017 12:00AM', @Actual= @EndCapturePoint, @Message = N'Error: @EndCapturePoint not matched'

END;