


CREATE PROCEDURE [IcsApp-Tests].[test ThreadRunStart returns expected resultset]
AS
BEGIN
CREATE TABLE [IcsApp-Tests].expected (ThreadRunId INT NULL, Instruction VARCHAR(8), RunType VARCHAR(8), Message VARCHAR(500),
[StartCapturePoint] datetime ,[EndCapturePoint] datetime)

 EXEC tSQLt.AssertResultSetsHaveSameMetaData
        'SELECT * From [IcsApp-Tests].expected',
        'Exec [dbo].[ThreadRunStart] ''a'', ''b'', 1 ';
END;