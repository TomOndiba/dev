﻿IF OBJECT_ID('[privy].[TsaToPsaValidateSchema]') IS NOT NULL
	DROP PROCEDURE [privy].[TsaToPsaValidateSchema];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   procedure [privy].[TsaToPsaValidateSchema]
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
				  , replace(TABLE_NAME, 'ICS_LAND', '') TableName
				from
					INFORMATION_SCHEMA.TABLES
				where
					TABLE_CATALOG = db_name()
					and TABLE_SCHEMA =
					(
						select top 1	SourceSchema from  dbo.psaTotsaLoadControlTable
					)
					and TABLE_TYPE = 'BASE TABLE'
					and TABLE_NAME in
						(
							select	SourceTable from dbo.psaTotsaLoadControlTable
						)
				except
				select
					'Missing table from the psa schema'
				  , replace(TABLE_NAME, 'ICS_STG', '') TableName
				from
					INFORMATION_SCHEMA.TABLES
				where
					TABLE_CATALOG = db_name()
					and TABLE_SCHEMA =
					(
						select top 1	TargetSchema from  dbo.psaTotsaLoadControlTable
					)
					and TABLE_TYPE = 'BASE TABLE'
					and TABLE_NAME in
						(
							select	TargetTable from dbo.psaTotsaLoadControlTable
						)
			)
				raiserror('missing table(s) error', 16, 1) ;

/********************************************************Missing columns in psa**************************************************************/

			set @_Step = 'check for tsa columns missing from psa' ;

			if exists
			(
				select
					'Missing column from the psa schema'
				  , replace(TABLE_NAME, 'ICS_LAND', '') TableName
				  , COLUMN_NAME
				from
					INFORMATION_SCHEMA.COLUMNS
				where
					TABLE_CATALOG = db_name()
					and TABLE_SCHEMA =
					(
						select top 1	SourceSchema from  dbo.psaTotsaLoadControlTable
					)
					and replace(TABLE_NAME, 'ICS_LAND', '') in
						(
							select	replace(TargetTable, 'ICS_STG', '') from dbo.psaTotsaLoadControlTable
						)
				except
				select
					'Missing column from the psa schema'
				  , replace(TABLE_NAME, 'ICS_STG', '')	TableName
				  , COLUMN_NAME
				from
					INFORMATION_SCHEMA.COLUMNS
				where
					TABLE_CATALOG = db_name()
					and TABLE_SCHEMA =
					(
						select top 1	TargetSchema from  dbo.psaTotsaLoadControlTable
					)
					and replace(TABLE_NAME, 'ICS_STG', '') in
						(
							select
								replace(a.SourceTable, 'ICS_LAND', '')
							from
								dbo.psaTotsaLoadControlTable a
						)
			)
				raiserror('missing colum(s) error', 16, 1) ;
			--!
			--!

/********************************************************Missing datatypes in psa**************************************************************/
			set @_Step = 'check for tsa mis-matched column datatype from psa' ;

			if exists
			(
				select
					'Mis-matched  data type from the psa schema'
				  , replace(TABLE_NAME, 'ICS_LAND', '')			TableName
				  , COLUMN_NAME
				  , DATA_TYPE
				from
					INFORMATION_SCHEMA.COLUMNS
				where
					TABLE_CATALOG = db_name()
					and TABLE_SCHEMA =
					(
						select top 1	SourceSchema from  dbo.psaTotsaLoadControlTable
					)
					and replace(TABLE_NAME, 'ICS_LAND', '') in
						(
							select	replace(TargetTable, 'ICS_STG', '') from dbo.psaTotsaLoadControlTable
						)
				except
				select
					'Mis-matched  data type from the psa schema'
				  , replace(TABLE_NAME, 'ICS_STG', '')			TableName
				  , COLUMN_NAME
				  , DATA_TYPE
				from
					INFORMATION_SCHEMA.COLUMNS
				where
					TABLE_CATALOG = db_name()
					and TABLE_SCHEMA =
					(
						select top 1	TargetSchema from  dbo.psaTotsaLoadControlTable
					)
					--and TABLE_TYPE='BASE TABLE'
					and replace(TABLE_NAME, 'ICS_STG', '') in
						(
							select
								replace(a.SourceTable, 'ICS_LAND', '')
							from
								dbo.psaTotsaLoadControlTable a
						)
			)
				raiserror('mis-matched colum(s) dataype error', 16, 1) ;

