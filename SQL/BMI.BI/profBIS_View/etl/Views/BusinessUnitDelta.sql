create view [etl].[BusinessUnitDelta]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      etl.BusinessUnitDelta
DESCRIPTION:    Exposes Business Unit changes (new, changed and deleted) in the format best suited to populate the
				Interim Data Warehouse/Mart.
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
		  bu.BusinessUnitKey
		, bu.IsDeleted
		, bu.NativeBusinessUnitKey
		, bu.StrategicBusinessUnitCode
		, bu.SalesCenterSbuCode
		, bu.RegionId
		, bu.RegionName
		, bu.RegionDescription
	from
		stg.BusinessUnit as bu
	left join stg.BusinessUnitControl as sc
		on sc.BusinessUnitKey = bu.BusinessUnitKey
	where
			sc.BusinessUnitKey is null --! New Business Units (not yet added to control)
		or sc.PreviousDeltaHash <> bu.EtlDeltaHash -- Existing Business Units that have been updated
		or sc.IsDeleted <> bu.IsDeleted --! Business Units that have been soft-deleted or (possibly) re-activated

go
exec sp_addextendedproperty @name = N'MS_Description'
, @value = 'Exposes Business Unit changes (new, changed and deleted) in the format best suited to populate the Interim Data Warehouse/Mart'
, @level0type = N'SCHEMA', @level0name = N'etl', @level1type = N'VIEW', @level1name = N'BusinessUnitDelta';
