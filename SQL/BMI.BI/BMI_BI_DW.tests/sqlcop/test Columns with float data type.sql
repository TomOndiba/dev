
CREATE PROCEDURE [sqlcop].[test Columns with float data type]
AS
BEGIN
	-- Written by George Mastros
	-- February 25, 2012
	-- http://sqlcop.lessthandot.com
	-- http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/do-not-use-the-float-data-type
	
	SET NOCOUNT ON
	
	DECLARE @Output VARCHAR(MAX)
	SET @Output = ''
			
	SELECT 	@Output = @Output + TABLE_SCHEMA + '.' + TABLE_NAME + '.' + COLUMN_NAME + CHAR(13) + CHAR(10)
	FROM	INFORMATION_SCHEMA.COLUMNS
	WHERE	DATA_TYPE IN ('float', 'real')
	AND TABLE_SCHEMA  NOT IN ('tsa','psa', 'tSQLt','stg','discovery')
	ORDER BY TABLE_SCHEMA,TABLE_NAME,COLUMN_NAME

	IF @Output > '' 
		BEGIN
			SET @Output = CHAR(13) + CHAR(10) 
						  + 'For more information:  '
						  + 'http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/do-not-use-the-float-data-type' 
						  + CHAR(13) + CHAR(10) 
						  + CHAR(13) + CHAR(10) 
						  + @Output
			EXEC tSQLt.Fail @Output
		END
END;