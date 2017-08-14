IF OBJECT_ID('[IcsApp].[TsaToPsaMerge]') IS NOT NULL
	DROP PROCEDURE [IcsApp].[TsaToPsaMerge];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   procedure [IcsApp].[TsaToPsaMerge]
(
	@DataSourceKey int
  , @RunType	   varchar(50)
)
as
	begin
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		IcsApp.TsaToPsaMerge
DESCRIPTION:		control SP to merge statement for moving data from tsa to psa 
ORIGIN DATE:		09-Aug-2017
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
001		09-AUG-2017		RN		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------
**********************************************************************************************************************/
		--</CommentHeader>
		-- declare @DataSourceKey int=1, 
		-- @RunType varchar(50)='full'
		--set nocount on ;

		--! Standard/ExceptionHandler variables
		declare @_FunctionName nvarchar(255) = quotename(object_schema_name(@@procid)) + '.' + quotename(object_name(@@procid)) ;
		declare @_Error int = 0 ;
		declare @_Message nvarchar(512) ;
		declare @_ErrorContext nvarchar(512) ;
		declare @_step varchar(128) ;
		declare @_ExceptionId int ;
		declare
			@max int = 1
		  , @id	 int = 0
		  , @i	 int = 0 ;
		declare
			@sourceTableName  varchar(255) = ''
		  , @sourceschemaName varchar(255) = ''
		  , @targetTableName  varchar(255) = ''
		  , @TargetSchemaName varchar(255) = '' ;


		begin try
			set @_step = 'Validate Inputs' ;

			if coalesce(@DataSourceKey, 0) = 0
				raiserror('@DataSourceKey can not be null or zero', 16, 1) ;
			
			if coalesce(@RunType, '') = ''
				raiserror('@RunType can not be null or empty', 16, 1) ;
				
			set @_step = 'Run privy.TsaToPsaValidateSchema' ;

			exec [privy].[TsaToPsaValidateSchema] @DataSourceKey ;

			set @_step = 'Run privy.BuildAndRunMerge' ;

			update	dbo.psaTotsaLoadControlTable set Done = 0 ;

			set @max =(select	count(*) from dbo.psaTotsaLoadControlTable	where DataSourceKey = @DataSourceKey group by DataSourceKey) ;
		

			while (@i < @max)
				begin
					set @id =(select top 1 ID	from dbo.psaTotsaLoadControlTable where DataSourceKey = @DataSourceKey and Done = 0) ;

				
					set @sourceTableName =	(select	SourceTable from dbo.psaTotsaLoadControlTable where ID = @id) ;
					set @sourceschemaName =	(select	SourceSchema from	dbo.psaTotsaLoadControlTable where	ID = @id) ;
					set @targetTableName =	(select	TargetTable from dbo.psaTotsaLoadControlTable where ID = @id) ;
					set @TargetSchemaName =	(select	TargetSchema from	dbo.psaTotsaLoadControlTable where	ID = @id) ;

					exec [privy].[BuildAndRunMerge]
						@Runtype = @RunType
					  , @SourceTableName = @sourceTableName
					  , @SourceSchemaName = @sourceschemaName
					  , @TargetTableName = @targetTableName
					  , @TargetSchemaName = @TargetSchemaName
					  , @LoadDateTime = null ;

					update	psaTotsaLoadControlTable set Done = 1 where ID = @id ;
					set @i = @i + 1 ;
				end ;
		end try
		begin catch
			set @_ErrorContext = 'Failed to merge to tsa to psa at Step: ' + coalesce('[' + @_step + ']', 'NULL') ;

			exec log4.ExceptionHandler
				@ErrorContext = @_ErrorContext
			  , @ErrorProcedure = @_FunctionName
			  , @ErrorNumber = @_Error out
			  , @ReturnMessage = @_Message out
			  , @ExceptionId = @_ExceptionId out ;



		end catch ;

		---/////////////////////////////////////////////////////////////////////////////////////////////////
		EndEx:
		--/////////////////////////////////////////////////////////////////////////////////////////////////

		--! Finally, throw an exception that will be detected by the caller
		if @_Error > 0 raiserror(@_Message, 16, 99) ;
		set nocount off ;

		--! Return the value of @@ERROR (which will be zero on success)
		return (@_Error) ;

	end ;










GO
