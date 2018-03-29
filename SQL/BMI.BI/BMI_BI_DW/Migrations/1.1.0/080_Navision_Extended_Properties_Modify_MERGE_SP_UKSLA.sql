-- <Migration ID="7e1d144d-e886-4904-aad4-2bf958e8a0c4" />
GO

PRINT N'Dropping constraints from [psa].[ics_stg_Navision_ROU_Standard_Purch_Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Standard_Purch_Line] DROP CONSTRAINT [PK_psa_ics_stg_Navision_ROU_Standard_Purch_Line]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Purch_Inv_Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Purch_Inv_Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purch_ Inv_Line_ExcludeFromMerge]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_BGR_Purch_Inv_Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Purch_Inv_Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purch_Inv_Line_IsDuplicate]
GO
PRINT N'Dropping constraints from [tsa].[ics_land_Navision_ROU_Standard_Purch_Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_ROU_Standard_Purch_Line] DROP CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Standard_Purch_Line_ExcludedFromMerge]
GO
PRINT N'Altering [privy].[TsaToPsaBuildAndRunMerge]'
GO
DROP PROCEDURE IF EXISTS  [privy].[TsaToPsaBuildAndRunMerge]
GO
CREATE procedure [privy].[TsaToPsaBuildAndRunMerge]
(
	@RunType		  varchar(10)
  , @SourceTableName  varchar(200)
  , @SourceSchemaName varchar(200)
  , @TargetTableName  varchar(200)
  , @TargetSchemaName varchar(200)
  , @LoadDateTime	  varchar(50) = null
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		privy.TsaToPsaBuildAndRunMerge
DESCRIPTION:		run merge statement dynamically for loading data from tsa to psa
ORIGIN DATE:		03-Aug-2017
ORIGINAL AUTHOR:	Razia Nazir

--Returns
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
001		18-Sep-2017		RN		N/A		Cast numeric values to varchar(255) for merge statemnet isnull operation
002		23-Mar-2017		SL		N/A		Added COLUMNPROPERTY(OBJECT_ID(TABLE_SCHEMA+'.'+TABLE_NAME),COLUMN_NAME,'IsComputed') = 0
										To make sure computed columns are excluded if used in the tables								
   

**********************************************************************************************************************/
--</CommentHeader>
begin
	set nocount on;

	begin try

	if object_id(N'#TableStructure') is not null drop table #TableStructure ;

	if object_id(N'#PkeyTable') is not null drop table #PkeyTable ;
			
	declare @STableName nvarchar(200) = @SourceSchemaName + '.' + @SourceTableName ;
	declare @TTableName nvarchar(200) = @TargetSchemaName + '.' + @TargetTableName ;
	declare @sql nvarchar(max) = '' ;
	declare @_LoadDateTime varchar(50) = isnull(@LoadDateTime, getdate()) ;
	declare @maxid int=null;
	declare @_FunctionName nvarchar(255) = quotename(object_schema_name(@@procid)) + '.' + quotename(object_name(@@procid)) ;
	declare @_Error int = 0 ;
	declare @_ReturnValue int ;
	declare @_Message nvarchar(512) ;
	declare @_ErrorContext nvarchar(512) ;
	declare @_Step varchar(255) ;

	declare @SEVERITY_INFORMATION int = 256;
	declare @_JobName nvarchar(128) = 'privy.BuildAndRunMerge SP' ;
	declare	@_ExceptionId int
	declare @_Severity smallint = @SEVERITY_INFORMATION;
	declare @_ProgressLog nvarchar(max);
	declare	@_ProgressMessage varchar(2000)
	declare	@_StepStartTime datetime



	set @_Step = 'Prepare data for merge dynamic statement' ;
			
	select
		COLUMN_NAME ColumnName, DATA_TYPE ColumnDataType 
	into
		#TableStructure
	from
		INFORMATION_SCHEMA.COLUMNS
	where
		TABLE_SCHEMA + '.[' + TABLE_NAME+']' = @STableName 
		AND COLUMNPROPERTY(OBJECT_ID(TABLE_SCHEMA+'.'+TABLE_NAME),COLUMN_NAME,'IsComputed') = 0
    ;

			
	alter table #TableStructure add id int identity(1, 1) ;

	declare @i int = 1 ;
	declare @insertcolumnstring nvarchar(max) = '' ; ---prepares insert list of column
	declare @updatecolumnstring nvarchar(max) = '' ; --prepares update list of column
	declare @columnname nvarchar(255) = '' ;
	declare @updatesetcolumnstring nvarchar(max) = '' ; --prepares set list of columns for update statement
	declare @pkcolumns varchar(500) = '' ;
	declare @pkcolumnsTemp varchar(500) = '' ;
	declare @columndatatype varchar(500) = '' ;

	select
		col_name(ic.object_id, ic.column_id) as PK
	into
		#PkeyTable
	from
		sys.indexes				 as i
	inner join sys.index_columns as ic
		on i.object_id = ic.object_id
			and i.index_id = ic.index_id
	where
		1 = 1
		and i.is_primary_key = 1
		and ic.object_id = object_id(replace(replace(@TTableName,'[',''),']','')) ;
						
	alter table #PkeyTable add id int identity(1, 1) ;

	set @maxid  = (select max(id) from #PkeyTable) ;
		
	while (@i <=@maxid )
		begin

			set @pkcolumnsTemp =(select '['+PK+']' from dbo.#PkeyTable where id=@i );
				
			if (@maxid>1)

				begin
					set @pkcolumns= ' and '+'s.'+@pkcolumnsTemp + '=t.'+@pkcolumnsTemp + @pkcolumns
				end
			
			if (@maxid=1)
				begin
					set @pkcolumns= ' and '+'s.'+@pkcolumnsTemp + '=t.'+@pkcolumnsTemp
				end

			set @i=@i+1;
	end
	
	set @pkcolumns= substring(@pkcolumns,5,len(@pkcolumns))
			
    set @i=1;
	set @maxid  = (select max(id) from #TableStructure) ;
	while (@i <= @maxid)
		begin

			set @columnname =(select ColumnName from #TableStructure where id = @i) ;
			set @columndatatype=(select ColumnDataType from #TableStructure where id = @i) ;
								
			if (@columnname not in ('EtlRecordId', 'IsIncomplete', 'EtlUpdatedOn', 'EtlDeletedOn', 'EtlDeletedBy', 'IsDeleted','ExcludeFromMerge','IsDuplicate'))
				set @insertcolumnstring = @insertcolumnstring + ',' + '['+@columnname+']' ;
															
			if ( @columnname not in  ( select	PK from #PkeyTable )  and 	@columnname not in ('EtlRecordId', 'IsIncomplete', 'EtlUpdatedOn', 'EtlUpdatedBy', 'EtlDeletedOn', 'EtlDeletedBy', 'IsDeleted','ExcludeFromMerge','IsDuplicate') )
				set @updatesetcolumnstring = @updatesetcolumnstring + ' , ' + 't.[' + @columnname + ']=' + 's.[' + @columnname+']' ;

			if (@columnname not in   (  select	PK from #PkeyTable  )  and	@columnname not in	('EtlBatchRunId', 'EtlStepRunId', 'EtlThreadRunId', 'DataSourceKey', 'EtlCreatedOn', 'EtlCreatedBy', 'EtlSourceTable', 'EtlRecordId', 'IsIncomplete', 'EtlUpdatedOn', 'EtlUpdatedBy', 'EtlDeletedOn', 'EtlDeletedBy', 'IsDeleted'	,'ExcludeFromMerge','IsDuplicate') )
				begin 

					if (@columndatatype in ('time','datetime','varchar','date','datetime2','smalldatetime','char','nvarchar','nchar'))
						set @updatecolumnstring = @updatecolumnstring + ' or ' + 'isnull(s.[' + @columnname + '], '''')<>' + 'isnull(t.[' + @columnname +'],'''')';
				
					if (@columndatatype in ('int','float','real','bigint','tinyint','decimal','smallint','numeric','bit','money','smallmoney'))
						set @updatecolumnstring = @updatecolumnstring + ' or ' + 'isnull(cast(s.[' + @columnname + '] as varchar(255)),'''') <>' + 'isnull(cast(t.[' + @columnname+'] as varchar(255)),'''')' ;
				end 
					
			set @i = @i + 1 ;
		end ;

	set @insertcolumnstring = substring(@insertcolumnstring, 2, len(@insertcolumnstring)) ;
	set @updatesetcolumnstring = substring(@updatesetcolumnstring, 3, len(@updatesetcolumnstring)) ;
	set @updatecolumnstring = substring(@updatecolumnstring, 4, len(@updatecolumnstring)) ;
	set @updatecolumnstring = '( ' + @updatecolumnstring + ' )' ;

	set @_StepStartTime = getdate();
	set @_Step = 'Merge statement for Delta ' ;
	
			
	if @RunType = 'Delta'
		begin

			set @sql = 'merge ' + @TTableName + ' t using ' + @STableName + ' s on ' + @pkcolumns 
						+ ' when not matched by target and ExcludeFromMerge =0 then 	insert ('	+ @insertcolumnstring + ',EtlUpdatedBy,EtlUpdatedOn' + ') values('
						+ @insertcolumnstring + ',EtlCreatedBy,' + '''' + @_LoadDateTime + '''' + ')' + 'when matched and ExcludeFromMerge =0 and ' + @updatecolumnstring
						+ ' then update set  ' + @updatesetcolumnstring + ', t.EtlUpdatedOn=' + '''' + @_LoadDateTime + ''''
						+ ', t.EtlUpdatedBy=s.EtlCreatedBy' + ';' ;
		end ;
			
			
	set @_Step = 'Merge statement for Full ' ;
		
	if @RunType = 'Full' ---soft delete
		begin

			set @sql = 'merge ' + @TTableName + ' t using ' + @STableName + ' s on ' + @pkcolumns 
						+ ' when not matched by target and ExcludeFromMerge =0
						then 	insert ('	+ @insertcolumnstring + ',EtlUpdatedBy,EtlUpdatedOn' + ') values('
						+ @insertcolumnstring + ',EtlCreatedBy,' + '''' + @_LoadDateTime + '''' + ')' + ' when matched  and ExcludeFromMerge =0 and ' + @updatecolumnstring
						+ ' then update set  ' + @updatesetcolumnstring + ', t.EtlUpdatedOn=' + '''' + @_LoadDateTime + ''''
						+ ', t.EtlUpdatedBy=s.EtlCreatedBy' + ' when not matched by source then update set  t.EtlDeletedOn=' + '''' + @_LoadDateTime + ''''
						+ ', t.EtlDeletedBy=EtlCreatedBy, t.IsDeleted='+ ''''+ 'Y'+ '''' + ';' ;
		end ;

	set @_Step = 'Execute Merge statement ' ;


	execute sp_executesql @sql ;

	
	set @_Message = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@@ROWCOUNT as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
						
	if object_id(N'#TableStructure') is not null drop table #TableStructure ;

	if object_id(N'#PkeyTable') is not null drop table #PkeyTable ;

	end try               
	begin catch

		set @_ErrorContext = 'Merge statement preparation failed at step: ' + coalesce('[' + @_Step + ']', 'NULL') ;

		exec log4.ExceptionHandler
			@ErrorContext = @_ErrorContext
			, @ErrorProcedure = @_FunctionName
			, @ErrorNumber = @_Error out
			, @ReturnMessage = @_Message out
			, @ExceptionId    = @_ExceptionId out;
	end catch ;

--/////////////////////////////////////////////////////////////////////////////////////////////////
	EndProc:
--/////////////////////////////////////////////////////////////////////////////////////////////////

		exec log4.JournalWriter
				  @Task = @_JobName
				, @FunctionName = @_FunctionName
				, @StepInFunction = @_Step
				, @MessageText = @_Message
				, @ExtraInfo = @sql
				, @Severity = @_Severity
				, @ExceptionId = @_ExceptionId



	--! Finally, throw an exception that will be detected by the caller
	if @_Error > 0 raiserror(@_Message, 16, 99) ;

	set nocount off ;

	--! Return the value of @@ERROR (which will be zero on success)
	return (@_Error) ;
		
end ;
GO
PRINT N'Creating [dbo].[PopulateTsaToPsaLoadControlTable_NoDrop]'
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
PRINT N'Creating [tsa].[ics_land_Navision_BGR_Purch_Line_Discount]'
GO
CREATE TABLE [tsa].[ics_land_Navision_BGR_Purch_Line_Discount]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purch_Line_Discount_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purch_Line_Discount_IsDuplicate] DEFAULT ((0)),
[Currency_Code] [varchar] (10) NULL,
[Ending_Date] [datetime] NULL,
[Item_No_] [varchar] (20) NULL,
[Line_Discount_%] [decimal] (38, 20) NULL,
[Minimum_Quantity] [decimal] (38, 20) NULL,
[Starting_Date] [datetime] NULL,
[Unit_of_Measure_Code] [varchar] (10) NULL,
[Variant_Code] [varchar] (10) NULL,
[Vendor_No_] [varchar] (20) NULL,
[timestamp] [varchar] (30) NULL
)
GO
PRINT N'Creating [tsa].[ics_land_Navision_ROU_Purch_Code]'
GO
CREATE TABLE [tsa].[ics_land_Navision_ROU_Purch_Code]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Purchase_Code_ExcludedFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Purch_Code_IsDuplicate] DEFAULT ((0)),
[timestamp] [varbinary] (8) NULL,
[Code] [varchar] (10) NOT NULL,
[Description] [varchar] (50) NULL,
[Currency Code] [varchar] (10) NULL
)
GO
PRINT N'Altering [tsa].[ics_land_Navision_ROU_Standard_Purch_Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_ROU_Standard_Purch_Line] ADD
[Line_No_] [int] NULL,
[Variant_Code] [varchar] (10) NULL
GO
ALTER TABLE [tsa].[ics_land_Navision_ROU_Standard_Purch_Line] DROP
COLUMN [Standard Purchase Code],
COLUMN [Line No_]
GO
EXEC sp_rename N'[tsa].[ics_land_Navision_ROU_Standard_Purch_Line].[Amount Excl_ VAT]', N'Amount_Excl__VAT', N'COLUMN'
GO
EXEC sp_rename N'[tsa].[ics_land_Navision_ROU_Standard_Purch_Line].[Shortcut Dimension 1 Code]', N'Shortcut_Dimension_1_Code', N'COLUMN'
GO
EXEC sp_rename N'[tsa].[ics_land_Navision_ROU_Standard_Purch_Line].[Shortcut Dimension 2 Code]', N'Shortcut_Dimension_2_Code', N'COLUMN'
GO
EXEC sp_rename N'[tsa].[ics_land_Navision_ROU_Standard_Purch_Line].[Variant Code]', N'Standard_Purchase_Code', N'COLUMN'
GO
EXEC sp_rename N'[tsa].[ics_land_Navision_ROU_Standard_Purch_Line].[Unit of Measure Code]', N'Unit_of_Measure_Code', N'COLUMN'
GO
ALTER TABLE [tsa].[ics_land_Navision_ROU_Standard_Purch_Line] ALTER COLUMN [timestamp] [varbinary] (max) NULL
GO
PRINT N'Altering [psa].[ics_stg_Navision_ROU_Standard_Purch_Line]'
GO
EXEC sp_rename N'[psa].[ics_stg_Navision_ROU_Standard_Purch_Line].[Amount Excl_ VAT]', N'Amount_Excl__VAT', N'COLUMN'
GO
EXEC sp_rename N'[psa].[ics_stg_Navision_ROU_Standard_Purch_Line].[Line No_]', N'Line_No_', N'COLUMN'
GO
EXEC sp_rename N'[psa].[ics_stg_Navision_ROU_Standard_Purch_Line].[Shortcut Dimension 1 Code]', N'Shortcut_Dimension_1_Code', N'COLUMN'
GO
EXEC sp_rename N'[psa].[ics_stg_Navision_ROU_Standard_Purch_Line].[Shortcut Dimension 2 Code]', N'Shortcut_Dimension_2_Code', N'COLUMN'
GO
EXEC sp_rename N'[psa].[ics_stg_Navision_ROU_Standard_Purch_Line].[Standard Purchase Code]', N'Standard_Purchase_Code', N'COLUMN'
GO
EXEC sp_rename N'[psa].[ics_stg_Navision_ROU_Standard_Purch_Line].[Unit of Measure Code]', N'Unit_of_Measure_Code', N'COLUMN'
GO
EXEC sp_rename N'[psa].[ics_stg_Navision_ROU_Standard_Purch_Line].[Variant Code]', N'Variant_Code', N'COLUMN'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Standard_Purch_Line] ALTER COLUMN [timestamp] [varbinary] (max) NULL
GO
PRINT N'Creating primary key [PK_psa_ics_stg_Navision_ROU_Standard_Purch_Line] on [psa].[ics_stg_Navision_ROU_Standard_Purch_Line]'
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Standard_Purch_Line] ADD CONSTRAINT [PK_psa_ics_stg_Navision_ROU_Standard_Purch_Line] PRIMARY KEY CLUSTERED  ([Line_No_], [Standard_Purchase_Code])
GO
PRINT N'Creating primary key [PK_DataSourceTableGroups] on [dbo].[DataSourceTableGroups]'
GO
ALTER TABLE [dbo].[DataSourceTableGroups] ADD CONSTRAINT [PK_DataSourceTableGroups] PRIMARY KEY CLUSTERED  ([ROWID])
GO
PRINT N'Adding constraints to [tsa].[ics_land_Navision_BGR_Purch_Inv_Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Purch_Inv_Line] ADD CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purch_ Inv_ Line_ExcludeFromMerge] DEFAULT ((0)) FOR [ExcludeFromMerge]
GO
ALTER TABLE [tsa].[ics_land_Navision_BGR_Purch_Inv_Line] ADD CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purch_ Inv_ Line_IsDuplicate] DEFAULT ((0)) FOR [IsDuplicate]
GO
PRINT N'Adding constraints to [tsa].[ics_land_Navision_ROU_Standard_Purch_Line]'
GO
ALTER TABLE [tsa].[ics_land_Navision_ROU_Standard_Purch_Line] ADD CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Standard_Purch_Line_ExcludeFromMerge] DEFAULT ((0)) FOR [ExcludeFromMerge]
GO