/********************************************************Missing length in psa**************************************************************/
			set @_Step = 'check for tsa mis-matched column length from psa' ;

			if exists
			(
				select
					'Mis-matched length from the psa schema'
				  , replace(TABLE_NAME, 'ICS_LAND', '')		TableName
				  , COLUMN_NAME
				  , isnull(CHARACTER_MAXIMUM_LENGTH, -1)
				from
					INFORMATION_SCHEMA.COLUMNS
				where
					TABLE_CATALOG = db_name()
					and TABLE_SCHEMA =
					(
						select top 1	SourceSchema from  dbo.psaTotsaLoadControlTable
					)
					and replace(TABLE_NAME, 'ICS_LAND', '') in
						(
							select	replace(TargetTable, 'ICS_STG', '') from dbo.psaTotsaLoadControlTable
						)
				except
				select
					'Mis-matched length from the psa schema'
				  , replace(TABLE_NAME, 'ICS_STG', '')		TableName
				  , COLUMN_NAME
				  , isnull(CHARACTER_MAXIMUM_LENGTH, -1)
				from
					INFORMATION_SCHEMA.COLUMNS
				where
					TABLE_CATALOG = db_name()
					and TABLE_SCHEMA =
					(
						select top 1	TargetSchema from  dbo.psaTotsaLoadControlTable
					)
					and replace(TABLE_NAME, 'ICS_STG', '') in
						(
							select
								replace(a.SourceTable, 'ICS_LAND', '')
							from
								dbo.psaTotsaLoadControlTable a
						)
			)
				raiserror('mis-matched colum(s) length error', 16, 1) ;

/********************************************************Missing Nullable in Psa**************************************************************/
			set @_Step = 'check for tsa mis-matched null column from psa' ;

			if exists
			(
				select
					'Mis-matched length from the psa schema'
				  , replace(TABLE_NAME, 'ICS_LAND', '')		TableName
				  , COLUMN_NAME
				  , IS_NULLABLE
				from
					INFORMATION_SCHEMA.COLUMNS
				where
					TABLE_CATALOG = db_name()
					and TABLE_SCHEMA =
					(
						select top 1	SourceSchema from  dbo.psaTotsaLoadControlTable
					)
					and replace(TABLE_NAME, 'ICS_LAND', '') in
						(
							select	replace(TargetTable, 'ICS_STG', '') from dbo.psaTotsaLoadControlTable
						)
					and IS_NULLABLE = 'YES'
				except
				select
					'Mis-matched length from the psa schema' Message
				  , replace(TABLE_NAME, 'ICS_STG', '')		 TableName
				  , COLUMN_NAME
				  , IS_NULLABLE
				from
					INFORMATION_SCHEMA.COLUMNS
				where
					TABLE_CATALOG = db_name()
					and TABLE_SCHEMA =
					(
						select top 1	TargetSchema from  dbo.psaTotsaLoadControlTable
					)
					and replace(TABLE_NAME, 'ICS_STG', '') in
						(
							select
								replace(a.SourceTable, 'ICS_LAND', '')
							from
								dbo.psaTotsaLoadControlTable a
						)
					and IS_NULLABLE = 'YES'
			)
				raiserror('mis-matched colum(s) length error', 16, 1) ;

/********************************************************Missing Nullable in tsa**************************************************************/
			set @_Step = 'check for tsa mis-matched null column from tsa' ;

			if exists
			(
				select
					'Mis-matched length from the psa schema'
				  , replace(TABLE_NAME, 'ICS_LAND', '')		TableName
				  , COLUMN_NAME
				  , IS_NULLABLE
				from
					INFORMATION_SCHEMA.COLUMNS
				where
					TABLE_CATALOG = db_name()
					and TABLE_SCHEMA =
					(
						select top 1	SourceSchema from  dbo.psaTotsaLoadControlTable
					)
					and replace(TABLE_NAME, 'ICS_LAND', '') in
						(
							select	replace(TargetTable, 'ICS_STG', '') from dbo.psaTotsaLoadControlTable
						)
					and IS_NULLABLE = 'NO'
				except
				select
					'Mis-matched length from the psa schema' Message
				  , replace(TABLE_NAME, 'ICS_STG', '')		 TableName
				  , COLUMN_NAME
				  , IS_NULLABLE
				from
					INFORMATION_SCHEMA.COLUMNS
				where
					TABLE_CATALOG = db_name()
					and TABLE_SCHEMA =
					(
						select top 1	TargetSchema from  dbo.psaTotsaLoadControlTable
					)
					and replace(TABLE_NAME, 'ICS_STG', '') in
						(
							select
								replace(a.SourceTable, 'ICS_LAND', '')
							from
								dbo.psaTotsaLoadControlTable a
						)
					and IS_NULLABLE = 'NO'
			)
				raiserror('mis-matched colum(s) length error', 16, 1) ;


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
