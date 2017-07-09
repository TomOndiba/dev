IF OBJECT_ID('[pbi].[factBudgetVolumes]') IS NOT NULL
	DROP VIEW [pbi].[factBudgetVolumes];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create view [pbi].[factBudgetVolumes]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.factBudgetVolumes
DESCRIPTION:    Exposes current state of the BudgetVolume facts imported from QlikView (no history available)
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    21-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		21-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		  BudgetVolumesKey as [BudgetVolumeKey]
		, LineCount
		, BusinessUnitKey
		, ProductCategoryKey
		, Jan_YTD
		, Feb_YTD
		, Mar_YTD
		, Apr_YTD
		, May_YTD
		, Jun_YTD
		, Jul_YTD
		, Aug_YTD
		, Sep_YTD
		, Oct_YTD
		, Nov_YTD
		, Dec_YTD
		, IsDeleted
	from
		qvstg.BudgetVolumes
GO
