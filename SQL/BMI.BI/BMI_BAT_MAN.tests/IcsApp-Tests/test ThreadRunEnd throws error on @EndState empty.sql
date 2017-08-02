CREATE   PROCEDURE [IcsApp-Tests].[test ThreadRunEnd throws error on @EndState empty]
AS
BEGIN
	EXEC tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler'   -- nvarchar(max)
                        , @CommandToExecute = N'Set @ErrorNumber = 1' -- nvarchar(max)

	EXEC tSQLt.ExpectException @ExpectedErrorNumber = 50000

	EXEC dbo.ThreadRunEnd
	@MappingName ='mn',
	@MappingConfigTaskName='mctn' ,
	@ThreadRunID=1 ,
	@EndState ='',
	--@EndMessage='',
	@SuccessSourceRows=100 ,
	@FailedSourceRows =1,
	@SuccessTargetRows=101 ,
	@FailedTargetRows=1

END;