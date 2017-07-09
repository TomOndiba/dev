CREATE PROCEDURE tSQLt.MarkSchemaAsTestClass
(
  @QuotedClassName NVARCHAR(MAX)
)
AS
--<CommentHeader>
/**************************************************************************************************

PROCEDURE NAME:		tSQLt.MarkSchemaAsTestClass
DESCRIPTION:		Added to allow Test Class status to test classes when publishing from SSDT
ORIGIN DATE:		04-NOV-2013 (not yest tested)
ORIGINAL AUTHOR:	Greg M. Lucas (data-centric solutions ltd. http://www.data-centric.co.uk)
BUILD DATE:			<--%DbBuildDate%-->
BUILD VERSION:		<--%DbBuildVersion%-->

**************************************************************************************************/
--</CommentHeader>

BEGIN
	DECLARE @UnquotedClassName NVARCHAR(MAX);

	SELECT
		@UnquotedClassName = name
	FROM
		sys.schemas
	WHERE
		QUOTENAME(name) = @QuotedClassName;

	--! Only do this if the schema does actually exist
	IF @UnquotedClassName IS NOT NULL
		BEGIN
		    IF NOT  EXISTS ( SELECT 1 FROM sys.extended_properties WHERE [class_desc] = 'SCHEMA' AND [name] = N'tSQLt.TestClass' AND major_id = SCHEMA_ID(@UnquotedClassName))
				EXEC tSQLt.Private_MarkSchemaAsTestClass @QuotedClassName
		END
END;
