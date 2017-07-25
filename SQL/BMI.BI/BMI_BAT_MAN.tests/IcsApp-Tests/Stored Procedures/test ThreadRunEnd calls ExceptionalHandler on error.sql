create    
      PROCEDURE [IcsApp-Tests].[test ThreadRunEnd calls ExceptionalHandler on error]
AS
BEGIN
	CREATE TABLE [IcsApp-Tests].Expected1
	(
	  ErrorContext		nvarchar(512)	NULL
	, ErrorProcedure	nvarchar(128)	NULL
	, ErrorNumber		int				NULL
	, ErrorSeverity		INT				NULL
	, ErrorState		INT				NULL
	, ErrorLine			INT				NULL
	, ErrorMessage		nvarchar(4000)	NULL
	, ReturnMessage		NVARCHAR(1000)	NULL
	, ExceptionId		int				NULL
	)


	INSERT INTO [IcsApp-Tests].Expected1  (ErrorContext, ErrorProcedure, ErrorNumber)
	VALUES ('Failed to start new batch run at step: [Validate Inputs]', '[dbo].[ThreadRunEnd]', 0)



	EXEC tSQLt.SpyProcedure N'log4.ExceptionHandler';

	EXEC dbo.ThreadRunEnd
	@MappingName='' ,
	@MappingConfigTaskName='mctn' ,
	@ThreadRunID=1 ,
	@EndState='es',
	@EndMessage='em', 
	@SuccessSourceRows=1 ,
	@FailedSourceRows=1,
	@SuccessTargetRows=1 ,
	@FailedTargetRows=1

	EXEC tSQLt.AssertEqualsTable @Expected ='[IcsApp-Tests].Expected1'  ,   @Actual = N'log4.ExceptionHandler_spyprocedureLog'

END;



--EXEC  tsqlt.run '[IcsApp-Tests].[test ThreadRunStart calls ExceptionalHandler on error]'
go