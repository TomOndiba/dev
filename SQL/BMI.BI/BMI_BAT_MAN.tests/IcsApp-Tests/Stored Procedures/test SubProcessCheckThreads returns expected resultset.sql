
CREATE  PROCEDURE [IcsApp-Tests].[test SubProcessCheckThreads returns expected resultset]
AS
BEGIN
CREATE TABLE [IcsApp-Tests].expected (SubProcessRunId INT NULL, Outcome varchar(255), Message VARCHAR(500), ExpectedThreadCount int,
									 ActualThreadCount int, ThreadsSucceeded int, ThreadsSkipped int ,ThreadsStopped int,	ThreadsFailed  int )

 EXEC tSQLt.AssertResultSetsHaveSameMetaData
        'SELECT * From [IcsApp-Tests].expected',
        'Exec [dbo].[SubProcessCheckThreads] ''PN'',1 ';
END;