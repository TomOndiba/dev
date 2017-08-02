CREATE   PROCEDURE [IcsApp-Tests].[test ThreadRunEnd throws error on @FailedSourceRows null]
AS
BEGIN
	EXEC tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler'   -- nvarchar(max)
                        , @CommandToExecute = N'Set @ErrorNumber = 1' -- nvarchar(max)

	EXEC tSQLt.ExpectException @ExpectedErrorNumber = 50000

	EXEC dbo.ThreadRunEnd
	@MappingName ='mn',
	@MappingConfigTaskName='mctn' ,
	@ThreadRunID=100 ,
	@EndState ='es',
	--@EndMessage='',
	@SuccessSourceRows=100,
	@FailedSourceRows =null,
	@SuccessTargetRows=98,
	@FailedTargetRows=1

END;