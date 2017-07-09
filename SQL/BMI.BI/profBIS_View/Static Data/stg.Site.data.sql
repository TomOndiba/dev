set identity_insert stg.[Site] on;
go

;with sourceCte (SiteKey, IsDeleted, SiteCode, SiteName, SiteDescription)
as
(
			  select -1, 'N', 'N/S', 'Not Specified at Source'	, 'Indicates that the value in the source system was NULL'
	union all select -2, 'N', 'N/F', 'Lookup Not Found'			, 'Indicates that the source system provided a value but that there is no matching lookup'
	union all select -3, 'N', 'N/I', 'Not Implemented in Source'	, 'Used when the source system does not support the concept of a Site'
	union all select -4, 'N', 'N/A', 'Not Applicable'			, 'Used in a context where Site has no relevance in this context'
	union all select -5, 'N', 'N/D', 'Not Defined'				, 'The logic to identify the Site has not been supplied or specified'
)
merge into stg.[Site] as tgt
using sourceCte as src
	on src.SiteKey = tgt.SiteKey
when not matched
	then insert
	(
	  SiteKey
	, IsDeleted
	, EtlDeltaHash
	, EtlCreatedOn
	, EtlCreatedBy
	, EtlUpdatedOn
	, EtlUpdatedBy
	, EtlDeletedOn
	, EtlDeletedBy
	, NativeSiteKey
	, SiteName
	, SiteDescription
	, StrategicBusinessUnitCode
	, SalesCenterSbuCode
	, BusinessUnitName
	, RegionId
	, RegionName
	, RegionDescription
	, SourceSystemId
	, SourceSystemName
	)
	values
	(
	  src.SiteKey
	, src.IsDeleted
	, src.SiteCode -- EtlDeltaHash
	, getdate() -- EtlCreatedOn
	, 'add seed values' -- EtlCreatedBy
	, getdate() -- EtlUpdatedOn
	, 'add seed values'  -- EtlUpdatedBy
	, null -- EtlDeletedOn
	, null -- EtlDeletedBy
	, src.SiteCode -- NativeSiteKey
	, src.SiteName -- SiteName
	, src.SiteDescription -- SiteDescription
	, src.SiteCode -- StrategicBusinessUnitCode
	, src.SiteCode -- SalesCenterSbuCode
	, src.SiteName -- BusinessUnitName
	, null -- RegionId
	, src.SiteName -- RegionName
	, '' -- RegionDescription
	, null -- SourceSystemId
	, src.SiteName -- SourceSystemName
	)
when matched
	and tgt.IsDeleted <> src.IsDeleted
	or tgt.NativeSiteKey <> src.SiteCode
	or tgt.SiteName <> src.SiteName
	or tgt.SiteDescription <> src.SiteDescription
	or tgt.StrategicBusinessUnitCode <> src.SiteCode
then update
	set
		  tgt.IsDeleted = src.IsDeleted
		, tgt.EtlDeltaHash = src.SiteCode
		, tgt.EtlUpdatedOn = getdate()
		, tgt.EtlUpdatedBy = 'update seed values' 
		, tgt.EtlDeletedOn = case when src.IsDeleted = 'Y' then getdate() else tgt.EtlDeletedOn end
		, tgt.EtlDeletedBy = case when src.IsDeleted = 'Y' then 'update seed values' else tgt.EtlDeletedBy end
		, tgt.NativeSiteKey = src.SiteCode
		, tgt.SiteName = src.SiteName
		, tgt.SiteDescription = src.SiteDescription
		, tgt.StrategicBusinessUnitCode = src.SiteCode
		, tgt.SalesCenterSbuCode = src.SiteCode
		, tgt.BusinessUnitName = src.SiteName
		, tgt.RegionName = src.SiteName
		, tgt.SourceSystemName = src.SiteName
;
	
set identity_insert stg.Site off;
go
