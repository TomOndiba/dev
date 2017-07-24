


CREATE   PROCEDURE [IcsApp-Tests].[test SubProcessRunStart returns expected resultset]
AS
BEGIN
CREATE TABLE [IcsApp-Tests].expected (SubProcessRunId INT NULL, Instruction VARCHAR(255), RunType VARCHAR(8), [Message] VARCHAR(500))

 EXEC tSQLt.AssertResultSetsHaveSameMetaData
        'SELECT * From [IcsApp-Tests].expected',
        'Exec [dbo].[SubProcessRunStart] ''PN'',''psn'',1 ';
END;