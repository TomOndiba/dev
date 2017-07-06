create view [etl].[SiteDelta]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      etl.SiteDelta
DESCRIPTION:    Exposes Site changes (new, changed and deleted) in the format best suited to populate the Interim
				Data Warehouse/Mart.
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    30-MAY-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		30-MAY-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		  s.SiteKey
		, s.IsDeleted
		, s.NativeSiteKey
		, s.SiteName
		, s.SiteDescription
		--! If StrategicBusinessUnitCode is NULL, use "Not Specified at Source" (-1) and if there
		--! is no match in stg.BusinessUnit then use "Lookup Not Found" (-2)
		, case when coalesce(s.StrategicBusinessUnitCode, '') = '' then -1 else coalesce(bu.BusinessUnitKey, -2) end	as [BusinessUnitKey]
		, s.StrategicBusinessUnitCode
		, s.SalesCenterSbuCode
		, s.BusinessUnitName
		, s.RegionId
		, s.RegionName
		, s.RegionDescription
		--! The standard sites (N/S, N/F, N/I etc) may already have the correct QlikViewSourceSystemId
		, case when s.SourceSystemId = 100000 then s.SourceSystemId else s.SourceSystemId + 100100 end as [DataSourceKey]
		, s.SourceSystemId
		, s.SourceSystemName
	from
		stg.[Site] as s
	left join stg.SiteControl as sc
		on sc.SiteKey = s.SiteKey
	left join stg.BusinessUnit as bu
		on bu.NativeBusinessUnitKey = s.StrategicBusinessUnitCode
	where
			sc.SiteKey is null --! New Sites (not yet added to control)
		or sc.PreviousDeltaHash <> s.EtlDeltaHash -- Existing Sites that have been updated
		or sc.IsDeleted <> s.IsDeleted --! Sites that have been soft-deleted or (possibly) re-activated

go
exec sp_addextendedproperty @name = N'MS_Description'
, @value = 'Exposes Site changes (new, changed and deleted) in the format best suited to populate the Interim Data Warehouse/Mart'
, @level0type = N'SCHEMA', @level0name = N'etl', @level1type = N'VIEW', @level1name = N'SiteDelta';
