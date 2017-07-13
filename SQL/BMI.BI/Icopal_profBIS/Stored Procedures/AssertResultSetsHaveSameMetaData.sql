CREATE PROCEDURE [tSQLt].[AssertResultSetsHaveSameMetaData]
@expectedCommand NVARCHAR (MAX) = null, @actualCommand NVARCHAR (MAX) = null
AS EXTERNAL NAME [tSQLtCLR].[tSQLtCLR.StoredProcedures].[AssertResultSetsHaveSameMetaData]

