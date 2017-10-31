IF OBJECT_ID('[dbo].[inventory_snapshot_sap_gbr]') IS NOT NULL
	DROP VIEW [dbo].[inventory_snapshot_sap_gbr];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


create   view [dbo].[inventory_snapshot_sap_gbr]
as

--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
View NAME:			dbo.inventory_snapshot_sap_gbr
DESCRIPTION:		SAP GBP Inventory
ORIGIN DATE:		31-Oct-2017
ORIGINAL AUTHOR:	Razia Nazir

Returns
=======
stock quantity per product  per plant(where plant is named as warehouse)

Additional Notes
================
Grain of the the view is plant not warehouse/storage location so we'll be excluding ics_land_SAP_GBR_T001L table as it's at stoarge level.

REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		31-Oct-2017		RN		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------

**********************************************************************************************************************/
--</CommentHeader>
with cte
as
(
	select distinct
		m.EtlCreatedOn															as etl_created_on
	  , m.EtlUpdatedOn															 as etl_updated_on
	  , m.EtlSourceTable														as etl_source_table
	  , m.IsDeleted																as is_deleted
	  , m.DLINL																	as snapshot_date			--'DateofLastPostedCountforUnrestrictedUseStock'---snapshotdate
	  , m.DataSourceKey															as data_source_key
	  , ds.DataSourceName														as data_source_name
	  , 'GBR'																	as country_code
	  , m.WERKS																	as native_warehouse_number --Plant but close to the warehouse 
	  , w.NAME1 + ' ' + w.NAME2													as native_warehouse_name	--plant but close to the warehouse 
	  , isnull(m.MATNR, p.NativeProductKey)										as native_product_key
	  , isnull(md.MAKTG, p.ProductName)											as product_name
	  , p.ProductCategoryBaseLevel												as product_category_direct
	  , p.ProductCategoryLevel1													as product_category_level_1
	  , p.ProductCategoryLevel2													as product_category_level_2
	  , p.ProductCategoryLevel3													as product_category_level_3
	  , p.ProductCategoryLevel4													as product_category_level_4
	  , p.ProductCategoryLevel5													as product_category_level_5
	  , m.LABST																	as native_stock_on_hand
	  , null																	as native_unit_of_measure
	  , null																	as standard_stock_on_hand
	  , null																	as standard_unit_of_measure
	  , 'GBR'																	as local_ccy
	  , cast(null as decimal(18, 2))											as native_unit_value_local_ccy
	  , cast(null as decimal(18, 2))											as standard_unit_value_local_ccy
	  , cast(null as decimal(18, 2))											as stock_in_hand_value_local_ccy
	  , cast(null as decimal(18, 2))											as native_unit_value_eur
	  , cast(null as decimal(18, 2))											as standard_unit_value_eur
	  , cast(null as decimal(18, 2))											as stock_in_hand_value_eur
	  , dense_rank() over (partition by m.MATNR, m.WERKS order by m.DLINL desc) as RankingMaterialPlant
	from
		psa.ics_stg_SAP_GBR_MARD			  m
	left outer join psa.ics_stg_SAP_GBR_T001W w
		on w.WERKS = m.WERKS
	left outer join psa.ics_stg_SAP_GBR_MAKT  md
		on m.MATNR = md.MATNR
	left outer join qvstg.Product			  p
		on m.MATNR = p.NativeProductKey
	left outer join DataSource				  ds
		on ds.DataSourceKey = m.DataSourceKey
	left outer join psa.ics_stg_SAP_GBR_T001L t
		on m.LGORT = t.LGORT
	where
		LVORM is null
)
select
	etl_created_on
  , etl_updated_on
  , etl_source_table
  , is_deleted
  , snapshot_date			--'D
  , data_source_key
  , data_source_name
  , country_code
  , native_warehouse_number --Pl
  , native_warehouse_name	--pl
  , native_product_key
  , product_name
  , product_category_direct
  , product_category_level_1
  , product_category_level_2
  , product_category_level_3
  , product_category_level_4
  , product_category_level_5
  , native_stock_on_hand
  , native_unit_of_measure
  , standard_stock_on_hand
  , standard_unit_of_measure
  , local_ccy
  , native_unit_value_local_ccy
  , standard_unit_value_local_ccy
  , stock_in_hand_value_local_ccy
  , native_unit_value_eur
  , standard_unit_value_eur
  , stock_in_hand_value_eur
from
	cte
where
	cte.RankingMaterialPlant = 1 ;
GO
