
CREATE PROCEDURE [sqlcop].[test Wide Table]
AS
BEGIN
	-- Written by George Mastros
	-- February 25, 2012
	-- http://sqlcop.lessthandot.com
	-- http://wiki.lessthandot.com/index.php/SQLCop_wide_table_check
	
	SET NOCOUNT ON
	
	DECLARE @Output VARCHAR(MAX)
	SET @Output = ''

	SELECT  @Output = @Output + C.TABLE_SCHEMA + '.' + C.TABLE_NAME + CHAR(13) + CHAR(10)
	FROM    INFORMATION_SCHEMA.TABLES T
			INNER JOIN INFORMATION_SCHEMA.COLUMNS C
			  ON  T.TABLE_NAME = C.TABLE_NAME
			  AND T.TABLE_SCHEMA = C.TABLE_SCHEMA
			  AND T.TABLE_TYPE = 'BASE TABLE'
			INNER JOIN systypes S
				ON C.DATA_TYPE = S.name
	WHERE  C.TABLE_SCHEMA  NOT IN ('tsa','psa', 'tSQLt','stg','discovery')

	GROUP BY C.TABLE_SCHEMA,C.TABLE_NAME
	HAVING SUM(ISNULL(NULLIF(CONVERT(BIGINT,S.length), 8000), 0) + ISNULL(NULLIF(C.CHARACTER_MAXIMUM_LENGTH, 2147483647), 0)) > 8060
	ORDER BY C.TABLE_SCHEMA,C.TABLE_NAME

	IF @Output > '' 
		BEGIN
			SET @Output = CHAR(13) + CHAR(10) 
						  + 'For more information:  '
						  + 'http://wiki.lessthandot.com/index.php/SQLCop_wide_table_check' 
						  + CHAR(13) + CHAR(10) 
						  + CHAR(13) + CHAR(10) 
						  + @Output
			EXEC tSQLt.Fail @Output
		END	
END;