IF OBJECT_ID('[dbo].[PopulateTsaToPsaLoadControlTable_NoDrop]') IS NOT NULL
	DROP PROCEDURE [dbo].[PopulateTsaToPsaLoadControlTable_NoDrop];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[PopulateTsaToPsaLoadControlTable_NoDrop]
	  @Search VARCHAR(50) = null
	, @all INT = 0
	, @Generate VARCHAR(10) = 'Full'
	, @DoMerge INT = 0
as

	--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		dbo.PopulateTsaToPsaLoadControlTable_NoDrop
DESCRIPTION:		Populate TsaToPsaLoadControlTable For either a Table, Set of Tables, or all
					It also generates the required text to append or replace the Source Control file.

INSTRUCTIONS:		@Search - You can set the @Search parameter for the SP to either 
						1. Select a single table (use full psa name)
						2. Select a set of tables (eg. Grouped by source system e.g. 'Navision'
						3. All Tables (Leave the parameter blank) and set @all = 1
					@all - This is a safety check - setting to 1 will generate the script for All tables to be merged in.
						1. Set to 0 - when this is set and there is no value passed into @Search this will cause an error
						2. Set to 1 - When this is set and the @Search isnt set - a FULL merge is carried out. All Tables are regenerated
					@Generate - You can use the @Generate to specify the output - defaults to "Full"
						1. New - only produce an output for new lines for the TsaToPsaLoadControlTable.data.sql file
						2. Full - Generate a full derived table for use in the Source Control files
						3. None - Don't Generate an output
					@DoMerge - Used to Merge the new data into the TsaToPsaLoadControlTable, Default of 0 (Don't do Merge)


				
ORIGIN DATE:		21-03-2018
ORIGINAL AUTHOR:	Stephen Lawrenson

Returns
=======
@@Error - always zero on success

Additional Notes
================

REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		01-Aug-2017		RN		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------

**********************************************************************************************************************/
	--</CommentHeader>
SET NOCOUNT ON	
BEGIN	

BEGIN TRY
	IF ISNULL(@Search,'' ) = '' AND @all = 0
		RAISERROR	('Incorrect Parameters Passed into Stored Procedure for @Search and @all', -- Message text.  
               16, -- Severity.  
               1 -- State.  
               );  
	IF UPPER(@Generate) NOT IN ('NEW', 'FULL', 'NONE')
		RAISERROR	('Incorrect Parameters Passed into Stored Procedure for @Generate', -- Message text.  
               16, -- Severity.  
               1 -- State.  
               ); 
	IF @DoMerge < 0 OR @DoMerge > 1
		RAISERROR	('Incorrect Parameters Passed into Stored Procedure for @DoMerge', -- Message text.  
               16, -- Severity.  
               1 -- State.  
               ); 

DECLARE @_sql VARCHAR(4000);
declare @_FunctionName nvarchar(255)	= quotename(object_schema_name(@@procid)) + '.' + quotename(object_name(@@procid)) ;
declare @_Error int						= 0 ;
declare @_ReturnValue int ;
declare @_Message nvarchar(512) ;
declare @_ErrorContext nvarchar(512) ;
declare @_Step varchar(128) ;

--!Create Temporary Control Table

CREATE TABLE #TsaToPsaLoadControlTable(
	[id] INT IDENTITY(1,1),
	[CreatedDate] [datetime],
	[CreatedBy] [nvarchar](128),
	[SourceDB] [nvarchar](128) ,
	[SourceSchema] [nvarchar](100) ,
	[SourceTable] [nvarchar](200) ,
	[TargetDB] [nvarchar](128),
	[TargetSchema] [nvarchar](100),
	[TargetTable] [nvarchar](200) ,
	[LoadMode] [varchar](10) ,
	[DataSourceKey] [int]  ,
	[SourcePK] [varchar](max) ,
	[TargetPK] [varchar](max) ,
	[Done] [smallint] ) 



SET @_Step = 'Temporary Control Table Generation';
SET @_sql = 
			'insert into  #TsaToPsaLoadControlTable	([CreatedDate], [CreatedBy], [SourceDB], [SourceSchema]
													, [SourceTable], [TargetDB], [TargetSchema], [TargetTable]
													, [LoadMode], [DataSourceKey], [SourcePK], [TargetPK])
			select
				getdate()		as CreatedDate
			  , system_user		as CreatedBy
			  , s.TABLE_CATALOG as SourceDB
			  , s.TABLE_SCHEMA	as SourceSchema
			  , QUOTENAME(s.TABLE_NAME)	as SourceTable
			  , t.TABLE_CATALOG as TargetDB
			  , t.TABLE_SCHEMA	as TargetSchema
			  , QUOTENAME(t.TABLE_NAME)	as TargetTable
			  , ''Full''	as LoadMode
			  , 0				as DataSourceKey
			  , cast(NULL as varchar(max)) AS SourcePK
			  , cast(NULL as varchar(max)) AS TargetPK
						
			from
				INFORMATION_SCHEMA.TABLES			  s
			left outer join INFORMATION_SCHEMA.TABLES t
				on replace(s.TABLE_NAME, ''ics_land'', '''') = replace(t.TABLE_NAME, ''ics_stg'', '''')
					and t.TABLE_SCHEMA = ''psa''
					and t.TABLE_TYPE = ''BASE TABLE''
					and t.TABLE_NAME not like ''%sample%''
			inner join sys.objects so
				ON t.TABLE_NAME = so.name
				AND SCHEMA_ID(t.TABLE_SCHEMA) = so.schema_id      
			LEFT outer join sys.extended_properties sep   
				on so.object_id = sep.major_id   
			where
				s.TABLE_SCHEMA = ''tsa''
				and sep.minor_id = 0
				and sep.name = ''IncludeInMerge''
				and sep.value = ''Y''
				and s.TABLE_TYPE = ''BASE TABLE''
				and s.TABLE_NAME not like ''%sample%'''
				+ CASE 
					WHEN ISNULL(@Search,'') = '' THEN ''';'
				ELSE ' AND s.TABLE_NAME LIKE ''%' + @Search + '%'''
				END
				+ 'ORDER BY s.TABLE_NAME;'



--!Run the SQL String created above

IF ISNULL(NULLIF(@_sql, ''),'') = ''
	RAISERROR	('No SQL String formed', -- Message text.  
               16, -- Severity.  
               1 -- State.  
               );  
ELSE 
	BEGIN
		EXEC(@_sql)
		
	END



SET @_Step = 'Load the Primary Keys'
--!Get the Primary Keys
	select
		t.PK, t.TableName
	into
		#PKTable
	from
		(
			select
				'['+replace(col_name(ic.object_id, ic.column_id),' ','_')+']' PK
				, t.TargetSchema + '.' + t.TargetTable as TableName
			from
				#TsaToPsaLoadControlTable t
			inner join sys.indexes			 as i
				on i.object_id = object_id(t.TargetSchema + '.' + t.TargetTable)
			inner join sys.index_columns	 as ic
				on i.object_id = ic.object_id
					and i.index_id = ic.index_id
			where
				1 = 1
				and i.is_primary_key = 1
				
		) t
	order by
		TableName
		, PK ;

--! Add a  row number to the table
	alter table #PKTable add id int identity(1, 1) ;
			
	declare
			@max int		  = (select		max(id) from #PKTable)
		,	@i	 int		  = 1
		,	@tn	 varchar(300)
		,	@pk	 varchar(300) = '' ;

SET @_Step = 'Update the Primary Keys in the Temporary Control Table'
--!Loop through each of the tables
	while @i <= @max
		BEGIN
			set @tn = (SELECT TableName from	#PKTable where	id = @i) ;
			set @pk = (SELECT PK from #PKTable where	id = @i) ;

			UPDATE t
				set TargetPK	= ',' + @pk + isnull(TargetPK, '')
				from
					#TsaToPsaLoadControlTable t
				where
					t.TargetSchema + '.' + t.TargetTable = @tn ;

			update t
				set SourcePK	 = ',' + @pk + isnull(SourcePK, '')
				from
					#TsaToPsaLoadControlTable t
				where
					t.SourceSchema + '.' + t.SourceTable = @tn ;
--!Increment Loop
		set @i = @i + 1 ;

	end ;

	update t
	set
			TargetPK	= substring(TargetPK, 2, len(TargetPK))
		,	SourcePK	= substring(TargetPK, 2, len(TargetPK))
	from
		#TsaToPsaLoadControlTable t ;

--!Set the DataSourceKey from the TSA table - default to 0

	SET @_Step = 'Setting DataSourceKey from dbo.DataSourceTableGroups'

	UPDATE a
	SET a.DataSourceKey = b.DataSourceKey
	FROM #TsaToPsaLoadControlTable a 
	INNER JOIN dbo.DataSourceTableGroups b
	ON 
		UPPER(b.TableFilter) COLLATE DATABASE_DEFAULT = UPPER(SUBSTRING(REPLACE(a.SourceTable, 'ics_land_', ''),2, LEN(b.TableFilter))) COLLATE DATABASE_DEFAULT

IF (SELECT COUNT(1) FROM #TsaToPsaLoadControlTable WHERE ISNULL(DataSourceKey, 0) =0) > 0
	RAISERROR	('DataSources are not set in dbo.DataSourceTableGroups', -- Message text.  
               16, -- Severity.  
               1 -- State.  
               );  
--! Generate the output clause to insert into Static Data script

SET @_Step = 'Generate the data to be included into the STATIC data'

IF @Generate = 'Full'
		SELECT -10 AS [Order], '/*Copy The following data into the dbo.TsaToPsaControlTable.data.sql Script located within the Static Data Folder*/' AS [text]
		UNION	
		SELECT -9, '/*Excluding the Order Columns */'
		UNION 
		SELECT -8, '/*Remove the leading ","		*/'
		UNION
		SELECT -7, '--'
		UNION
		SELECT 0, 'USING (VALUES'
		UNION	
		SELECT 99999999, ') AS Source ([ID],[CreatedDate],[CreatedBy],[SourceDB],[SourceSchema],[SourceTable],[TargetDB],[TargetSchema],[TargetTable],[LoadMode],[DataSourceKey],[SourcePK],[TargetPK],[Done])'
		UNION	
		SELECT ID, ',(' +	CAST(ID AS VARCHAR(10))						+ ', '		+ 
						'''' + CONVERT(VARCHAR(30), CreatedDate, 126)	+ '''' + ', '	+ 
						 '''' + CreatedBy								+ '''' + ', '	+
							'DB_NAME()'									+ ', '	+
						'''' + SourceSchema								+ '''' + ', '	+ 
						'''' + SourceTable								+ '''' + ', '	+ 
							'DB_NAME()'										 + ', '	+ 
						'''' + TargetSchema								+ '''' + ', '	+ 
						'''' + TargetTable								+ '''' + ', '	+
						'''' + LoadMode									+ '''' + ', '	+
						CAST(DataSourceKey AS VARCHAR(10))				+ ', '		+
						'''' + SourcePK									+ '''' + ','	+ 
						'''' + TargetPK									+ '''' + ','	+ 
						CAST(0 AS VARCHAR(1)) +
						') '
		FROM dbo.TsaToPsaLoadControlTable
		ORDER BY [Order]
ELSE IF @Generate = 'New'
	BEGIN
	DECLARE @_id INT = (SELECT MAX(ID) FROM dbo.TsaToPsaLoadControlTable);

	SELECT -10 AS [Order], '/*Append the following data into the dbo.TsaToPsaControlTable.data.sql Script located within the Static Data Folder*/' AS [text]
		UNION	
		SELECT -9, '/*Excluding the Order Columns */'
		UNION
		SELECT -7, '--'
		UNION	
		SELECT			ID + @_id AS [Order] 
							, ',(' +	CAST(ID + @_id AS VARCHAR(10))	+ ', '	+ 
						'''' + CONVERT(VARCHAR(30), CreatedDate, 126)	+ ''''	+ ', '	+ 
						 '''' + CreatedBy								+ ''''	+ ', '	+
							'DB_NAME()'											+ ', '	+
						'''' + SourceSchema								+ ''''	+ ', '	+ 
						'''' + SourceTable								+ ''''	+ ', '	+ 
							'DB_NAME()'											+ ', '	+ 
						'''' + TargetSchema								+ ''''	+ ', '	+ 
						'''' + TargetTable								+ ''''	+ ', '	+
						'''' + LoadMode									+ ''''	+ ', '	+
						CAST(ISNULL(DataSourceKey, 0) AS VARCHAR(10))	+ ', '	+
						'''' + SourcePK									+ '''' + ','	+ 
						'''' + TargetPK									+ '''' + ','	+ 
						CAST(0 AS VARCHAR(1)) +
						') '
		FROM #TsaToPsaLoadControlTable
		WHERE TargetTable COLLATE DATABASE_DEFAULT		 NOT IN
			(SELECT TargetTable FROM dbo.TsaToPsaLoadControlTable)
		ORDER BY [Order]
		END


SET @_Step = 'Merging the New tables into the Physical TsaToPsaControlTable'
--!Merge the data into the physical TsaToPsaControlTable

DECLARE @_tblMergeAction TABLE ([action] VARCHAR(50))


IF @DoMerge = 1
BEGIN
	MERGE dbo.TsaToPsaLoadControlTable T
	USING #TsaToPsaLoadControlTable S
	ON S.SourceSchema = T.SourceSchema COLLATE DATABASE_DEFAULT
	AND S.SourceTable = T.SourceTable COLLATE	DATABASE_DEFAULT
	WHEN MATCHED
		AND (	S.TargetSchema	<> T.TargetSchema COLLATE DATABASE_DEFAULT
			OR	S.TargetTable	<> T.TargetTable COLLATE DATABASE_DEFAULT
			OR	S.LoadMode		<> T.LoadMode COLLATE DATABASE_DEFAULT
			OR	S.DataSourceKey <> T.DataSourceKey
			OR	S.SourcePK		<> T.SourcePK COLLATE DATABASE_DEFAULT
			OR	S.TargetPK		<> T.TargetPK COLLATE DATABASE_DEFAULT)
		THEN UPDATE SET
				T.TargetSchema	= S.TargetSchema,
				T.TargetTable	= S.TargetTable,
				T.LoadMode		= S.LoadMode,
				T.DataSourceKey = S.DataSourceKey,
				T.SourcePK		= S.SourcePK,
				T.TargetPK		= S.TargetPK
	WHEN NOT MATCHED BY TARGET
		THEN INSERT (CreatedDate, CreatedBy, SourceDB, SourceSchema, SourceTable, TargetDB, TargetSchema, TargetTable, LoadMode, DataSourceKey, SourcePK, TargetPK)
		VALUES (S.CreatedDate, S.CreatedBy, S.SourceDB, S.SourceSchema, S.SourceTable, S.TargetDB, S.TargetSchema, S.TargetTable, S.LoadMode, S.DataSourceKey, S.SourcePK, S.TargetPK)
	OUTPUT $action AS [action] INTO @_tblMergeAction;

--Report on What Actions have been carried out

IF @DoMerge = 1
	SELECT CASE WHEN UPPER([action]) = 'UPDATE' THEN CAST(COUNT([action]) AS VARCHAR(10)) + ' Records Have Been updated'
				WHEN UPPER([action]) = 'INSERT' THEN CAST(COUNT([action]) AS VARCHAR(10)) + ' Records Have Been Inserted'
				ELSE 'No Action has been Carried Out'
				END AS [Merge Actions Taken]
	FROM @_tblMergeAction
	GROUP BY [action]
END

end try
begin catch

	set @_ErrorContext = 'schema validation failed at step: ' + coalesce('[' + @_Step + ']', 'NULL') ;


	exec log4.ExceptionHandler
		@ErrorContext = @_ErrorContext
		, @ErrorProcedure = @_FunctionName
		, @ErrorNumber = @_Error out
		, @ReturnMessage = @_Message out ;
end catch ;

--/////////////////////////////////////////////////////////////////////////////////////////////////
EndProc:
--/////////////////////////////////////////////////////////////////////////////////////////////////

--! Finally, throw an exception that will be detected by the caller

if @_Error > 0 raiserror(@_Message, 16, 99) ;

set nocount off ;

--! Return the value of @@ERROR (which will be zero on success)
return (@_Error) ;
end ;
GO
