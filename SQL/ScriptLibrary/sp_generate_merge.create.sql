--!
--! Taken from https://github.com/readyroll/generate-sql-merge
--!
set nocount on
go

print 'Using Master database'
use master
go

print 'Checking for the existence of this procedure'
if (select object_id('sp_generate_merge','P')) is not null --means, the procedure already exists
 begin
 print 'Procedure already exists. So, dropping it'
 drop proc sp_generate_merge
 end
go

--Turn system object marking on

create proc sp_generate_merge
(
 @table_name varchar(776), -- The table/view for which the MERGE statement will be generated using the existing data
 @target_table varchar(776) = null, -- Use this parameter to specify a different table name into which the data will be inserted/updated/deleted
 @from varchar(800) = null, -- Use this parameter to filter the rows based on a filter condition (using WHERE)
 @include_timestamp bit = 0, -- Specify 1 for this parameter, if you want to include the TIMESTAMP/ROWVERSION column's data in the MERGE statement
 @debug_mode bit = 0, -- If @debug_mode is set to 1, the SQL statements constructed by this procedure will be printed for later examination
 @schema varchar(64) = null, -- Use this parameter if you are not the owner of the table
 @ommit_images bit = 0, -- Use this parameter to generate MERGE statement by omitting the 'image' columns
 @ommit_identity bit = 0, -- Use this parameter to ommit the identity columns
 @top int = null, -- Use this parameter to generate a MERGE statement only for the TOP n rows
 @cols_to_include varchar(8000) = null, -- List of columns to be included in the MERGE statement
 @cols_to_exclude varchar(8000) = null, -- List of columns to be excluded from the MERGE statement
 @update_only_if_changed bit = 1, -- When 1, only performs an UPDATE operation if an included column in a matched row has changed.
 @delete_if_not_matched bit = 1, -- When 1, deletes unmatched source rows from target, when 0 source rows will only be used to update existing rows or insert new.
 @disable_constraints bit = 0, -- When 1, disables foreign key constraints and enables them after the MERGE statement
 @ommit_computed_cols bit = 0, -- When 1, computed columns will not be included in the MERGE statement
 @include_use_db bit = 1, -- When 1, includes a USE [DatabaseName] statement at the beginning of the generated batch
 @results_to_text bit = 0, -- When 1, outputs results to grid/messages window. When 0, outputs MERGE statement in an XML fragment.
 @include_rowsaffected bit = 1, -- When 1, a section is added to the end of the batch which outputs rows affected by the MERGE
 @nologo bit = 0, -- When 1, the "About" comment is suppressed from output
 @batch_separator varchar(50) = 'GO' -- Batch separator to use
)
as
begin

