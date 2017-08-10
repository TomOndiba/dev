IF OBJECT_ID('[IcsApp].[TsaToPsaMerge]') IS NOT NULL
	DROP PROCEDURE [IcsApp].[TsaToPsaMerge];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [IcsApp].[TsaToPsaMerge]
(
	@DataSourceKey int
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
		set nocount on ;

		--! Standard/ExceptionHandler variables
		declare @_FunctionName nvarchar(255) = quotename(object_schema_name(@@procid)) + '.' + quotename(object_name(@@procid)) ;
		declare @_Error int = 0 ;
		declare @_Message nvarchar(512) ;
		declare @_ErrorContext nvarchar(512) ;
		declare @_step varchar(128) ;
		declare @_ExceptionId int ;

		begin try
			set @_step = 'Validate Inputs' ;


			if coalesce(@DataSourceKey, 0) = 0
				raiserror('@DataSourceKey can not be null or zero', 16, 1);


				----exec 
























			
		
		
		
		end try
		begin catch
			set @_ErrorContext = 'Failed to start new batch run at Step: ' + coalesce('[' + @_step + ']', 'NULL') ;

			exec log4.ExceptionHandler
				@ErrorContext = @_ErrorContext
			  , @ErrorProcedure = @_FunctionName
			  , @ErrorNumber = @_Error out
			  , @ReturnMessage = @_Message out
			  , @ExceptionId = @_ExceptionId out ;
		end catch ;

		--/////////////////////////////////////////////////////////////////////////////////////////////////
		EndEx:
		--/////////////////////////////////////////////////////////////////////////////////////////////////

		--! Finally, throw an exception that will be detected by the caller
		if @_Error > 0 raiserror(@_Message, 16, 99) ;
		set nocount off ;

		--! Return the value of @@ERROR (which will be zero on success)
		return (@_Error) ;

	end ;










GO
