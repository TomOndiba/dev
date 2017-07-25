﻿CREATE       PROCEDURE [IcsApp-Tests].[test ThreadRunStart throws error on @MappingConfigTaskName empty]
AS
BEGIN
	EXEC tSQLt.SpyProcedure @ProcedureName = N'log4.ExceptionHandler'   -- nvarchar(max)
                        , @CommandToExecute = N'Set @ErrorNumber = 1' -- nvarchar(max)

	EXEC tSQLt.ExpectException @ExpectedErrorNumber = 50000

	EXEC dbo.ThreadRunStart
	@MappingName = 'c',
	@MappingConfigTaskName = '',
	@SubProcessRunID=1

END;