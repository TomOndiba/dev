if object_id('[privy].[TsaToPsaValidateSchema]') is not null
	drop procedure [privy].[TsaToPsaValidateSchema];
go
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [privy].[TsaToPsaValidateSchema] 
(
	@DataSourceKey bigint
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		privy.TsaToPsaValidateSchema
DESCRIPTION:		match psa and tsa tables metadata 
ORIGIN DATE:		01-Aug-2017
ORIGINAL AUTHOR:	Razia Nazir

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

begin
	set nocount on ;

	--! Standard/ExceptionHandler variables
	declare @_FunctionName nvarchar(255) = quotename(object_schema_name(@@procid)) + '.' + quotename(object_name(@@procid)) ;
	declare @_Error int = 0 ;
	declare @_ReturnValue int ;
	declare @_Message nvarchar(512) ;
	declare @_ErrorContext nvarchar(512) ;
	declare @_Step varchar(128) ;

	begin try

/********************************************************Missing tables in psa**************************************************************/
		set @_Step = 'check for tsa tables missing from psa' ;

		if exists
		(
			select
				'Missing table from the psa schema'
				, replace(TABLE_NAME, 'ics_land', '') TableName
			from
				INFORMATION_SCHEMA.TABLES
			where
				TABLE_CATALOG = db_name()
				and TABLE_SCHEMA =
				(
					select top 1 SourceSchema from  dbo.TsaToPsaLoadControlTable
					where DataSourceKey=@DataSourceKey
				) collate Latin1_General_BIN
				and TABLE_TYPE = 'BASE TABLE'
				and TABLE_NAME in
					(
						select	SourceTable collate Latin1_General_BIN from dbo.TsaToPsaLoadControlTable
						where DataSourceKey=@DataSourceKey
					)
			except
			select
				'Missing table from the psa schema'
				, replace(TABLE_NAME, 'ics_stg', '') TableName
			from
				INFORMATION_SCHEMA.TABLES
			where
				TABLE_CATALOG = db_name()
				and TABLE_SCHEMA =
				(
					select top 1	TargetSchema from  dbo.TsaToPsaLoadControlTable
					where DataSourceKey=@DataSourceKey
				) collate Latin1_General_BIN
				and TABLE_TYPE = 'BASE TABLE'
				and TABLE_NAME in
					(
						select	TargetTable collate Latin1_General_BIN from dbo.TsaToPsaLoadControlTable
						where DataSourceKey=@DataSourceKey
					)
		)
			raiserror('missing table(s) error', 16, 1) ;

/********************************************************Missing columns in psa**************************************************************/

		set @_Step = 'check for tsa columns missing from psa' ;

		if exists
		(
			select
				'Missing column from the psa schema'
				, replace(TABLE_NAME, 'ics_land', '') TableName
				, COLUMN_NAME
			from
				INFORMATION_SCHEMA.COLUMNS
			where
				TABLE_CATALOG = db_name()
				and TABLE_SCHEMA =
				(
					select top 1	SourceSchema from  dbo.TsaToPsaLoadControlTable
					where DataSourceKey=@DataSourceKey
				) collate Latin1_General_BIN
				and replace(TABLE_NAME, 'ics_land', '') in
					(
						select	replace(TargetTable, 'ics_stg', '') collate Latin1_General_BIN from dbo.TsaToPsaLoadControlTable
						where DataSourceKey=@DataSourceKey
					)
				and COLUMN_NAME not in ( 'EtlBatchRunId','EtlUpdatedOn'	 , 'EtlUpdatedBy' , 'EtlDeletedOn'	  , 'EtlDeletedBy'	   , 'IsDeleted', 'IsIncomplete','ExcludeFromMerge'	,'IsDuplicate')
			except
			select
				'Missing column from the psa schema'
				, replace(TABLE_NAME, 'ics_stg', '')	TableName
				, COLUMN_NAME
			from
				INFORMATION_SCHEMA.COLUMNS
			where
				TABLE_CATALOG = db_name()
				and TABLE_SCHEMA =
				(
					select top 1	TargetSchema from  dbo.TsaToPsaLoadControlTable
					where DataSourceKey=@DataSourceKey
				) collate Latin1_General_BIN
				and replace(TABLE_NAME, 'ics_stg', '') in
					(
						select
							replace(a.SourceTable, 'ics_land', '') collate Latin1_General_BIN
						from
							dbo.TsaToPsaLoadControlTable a
						where DataSourceKey=@DataSourceKey
					)
					and COLUMN_NAME not in ( 'EtlBatchRunId','EtlUpdatedOn'	 , 'EtlUpdatedBy' , 'EtlDeletedOn'	  , 'EtlDeletedBy'	   , 'IsDeleted', 'IsIncomplete','ExcludeFromMerge'	,'IsDuplicate')
		)
			raiserror('missing column(s) error psa', 16, 1) ;
		--!
		--!

/********************************************************Missing datatypes in psa**************************************************************/
		set @_Step = 'check for tsa mis-matched column datatype from psa' ;

		if exists
		(
			select
				'Mis-matched  data type from the psa schema'
				, replace(TABLE_NAME, 'ics_land', '')			TableName
				, COLUMN_NAME
				, DATA_TYPE
			from
				INFORMATION_SCHEMA.COLUMNS
			where
				TABLE_CATALOG = db_name()
				and TABLE_SCHEMA =
				(
					select top 1	SourceSchema from  dbo.TsaToPsaLoadControlTable
					where DataSourceKey=@DataSourceKey
				) collate Latin1_General_BIN
				and replace(TABLE_NAME, 'ics_land', '') in
					(
						select	replace(TargetTable, 'ics_stg', '') collate Latin1_General_BIN from dbo.TsaToPsaLoadControlTable
						where DataSourceKey=@DataSourceKey
					)
				and COLUMN_NAME not in ('EtlBatchRunId', 'EtlUpdatedOn'	 , 'EtlUpdatedBy' , 'EtlDeletedOn'	  , 'EtlDeletedBy'	   , 'IsDeleted', 'IsIncomplete','ExcludeFromMerge'	,'IsDuplicate')
			except
			select
				'Mis-matched  data type from the psa schema'
				, replace(TABLE_NAME, 'ics_stg', '')			TableName
				, COLUMN_NAME
				, DATA_TYPE
			from
				INFORMATION_SCHEMA.COLUMNS
			where
				TABLE_CATALOG = db_name()
				and TABLE_SCHEMA =
				(
					select top 1	TargetSchema from  dbo.TsaToPsaLoadControlTable
					where DataSourceKey=@DataSourceKey
				) collate Latin1_General_BIN
				--and TABLE_TYPE='BASE TABLE'
				and replace(TABLE_NAME, 'ics_stg', '') in
					(
						select
							replace(a.SourceTable, 'ics_land', '') collate Latin1_General_BIN
						from
							dbo.TsaToPsaLoadControlTable a
						where DataSourceKey=@DataSourceKey
					)
					and COLUMN_NAME not in ( 'EtlBatchRunId','EtlUpdatedOn'	 , 'EtlUpdatedBy' , 'EtlDeletedOn'	  , 'EtlDeletedBy'	   , 'IsDeleted'		   , 'IsIncomplete'	,'ExcludeFromMerge'	,'IsDuplicate')
		)
			raiserror('mis-matched column(s) dataype error psa', 16, 1) ;

/********************************************************Missing length in psa**************************************************************/
		set @_Step = 'check for tsa mis-matched column length from psa' ;

		if exists
		(
			select
				'Mis-matched length from the psa schema'
				, replace(TABLE_NAME, 'ics_land', '')		TableName
				, COLUMN_NAME
				, isnull(CHARACTER_MAXIMUM_LENGTH, -1)
			from
				INFORMATION_SCHEMA.COLUMNS
			where
				TABLE_CATALOG = db_name()
				and TABLE_SCHEMA =
				(
					select top 1	SourceSchema from  dbo.TsaToPsaLoadControlTable
					where DataSourceKey=@DataSourceKey
				) collate Latin1_General_BIN
				and replace(TABLE_NAME, 'ics_land', '') in
					(
						select	replace(TargetTable, 'ics_stg', '') collate Latin1_General_BIN from dbo.TsaToPsaLoadControlTable
						where DataSourceKey=@DataSourceKey
					)
				and COLUMN_NAME not in ( 'EtlBatchRunId','EtlUpdatedOn'	 , 'EtlUpdatedBy' , 'EtlDeletedOn'	  , 'EtlDeletedBy'	   , 'IsDeleted', 'IsIncomplete','ExcludeFromMerge'	,'IsDuplicate')
			except
			select
				'Mis-matched length from the psa schema'
				, replace(TABLE_NAME, 'ics_stg', '')		TableName
				, COLUMN_NAME
				, isnull(CHARACTER_MAXIMUM_LENGTH, -1)
			from
				INFORMATION_SCHEMA.COLUMNS
			where
				TABLE_CATALOG = db_name()
				and TABLE_SCHEMA =
				(
					select top 1	TargetSchema from  dbo.TsaToPsaLoadControlTable
					where DataSourceKey=@DataSourceKey
				) collate Latin1_General_BIN
				and replace(TABLE_NAME, 'ics_stg', '') in
					(
						select
							replace(a.SourceTable, 'ics_land', '') collate Latin1_General_BIN
						from
							dbo.TsaToPsaLoadControlTable a
						where DataSourceKey=@DataSourceKey
					)
					and COLUMN_NAME not in ( 'EtlBatchRunId','EtlUpdatedOn'	 , 'EtlUpdatedBy' , 'EtlDeletedOn'	  , 'EtlDeletedBy'	   , 'IsDeleted'		   , 'IsIncomplete','ExcludeFromMerge'	,'IsDuplicate')
		)
			raiserror('mis-matched column(s) length error from psa', 16, 1) ;

/********************************************************Missing Nullable in Psa**************************************************************/
		set @_Step = 'check for tsa mis-matched null column from psa' ;

		if exists
		(
			select
				'Mis-matched null column from the psa schema'
				, replace(TABLE_NAME, 'ics_land', '')		TableName
				, COLUMN_NAME
				, IS_NULLABLE
			from
				INFORMATION_SCHEMA.COLUMNS c
			where
				TABLE_CATALOG = db_name()
				and TABLE_SCHEMA =
				(
					select top 1	SourceSchema from  dbo.TsaToPsaLoadControlTable
				where DataSourceKey=@DataSourceKey
				) collate Latin1_General_BIN
				and replace(TABLE_NAME, 'ics_land', '') in
					(
						select	replace(TargetTable, 'ics_stg', '') collate Latin1_General_BIN from dbo.TsaToPsaLoadControlTable
					where DataSourceKey=@DataSourceKey
					)
				and IS_NULLABLE = 'YES'
				and c.COLUMN_NAME not in
					(
						select
							col_name(ic.object_id, ic.column_id) as PK
						from
							sys.indexes				 as i
						inner join sys.index_columns as ic
							on i.object_id = ic.object_id
								and i.index_id = ic.index_id
						where
							1 = 1
							and i.is_primary_key = 1
							and ic.object_id = object_id('psa.' + replace(c.TABLE_NAME, 'ics_land_', 'ics_stg_'))
					)
				and COLUMN_NAME not in ( 'EtlBatchRunId','EtlUpdatedOn'	 , 'EtlUpdatedBy' , 'EtlDeletedOn'	  , 'EtlDeletedBy'	   , 'IsDeleted', 'IsIncomplete','ExcludeFromMerge'	,'IsDuplicate')
			except
			select
				'Mis-matched null column from the psa schema' Message
				, replace(TABLE_NAME, 'ics_stg', '')		 TableName
				, COLUMN_NAME
				, IS_NULLABLE
			from
				INFORMATION_SCHEMA.COLUMNS c
			where
				TABLE_CATALOG = db_name()
				and TABLE_SCHEMA =
				(
					select top 1	TargetSchema from  dbo.TsaToPsaLoadControlTable
				where DataSourceKey=@DataSourceKey
				) collate Latin1_General_BIN
				and replace(TABLE_NAME, 'ics_stg', '') in
					(
						select
							replace(a.SourceTable, 'ics_land', '') collate Latin1_General_BIN
						from
							dbo.TsaToPsaLoadControlTable a
					where DataSourceKey=@DataSourceKey
					)
				and IS_NULLABLE = 'YES'
				and c.COLUMN_NAME not in
					(
						select
							col_name(ic.object_id, ic.column_id) as PK
						from
							sys.indexes				 as i
						inner join sys.index_columns as ic
							on i.object_id = ic.object_id
								and i.index_id = ic.index_id
						where
							1 = 1
							and i.is_primary_key = 1
							and ic.object_id = object_id('psa.' + replace(c.TABLE_NAME, 'ics_land_', 'ics_stg_'))
					)
					and c.COLUMN_NAME not in ( 'EtlBatchRunId','EtlUpdatedOn'	 , 'EtlUpdatedBy' , 'EtlDeletedOn'	  , 'EtlDeletedBy'	   , 'IsDeleted'		   , 'IsIncomplete','ExcludeFromMerge'	,'IsDuplicate')
		)
			raiserror('check for tsa mis-matched null column from psa', 16, 1) ;

/********************************************************Missing Nullable in tsa**************************************************************/
		set @_Step = 'check for tsa mis-matched null column from tsa' ;

		if exists
		(
			select
				'Mis-matched null column the tsa schema'
				, replace(TABLE_NAME, 'ics_land', '')		TableName
				, COLUMN_NAME
				, IS_NULLABLE
			from
				INFORMATION_SCHEMA.COLUMNS c
			where
				TABLE_CATALOG = db_name()
				and TABLE_SCHEMA =
				(
					select top 1	SourceSchema from  dbo.TsaToPsaLoadControlTable
				where DataSourceKey=@DataSourceKey
				) collate Latin1_General_BIN
				and replace(TABLE_NAME, 'ics_land', '') in
					(
						select	replace(TargetTable, 'ics_stg', '') collate Latin1_General_BIN from dbo.TsaToPsaLoadControlTable
					where DataSourceKey=@DataSourceKey
					)
				and IS_NULLABLE = 'NO'
				and c.COLUMN_NAME not in
					(
						select
							col_name(ic.object_id, ic.column_id) as PK
						from
							sys.indexes				 as i
						inner join sys.index_columns as ic
							on i.object_id = ic.object_id
								and i.index_id = ic.index_id
						where
							1 = 1
							and i.is_primary_key = 1
							and ic.object_id = object_id('psa.' + replace(c.TABLE_NAME, 'ics_land_', 'ics_stg_'))
					)
				and COLUMN_NAME not in ('EtlBatchRunId', 'EtlUpdatedOn'	 , 'EtlUpdatedBy' , 'EtlDeletedOn'	  , 'EtlDeletedBy'	   , 'IsDeleted', 'IsIncomplete','ExcludeFromMerge'	,'IsDuplicate')
			except
			select
				'Mis-matched null column the tsa schema' Message
				, replace(TABLE_NAME, 'ics_stg', '')		 TableName
				, COLUMN_NAME
				, IS_NULLABLE
			from
				INFORMATION_SCHEMA.COLUMNS c
			where
				TABLE_CATALOG = db_name()
				and TABLE_SCHEMA =
				(
					select top 1	TargetSchema from  dbo.TsaToPsaLoadControlTable
				where DataSourceKey=@DataSourceKey
				) collate Latin1_General_BIN
				and replace(TABLE_NAME, 'ics_stg', '') in
					(
						select
							replace(a.SourceTable, 'ics_land', '') collate Latin1_General_BIN
						from
							dbo.TsaToPsaLoadControlTable a

					where DataSourceKey=@DataSourceKey
					)
				and IS_NULLABLE = 'NO'
				and c.COLUMN_NAME not in
					(
						select
							col_name(ic.object_id, ic.column_id) as PK
						from
							sys.indexes				 as i
						inner join sys.index_columns as ic
							on i.object_id = ic.object_id
								and i.index_id = ic.index_id
						where
							1 = 1
							and i.is_primary_key = 1
							and ic.object_id = object_id('psa.' + replace(c.TABLE_NAME, 'ics_land_', 'ics_stg_'))
					)
					and c.COLUMN_NAME not in ( 'EtlBatchRunId','EtlUpdatedOn'	 , 'EtlUpdatedBy' , 'EtlDeletedOn'	  , 'EtlDeletedBy'	   , 'IsDeleted'		   , 'IsIncomplete','ExcludeFromMerge'	,'IsDuplicate')
		)
			raiserror('check for tsa mis-matched null column from tsa', 16, 1) ;

/***********************************************Missing PKs from the table(s)****************************************************************/

				set @_Step = 'PK does not exist' ;
				if exists
				(
					select
						1
					from
						dbo.TsaToPsaLoadControlTable t
					where
						t.SourcePK is null
						or	t.TargetPK is null
				)
					raiserror('PK does not exist', 16, 1) ;


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
