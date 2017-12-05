CREATE TABLE [tsa].[ics_land_SAP_SVK_ADRC]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_SVK_ADRC_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_SVK_ADRC_IsDuplicate] DEFAULT ((0)),
[ADDR_GROUP] [nvarchar] (4) NULL,
[ADDRESS_ID] [nvarchar] (10) NULL,
[ADDRNUMBER] [nvarchar] (10) NULL,
[ADDRORIGIN] [nvarchar] (4) NULL,
[BUILDING] [nvarchar] (20) NULL,
[CHCKSTATUS] [nvarchar] (1) NULL,
[CITY_CODE] [nvarchar] (12) NULL,
[CITY_CODE2] [nvarchar] (12) NULL,
[CITY1] [nvarchar] (40) NULL,
[CITY2] [nvarchar] (40) NULL,
[CITYH_CODE] [nvarchar] (12) NULL,
[CITYP_CODE] [nvarchar] (8) NULL,
[CLIENT] [nvarchar] (3) NULL,
[COUNTRY] [nvarchar] (3) NULL,
[DATE_FROM] [nvarchar] (8) NULL,
[DATE_TO] [nvarchar] (8) NULL,
[DEFLT_COMM] [nvarchar] (3) NULL,
[DONT_USE_P] [nvarchar] (4) NULL,
[DONT_USE_S] [nvarchar] (4) NULL,
[DUNS] [nvarchar] (9) NULL,
[DUNSP4] [nvarchar] (4) NULL,
[EXTENSION1] [nvarchar] (40) NULL,
[EXTENSION2] [nvarchar] (40) NULL,
[FAX_EXTENS] [nvarchar] (10) NULL,
[FAX_NUMBER] [nvarchar] (30) NULL,
[FLAGCOMM10] [nvarchar] (1) NULL,
[FLAGCOMM11] [nvarchar] (1) NULL,
[FLAGCOMM12] [nvarchar] (1) NULL,
[FLAGCOMM13] [nvarchar] (1) NULL,
[FLAGCOMM2] [nvarchar] (1) NULL,
[FLAGCOMM3] [nvarchar] (1) NULL,
[FLAGCOMM4] [nvarchar] (1) NULL,
[FLAGCOMM5] [nvarchar] (1) NULL,
[FLAGCOMM6] [nvarchar] (1) NULL,
[FLAGCOMM7] [nvarchar] (1) NULL,
[FLAGCOMM8] [nvarchar] (1) NULL,
[FLAGCOMM9] [nvarchar] (1) NULL,
[FLAGGROUPS] [nvarchar] (1) NULL,
[FLOOR] [nvarchar] (10) NULL,
[HOME_CITY] [nvarchar] (40) NULL,
[HOUSE_NUM1] [nvarchar] (10) NULL,
[HOUSE_NUM2] [nvarchar] (10) NULL,
[HOUSE_NUM3] [nvarchar] (10) NULL,
[LANGU] [nvarchar] (1) NULL,
[LANGU_CREA] [nvarchar] (1) NULL,
[LOCATION] [nvarchar] (40) NULL,
[MC_CITY1] [nvarchar] (25) NULL,
[MC_NAME1] [nvarchar] (25) NULL,
[MC_STREET] [nvarchar] (25) NULL,
[NAME_CO] [nvarchar] (40) NULL,
[NAME_TEXT] [nvarchar] (50) NULL,
[NAME1] [nvarchar] (40) NULL,
[NAME2] [nvarchar] (40) NULL,
[NAME3] [nvarchar] (40) NULL,
[NAME4] [nvarchar] (40) NULL,
[NATION] [nvarchar] (1) NULL,
[PCODE1_EXT] [nvarchar] (10) NULL,
[PCODE2_EXT] [nvarchar] (10) NULL,
[PCODE3_EXT] [nvarchar] (10) NULL,
[PERS_ADDR] [nvarchar] (1) NULL,
[PO_BOX] [nvarchar] (10) NULL,
[PO_BOX_CTY] [nvarchar] (3) NULL,
[PO_BOX_LOC] [nvarchar] (40) NULL,
[PO_BOX_NUM] [nvarchar] (1) NULL,
[PO_BOX_REG] [nvarchar] (3) NULL,
[POST_CODE1] [nvarchar] (10) NULL,
[POST_CODE2] [nvarchar] (10) NULL,
[POST_CODE3] [nvarchar] (10) NULL,
[POSTALAREA] [nvarchar] (15) NULL,
[REGIOGROUP] [nvarchar] (8) NULL,
[REGION] [nvarchar] (3) NULL,
[ROOMNUMBER] [nvarchar] (10) NULL,
[SORT_PHN] [nvarchar] (20) NULL,
[SORT1] [nvarchar] (20) NULL,
[SORT2] [nvarchar] (20) NULL,
[STR_SUPPL1] [nvarchar] (40) NULL,
[STR_SUPPL2] [nvarchar] (40) NULL,
[STR_SUPPL3] [nvarchar] (40) NULL,
[STREET] [nvarchar] (60) NULL,
[STREETABBR] [nvarchar] (2) NULL,
[STREETCODE] [nvarchar] (12) NULL,
[TAXJURCODE] [nvarchar] (15) NULL,
[TEL_EXTENS] [nvarchar] (10) NULL,
[TEL_NUMBER] [nvarchar] (30) NULL,
[TIME_ZONE] [nvarchar] (6) NULL,
[TITLE] [nvarchar] (4) NULL,
[TRANSPZONE] [nvarchar] (10) NULL
)
GO
