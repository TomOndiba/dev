IF OBJECT_ID('[IcsApp-Tests].[test SubProcessCheckThreads throws error on @SubProcessRunID null]') IS NOT NULL
	DROP PROCEDURE [IcsApp-Tests].[test SubProcessCheckThreads throws error on @SubProcessRunID null];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [IcsApp-Tests].[test SubProcessCheckThreads throws error on @SubProcessRunID null]
as
begin
	exec tSQLt.SpyProcedure N'log4.ExceptionHandler', N'Set @ErrorNumber = 1' ;
	exec tSQLt.SpyProcedure N'log4.JournalWriter' ;

	exec tSQLt.ExpectException @ExpectedErrorNumber = 50000 ;

	exec IcsApp.SubProcessCheckThreads @SubProcessName = 'spn', @SubProcessRunId = null ;
end ;
GO
