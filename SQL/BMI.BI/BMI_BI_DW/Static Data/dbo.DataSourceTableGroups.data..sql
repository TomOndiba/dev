/*
The DataSourceTableGroups Table is used for matching Table Names to Data Source Keys.
It should also be used to define table names by populating the columns

ERP_System			- The type of Source System (SAP - Navision)
Source_Company		- If there are multiple companies being extracted with different DataSourceKey Values
Source_Country		- The ISO country code for the source Country
Subject_Area		- The area the data is for (Sales, Purchase etc.)

Not all columns are required to be filled in (we had to deal with existing table names) but it would be better with more than less

The table name is built up as
[ERP_System]_[Source_Company]_{Source_Country]_[Subject_Area]

with relevant fields and "_" removed on nulls
*/

; WITH CTE_DSTG AS (
	SELECT [DataSourceKey], [ERP_System], [Source_Company], [Source_Country], [Subject_Area]
	FROM dbo.DataSourceTableGroups)

MERGE CTE_DSTG AS T
USING (VALUES 
		(100113, 'M3V10gen', NULL, 'POL', NULL)
	 ,	(100140, 'M3V10ved', NULL, 'POL', NULL)
	 ,	(100141, 'M3V10vil', NULL, 'POL', NULL)
	 ,	(100139, 'Navision', NULL, 'BGR', NULL)
	 ,	(100138, 'Navision', NULL, 'ROU', NULL)
	 ,	(100101, 'SAP', NULL, 'GBR', NULL)
	 ,	(100104, 'SAP', NULL, 'SVK', NULL)
	 ,	(100151, 'Symfonia', NULL, NULL, NULL)
	 ,	(100105, 'aspect4', NULL, NULL, NULL)
	 ,	(100142, 'baan', NULL, NULL, NULL)
	 ,	(100131, 'cegid', 'comp', 'fra', 'procure')
	 ,	(100129, 'cegid', 'poly', 'fra', 'procure')
	 ,	(100147, 'iScala', NULL, 'HUN', NULL)
	 ,	(100148, 'ibs', NULL, 'est', 'procure')
	 ,	(100112, 'ibs', NULL, 'fin', 'procure')
	 ,	(100149, 'ibs', NULL, 'lat', 'procure')
	 ,	(100150, 'ibs', NULL, 'lit', 'procure')
	 ,	(100144, 'm3', NULL, null, null)
	 ,	(100145, 'm3v7', NULL, null, null)
	 ,	(100146, 'movex', NULL, null, null)
	 )	AS S ([DataSourceKey], [ERP_System], [Source_Company], [Source_Country], [Subject_Area])
ON T.DataSourceKey = S.DataSourceKey
WHEN MATCHED
	AND 
		(	S.ERP_System <> T.ERP_System
		OR	S.Source_Company <> T.Source_Company
		OR	S.Source_Country <> T.Source_Country
		OR	S.Subject_Area <> T.Subject_Area)
	THEN UPDATE
		SET T.ERP_System = S.ERP_System,
			T.Source_Company = S.Source_Company,
			T.Source_Country = S.Source_Country,
			T.Subject_Area = S.Subject_Area

WHEN NOT MATCHED BY TARGET
	THEN INSERT 
			([DataSourceKey], [ERP_System], [Source_Company], [Source_Country],  [Subject_Area])
	VALUES 
			(S.[DataSourceKey], S.[ERP_System], S.[Source_Company], S.[Source_Country],  [Subject_Area]);
GO
DECLARE @mergeError int
 , @mergeCount int
SELECT @mergeError = @@ERROR, @mergeCount = @@ROWCOUNT
IF @mergeError <> 0
 BEGIN
	PRINT 'ERROR OCCURRED IN MERGE FOR [dbo].[DataSourceTableGroups]. Rows affected: ' + CAST(@mergeCount AS VARCHAR(100)); -- SQL should always return zero rows affected
 END
ELSE
 BEGIN
	PRINT '[dbo].[TsaToPsaLoadControlTable] rows affected by MERGE: ' + CAST(@mergeCount AS VARCHAR(100));
 END
GO