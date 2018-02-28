
CREATE PROCEDURE [sqlcop].[test Tables without a primary key]
AS
BEGIN
	-- Written by George Mastros
	-- February 25, 2012
	-- http://sqlcop.lessthandot.com
	-- http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/best-practice-every-table-should-have-a
	
	SET NOCOUNT ON;
	
	DECLARE	@Output VARCHAR(MAX) = '';

	SELECT
		@Output = @Output + s.name + '.' + t.name + CHAR(13) + CHAR(10)
	FROM
		sys.tables AS t
	INNER JOIN sys.schemas AS s
		ON s.schema_id = t.schema_id
	LEFT JOIN sys.key_constraints AS k -- unique constraint is acceptable too
		ON t.object_id = k.parent_object_id
	WHERE
			k.parent_object_id IS NULL
		AND s.name NOT IN ('tSQLt', 'TestHelpers','tsa','psa','discovery')
		AND NOT (s.name = 'stg' AND t.name LIKE '%LAND%')
		AND NOT (s.name = 'tsa' AND t.name LIKE 'ics_sql%')
		AND NOT (s.name = 'dbo' AND t.name LIKE '%SchemaSnapshot')

	ORDER BY
		s.name, t.name

	RAISERROR('WARNING!! PK validation on tsa and psa schemas temporarily disabled',0,1) WITH NOWAIT;

	IF @Output > ''
		BEGIN
			SET @Output = CHAR(13) + CHAR(10) + 'For more information:  ' + 'http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/best-practice-every-table-should-have-a' + CHAR(13) + CHAR(10) + CHAR(13) + CHAR(10) + @Output
			EXEC tSQLt.Fail
				@Output
		END	
END;