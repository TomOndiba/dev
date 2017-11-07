IF OBJECT_ID('[ics].[SubProcessRunEnd]') IS NOT NULL
	DROP PROCEDURE [ics].[SubProcessRunEnd];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE proc [ics].[SubProcessRunEnd]
(
	@ProcessName	 varchar(100)
  , @SubProcessName	 varchar(100)
  , @SubProcessRunId int
  , @EndState		 varchar(100)
  , @EndMessage		 varchar(500) = null
  , @SetDate		 datetime	  = null
)
as
	--<CommentHeader>
	/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		ics.SubProcessRunEnd
DESCRIPTION:		POC stub procedure
ORIGIN DATE:		26-JUL-2017
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
001		25-JUL-2017		RN		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------
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
		

			set @RunStateId =
			(
				select
					s.RunStateId
				from
					batch.RunStateFlag f
				  , batch.RunState s
				where
					s.FlagBit = f.FlagBit
					and s.RunStateName like 'Sub-Pro%'
					and upper(f.FlagName) = upper(@EndState)
			) ;

			update
				batch.StepRun
			set
				EndTime = @SetDate
			  , RunStateId = @RunStateId
			  , EndState = @EndState
			  , EndMessage = @EndMessage
			where
				StepRunId = @SubProcessRunId ;

		end try
		begin catch
			set @_ErrorContext = 'Failed to record end of sub-process run' + ' for ICRT Process: ' + coalesce('"' + @ProcessName + '"', 'NULL')
								 + ' , ICRT Sub-Process: ' + coalesce('"' + @SubProcessName + '"', 'NULL') + ' and (BatMan) Sub-process Run Id: '
								 + coalesce(cast(@SubProcessRunId as varchar(32)), 'NULL') + ' with End State: ' + coalesce('[' + @EndState + ']', 'NULL')
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
EXEC sp_addextendedproperty N'MS_Description', N'Records the end state of the indicated sub-process run.  ICS Note:  This call is not required if the output from the initiating call from this sub-process to SubProcessRunStart was “SKIP”, “STOP” or “ERROR”', 'SCHEMA', N'ics', 'PROCEDURE', N'SubProcessRunEnd', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Optional, a message provided by the caller to provide any detail around the reason for success, failure or other stoppage', 'SCHEMA', N'ics', 'PROCEDURE', N'SubProcessRunEnd', 'PARAMETER', N'@EndMessage'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, an indicator of the final run state for this sub-process run, choose from “SUCCEEDED”, “STOPPED”, “SKIPPED” or “FAILED”', 'SCHEMA', N'ics', 'PROCEDURE', N'SubProcessRunEnd', 'PARAMETER', N'@EndState'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, the name of the ICS process responsible for running the end-to-end data load for a source', 'SCHEMA', N'ics', 'PROCEDURE', N'SubProcessRunEnd', 'PARAMETER', N'@ProcessName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, the name of the ICRT sub-process responsible for running this subject area step', 'SCHEMA', N'ics', 'PROCEDURE', N'SubProcessRunEnd', 'PARAMETER', N'@SubProcessName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, the Id of the sub-process run context that should be marked as succeeded, failed or otherwise stopped', 'SCHEMA', N'ics', 'PROCEDURE', N'SubProcessRunEnd', 'PARAMETER', N'@SubProcessRunId'
GO
