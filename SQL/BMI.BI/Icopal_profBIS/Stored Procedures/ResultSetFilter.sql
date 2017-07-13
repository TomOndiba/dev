CREATE PROCEDURE [tSQLt].[ResultSetFilter]
@ResultsetNo INT = null, @Command NVARCHAR (MAX) = null
AS EXTERNAL NAME [tSQLtCLR].[tSQLtCLR.StoredProcedures].[ResultSetFilter]

