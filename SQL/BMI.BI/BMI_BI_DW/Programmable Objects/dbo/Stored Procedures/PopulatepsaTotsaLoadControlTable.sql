IF OBJECT_ID('[dbo].[PopulatepsaTotsaLoadControlTable]') IS NOT NULL
	DROP PROCEDURE [dbo].[PopulatepsaTotsaLoadControlTable];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[PopulatepsaTotsaLoadControlTable]
as

	--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		dbo.PopulatepsaTotsaLoadControlTable
DESCRIPTION:		Populate psaTotsaLoadControlTable
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
		begin try

			declare @_FunctionName nvarchar(255) = quotename(object_schema_name(@@procid)) + '.' + quotename(object_name(@@procid)) ;
			declare @_Error int = 0 ;
			declare @_ReturnValue int ;
			declare @_Message nvarchar(512) ;
			declare @_ErrorContext nvarchar(512) ;
			declare @_Step varchar(128) ;

			set @_Step = 'Prepare psaTotsaLoadControlTable' ;

			truncate table psaTotsaLoadControlTable ;

			insert into dbo.psaTotsaLoadControlTable
			(
				CreatedDate
			  , CreatedBy
			  , SourceDB
			  , SourceSchema
			  , SourceTable
			  , TargetDB
			  , TargetSchema
			  , TargetTable
			  , LoadMode
			  , DataSourceKey
			)
			select
				getdate()		as CreatedDate
			  , system_user		as CreatedBy
			  , s.TABLE_CATALOG as SourceDB
			  , s.TABLE_SCHEMA	as SourceSchema
			  , s.TABLE_NAME	as SourceTable
			  , t.TABLE_CATALOG as TargetDB
			  , t.TABLE_SCHEMA	as TargetSchema
			  , t.TABLE_NAME	as TargetTable
			  , 'Delta Full'	as LoadMode
			  , 0				as DataSourceKey
			--,'y n' as Action 
			from
				INFORMATION_SCHEMA.TABLES			  s
			left outer join INFORMATION_SCHEMA.TABLES t
				on replace(s.TABLE_NAME, 'ICS_LAND', '') = replace(t.TABLE_NAME, 'ICS_STG', '')
					and t.TABLE_SCHEMA = 'psa'
					and t.TABLE_TYPE = 'BASE TABLE'
					and t.TABLE_NAME not like '%sample%' 
			where
				s.TABLE_SCHEMA = 'tsa'
				and s.TABLE_TYPE = 'BASE TABLE'
				and s.TABLE_NAME not like '%sample%'; 


/******************************************set PKs**********************************/

			set @_Step = 'Prepare PK for source and target tables in psaTotsaLoadControlTable' ;
			if object_id(N'dbo.PKTable') is not null drop table dbo.PKTable ;

			update
				t
			set
				t.TargetPK = null
			  , t.SourcePK = null
			from
				dbo.psaTotsaLoadControlTable t ;


			select
				*
			into
				dbo.PKTable
			from
				(
					select
						col_name(ic.object_id, ic.column_id) PK
					  , t.TargetSchema + '.' + t.TargetTable as TableName
					from
						dbo.psaTotsaLoadControlTable t
					inner join sys.indexes			 as i
						on i.object_id = object_id(t.TargetSchema + '.' + t.TargetTable)
					inner join sys.index_columns	 as ic
						on i.object_id = ic.object_id
							and i.index_id = ic.index_id
					where
						1 = 1
						and i.is_primary_key = 1
					union
					select
						col_name(ic.object_id, ic.column_id) PK
					  , t.SourceSchema + '.' + t.SourceTable as TableName
					from
						dbo.psaTotsaLoadControlTable t
					inner join sys.indexes			 as i
						on i.object_id = object_id(t.SourceSchema + '.' + t.SourceTable)
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


			alter table dbo.PKTable add id int identity(1, 1) ;
			
			declare
				@max int		  = (
										select		max(id) from PKTable
									)
			  , @i	 int		  = 1
			  , @tn	 varchar(300)
			  , @pk	 varchar(300) = '' ;

			while @i <= @max
				begin


					set @tn =
					(
						select	TableName from	dbo.PKTable where	id = @i
					) ;
					set @pk =
					(
						select	PK from dbo.PKTable where	id = @i
					) ;

					update
						t
					set
						TargetPK = ',' + @pk + isnull(TargetPK, '')
					from
						dbo.psaTotsaLoadControlTable t
					where
						t.TargetSchema + '.' + t.TargetTable = @tn ;


					update
						t
					set
						SourcePK = ',' + @pk + isnull(SourcePK, '')
					from
						dbo.psaTotsaLoadControlTable t
					where
						t.SourceSchema + '.' + t.SourceTable = @tn ;

					set @i = @i + 1 ;

				end ;

			update
				t
			set
				TargetPK = substring(TargetPK, 2, len(TargetPK))
			  , SourcePK = substring(SourcePK, 2, len(SourcePK))
			from
				dbo.psaTotsaLoadControlTable t ;

/*************************************************************************************************************************************/
		if object_id(N'dbo.PKTable') is not null drop table dbo.PKTable ;
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
