create   procedure [IcsApp-Tests].[test ThreadRunEnd throws error on @EndState "SUCCESS"]
as
begin
	exec tSQLt.SpyProcedure
		@ProcedureName = N'log4.ExceptionHandler'	-- nvarchar(max)
		, @CommandToExecute = N'Set @ErrorNumber = 1' -- nvarchar(max)

	exec tSQLt.ExpectException @ExpectedErrorNumber = 50000

	exec dbo.ThreadRunEnd
		  @MappingName = 'mn'
		, @MappingConfigTaskName = 'mctn'
		, @ThreadRunID = 1
		, @EndState = 'SUCCESS'
		, @EndMessage = ''
		, @SuccessSourceRows = 100
		, @FailedSourceRows = 1
		, @SuccessTargetRows = 101
		, @FailedTargetRows = 1

end ;