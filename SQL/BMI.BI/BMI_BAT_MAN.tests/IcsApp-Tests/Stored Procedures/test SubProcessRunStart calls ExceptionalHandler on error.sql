﻿CREATE      PROCEDURE [IcsApp-Tests].[test SubProcessRunStart calls ExceptionalHandler on error]
AS
BEGIN
	CREATE TABLE [IcsApp-Tests].expected 
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

	INSERT INTO [IcsApp-Tests].expected (ErrorContext, ErrorProcedure, ErrorNumber)
	VALUES ('Failed to start new batch run at step: [Validate Inputs]', '[dbo].[SubProcessRunStart]', 0)
	

	--SELECT * FROM [IcsApp-Tests].expected;


	EXEC tSQLt.SpyProcedure N'log4.ExceptionHandler';

	EXEC dbo.SubProcessRunStart
	@ProcessName = '', 
	@ProcessRunID=1,
	@SubProcessName='spn'


	EXEC tSQLt.AssertEqualsTable @Expected ='[IcsApp-Tests].expected'  ,   @Actual = N'log4.ExceptionHandler_spyprocedureLog'
END;