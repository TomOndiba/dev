﻿CREATE TABLE [stg].[BusinessUnit]
(
  BusinessUnitKey int not null identity(100, 1)
, EtlDeltaHash char(32) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, IsDeleted char(1) not null
-----------------------------------------------------------------------------------------------------------------------
--! This is effectively the business key that the ETL process will lookup
, NativeBusinessUnitKey nvarchar(50) not null
-----------------------------------------------------------------------------------------------------------------------
, StrategicBusinessUnitCode nvarchar(20) not null
, SalesCenterSbuCode nvarchar(20) not null
, BusinessUnitName nvarchar(100) not null
, RegionId int null
, RegionName nvarchar(50) not null
, RegionDescription nvarchar(1000) not null
, constraint PK_stg_BusinessUnit primary key clustered (BusinessUnitKey)
, constraint AK_stg_BusinessUnit_NativeBusinessUnitKey unique nonclustered (NativeBusinessUnitKey)
, constraint CK_stg_BusinessUnit_IsDeleted check (IsDeleted = 'Y' or IsDeleted = 'N' )
)
