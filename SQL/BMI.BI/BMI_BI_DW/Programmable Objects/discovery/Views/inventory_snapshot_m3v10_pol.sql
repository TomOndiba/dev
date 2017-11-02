IF OBJECT_ID('[discovery].[inventory_snapshot_m3v10_pol]') IS NOT NULL
	DROP VIEW [discovery].[inventory_snapshot_m3v10_pol];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
View NAME:			discovery.inventory_snapshot_m3v10_pol
DESCRIPTION:		Poland(Gen, Vil & Ved) Inventory
ORIGIN DATE:		31-Oct-2017
ORIGINAL AUTHOR:	Tom Manville 

Returns
=======
stock quantity per product per warehouse

Additional Notes
================

REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		02-Nov-2017		TM		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------

**********************************************************************************************************************/
--</CommentHeader>

create   view [discovery].[inventory_snapshot_m3v10_pol]
as
select
	MITTRA.EtlCreatedOn						  as etl_created_on
  , MITTRA.EtlSourceTable					  as etl_source_table
  , max(MITTRA.MTTRDT)						  as transaction_date
  , MITTRA.DataSourceKey					  as data_source_key
  , ds.DataSourceName						  as data_source_name
  , 'POL'									  as country_code
  , MITTRA.MTWHLO							  as native_warehouse_number
  , MITWHL.MWWHNM							  as native_warehouse_name
  , MITTRA.MTITNO							  as native_product_key
  , coalesce(prod.ProductName, MITMAS.MMITDS) as product_name
  , prod.ProductCategoryBaseLevel			  as product_category_direct
  , prod.ProductCategoryLevel1				  as product_category_level_1
  , prod.ProductCategoryLevel2				  as product_category_level_2
  , prod.ProductCategoryLevel3				  as product_category_level_3
  , prod.ProductCategoryLevel4				  as product_category_level_4
  , prod.ProductCategoryLevel5				  as product_category_level_5
  , sum(MITTRA.MTTRQT)						  as native_stock_on_hand
  , MITMAS.MMUNMS							  as native_unit_of_measure
  , coalesce(uom.unit_of_measure_code, '')	  as standard_unit_of_measure
  , 'PLN'									  as local_ccy
  , ''										  as native_unit_value_local_ccy
  , ''										  as stock_in_hand_value_local_ccy
  , MITMAS.MMPUPR							  as native_unit_value_eur
  , sum(MITTRA.MTTRQT * MITMAS.MMPUPR)		  as stock_in_hand_value_eur
from
	psa.ics_stg_M3V10gen_POL_MITTRA		  as MITTRA ---- Material table
inner join dbo.DataSource				  as ds
	on ds.DataSourceKey = MITTRA.DataSourceKey
left join psa.ics_stg_M3V10gen_POL_MITMAS as MITMAS ---material master
	on MITTRA.MTITNO = MITMAS.MMITNO
left join psa.ics_stg_M3V10gen_POL_MITWHL as MITWHL ---warehouse location
	on MITTRA.MTWHLO = MITWHL.MWWHLO
left join qvstg.Product					  as prod
	on MITTRA.MTITNO = prod.NativeProductKey
		and MITTRA.DataSourceKey = prod.DataSourceKey
left join etl.unit_of_measure_lookup	  as uomlu
	on MITMAS.MMUNMS = uomlu.native_key
		and MITTRA.DataSourceKey = uomlu.data_source_key
left join dbo.unit_of_measure			  as uom
	on uom.unit_of_measure_id = uomlu.unit_of_measure_id
group by
	MITTRA.MTWHLO
  , MITTRA.MTITNO
  , MITMAS.MMITDS
  , MTWHSL
  , MTBANO
  , MITMAS.MMUNMS
  , MITWHL.MWWHNM
  , MITTRA.EtlCreatedOn
  , MITTRA.EtlSourceTable
  , prod.ProductName
  , prod.ProductCategoryBaseLevel
  , MITTRA.DataSourceKey
  , prod.ProductCategoryLevel1
  , prod.ProductCategoryLevel2
  , prod.ProductCategoryLevel3
  , prod.ProductCategoryLevel4
  , prod.ProductCategoryLevel5
  , ds.DataSourceName
  , coalesce(uom.unit_of_measure_code, '')
  , MITMAS.MMPUPR
having
	sum(MITTRA.MTTRQT) <> 0
union
select
	MITTRA.EtlCreatedOn						  as etl_created_on
  , MITTRA.EtlSourceTable					  as etl_source_table
  , max(MITTRA.MTTRDT)						  as transaction_date
  , MITTRA.DataSourceKey					  as data_source_key
  , ds.DataSourceName						  as data_source_name
  , 'POL'									  as country_code
  , MITTRA.MTWHLO							  as native_warehouse_number
  , MITWHL.MWWHNM							  as native_warehouse_name
  , MITTRA.MTITNO							  as native_product_key
  , coalesce(prod.ProductName, MITMAS.MMITDS) as product_name
  , prod.ProductCategoryBaseLevel			  as product_category_direct
  , prod.ProductCategoryLevel1				  as product_category_level_1
  , prod.ProductCategoryLevel2				  as product_category_level_2
  , prod.ProductCategoryLevel3				  as product_category_level_3
  , prod.ProductCategoryLevel4				  as product_category_level_4
  , prod.ProductCategoryLevel5				  as product_category_level_5
  , sum(MITTRA.MTTRQT)						  as native_stock_on_hand
  , MITMAS.MMUNMS							  as native_unit_of_measure
  , coalesce(uom.unit_of_measure_code, '')	  as standard_unit_of_measure
  , 'PLN'									  as local_ccy
  , ''										  as native_unit_value_local_ccy
  , ''										  as stock_in_hand_value_local_ccy
  , MITMAS.MMPUPR							  as native_unit_value_eur
  , sum(MITTRA.MTTRQT * MITMAS.MMPUPR)		  as stock_in_hand_value_eur