/***********************************************************************************************************
Procedure: sp_generate_merge (Version 0.93)
 (Adapted by Daniel Nolan for SQL Server 2008/2012)
Adapted from: sp_generate_inserts (Build 22) 
 (Copyright © 2002 Narayana Vyas Kondreddi. All rights reserved.)
Purpose: To generate a MERGE statement from existing data, which will INSERT/UPDATE/DELETE data based
 on matching primary key values in the source/target table.
 
 The generated statements can be executed to replicate the data in some other location.
 
 Typical use cases:
 * Generate statements for static data tables, store the .SQL file in source control and use 
 it as part of your Dev/Test/Prod deployment. The generated statements are re-runnable, so 
 you can make changes to the file and migrate those changes between environments.
 
 * Generate statements from your Production tables and then run those statements in your 
 Dev/Test environments. Schedule this as part of a SQL Job to keep all of your environments 
 in-sync.
 
 * Enter test data into your Dev environment, and then generate statements from the Dev
 tables so that you can always reproduce your test database with valid sample data.
 
Written by: Narayana Vyas Kondreddi
 http://vyaskn.tripod.com
 Daniel Nolan
 http://danere.com
 @dan3r3
Acknowledgements (sp_generate_merge):
 Nathan Skerl -- StackOverflow answer that provided a workaround for the output truncation problem
 http://stackoverflow.com/a/10489767/266882
 Bill Gibson -- Blog that detailed the static data table use case; the inspiration for this proc
 http://blogs.msdn.com/b/ssdt/archive/2012/02/02/including-data-in-an-sql-server-database-project.aspx
 
 Bill Graziano -- Blog that provided the groundwork for MERGE statement generation
 http://weblogs.sqlteam.com/billg/archive/2011/02/15/generate-merge-statements-from-a-table.aspx 
Acknowledgements (sp_generate_inserts):
 Divya Kalra -- For beta testing
 Mark Charsley -- For reporting a problem with scripting uniqueidentifier columns with NULL values
 Artur Zeygman -- For helping me simplify a bit of code for handling non-dbo owned tables
 Joris Laperre -- For reporting a regression bug in handling text/ntext columns
Tested on: SQL Server 2008 (10.50.1600), SQL Server 2012 (11.0.2100)
Date created: January 17th 2001 21:52 GMT
Modified: May 1st 2002 19:50 GMT
Last Modified: September 27th 2012 10:00 AEDT
Email: dan@danere.com, vyaskn@hotmail.com
NOTE: This procedure may not work with tables with a large number of columns (> 500).
 Results can be unpredictable with huge text columns or SQL Server 2000's sql_variant data types
 IMPORTANT: This procedure has not been extensively tested with international data (Extended characters or Unicode). If needed
 you might want to convert the datatypes of character variables in this procedure to their respective unicode counterparts
 like nchar and nvarchar
Get Started: Ensure that your SQL client is configured to send results to grid (default SSMS behaviour).
This ensures that the generated MERGE statement can be output in full, getting around SSMS's 4000 nchar limit.
After running this proc, click the hyperlink within the single row returned to copy the generated MERGE statement.
Example 1: To generate a MERGE statement for table 'titles':
 
 EXEC sp_generate_merge 'titles'
Example 2: To generate a MERGE statement for 'titlesCopy' table from 'titles' table:
 EXEC sp_generate_merge 'titles', 'titlesCopy'
Example 3: To generate a MERGE statement for table 'titles' that will unconditionally UPDATE matching rows 
 (ie. not perform a "has data changed?" check prior to going ahead with an UPDATE):
 
 EXEC sp_generate_merge 'titles', @update_only_if_changed = 0
Example 4: To generate a MERGE statement for 'titles' table for only those titles 
 which contain the word 'Computer' in them:
 NOTE: Do not complicate the FROM or WHERE clause here. It's assumed that you are good with T-SQL if you are using this parameter
 EXEC sp_generate_merge 'titles', @from = "from titles where title like '%Computer%'"
Example 5: To specify that you want to include TIMESTAMP column's data as well in the MERGE statement:
 (By default TIMESTAMP column's data is not scripted)
 EXEC sp_generate_merge 'titles', @include_timestamp = 1
Example 6: To print the debug information:
 EXEC sp_generate_merge 'titles', @debug_mode = 1
Example 7: If the table is in a different schema to the default, use @schema parameter to specify the schema name
 To use this option, you must have SELECT permissions on that table
 EXEC sp_generate_merge 'Nickstable', @schema = 'Nick'
Example 8: To generate a MERGE statement for the rest of the columns excluding images
 EXEC sp_generate_merge 'imgtable', @ommit_images = 1
Example 9: To generate a MERGE statement excluding (omitting) IDENTITY columns:
 (By default IDENTITY columns are included in the MERGE statement)
 EXEC sp_generate_merge 'mytable', @ommit_identity = 1
Example 10: To generate a MERGE statement for the TOP 10 rows in the table:
 
 EXEC sp_generate_merge 'mytable', @top = 10
Example 11: To generate a MERGE statement with only those columns you want:
 
 EXEC sp_generate_merge 'titles', @cols_to_include = "'title','title_id','au_id'"
Example 12: To generate a MERGE statement by omitting certain columns:
 
 EXEC sp_generate_merge 'titles', @cols_to_exclude = "'title','title_id','au_id'"
Example 13: To avoid checking the foreign key constraints while loading data with a MERGE statement:
 
 EXEC sp_generate_merge 'titles', @disable_constraints = 1
Example 14: To exclude computed columns from the MERGE statement:
 EXEC sp_generate_merge 'MyTable', @ommit_computed_cols = 1
 
***********************************************************************************************************/

set nocount on


--Making sure user only uses either @cols_to_include or @cols_to_exclude
if ((@cols_to_include is not null) and (@cols_to_exclude is not null))
 begin
 raiserror('Use either @cols_to_include or @cols_to_exclude. Do not use both the parameters at once',16,1)
 return -1 --Failure. Reason: Both @cols_to_include and @cols_to_exclude parameters are specified
 end


