IF OBJECT_ID('[pbi].[factBudgetSales]') IS NOT NULL
	DROP VIEW [pbi].[factBudgetSales];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create view [pbi].[factBudgetSales]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.factBudgetSales
DESCRIPTION:    Exposes current state of the BudgetSales facts imported from QlikView (no history available)
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    20-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		20-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		  BudgetSaleKey
		, LineCount
		, BusinessUnitKey
		, BudgetMonthDateKey
		, InstallationServices
		, ProducedGoods
		, GroupGoods
		, CommercialGoods
		, ExternalSales
		, IC_Transf_SBU
		, IC_Transf_Region
		, IC_Transf_Abroad
		, IC_Transf_US
		, Total_IC_Sales
		, TotalSalesAndTransfers
		, IsDeleted
	from
		qvstg.BudgetSales
GO
