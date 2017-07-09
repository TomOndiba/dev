set identity_insert stg.BusinessUnit on;
go

;with sourceCte (BusinessUnitKey, IsDeleted, BusinessUnitCode, BusinessUnitName, BusinessUnitDescription)
as
(
			  select -1, 'N', 'N/S', 'Not Specified at Source'		, 'Indicates that the value in the source system was NULL'
	union all select -2, 'N', 'N/F', 'Lookup Not Found'				, 'Indicates that the source system provided a value but that there is no matching lookup'
	union all select -3, 'N', 'N/I', 'Not Implemented in Source'	, 'Used when the source system does not support the concept of a Business Unit'
	union all select -4, 'N', 'N/A', 'Not Applicable'				, 'Used in a context where Business Unit has no relevance in this context'
	union all select -5, 'N', 'N/D', 'Not Defined'					, 'The logic to identify the Business Unit has not been supplied or specified'
)
merge into stg.BusinessUnit as tgt
using sourceCte as src
	on src.BusinessUnitKey = tgt.BusinessUnitKey
when not matched
	then insert
	(
	  BusinessUnitKey
	, IsDeleted
	, EtlDeltaHash
	, EtlCreatedOn
	, EtlCreatedBy
	, EtlUpdatedOn
	, EtlUpdatedBy
	, EtlDeletedOn
	, EtlDeletedBy
	, NativeBusinessUnitKey
	, StrategicBusinessUnitCode
	, SalesCenterSbuCode
	, BusinessUnitName
	, RegionId
	, RegionName
	, RegionDescription
	)
	values
	(
	  src.BusinessUnitKey
	, src.IsDeleted
	, src.BusinessUnitCode -- EtlDeltaHash
	, getdate() -- EtlCreatedOn
	, 'add seed values' -- EtlCreatedBy
	, getdate() -- EtlUpdatedOn
	, 'add seed values'  -- EtlUpdatedBy
	, null -- EtlDeletedOn
	, null -- EtlDeletedBy
	, src.BusinessUnitCode -- NativeBusinessUnitKey
	, src.BusinessUnitCode -- StrategicBusinessUnitCode
	, src.BusinessUnitCode -- SalesCenterSbuCode
	, src.BusinessUnitName -- BusinessUnitName
	, null -- RegionId
	, src.BusinessUnitName -- RegionName
	, src.BusinessUnitDescription -- RegionDescription
	)
when matched
	and tgt.IsDeleted <> src.IsDeleted
	or tgt.NativeBusinessUnitKey <> src.BusinessUnitCode
	or tgt.BusinessUnitName <> src.BusinessUnitName
	or tgt.RegionDescription <> src.BusinessUnitDescription
	or tgt.StrategicBusinessUnitCode <> src.BusinessUnitCode
then update
	set
		  tgt.IsDeleted = src.IsDeleted
		, tgt.EtlDeltaHash = src.BusinessUnitCode
		, tgt.EtlUpdatedOn = getdate()
		, tgt.EtlUpdatedBy = 'update seed values' 
		, tgt.EtlDeletedOn = case when src.IsDeleted = 'Y' then getdate() else tgt.EtlDeletedOn end
		, tgt.EtlDeletedBy = case when src.IsDeleted = 'Y' then 'update seed values' else tgt.EtlDeletedBy end
		, tgt.NativeBusinessUnitKey = src.BusinessUnitCode
		, tgt.StrategicBusinessUnitCode = src.BusinessUnitCode
		, tgt.SalesCenterSbuCode = src.BusinessUnitCode
		, tgt.BusinessUnitName = src.BusinessUnitName
		, tgt.RegionName = src.BusinessUnitName
		, tgt.RegionDescription = src.BusinessUnitDescription
;
	
set identity_insert stg.BusinessUnit off;
go