--Making sure the @cols_to_include and @cols_to_exclude parameters are receiving values in proper format
if ((@cols_to_include is not null) and (patindex('''%''',@cols_to_include) = 0))
 begin
 raiserror('Invalid use of @cols_to_include property',16,1)
 print 'Specify column names surrounded by single quotes and separated by commas'
 print 'Eg: EXEC sp_generate_merge titles, @cols_to_include = "''title_id'',''title''"'
 return -1 --Failure. Reason: Invalid use of @cols_to_include property
 end

if ((@cols_to_exclude is not null) and (patindex('''%''',@cols_to_exclude) = 0))
 begin
 raiserror('Invalid use of @cols_to_exclude property',16,1)
 print 'Specify column names surrounded by single quotes and separated by commas'
 print 'Eg: EXEC sp_generate_merge titles, @cols_to_exclude = "''title_id'',''title''"'
 return -1 --Failure. Reason: Invalid use of @cols_to_exclude property
 end


--Checking to see if the database name is specified along wih the table name
--Your database context should be local to the table for which you want to generate a MERGE statement
--specifying the database name is not allowed
if (parsename(@table_name,3)) is not null
 begin
 raiserror('Do not specify the database name. Be in the required database and just specify the table name.',16,1)
 return -1 --Failure. Reason: Database name is specified along with the table name, which is not allowed
 end


--Checking for the existence of 'user table' or 'view'
--This procedure is not written to work on system tables
--To script the data in system tables, just create a view on the system tables and script the view instead
if @schema is null
 begin
 if not exists (select 1 from INFORMATION_SCHEMA.TABLES where TABLE_NAME = @table_name and (TABLE_TYPE = 'BASE TABLE' or TABLE_TYPE = 'VIEW') and TABLE_SCHEMA = schema_name())
 begin
 raiserror('User table or view not found.',16,1)
 print 'You may see this error if the specified table is not in your default schema (' + schema_name() + '). In that case use @schema parameter to specify the schema name.'
 print 'Make sure you have SELECT permission on that table or view.'
 return -1 --Failure. Reason: There is no user table or view with this name
 end
 end
else
 begin
 if not exists (select 1 from INFORMATION_SCHEMA.TABLES where TABLE_NAME = @table_name and (TABLE_TYPE = 'BASE TABLE' or TABLE_TYPE = 'VIEW') and TABLE_SCHEMA = @schema)
 begin
 raiserror('User table or view not found.',16,1)
 print 'Make sure you have SELECT permission on that table or view.'
 return -1 --Failure. Reason: There is no user table or view with this name 
 end
 end


--Variable declarations
declare @Column_ID int, 
 @Column_List varchar(8000), 
 @Column_List_For_Update varchar(8000), 
 @Column_List_For_Check varchar(8000), 
 @Column_Name varchar(128), 
 @Column_Name_Unquoted varchar(128), 
 @Data_Type varchar(128), 
 @Actual_Values nvarchar(max), --This is the string that will be finally executed to generate a MERGE statement
 @IDN varchar(128), --Will contain the IDENTITY column's name in the table
 @Target_Table_For_Output varchar(776),
 @Source_Table_Qualified varchar(776)
 
 

--Variable Initialization
set @IDN = ''
set @Column_ID = 0
set @Column_Name = ''
set @Column_Name_Unquoted = ''
set @Column_List = ''
set @Column_List_For_Update = ''
set @Column_List_For_Check = ''
set @Actual_Values = ''

--Variable Defaults
if @schema is null
 begin
 set @Target_Table_For_Output = quotename(coalesce(@target_table, @table_name))
 end
else
 begin
 set @Target_Table_For_Output = quotename(@schema) + '.' + quotename(coalesce(@target_table, @table_name))
 end

set @Source_Table_Qualified = quotename(coalesce(@schema,schema_name())) + '.' + quotename(@table_name)

--To get the first column's ID
select @Column_ID = min(ORDINAL_POSITION) 
from INFORMATION_SCHEMA.COLUMNS (nolock) 
where TABLE_NAME = @table_name
and TABLE_SCHEMA = coalesce(@schema, schema_name())


