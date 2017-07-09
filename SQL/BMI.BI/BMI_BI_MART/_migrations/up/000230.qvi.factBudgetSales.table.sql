if objectpropertyex(object_id(N'qvi.factBudgetSales'), N'IsUserTable') is not null
  drop table qvi.factBudgetSales ;
go

create table qvi.factBudgetSales
(
  BudgetSaleKey int not null
, EtlDeltaHash char(32) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, IsDeleted char(1) not null
, LineCount int not null
, BusinessUnitKey int not null
, BudgetMonthDateKey int not null
, InstallationServices decimal(28,4) null
, ProducedGoods decimal(28,4) null
, GroupGoods decimal(28,4) null
, CommercialGoods decimal(28,4) null
, ExternalSales decimal(28,4) null
, IC_Transf_SBU decimal(28,4) null
, IC_Transf_Region decimal(28,4) null
, IC_Transf_Abroad decimal(28,4) null
, IC_Transf_US decimal(28,4) null
, Total_IC_Sales decimal(28,4) null
, TotalSalesAndTransfers decimal(28,4) null
)
with (heap)
go
