
CREATE view [dbo].[V_UNMAPPED_PAYMENTS] as
--
-- Tæl antal PaymentTerms der ikke er Mapped
--
select SYSTEM_ID, PAYMENT_TERM, PAYMENT_TERM_TEXT, Count(*) as UnmapPaymentCount
from(
     -- Find Unmapped i Direct
     select purch.SYSTEM_ID, purch.PAYMENT_TERM, purch.PAYMENT_TERM_TEXT
     from PU_PURCHASE as purch
     where not exists(select *
                      from PU_LINK_PAYMENTTERM as lp
                       where lp.SYSTEM_ID    = purch.SYSTEM_ID and
                             lp.PAYMENT_TERM = purch.PAYMENT_TERM)
    
--     union all

     -- Find Unmapped i Indirect
-- 	 select indir.SYSTEM_ID, indir.PAYMENT_TERM, indir.PAYMENT_TERM_TEXT
--     from PU_INDIRECT as indir
--     where not exists(select *
--                      from PU_LINK_PAYMENTTERM as lp
--                      where lp.SYSTEM_ID    = indir.SYSTEM_ID and
--                            lp.PAYMENT_TERM = indir.PAYMENT_TERM) and
--           indir.PAYMENT_TERM <> ''

--     union all

	 -- Find Unmapped i Contracting
--     select con.SYSTEM_ID, con.PAYMENT_TERM, con.PAYMENT_TERM_TEXT
--     from PU_CONTRACTING as con
--     where not exists(select *
--                      from PU_LINK_PAYMENTTERM as lp
--                       where lp.SYSTEM_ID    = con.SYSTEM_ID and
--                             lp.PAYMENT_TERM = con.PAYMENT_TERM)
	 ) as xx
group by xx.SYSTEM_ID, xx.PAYMENT_TERM, xx.PAYMENT_TERM_TEXT