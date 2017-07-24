


CREATE PROCEDURE [IcsApp-Tests].[test ProcessRunStart returns expected resultset]
AS
BEGIN
CREATE TABLE [IcsApp-Tests].expected (ProcessRunId INT NULL, Instruction VARCHAR(255), RunType VARCHAR(8), [Message] VARCHAR(500))

 EXEC tSQLt.AssertResultSetsHaveSameMetaData
        'SELECT * From [IcsApp-Tests].expected',
        'Exec [dbo].[ProcessRunStart] ''PN'',1 ';
END;