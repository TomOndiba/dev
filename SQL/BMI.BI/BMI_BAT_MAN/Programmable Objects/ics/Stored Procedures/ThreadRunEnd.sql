if object_id('[ics].[ThreadRunEnd]') is not null
	drop procedure [ics].[ThreadRunEnd];
go
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE proc [ics].[ThreadRunEnd]
(
	@MappingConfigTaskName varchar(100)
  , @MappingName		   varchar(100)
  , @ThreadRunId		   int
  , @EndState			   varchar(16)
  , @EndMessage			   varchar(500) = null
  , @SuccessSourceRows	   int
  , @FailedSourceRows	   int
  , @SuccessTargetRows	   int
  , @FailedTargetRows	   int
  , @SetDate			   datetime		= null
)
as
	--<CommentHeader>
	/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		ics.ThreadRunEnd
DESCRIPTION:		POC stub procedure
ORIGIN DATE:		25-JUL-2017
ORIGINAL AUTHOR:	Razia Nazir

Returns
=======
@@Error - always zero on success

Additional Notes
================
Stubs

REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		24-JUL-2017		RN		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------
002		11-OCT-2017		RN		N/A		Modified- stub repleaced with logic

**********************************************************************************************************************/
	--</CommentHeader>

	begin
		set nocount on ;

		--! Standard/ExceptionHandler variables
		declare @_FunctionName nvarchar(255) = quotename(object_schema_name(@@procid)) + '.' + quotename(object_name(@@procid)) ;
		declare @_Error int = 0 ;
		declare @_RowCount int = 0 ;
		declare @_ReturnValue int = 0 ;
		declare @_Message nvarchar(512) ;
		declare @_ErrorContext nvarchar(512) ;
		declare @_Step varchar(128) ;
		declare @_ExceptionId int ;
		declare @RunStateId int ;
		set @SetDate = isnull(@SetDate, getdate()) ;
		begin try
			set @_Step = 'Record POC' ;

		

			--set @RunStateId =
			--(
			--	select	RunStateId from batch.RunState where RunStateName = @EndState
			--) ;


			set @RunStateId =
			(
				select
					s.RunStateId
				from
					batch.RunStateFlag f
				  , batch.RunState s
				where
					s.FlagBit = f.FlagBit
					and s.RunStateName like 'Thre%'
					and upper(f.FlagName) =upper( @EndState)
			) ;
			
			update
				batch.ThreadRun
			set
				EndTime = @SetDate
			  , RunStateId = @RunStateId
			  , EndState = @EndState
			  , EndMessage = @EndMessage
			  , SuccessSourceRows = @SuccessSourceRows
			  , FailedSourceRows = @FailedSourceRows
			  , SuccessTargetRows = @SuccessTargetRows
			  , FailedTargetRows = @FailedTargetRows
			where
				ThreadRunId = @ThreadRunId ;

		end try
		begin catch
			set @_ErrorContext = 'Failed to record end of thread run' + ' for MCT Name: ' + coalesce('"' + @MappingConfigTaskName + '"', 'NULL')
								 + ' , Mapping: ' + coalesce('"' + @MappingName + '"', 'NULL') + ' and (BatMan) Thread Run Id: '
								 + coalesce(cast(@ThreadRunId as varchar(32)), 'NULL') + ' with End State: ' + coalesce('[' + @EndState + ']', 'NULL')
								 + ' at step: ' + coalesce('[' + @_Step + ']', 'NULL') ;

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
EXEC sp_addextendedproperty N'MS_Description', N'Records the end state of the indicated thread run.  ICS Note:  This call is not required if the output from the initiating call from this MCT to ThreadRunStart was “SKIP”, “STOP” or “ERROR”', 'SCHEMA', N'ics', 'PROCEDURE', N'ThreadRunEnd', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Optional, a message provided by the caller to provide any detail around the reason for success, failure or other stoppage', 'SCHEMA', N'ics', 'PROCEDURE', N'ThreadRunEnd', 'PARAMETER', N'@EndMessage'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, an indicator of the final run state for this thread run, choose from “SUCCEEDED” or “FAILED”', 'SCHEMA', N'ics', 'PROCEDURE', N'ThreadRunEnd', 'PARAMETER', N'@EndState'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The number of source rows rejected or failed by this thread', 'SCHEMA', N'ics', 'PROCEDURE', N'ThreadRunEnd', 'PARAMETER', N'@FailedSourceRows'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, the number of records failed by this thread during “write to target”, represents the total number of source rows that were not processed into the target table at all.', 'SCHEMA', N'ics', 'PROCEDURE', N'ThreadRunEnd', 'PARAMETER', N'@FailedTargetRows'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, the name of the ICS mapping configuration task from which this call originates', 'SCHEMA', N'ics', 'PROCEDURE', N'ThreadRunEnd', 'PARAMETER', N'@MappingConfigTaskName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, the name of the ICS mapping from which this call originates', 'SCHEMA', N'ics', 'PROCEDURE', N'ThreadRunEnd', 'PARAMETER', N'@MappingName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The number of source rows successfully read by this thread', 'SCHEMA', N'ics', 'PROCEDURE', N'ThreadRunEnd', 'PARAMETER', N'@SuccessSourceRows'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, the total number of records written to the target table by this thread, typically the total number of inserts, updates and soft-deletes on a single target table.  This is required so that table level quality gates and execution dependencies can be implemented as needed.', 'SCHEMA', N'ics', 'PROCEDURE', N'ThreadRunEnd', 'PARAMETER', N'@SuccessTargetRows'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, the Id of the Thread run context that should be marked as succeeded, failed or otherwise stopped', 'SCHEMA', N'ics', 'PROCEDURE', N'ThreadRunEnd', 'PARAMETER', N'@ThreadRunId'
GO
