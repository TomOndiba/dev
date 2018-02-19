IF OBJECT_ID('[dbo].[UpdateSAPMarmUoM]') IS NOT NULL
	DROP PROCEDURE [dbo].[UpdateSAPMarmUoM];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
	create   procedure [dbo].[UpdateSAPMarmUoM] @dummypara int
	as
	begin

				update m
		set 
		ReportingUnitOfMeasure='M2'
		from 
		psa.ics_stg_SAP_GBR_MARM m 
		where m.MATNR in (select  Item from [discovery].[procurement_sap_gbr]
		where upper([PurchaseOrderUnit]) ='M' )
		and upper(m.MEINH) in ('M2')
	

		update m
		set 
		ReportingUnitOfMeasure='M2'
		from 
		psa.ics_stg_SAP_GBR_MARM m 
		where m.MATNR in (select  Item from [discovery].[procurement_sap_gbr]
		where upper([PurchaseOrderUnit]) ='M2' )
		and  m.MATNR not in (select  c.MATNR from psa.ics_stg_SAP_GBR_MARM c 
		where c.ReportingUnitOfMeasure is not null )
	



		
		update m
		set 
		ReportingUnitOfMeasure='KG'
		from 
		psa.ics_stg_SAP_GBR_MARM m 
		where m.MATNR in (select  Item from [discovery].[procurement_sap_gbr]
		where upper([PurchaseOrderUnit]) not like '%R%L%' )
		and upper(m.MEINH) in ('KG')
		and  m.MATNR not in (select  c.MATNR from psa.ics_stg_SAP_GBR_MARM c 
		where c.ReportingUnitOfMeasure is not null )

		  

	

		
		update m
		set 
		ReportingUnitOfMeasure='M2'
		from 
		psa.ics_stg_SAP_GBR_MARM m 
		where m.MATNR in (select  Item from [discovery].[procurement_sap_gbr] 
		where upper([PurchaseOrderUnit]) like '%R%L%' )
		and upper(m.MEINH) in ('M2')
		and  m.MATNR not in (select  c.MATNR from psa.ics_stg_SAP_GBR_MARM c 
		where c.ReportingUnitOfMeasure is not null )

		
		
			update m
		set 
		ReportingUnitOfMeasure='ROL'
		from 
		psa.ics_stg_SAP_GBR_MARM m 
		where m.MATNR in (select  Item from [discovery].[procurement_sap_gbr] 
		where upper([PurchaseOrderUnit]) like '%R%L%' )
		and upper(m.MEINH) like '%R%L%'
		and  m.MATNR not in (select  c.MATNR from psa.ics_stg_SAP_GBR_MARM c 
		where c.ReportingUnitOfMeasure is not null )
		
		
		
		
		end
GO
