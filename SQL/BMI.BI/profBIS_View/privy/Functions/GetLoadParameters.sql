create function [privy].[GetLoadParameters]
(
  @ModuleName varchar(200)
)
returns table
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
FUNCTION NAME:  privy.GetLoadParameters
DESCRIPTION:    Returns the load parameters for the specified module or override if set, otherwise the default
				parameters if the module is not recognised
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    14-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		12-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

return
	(
		select top 1
			  ModuleName
			, DataCaptureStart
			, DataCaptureEnd
		from
			(
					select
						ModuleName, DataCaptureStart, DataCaptureEnd, 1 as [Precedence]
					from
						privy.StagingLoadParameter
					where
							ModuleName = 'OVERRIDE'
						--! Only use the override when the parameters are set
						and DataCaptureStart is not null
						and DataCaptureEnd is not null
				union all
					select
						ModuleName, DataCaptureStart, DataCaptureEnd, 10 as [Precedence]
					from
						privy.StagingLoadParameter
					where
						ModuleName = @ModuleName
				union all
					select
						ModuleName, DataCaptureStart, DataCaptureEnd, 100 as [Precedence]
					from
						privy.StagingLoadParameter
					where
						ModuleName = 'DEFAULT'
			) as x
		order by x.Precedence asc
	)
go
execute sp_addextendedproperty @name = N'MS_Description'
, @value = N'Returns the load parameters for the specified module or override if set, otherwise the default parameters if the module is not recognised'
, @level0type = N'SCHEMA', @level0name = N'privy', @level1type = N'FUNCTION', @level1name = N'GetLoadParameters';

