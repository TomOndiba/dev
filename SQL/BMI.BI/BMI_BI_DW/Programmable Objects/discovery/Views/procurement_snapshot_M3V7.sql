IF OBJECT_ID('[discovery].[procurement_snapshot_M3V7]') IS NOT NULL
	DROP VIEW [discovery].[procurement_snapshot_M3V7];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE   view  
 [discovery].[procurement_snapshot_M3V7]
as
select 
h.IACONO as Division,
h.IADIVI as CompanyNumber,
h.IAFACI as Facility,
h.IAWHLO as Warehouse,
h.IAPUNO as PurchaseOrder,
h.IAORTY as POType,
h.IAPUSL as LowestStatus,
h.IAPUST as HighestStatus,
h.IASUNO as Supplier,
h.IACUCD as Currency,
l.IBPNLI as PurchaseLine,
l.IBITNO as Item,
l.IBORQA as OrderedQty,
l.IBRVQA as ReceivedQuantity,
l.IBCAQA as ApprovedQty,
l.IBRJQA as RejectedQty,
l.IBSDQA as StoredQty,
l.IBPUUN as PurchaseOrderUnit,
l.IBPPUN as PurchasePriceUnit,
l.IBLNAM as LineAmountOrderCurrency,
l.IBDWDT as RequestedDeliveryDate,
l.IBCODT as ConfirmedDeliveryDate,
l.IBPLDT as PlanningDeliveryDate,
l.IBLMDT as ChangeDate,
 'M3V7'	 as DataSource,
   (select max(d.EtlCreatedOn) from psa.ics_stg_m3v7_MPHEAD	 d) as DateDataExtracted

 from psa.ics_stg_m3v7_MPHEAD h---Header
left outer  join psa.ics_stg_m3v7_MPLINE l on ---line
h.IAPUNO =l.IBPUNO
--left outer join 
--[tsa].[ics_land_m3v7_FGINLI] i---invoice
--on i.F5PUNO=l.IBPUNO
--and L.IBPNLI=I.F5PNLI
--and l.IBPNLS=I.F5PNLS
where year(cast(IARGDT as nvarchar(20)))>'2016'
--order by IAPUNO,IBPNLI, IBPNLS



GO