from
	psa.ics_stg_M3V10ved_POL_MITTRA		  as MITTRA ---- Material table
inner join dbo.DataSource				  as ds
	on ds.DataSourceKey = MITTRA.DataSourceKey
left join psa.ics_stg_M3V10ved_POL_MITMAS as MITMAS ---material master
	on MITTRA.MTITNO = MITMAS.MMITNO
left join psa.ics_stg_M3V10ved_POL_MITWHL as MITWHL ---warehouse location
	on MITTRA.MTWHLO = MITWHL.MWWHLO
left join qvstg.Product					  as prod
	on MITTRA.MTITNO = prod.NativeProductKey
		and MITTRA.DataSourceKey = prod.DataSourceKey
left join etl.unit_of_measure_lookup	  as uomlu
	on MITMAS.MMUNMS = uomlu.native_key
		and MITTRA.DataSourceKey = uomlu.data_source_key
left join dbo.unit_of_measure			  as uom
	on uom.unit_of_measure_id = uomlu.unit_of_measure_id
group by
	MITTRA.MTWHLO
  , MITTRA.MTITNO
  , MITMAS.MMITDS
  , MTWHSL
  , MTBANO
  , MITMAS.MMUNMS
  , MITWHL.MWWHNM
  , MITTRA.EtlCreatedOn
  , MITTRA.EtlSourceTable
  , prod.ProductName
  , prod.ProductCategoryBaseLevel
  , MITTRA.DataSourceKey
  , prod.ProductCategoryLevel1
  , prod.ProductCategoryLevel2
  , prod.ProductCategoryLevel3
  , prod.ProductCategoryLevel4
  , prod.ProductCategoryLevel5
  , ds.DataSourceName
  , coalesce(uom.unit_of_measure_code, '')
  , MITMAS.MMPUPR
having
	sum(MITTRA.MTTRQT) <> 0
union
select
	MITTRA.EtlCreatedOn						  as etl_created_on
  , MITTRA.EtlSourceTable					  as etl_source_table
  , max(MITTRA.MTTRDT)						  as transaction_date
  , MITTRA.DataSourceKey					  as data_source_key
  , ds.DataSourceName						  as data_source_name
  , 'POL'									  as country_code
  , MITTRA.MTWHLO							  as native_warehouse_number
  , MITWHL.MWWHNM							  as native_warehouse_name
  , MITTRA.MTITNO							  as native_product_key
  , coalesce(prod.ProductName, MITMAS.MMITDS) as product_name
  , prod.ProductCategoryBaseLevel			  as product_category_direct
  , prod.ProductCategoryLevel1				  as product_category_level_1
  , prod.ProductCategoryLevel2				  as product_category_level_2
  , prod.ProductCategoryLevel3				  as product_category_level_3
  , prod.ProductCategoryLevel4				  as product_category_level_4
  , prod.ProductCategoryLevel5				  as product_category_level_5
  , sum(MITTRA.MTTRQT)						  as native_stock_on_hand
  , MITMAS.MMUNMS							  as native_unit_of_measure
  , coalesce(uom.unit_of_measure_code, '')	  as standard_unit_of_measure
  , 'PLN'									  as local_ccy
  , ''										  as native_unit_value_local_ccy
  , ''										  as stock_in_hand_value_local_ccy
  , MITMAS.MMPUPR							  as native_unit_value_eur
  , sum(MITTRA.MTTRQT * MITMAS.MMPUPR)		  as stock_in_hand_value_eur
from
	psa.ics_stg_M3V10vil_POL_MITTRA		  as MITTRA ---- Material table
inner join dbo.DataSource				  as ds
	on ds.DataSourceKey = MITTRA.DataSourceKey
left join psa.ics_stg_M3V10vil_POL_MITMAS as MITMAS ---- material master
	on MITTRA.MTITNO = MITMAS.MMITNO
left join psa.ics_stg_M3V10vil_POL_MITWHL as MITWHL ---warehouse location
	on MITTRA.MTWHLO = MITWHL.MWWHLO
left join qvstg.Product					  as prod
	on MITTRA.MTITNO = prod.NativeProductKey
		and MITTRA.DataSourceKey = prod.DataSourceKey
left join etl.unit_of_measure_lookup	  as uomlu
	on MITMAS.MMUNMS = uomlu.native_key
		and MITTRA.DataSourceKey = uomlu.data_source_key
left join dbo.unit_of_measure			  as uom
	on uom.unit_of_measure_id = uomlu.unit_of_measure_id
group by
	MITTRA.MTWHLO
  , MITTRA.MTITNO
  , MITMAS.MMITDS
  , MTWHSL
  , MTBANO
  , MITMAS.MMUNMS
  , MITWHL.MWWHNM
  , MITTRA.EtlCreatedOn
  , MITTRA.EtlSourceTable
  , prod.ProductName
  , prod.ProductCategoryBaseLevel
  , MITTRA.DataSourceKey
  , prod.ProductCategoryLevel1
  , prod.ProductCategoryLevel2
  , prod.ProductCategoryLevel3
  , prod.ProductCategoryLevel4
  , prod.ProductCategoryLevel5
  , ds.DataSourceName
  , coalesce(uom.unit_of_measure_code, '')
  , MITMAS.MMPUPR
having
	sum(MITTRA.MTTRQT) <> 0 ;
GO
