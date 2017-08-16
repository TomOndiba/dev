IF OBJECT_ID('[privy].[DeDupe]') IS NOT NULL
	DROP PROCEDURE [privy].[DeDupe];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   proc [privy].[DeDupe]
(
	@SourceSchemaName varchar(255), 
	@SourceTableName  varchar(255)
  
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		privy.Dedup
DESCRIPTION:		SP to flag duplicate rows (on the basis of logical PK(s))
ORIGIN DATE:		14-Aug-2017
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
001		14-AUG-2017		RN		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------
**********************************************************************************************************************/
--</CommentHeader>
set nocount on ;
	begin
		begin try
			declare @_FunctionName nvarchar(255) = quotename(object_schema_name(@@procid)) + '.' + quotename(object_name(@@procid)) ;
			declare @_Error int = 0 ;
			declare @_Message nvarchar(512) ;
			declare @_ErrorContext nvarchar(512) ;
			declare @_step varchar(128) ;
			declare @_ExceptionId int ;
			declare	@pk	 varchar(255) = ( select	TargetPK from dbo.psaTotsaLoadControlTable	 where	SourceTable = @SourceTableName	 and  SourceSchema = @SourceSchemaName )
					, @sql nvarchar(max) = '' ;

					--select @SourceSchemaName,@SourceTableName

			set @_step = 'Validate Inputs' ;

			if coalesce(@SourceSchemaName, '') = ''
				raiserror('@SourceSchemaName can not be null or zero', 16, 1) ;
			
			if coalesce(@SourceTableName, '') = ''
				raiserror('@SourceTableName can not be null or empty', 16, 1) ;
				
			set @_step = 'Prepares dynamic sql to flag duplicate rows' ;

			set @sql = '
					;with cte as (
					select  dense_rank() over ( order by ' + @pk
					   + ' )rn,* from '+ @SourceSchemaName+'.'+@SourceTableName+' )
							update  cte set cte.ExcludeFromMerge=1, cte.IsDuplicate=1
							where rn in (select rn from cte group by rn having count(*)>1)'


							

		execute sp_executesql @sql;

		end try
		begin catch
			set @_ErrorContext = 'Failed to flag duplicate at Step: ' + coalesce('[' + @_step + ']', 'NULL') ;

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
