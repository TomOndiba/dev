CREATE TABLE [psa].[ics_stg_aspect4_ordhtbli]
(
[EtlRecordId] [bigint] NOT NULL IDENTITY(1, 1),
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_aspect4_ordhtbli_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_aspect4_ordhtbli_IsIncomplete] DEFAULT ('N'),
[ORDH_I_STATUS_KODE] [decimal] (1, 0) NULL,
[ORDH_I_RECORD_ID] [nvarchar] (2) NULL,
[ORDH_I_ORDREART] [nvarchar] (1) NULL,
[ORDH_I_ORDREKLASSE] [nvarchar] (1) NULL,
[ORDH_I_RECORDTYPE] [nvarchar] (2) NULL,
[ORDH_I_ORDRENR] [decimal] (9, 0) NOT NULL,
[ORDH_I_LEV_LQBENR] [decimal] (4, 0) NULL,
[ORDH_I_KONCRN] [decimal] (3, 0) NULL,
[ORDH_I_FIRMA] [decimal] (3, 0) NULL,
[ORDH_I_OPDAT_DATO] [decimal] (8, 0) NULL,
[ORDH_I_OPDAT_AF] [nvarchar] (10) NULL,
[ORDH_I_OPRET_DATO] [decimal] (8, 0) NULL,
[ORDH_I_OPRET_AF] [nvarchar] (10) NULL,
[ORDH_I_ORDRESTATUS] [decimal] (2, 0) NULL,
[ORDH_LEVERANDQRNR] [nvarchar] (16) NULL,
[ORDH_I_LEV_TERMIN_DT] [decimal] (8, 0) NULL,
[ORDH_I_LEV_TERMIN_KL] [decimal] (4, 0) NULL,
[ORDH_I_UDLQB_TERMIN_DT] [decimal] (8, 0) NULL,
[ORDH_I_UDLQB_TERMIN_KL] [decimal] (4, 0) NULL,
[ORDH_I_RAMMEORDRENR] [decimal] (9, 0) NULL,
[ORDH_I_PRIORITET] [decimal] (2, 0) NULL,
[ORDH_I_LEV_ADRESSENR] [nvarchar] (4) NULL,
[ORDH_I_LEV_NAVN1] [nvarchar] (255) NULL,
[ORDH_I_LEV_NAVN2] [nvarchar] (255) NULL,
[ORDH_I_LEV_NAVN3] [nvarchar] (255) NULL,
[ORDH_I_LEV_NAVN4] [nvarchar] (255) NULL,
[ORDH_I_LEV_NAVN5] [nvarchar] (255) NULL,
[ORDH_I_LEV_KONTAKTPERSON] [nvarchar] (255) NULL,
[ORDH_I_LEV_TLF] [nvarchar] (20) NULL,
[ORDH_LEVERANDQR_ORDRENR] [nvarchar] (16) NULL,
[ORDH_LEVERANDQR_SAGSBEH] [nvarchar] (16) NULL,
[ORDH_I_VORES_SAGSBEH] [nvarchar] (16) NULL,
[ORDH_BEST] [nvarchar] (1) NULL,
[ORDH_BEST_ANTAL] [decimal] (2, 0) NULL,
[ORDH_RYKKER] [nvarchar] (1) NULL,
[ORDH_RYKKER_ANTAL] [decimal] (2, 0) NULL,
[ORDH_FILLER1] [nvarchar] (9) NULL,
[ORDH_I_EKSP_GEBYR] [decimal] (11, 2) NULL,
[ORDH_I_FORS_GEBYR] [decimal] (11, 2) NULL,
[ORDH_I_DIV1_GEBYR] [decimal] (11, 2) NULL,
[ORDH_I_DIV2_GEBYR] [decimal] (11, 2) NULL,
[ORDH_I_LEV_MAADE] [nvarchar] (255) NULL,
[ORDH_I_LEV_BETINGELSER] [nvarchar] (255) NULL,
[ORDH_FILLER2] [nvarchar] (8) NULL,
[ORDH_I_DISTRIKT] [nvarchar] (8) NULL,
[ORDH_I_VALUTA] [nvarchar] (4) NULL,
[ORDH_I_SPROG] [decimal] (2, 0) NULL,
[ORDH_I_MOMS] [nvarchar] (1) NULL,
[ORDH_I_BONUS] [nvarchar] (4) NULL,
[ORDH_BET_LEVERANDQRNR] [nvarchar] (16) NULL,
[ORDH_I_BET_VILKAAR] [nvarchar] (1) NULL,
[ORDH_I_BET_DAGE] [decimal] (3, 0) NULL,
[ORDH_I_RABAT_1_PCT] [decimal] (5, 2) NULL,
[ORDH_I_RABAT_1_DAGE] [decimal] (3, 0) NULL,
[ORDH_I_RABAT_2_PCT] [decimal] (5, 2) NULL,
[ORDH_I_RABAT_2_DAGE] [decimal] (3, 0) NULL,
[ORDH_I_TOTALRABAT_PCT] [decimal] (5, 2) NULL,
[ORDH_FILLER3] [nvarchar] (3) NULL,
[ORDH_RYKKER_DATO] [decimal] (8, 0) NULL,
[ORDH_FILLER4] [nvarchar] (6) NULL,
[ORDH_I_LEV_MAADE_KODE] [nvarchar] (2) NULL,
[ORDH_BESTILLINGS_DATO] [decimal] (8, 0) NULL,
[ORDH_I_OVERFQR_STATUS] [decimal] (1, 0) NULL,
[ORDH_I_BETALINGSKODE] [decimal] (3, 0) NULL,
[ORDH_KUNDENR_REFERENCE] [nvarchar] (16) NULL,
[ORDH_I_PROJNR] [decimal] (9, 0) NULL,
[ORDH_I_AARSAG] [nvarchar] (5) NULL,
[ORDH_I_LAGER] [nvarchar] (8) NULL,
[ORDH_I_TLAGER] [nvarchar] (8) NULL,
[ORDH_IOART] [nvarchar] (2) NULL,
[ORDH_IOARTB] [nvarchar] (2) NULL,
[ORDH_I_FRKDAT] [decimal] (8, 0) NULL,
[ORDH_I_FRKKL] [decimal] (4, 0) NULL,
[ORDH_I_LEVBK] [nvarchar] (2) NULL,
[ORDH_ITS] [decimal] (8, 0) NULL,
[ORDH_I_MOMSNR] [nvarchar] (15) NULL,
[ORDH_I_LAND] [nvarchar] (5) NULL,
[ORDH_I_POSTNR] [nvarchar] (255) NULL,
[ORDH_I_GODK] [nvarchar] (1) NULL,
[ORDH_I_PAR1] [nvarchar] (10) NULL,
[ORDH_I_NR1] [nvarchar] (16) NULL,
[ORDH_I_TEKST1] [nvarchar] (255) NULL,
[ORDH_I_MGD1] [decimal] (13, 5) NULL,
[ORDH_I_MGD2] [decimal] (13, 5) NULL,
[ORDH_I_MGD3] [decimal] (13, 5) NULL,
[ORDH_I_BELQB1] [decimal] (11, 2) NULL,
[ORDH_I_BELQB2] [decimal] (11, 2) NULL,
[ORDH_I_BELQB3] [decimal] (11, 2) NULL
)
GO
ALTER TABLE [psa].[ics_stg_aspect4_ordhtbli] ADD CONSTRAINT [PK_stg_aspect4_ordhtbli] PRIMARY KEY CLUSTERED  ([ORDH_I_ORDRENR])
GO