CREATE   PROCEDURE [IcsApp-Tests].[test ThreadRunEnd throws error on @FailedTargetRows null]
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
	@FailedSourceRows =78,
	@SuccessTargetRows=99,
	@FailedTargetRows=NULL 

END;