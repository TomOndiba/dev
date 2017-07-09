IF OBJECT_ID('[pbi].[dimBusinessUnit]') IS NOT NULL
	DROP VIEW [pbi].[dimBusinessUnit];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create view [pbi].[dimBusinessUnit]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.dimBusinessUnit
DESCRIPTION:    Exposes current state of the Business Unit dimension imported from QlikView (no history available)
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    16-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		16-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		s.BusinessUnitKey
	  , s.SalesCenterSbuCode as [SBU]
	  , s.BusinessUnitName
	  , s.RegionName
	  , s.RegionDescription
	  , cast('19000101 00:00:00' as datetime) as [RowValidFromUTC]
	  , cast('99991231 23:59:59' as datetime) as [RowValidToUTC]
	  , cast('Y' as char(1)) as [IsCurrent]
	  , s.IsDeleted
	from
		qvstg.BusinessUnit as s
GO
