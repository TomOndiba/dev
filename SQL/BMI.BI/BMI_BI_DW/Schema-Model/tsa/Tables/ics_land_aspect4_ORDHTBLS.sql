CREATE TABLE [tsa].[ics_land_aspect4_ORDHTBLS]
(
[EtlBatchRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlSourceTable] [varchar] (200) NULL,
[EtlStepRunId] [int] NULL,
[EtlCreatedOn] [datetime] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
[ExcludeFromMerge] [bit] NULL,
[IsDuplicate] [bit] NULL,
[ORDH_STATUS_KODE] [decimal] (1, 0) NULL,
[ORDH_RECORD_ID] [nvarchar] (2) NULL,
[ORDH_ORDREART] [nvarchar] (1) NULL,
[ORDH_ORDREKLASSE] [nvarchar] (1) NULL,
[ORDH_RECORDTYPE] [nvarchar] (2) NULL,
[ORDH_ORDRENR] [decimal] (9, 0) NULL,
[ORDH_LEV_LQBENR] [decimal] (4, 0) NULL,
[ORDH_KONCRN] [decimal] (3, 0) NULL,
[ORDH_FIRMA] [decimal] (3, 0) NULL,
[ORDH_OPDAT_DATO] [decimal] (8, 0) NULL,
[ORDH_OPDAT_AF] [nvarchar] (10) NULL,
[ORDH_OPRET_DATO] [decimal] (8, 0) NULL,
[ORDH_OPRET_AF] [nvarchar] (10) NULL,
[ORDH_ORDRESTATUS] [decimal] (2, 0) NULL,
[ORDH_KUNDENR] [nvarchar] (16) NULL,
[ORDH_LEV_TERMIN_DT] [decimal] (8, 0) NULL,
[ORDH_LEV_TERMIN_KL] [decimal] (4, 0) NULL,
[ORDH_UDLQB_TERMIN_DT] [decimal] (8, 0) NULL,
[ORDH_UDLQB_TERMIN_KL] [decimal] (4, 0) NULL,
[ORDH_RAMMEORDRENR] [decimal] (9, 0) NULL,
[ORDH_PRIORITET] [decimal] (2, 0) NULL,
[ORDH_LEV_ADRESSENR] [nvarchar] (4) NULL,
[ORDH_LEV_NAVN1] [nvarchar] (255) NULL,
[ORDH_LEV_NAVN2] [nvarchar] (255) NULL,
[ORDH_LEV_NAVN3] [nvarchar] (255) NULL,
[ORDH_LEV_NAVN4] [nvarchar] (255) NULL,
[ORDH_LEV_NAVN5] [nvarchar] (255) NULL,
[ORDH_LEV_KONTAKTPERSON] [nvarchar] (255) NULL,
[ORDH_LEV_TLF] [nvarchar] (20) NULL,
[ORDH_KUNDENS_ORDRENR] [nvarchar] (16) NULL,
[ORDH_KUNDENS_SAGSBEH] [nvarchar] (16) NULL,
[ORDH_VORES_SAGSBEH] [nvarchar] (16) NULL,
[ORDH_BEKR] [nvarchar] (1) NULL,
[ORDH_BEKR_ANTAL] [decimal] (2, 0) NULL,
[ORDH_PLUK] [nvarchar] (1) NULL,
[ORDH_PLUK_ANTAL] [decimal] (2, 0) NULL,
[ORDH_FQLG] [nvarchar] (1) NULL,
[ORDH_FQLG_ANTAL] [decimal] (2, 0) NULL,
[ORDH_ALAB] [nvarchar] (1) NULL,
[ORDH_ALAB_ANTAL] [decimal] (2, 0) NULL,
[ORDH_PLAB] [nvarchar] (1) NULL,
[ORDH_PLAB_ANTAL] [decimal] (2, 0) NULL,
[ORDH_EKSP_GEBYR] [decimal] (11, 2) NULL,
[ORDH_FORS_GEBYR] [decimal] (11, 2) NULL,
[ORDH_DIV1_GEBYR] [decimal] (11, 2) NULL,
[ORDH_DIV2_GEBYR] [decimal] (11, 2) NULL,
[ORDH_LEV_MAADE] [nvarchar] (255) NULL,
[ORDH_LEV_BETINGELSER] [nvarchar] (255) NULL,
[ORDH_SAELGER] [nvarchar] (8) NULL,
[ORDH_DISTRIKT] [nvarchar] (8) NULL,
[ORDH_VALUTA] [nvarchar] (4) NULL,
[ORDH_SPROG] [decimal] (2, 0) NULL,
[ORDH_MOMS] [nvarchar] (1) NULL,
[ORDH_BONUS] [nvarchar] (4) NULL,
[ORDH_BET_KUNDENR] [nvarchar] (16) NULL,
[ORDH_BET_VILKAAR] [nvarchar] (1) NULL,
[ORDH_BET_DAGE] [decimal] (3, 0) NULL,
[ORDH_RABAT_1_PCT] [decimal] (5, 2) NULL,
[ORDH_RABAT_1_DAGE] [decimal] (3, 0) NULL,
[ORDH_RABAT_2_PCT] [decimal] (5, 2) NULL,
[ORDH_RABAT_2_DAGE] [decimal] (3, 0) NULL,
[ORDH_TOTALRABAT_PCT] [decimal] (5, 2) NULL,
[ORDH_SAMLEFAKT_METODE] [nvarchar] (1) NULL,
[ORDH_SAMLEFAKT_TERMIN] [nvarchar] (2) NULL,
[ORDH_BEKR_DATO] [decimal] (8, 0) NULL,
[ORDH_LEVERANCE_NR] [decimal] (4, 0) NULL,
[ORDH_FAKTURA_NR] [decimal] (9, 0) NULL,
[ORDH_FAKTURA_DATO] [decimal] (8, 0) NULL,
[ORDH_OVERFQR_STATUS] [decimal] (1, 0) NULL,
[ORDH_BETALINGSKODE] [decimal] (3, 0) NULL,
[ORDH_PROV_AFTALE] [nvarchar] (1) NULL,
[ORDH_FQLGESEDDEL_DATO] [decimal] (8, 0) NULL,
[ORDH_LEV_MAADE_KODE] [nvarchar] (2) NULL,
[ORDH_FRAGT_LEVERANDQR] [nvarchar] (16) NULL,
[ORDH_FRAGTBELQB] [decimal] (11, 2) NULL,
[ORDH_RUTE] [nvarchar] (8) NULL,
[ORDH_RUTE_SEKVENS] [decimal] (4, 0) NULL,
[ORDH_PROJNR] [decimal] (9, 0) NULL,
[ORDH_AARSAG] [nvarchar] (5) NULL,
[ORDH_LAGER] [nvarchar] (8) NULL,
[ORDH_TLAGER] [nvarchar] (8) NULL,
[ORDH_SOART] [nvarchar] (2) NULL,
[ORDH_SOARTB] [nvarchar] (2) NULL,
[ORDH_FRKDAT] [decimal] (8, 0) NULL,
[ORDH_FRKKL] [decimal] (4, 0) NULL,
[ORDH_LEVBK] [nvarchar] (2) NULL,
[ORDH_LEVOMR] [nvarchar] (8) NULL,
[ORDH_LAND] [nvarchar] (5) NULL,
[ORDH_PROF] [nvarchar] (1) NULL,
[ORDH_PROFA] [decimal] (2, 0) NULL,
[ORDH_PAKL] [nvarchar] (1) NULL,
[ORDH_PAKLA] [decimal] (2, 0) NULL,
[ORDH_KMAX] [nvarchar] (1) NULL,
[ORDH_RSTORD] [nvarchar] (1) NULL,
[ORDH_STS] [decimal] (8, 0) NULL,
[ORDH_PAR1] [nvarchar] (10) NULL,
[ORDH_NR1] [nvarchar] (16) NULL,
[ORDH_TEKST1] [nvarchar] (255) NULL,
[ORDH_MGD1] [decimal] (13, 5) NULL,
[ORDH_MGD2] [decimal] (13, 5) NULL,
[ORDH_MGD3] [decimal] (13, 5) NULL,
[ORDH_BELQB1] [decimal] (11, 2) NULL,
[ORDH_BELQB2] [decimal] (11, 2) NULL,
[ORDH_BELQB3] [decimal] (11, 2) NULL,
[ORDH_RESPON] [nvarchar] (3) NULL,
[ORDH_SLUTM] [nvarchar] (4) NULL,
[ORDH_HSTED] [nvarchar] (4) NULL,
[ORDH_BSTED] [nvarchar] (4) NULL,
[ORDH_FQLGNR] [nvarchar] (30) NULL,
[ORDH_FORH] [nvarchar] (16) NULL,
[ORDH_TKRAV] [nvarchar] (8) NULL,
[ORDH_TUR] [decimal] (9, 0) NULL,
[ORDH_MOMSNR] [nvarchar] (15) NULL,
[ORDH_POSTNR] [nvarchar] (255) NULL,
[ORDH_GODK] [nvarchar] (1) NULL,
[ORDH_BBRT] [decimal] (11, 2) NULL,
[ORDH_BKOR] [decimal] (11, 2) NULL,
[ORDH_BGRP] [decimal] (11, 2) NULL,
[ORDH_BLINR] [decimal] (11, 2) NULL,
[ORDH_BTOTR] [decimal] (11, 2) NULL,
[ORDH_BGEB] [decimal] (11, 2) NULL,
[ORDH_BMOMS] [decimal] (11, 2) NULL,
[ORDH_BHFR] [decimal] (11, 2) NULL,
[ORDH_BHPR] [decimal] (11, 2) NULL,
[ORDH_BHPRA] [decimal] (11, 2) NULL,
[ORDH_BHBON] [decimal] (11, 2) NULL,
[ORDH_BHAFG] [decimal] (11, 2) NULL,
[ORDH_BVFBR] [decimal] (11, 2) NULL,
[ORDH_RBRT] [decimal] (11, 2) NULL,
[ORDH_RKOR] [decimal] (11, 2) NULL,
[ORDH_RGRP] [decimal] (11, 2) NULL,
[ORDH_RLINR] [decimal] (11, 2) NULL,
[ORDH_RTOTR] [decimal] (11, 2) NULL,
[ORDH_RGEB] [decimal] (11, 2) NULL,
[ORDH_RMOMS] [decimal] (11, 2) NULL,
[ORDH_RHFR] [decimal] (11, 2) NULL,
[ORDH_RHPR] [decimal] (11, 2) NULL,
[ORDH_RHPRA] [decimal] (11, 2) NULL,
[ORDH_RHBON] [decimal] (11, 2) NULL,
[ORDH_RHAFG] [decimal] (11, 2) NULL,
[ORDH_RVFBR] [decimal] (11, 2) NULL,
[ORDH_VAKURS] [decimal] (13, 5) NULL,
[ORDH_BALIN] [decimal] (5, 0) NULL,
[ORDH_BAENH] [decimal] (13, 5) NULL,
[ORDH_BAENB] [decimal] (13, 5) NULL,
[ORDH_BBRTV] [decimal] (13, 5) NULL,
[ORDH_BNETV] [decimal] (13, 5) NULL,
[ORDH_BRUMF] [decimal] (13, 5) NULL,
[ORDH_BAKOL] [decimal] (7, 0) NULL,
[ORDH_BAPAL] [decimal] (7, 0) NULL,
[ORDH_RALIN] [decimal] (5, 0) NULL,
[ORDH_RAENH] [decimal] (13, 5) NULL,
[ORDH_RAENB] [decimal] (13, 5) NULL,
[ORDH_RBRTV] [decimal] (13, 5) NULL,
[ORDH_RNETV] [decimal] (13, 5) NULL,
[ORDH_RRUMF] [decimal] (13, 5) NULL,
[ORDH_RAKOL] [decimal] (7, 0) NULL,
[ORDH_RAPAL] [decimal] (7, 0) NULL,
[ORDH_OT] [nvarchar] (1) NULL,
[ORDH_IF] [nvarchar] (1) NULL,
[ORDH_MGD4] [decimal] (13, 5) NULL,
[ORDH_MGD5] [decimal] (13, 5) NULL,
[ORDH_MGD6] [decimal] (13, 5) NULL,
[ORDH_BELQB4] [decimal] (11, 2) NULL,
[ORDH_BELQB5] [decimal] (11, 2) NULL,
[ORDH_BELQB6] [decimal] (11, 2) NULL,
[ORDH_GENBER] [nvarchar] (1) NULL
)
GO
