if objectpropertyex(object_id(N'pbi.factBudgetVolumes'), N'IsView') = 1
	drop view pbi.factBudgetVolumes
go
set quoted_identifier on;
set ansi_nulls on;
go
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
		  BudgetVolumeKey
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
		qvi.factBudgetVolumes
go
