




CREATE view [dbo].[V_KPI_RMI_BUDGET] as 
--
-- Select all RMI budgets. Find exchange rate for local currency and euro on first date of budget-year
--
select rb.SBU, 
       pg.PRODUCT_GROUP, 
       rb.BUDGET_YEAR, 
       rb.QUANTITY_BUDGET *  uni.FACTOR as QUANTITY_BUDGET, 
       isnull(uni1.UOM, uni.UOM) as UOM,
       rb.AMOUNT_BUDGET * uni.FACTOR as LOCAL_AMOUNT_BUDGET, 
       rb.CURRENCY,
       cast((((rb.AMOUNT_BUDGET * uni.FACTOR) * cr.CURRENCY_RATE) / eurr.CURRENCY_RATE) as integer) as EURO_AMOUNT_BUDGET,
       (((rb.FREIGHT_BUDGET) * cr.CURRENCY_RATE) / eurr.CURRENCY_RATE) as EURO_FREIGHT_BUDGET,
       rb.FREIGHT_BUDGET  as LOCAL_FREIGHT_BUDGET,
       cr.CURRENCY_RATE   as LOCAL_CURRENCY_RATE,
       cr.DATE_ACTIVE     as LOCAL_CURRENCY_RATE_DATE,
       eurr.CURRENCY_RATE as EURO_CURRENCY_RATE,
       eurr.DATE_ACTIVE   as EURO_CURRENCY_RATE_DATE
from MD_PRODUCTGROUPS as pg
       join
         KPI_RMI_BUDGET as rb on (rb.PRODUCT_GROUP = pg.PRODUCT_GROUP_BUDGET)
	   join
         MD_CURRENCY_RATE as cr on (cr.CURRENCY = rb.CURRENCY and
                                    cr.CURRENCY_RATE_TYPE = 2)
       join
         MD_CURRENCY_RATE as eurr on (eurr.CURRENCY = 'EUR' and
                                      eurr.CURRENCY_RATE_TYPE = 2)
       join
         MD_UNIT as uni on (uni.UOM = pg.UOM)
       left outer join
         MD_UNIT as uni1 on (uni1.UOM = uni.FACTOR1_UOM)
where
	  pg.UOM_CHECK_ONLY <> 'Y' and
      cast(rb.BUDGET_YEAR as Varchar(4))+'-01-01' >= (select TEKST
                                                      from FLEXPARAMS
                                                      where PARAMTYPE = 'DWH' and
                                                            PARAMNAVN = 'DATA_START_DATE') and
      cr.DATE_ACTIVE = (select TOP 1 DATE_ACTIVE
                        from MD_CURRENCY_RATE
                        where CURRENCY     = rb.CURRENCY and
                              CURRENCY_RATE_TYPE = 2 and
                              DATE_ACTIVE <= cast(rb.BUDGET_YEAR as Varchar(4))+'-01-01'
                        order by DATE_ACTIVE desc) and
      eurr.DATE_ACTIVE = (select TOP 1 DATE_ACTIVE
                          from MD_CURRENCY_RATE
                          where CURRENCY     = 'EUR' and
                              CURRENCY_RATE_TYPE = 2 and
                                DATE_ACTIVE <= cast(rb.BUDGET_YEAR as Varchar(4))+'-01-01'
                          order by DATE_ACTIVE desc)