--Loop through all the columns of the table, to get the column names and their data types
while @Column_ID is not null
 begin
 select @Column_Name = quotename(COLUMN_NAME), 
 @Column_Name_Unquoted = COLUMN_NAME,
 @Data_Type = DATA_TYPE 
 from INFORMATION_SCHEMA.COLUMNS (nolock) 
 where ORDINAL_POSITION = @Column_ID
 and TABLE_NAME = @table_name
 and TABLE_SCHEMA = coalesce(@schema, schema_name())

 if @cols_to_include is not null --Selecting only user specified columns
 begin
 if charindex( '''' + substring(@Column_Name,2,len(@Column_Name)-2) + '''',@cols_to_include) = 0 
 begin
 goto SKIP_LOOP
 end
 end

 if @cols_to_exclude is not null --Selecting only user specified columns
 begin
 if charindex( '''' + substring(@Column_Name,2,len(@Column_Name)-2) + '''',@cols_to_exclude) <> 0 
 begin
 goto SKIP_LOOP
 end
 end

 --Making sure to output SET IDENTITY_INSERT ON/OFF in case the table has an IDENTITY column
 if (select columnproperty( object_id(@Source_Table_Qualified),substring(@Column_Name,2,len(@Column_Name) - 2),'IsIdentity')) = 1 
 begin
 if @ommit_identity = 0 --Determing whether to include or exclude the IDENTITY column
 set @IDN = @Column_Name
 else
 goto SKIP_LOOP 
 end
 
 --Making sure whether to output computed columns or not
 if @ommit_computed_cols = 1
 begin
 if (select columnproperty( object_id(@Source_Table_Qualified),substring(@Column_Name,2,len(@Column_Name) - 2),'IsComputed')) = 1 
 begin
 goto SKIP_LOOP 
 end
 end
 
 --Tables with columns of IMAGE data type are not supported for obvious reasons
 if(@Data_Type in ('image'))
 begin
 if (@ommit_images = 0)
 begin
 raiserror('Tables with image columns are not supported.',16,1)
 print 'Use @ommit_images = 1 parameter to generate a MERGE for the rest of the columns.'
 return -1 --Failure. Reason: There is a column with image data type
 end
 else
 begin
 goto SKIP_LOOP
 end
 end

 --Determining the data type of the column and depending on the data type, the VALUES part of
 --the MERGE statement is generated. Care is taken to handle columns with NULL values. Also
 --making sure, not to lose any data from flot, real, money, smallmomey, datetime columns
 set @Actual_Values = @Actual_Values +
 case 
 when @Data_Type in ('char','nchar') 
 then 
 'COALESCE('''''''' + REPLACE(RTRIM(' + @Column_Name + '),'''''''','''''''''''')+'''''''',''NULL'')'
 when @Data_Type in ('varchar','nvarchar') 
 then 
 'COALESCE('''''''' + REPLACE(' + @Column_Name + ','''''''','''''''''''')+'''''''',''NULL'')'
 when @Data_Type in ('datetime','smalldatetime','datetime2','date') 
 then 
 'COALESCE('''''''' + RTRIM(CONVERT(char,' + @Column_Name + ',127))+'''''''',''NULL'')'
 when @Data_Type in ('uniqueidentifier') 
 then 
 'COALESCE('''''''' + REPLACE(CONVERT(char(36),RTRIM(' + @Column_Name + ')),'''''''','''''''''''')+'''''''',''NULL'')'
 when @Data_Type in ('text') 
 then 
 'COALESCE('''''''' + REPLACE(CONVERT(varchar(max),' + @Column_Name + '),'''''''','''''''''''')+'''''''',''NULL'')' 
 when @Data_Type in ('ntext') 
 then 
 'COALESCE('''''''' + REPLACE(CONVERT(nvarchar(max),' + @Column_Name + '),'''''''','''''''''''')+'''''''',''NULL'')' 
 when @Data_Type in ('xml') 
 then 
 'COALESCE('''''''' + REPLACE(CONVERT(nvarchar(max),' + @Column_Name + '),'''''''','''''''''''')+'''''''',''NULL'')' 
 when @Data_Type in ('binary','varbinary') 
 then 
 'COALESCE(RTRIM(CONVERT(char,' + 'CONVERT(int,' + @Column_Name + '))),''NULL'')' 
 when @Data_Type in ('timestamp','rowversion') 
 then 
 case 
 when @include_timestamp = 0 
 then 
 '''DEFAULT''' 
 else 
 'COALESCE(RTRIM(CONVERT(char,' + 'CONVERT(int,' + @Column_Name + '))),''NULL'')' 
 end
 when @Data_Type in ('float','real','money','smallmoney')
 then
 'COALESCE(LTRIM(RTRIM(' + 'CONVERT(char, ' + @Column_Name + ',2)' + ')),''NULL'')' 
 when @Data_Type in ('hierarchyid')
 then 
  'COALESCE(''hierarchyid::Parse(''+'''''''' + LTRIM(RTRIM(' + 'CONVERT(char, ' + @Column_Name + ')' + '))+''''''''+'')'',''NULL'')' 
 else 
 'COALESCE(LTRIM(RTRIM(' + 'CONVERT(char, ' + @Column_Name + ')' + ')),''NULL'')' 
 end + '+' + ''',''' + ' + '
 
 --Generating the column list for the MERGE statement
 set @Column_List = @Column_List + @Column_Name + ',' 
 
 --Don't update Primary Key or Identity columns
 if not exists(
 select 1
 from INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk ,
 INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
 where pk.TABLE_NAME = @table_name
 and pk.TABLE_SCHEMA = coalesce(@schema, schema_name())
 and CONSTRAINT_TYPE = 'PRIMARY KEY'
 and c.TABLE_NAME = pk.TABLE_NAME
 and c.TABLE_SCHEMA = pk.TABLE_SCHEMA
 and c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME
 and c.COLUMN_NAME = @Column_Name_Unquoted 
 )
 begin
 set @Column_List_For_Update = @Column_List_For_Update + @Column_Name + ' = Source.' + @Column_Name + ', 
  ' 
 set @Column_List_For_Check = @Column_List_For_Check +
 case @Data_Type 
 when 'text' then char(10) + char(9) + 'NULLIF(CAST(Source.' + @Column_Name + ' AS VARCHAR(MAX)), CAST(Target.' + @Column_Name + ' AS VARCHAR(MAX))) IS NOT NULL OR NULLIF(CAST(Target.' + @Column_Name + ' AS VARCHAR(MAX)), CAST(Source.' + @Column_Name + ' AS VARCHAR(MAX))) IS NOT NULL OR '
 when 'ntext' then char(10) + char(9) + 'NULLIF(CAST(Source.' + @Column_Name + ' AS NVARCHAR(MAX)), CAST(Target.' + @Column_Name + ' AS NVARCHAR(MAX))) IS NOT NULL OR NULLIF(CAST(Target.' + @Column_Name + ' AS NVARCHAR(MAX)), CAST(Source.' + @Column_Name + ' AS NVARCHAR(MAX))) IS NOT NULL OR ' 
 else char(10) + char(9) + 'NULLIF(Source.' + @Column_Name + ', Target.' + @Column_Name + ') IS NOT NULL OR NULLIF(Target.' + @Column_Name + ', Source.' + @Column_Name + ') IS NOT NULL OR '
 end 
 end

 SKIP_LOOP: --The label used in GOTO

 select @Column_ID = min(ORDINAL_POSITION) 
 from INFORMATION_SCHEMA.COLUMNS (nolock) 
 where TABLE_NAME = @table_name
 and TABLE_SCHEMA = coalesce(@schema, schema_name())
 and ORDINAL_POSITION > @Column_ID

 end --Loop ends here!


--To get rid of the extra characters that got concatenated during the last run through the loop
if len(@Column_List_For_Update) <> 0
 begin
 set @Column_List_For_Update = ' ' + left(@Column_List_For_Update,len(@Column_List_For_Update) - 4)
 end

if len(@Column_List_For_Check) <> 0
 begin
 set @Column_List_For_Check = left(@Column_List_For_Check,len(@Column_List_For_Check) - 3)
 end

set @Actual_Values = left(@Actual_Values,len(@Actual_Values) - 6)

set @Column_List = left(@Column_List,len(@Column_List) - 1)
if len(ltrim(@Column_List)) = 0
 begin
 raiserror('No columns to select. There should at least be one column to generate the output',16,1)
 return -1 --Failure. Reason: Looks like all the columns are ommitted using the @cols_to_exclude parameter
 end


--Get the join columns ----------------------------------------------------------
declare @PK_column_list varchar(8000)
declare @PK_column_joins varchar(8000)
set @PK_column_list = ''
set @PK_column_joins = ''

select @PK_column_list = @PK_column_list + '[' + c.COLUMN_NAME + '], '
, @PK_column_joins = @PK_column_joins + 'Target.[' + c.COLUMN_NAME + '] = Source.[' + c.COLUMN_NAME + '] AND '
from INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk ,
INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
where pk.TABLE_NAME = @table_name
and pk.TABLE_SCHEMA = coalesce(@schema, schema_name())
and CONSTRAINT_TYPE = 'PRIMARY KEY'
and c.TABLE_NAME = pk.TABLE_NAME
and c.TABLE_SCHEMA = pk.TABLE_SCHEMA
and c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

if isnull(@PK_column_list, '') = '' 
 begin
 raiserror('Table has no primary keys. There should at least be one column in order to have a valid join.',16,1)
 return -1 --Failure. Reason: looks like table doesn't have any primary keys
 end

set @PK_column_list = left(@PK_column_list, len(@PK_column_list) -1)
set @PK_column_joins = left(@PK_column_joins, len(@PK_column_joins) -4)


--Forming the final string that will be executed, to output the a MERGE statement
set @Actual_Values = 
 'SELECT ' + 
 case when @top is null or @top < 0 then '' else ' TOP ' + ltrim(str(@top)) + ' ' end + 
 '''' + 
 ' '' + CASE WHEN ROW_NUMBER() OVER (ORDER BY ' + @PK_column_list + ') = 1 THEN '' '' ELSE '','' END + ''(''+ ' + @Actual_Values + '+'')''' + ' ' + 
 coalesce(@from,' FROM ' + @Source_Table_Qualified + ' (NOLOCK)')

 declare @output varchar(max) = ''
 declare @b char(1) = char(13)

--Determining whether to ouput any debug information
if @debug_mode =1
 begin
 set @output += @b + '/*****START OF DEBUG INFORMATION*****'
 set @output += @b + ''
 set @output += @b + 'The primary key column list:'
 set @output += @b + @PK_column_list
 set @output += @b + ''
 set @output += @b + 'The INSERT column list:'
 set @output += @b + @Column_List
 set @output += @b + ''
 set @output += @b + 'The UPDATE column list:'
 set @output += @b + @Column_List_For_Update
 set @output += @b + ''
 set @output += @b + 'The SELECT statement executed to generate the MERGE:'
 set @output += @b + @Actual_Values
 set @output += @b + ''
 set @output += @b + '*****END OF DEBUG INFORMATION*****/'
 set @output += @b + ''
 end
 
if (@include_use_db = 1)
begin
	set @output +=      'USE ' + db_name()
	set @output += @b + @batch_separator
	set @output += @b + @b
end

if (@nologo = 0)
begin
 set @output += @b + '--MERGE generated by ''sp_generate_merge'' stored procedure, Version 0.93'
 set @output += @b + '--Originally by Vyas (http://vyaskn.tripod.com): sp_generate_inserts (build 22)'
 set @output += @b + '--Adapted for SQL Server 2008/2012 by Daniel Nolan (http://danere.com)'
 set @output += @b + ''
end

if (@include_rowsaffected = 1) -- If the caller has elected not to include the "rows affected" section, let MERGE output the row count as it is executed.
 set @output += @b + 'SET NOCOUNT ON'
 set @output += @b + ''


--Determining whether to print IDENTITY_INSERT or not
if (len(@IDN) <> 0)
 begin
 set @output += @b + 'SET IDENTITY_INSERT ' + @Target_Table_For_Output + ' ON'
 set @output += @b + ''
 end


--Temporarily disable constraints on the target table
if @disable_constraints = 1 and (object_id(@Source_Table_Qualified, 'U') is not null)
 begin
 set @output += @b + 'ALTER TABLE ' + @Target_Table_For_Output + ' NOCHECK CONSTRAINT ALL' --Code to disable constraints temporarily
 end


--Output the start of the MERGE statement, qualifying with the schema name only if the caller explicitly specified it
set @output += @b + 'MERGE INTO ' + @Target_Table_For_Output + ' AS Target'
set @output += @b + 'USING (VALUES'


--All the hard work pays off here!!! You'll get your MERGE statement, when the next line executes!
declare @tab table (val nvarchar(max));
insert into @tab
exec (@Actual_Values)

if (select count(*) from @tab) <> 0 -- Ensure that rows were returned, otherwise the MERGE statement will get nullified.
begin
 set @output += cast((select @b + val from @tab for xml path('')) as xml).value('.', 'VARCHAR(MAX)');
end

--Output the columns to correspond with each of the values above--------------------
set @output += @b + ') AS Source (' + @Column_List + ')'


--Output the join columns ----------------------------------------------------------
set @output += @b + 'ON (' + @PK_column_joins + ')'


--When matched, perform an UPDATE on any metadata columns only (ie. not on PK)------
if len(@Column_List_For_Update) <> 0
begin
 set @output += @b + 'WHEN MATCHED ' + case when @update_only_if_changed = 1 then 'AND (' + @Column_List_For_Check + ') ' else '' end + 'THEN'
 set @output += @b + ' UPDATE SET'
 set @output += @b + '  ' + ltrim(@Column_List_For_Update)
end


--When NOT matched by target, perform an INSERT------------------------------------
set @output += @b + 'WHEN NOT MATCHED BY TARGET THEN';
set @output += @b + ' INSERT(' + @Column_List + ')'
set @output += @b + ' VALUES(' + replace(@Column_List, '[', 'Source.[') + ')'


--When NOT matched by source, DELETE the row
if @delete_if_not_matched=1 begin
 set @output += @b + 'WHEN NOT MATCHED BY SOURCE THEN '
 set @output += @b + ' DELETE'
end;
set @output += @b + ';'
set @output += @b + @batch_separator

--Display the number of affected rows to the user, or report if an error occurred---
if @include_rowsaffected = 1
begin
 set @output += @b + 'DECLARE @mergeError int'
 set @output += @b + ' , @mergeCount int'
 set @output += @b + 'SELECT @mergeError = @@ERROR, @mergeCount = @@ROWCOUNT'
 set @output += @b + 'IF @mergeError != 0'
 set @output += @b + ' BEGIN'
 set @output += @b + ' PRINT ''ERROR OCCURRED IN MERGE FOR ' + @Target_Table_For_Output + '. Rows affected: '' + CAST(@mergeCount AS VARCHAR(100)); -- SQL should always return zero rows affected';
 set @output += @b + ' END'
 set @output += @b + 'ELSE'
 set @output += @b + ' BEGIN'
 set @output += @b + ' PRINT ''' + @Target_Table_For_Output + ' rows affected by MERGE: '' + CAST(@mergeCount AS VARCHAR(100));';
 set @output += @b + ' END'
 set @output += @b + @batch_separator
 set @output += @b + @b
end

--Re-enable the previously disabled constraints-------------------------------------
if @disable_constraints = 1 and (object_id(@Source_Table_Qualified, 'U') is not null)
 begin
 set @output +=      'ALTER TABLE ' + @Target_Table_For_Output + ' CHECK CONSTRAINT ALL' --Code to enable the previously disabled constraints
 set @output += @b + @batch_separator
 set @output += @b
 end


--Switch-off identity inserting------------------------------------------------------
if (len(@IDN) <> 0)
 begin
 set @output +=      'SET IDENTITY_INSERT ' + @Target_Table_For_Output + ' OFF'
 set @output += @b + @batch_separator
 set @output += @b
 end

if (@include_rowsaffected = 1)
begin
 set @output +=      'SET NOCOUNT OFF'
 set @output += @b + @batch_separator
 set @output += @b
end

set @output += @b + ''
set @output += @b + ''

if @results_to_text = 1
begin
	--output the statement to the Grid/Messages tab
	select @output;
end
else
begin
	--output the statement as xml (to overcome SSMS 4000/8000 char limitation)
	select [processing-instruction(x)]=@output for xml path(''),type;
	print 'MERGE statement has been wrapped in an XML fragment and output successfully.'
	print 'Ensure you have Results to Grid enabled and then click the hyperlink to copy the statement within the fragment.'
	print ''
	print 'If you would prefer to have results output directly (without XML) specify @results_to_text = 1, however please'
	print 'note that the results may be truncated by your SQL client to 4000 nchars.'
end

set nocount off
return 0 --Success. We are done!
end

go

print 'Created the procedure'
go


--Mark the proc as a system object to allow it to be called transparently from other databases
exec sp_MS_marksystemobject sp_generate_merge
go

print 'Granting EXECUTE permission on sp_generate_merge to all users'
grant exec on sp_generate_merge to public

set nocount off
go

print 'Done'