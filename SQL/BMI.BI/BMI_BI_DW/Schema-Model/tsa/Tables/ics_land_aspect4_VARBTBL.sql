CREATE TABLE [tsa].[ics_land_aspect4_VARBTBL]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_aspect4_VARBTBL_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_aspect4_VARBTBL_IsDuplicate] DEFAULT ((0)),
[VARB_RECSTS] [decimal] (1, 0) NULL,
[VARB_RECID] [nvarchar] (2) NULL,
[VARB_NR] [nvarchar] (16) NULL,
[VARB_KONCRN] [decimal] (3, 0) NULL,
[VARB_FIRMA] [decimal] (3, 0) NULL,
[VARB_TYPE] [nvarchar] (1) NULL,
[VARB_BETEGN] [nvarchar] (255) NULL,
[VARB_STATUS] [decimal] (2, 0) NULL,
[VARB_STYPE] [nvarchar] (1) NULL,
[VARB_GRP0] [nvarchar] (5) NULL,
[VARB_GRP1] [nvarchar] (5) NULL,
[VARB_GRP2] [nvarchar] (5) NULL,
[VARB_GRP3] [nvarchar] (5) NULL,
[VARB_GRP4] [nvarchar] (5) NULL,
[VARB_GRP5] [nvarchar] (5) NULL,
[VARB_GRP6] [nvarchar] (5) NULL,
[VARB_GRP7] [nvarchar] (5) NULL,
[VARB_GRP8] [nvarchar] (5) NULL,
[VARB_GRP9] [nvarchar] (5) NULL,
[VARB_REGN] [nvarchar] (2) NULL,
[VARB_ENHED] [nvarchar] (5) NULL,
[VARB_PRISAN] [decimal] (7, 0) NULL,
[VARB_ANTDEC] [decimal] (1, 0) NULL,
[VARB_LAGER] [nvarchar] (8) NULL,
[VARB_LOKAT] [nvarchar] (10) NULL,
[VARB_PARTI] [nvarchar] (1) NULL,
[VARB_LSTAT] [nvarchar] (1) NULL,
[VARB_LHIST] [nvarchar] (1) NULL,
[VARB_KALK] [nvarchar] (1) NULL,
[VARB_DISP] [nvarchar] (1) NULL,
[VARB_SIKDAG] [decimal] (3, 0) NULL,
[VARB_ORDPOL] [nvarchar] (2) NULL,
[VARB_LLC] [decimal] (2, 0) NULL,
[VARB_MINLAG] [decimal] (13, 5) NULL,
[VARB_MAXLAG] [decimal] (13, 5) NULL,
[VARB_TOLD] [nvarchar] (2) NULL,
[VARB_OLAND] [nvarchar] (5) NULL,
[VARB_PPLUK] [nvarchar] (1) NULL,
[VARB_PJOBK] [nvarchar] (1) NULL,
[VARB_PPROD] [nvarchar] (1) NULL,
[VARB_REGI] [nvarchar] (1) NULL,
[VARB_FSTMGI] [decimal] (13, 5) NULL,
[VARB_KORRFI] [decimal] (5, 2) NULL,
[VARB_VARMGI] [decimal] (13, 5) NULL,
[VARB_KORRVI] [decimal] (5, 2) NULL,
[VARB_VEDGOI] [nvarchar] (1) NULL,
[VARB_VEDKAI] [nvarchar] (1) NULL,
[VARB_VEDINI] [nvarchar] (1) NULL,
[VARB_KASPCI] [decimal] (5, 2) NULL,
[VARB_TIDKDI] [nvarchar] (1) NULL,
[VARB_TIDMIN] [decimal] (9, 2) NULL,
[VARB_TIDENH] [decimal] (9, 2) NULL,
[VARB_KALKOR] [decimal] (13, 5) NULL,
[VARB_MINORD] [decimal] (13, 5) NULL,
[VARB_ENHORD] [decimal] (13, 5) NULL,
[VARB_MAXORD] [decimal] (13, 5) NULL,
[VARB_MODNR] [nvarchar] (16) NULL,
[VARB_MODVAR] [nvarchar] (8) NULL,
[VARB_PLUK] [nvarchar] (1) NULL,
[VARB_FQLG] [nvarchar] (1) NULL,
[VARB_PROD] [nvarchar] (1) NULL,
[VARB_TEKSLK] [decimal] (9, 2) NULL,
[VARB_SLKKO] [nvarchar] (1) NULL,
[VARB_SLKKAL] [nvarchar] (1) NULL,
[VARB_REGU] [nvarchar] (1) NULL,
[VARB_FSTMGU] [decimal] (13, 5) NULL,
[VARB_KORRFU] [decimal] (5, 2) NULL,
[VARB_VARMGU] [decimal] (13, 5) NULL,
[VARB_KORRVU] [decimal] (5, 2) NULL,
[VARB_VEDGOU] [nvarchar] (1) NULL,
[VARB_VEDKAU] [nvarchar] (1) NULL,
[VARB_VEDINU] [nvarchar] (1) NULL,
[VARB_KASPCU] [decimal] (5, 2) NULL,
[VARB_TIDKDU] [nvarchar] (1) NULL,
[VARB_AENDDT] [decimal] (8, 0) NULL,
[VARB_AENDAF] [nvarchar] (10) NULL,
[VARB_OPRDT] [decimal] (8, 0) NULL,
[VARB_OPRAF] [nvarchar] (10) NULL,
[VARB_PLAGER] [nvarchar] (8) NULL,
[VARB_ORDTYP] [nvarchar] (2) NULL,
[VARB_FBRDAG] [decimal] (13, 5) NULL,
[VARB_VOLKL] [nvarchar] (1) NULL,
[VARB_SIKFAK] [decimal] (5, 2) NULL,
[VARB_MANDSP] [nvarchar] (1) NULL,
[VARB_TS] [decimal] (8, 0) NULL,
[VARB_KMTODE] [nvarchar] (1) NULL,
[VARB_BOBAND] [nvarchar] (5) NULL,
[VARB_KVEDL] [decimal] (3, 0) NULL,
[VARB_FVEDL] [decimal] (3, 0) NULL,
[VARB_GRPA] [nvarchar] (5) NULL,
[VARB_GRPB] [nvarchar] (5) NULL,
[VARB_GRPC] [nvarchar] (5) NULL,
[VARB_GRPD] [nvarchar] (5) NULL,
[VARB_GRPE] [nvarchar] (5) NULL,
[VARB_GRPF] [nvarchar] (5) NULL,
[VARB_GRPG] [nvarchar] (5) NULL,
[VARB_GRPH] [nvarchar] (5) NULL,
[VARB_GRPI] [nvarchar] (5) NULL,
[VARB_GRPJ] [nvarchar] (5) NULL,
[VARB_PAR0] [nvarchar] (10) NULL,
[VARB_PAR1] [nvarchar] (10) NULL,
[VARB_PAR2] [nvarchar] (10) NULL,
[VARB_PAR3] [nvarchar] (10) NULL,
[VARB_PAR4] [nvarchar] (10) NULL,
[VARB_PAR5] [nvarchar] (10) NULL,
[VARB_PAR6] [nvarchar] (10) NULL,
[VARB_PAR7] [nvarchar] (10) NULL,
[VARB_PAR8] [nvarchar] (10) NULL,
[VARB_PAR9] [nvarchar] (10) NULL,
[VARB_NUM0] [decimal] (11, 2) NULL,
[VARB_NUM1] [decimal] (11, 2) NULL,
[VARB_NUM2] [decimal] (11, 2) NULL,
[VARB_NUM3] [decimal] (11, 2) NULL,
[VARB_NUM4] [decimal] (11, 2) NULL,
[VARB_NUM5] [decimal] (11, 2) NULL,
[VARB_NUM6] [decimal] (11, 2) NULL,
[VARB_NUM7] [decimal] (11, 2) NULL,
[VARB_NUM8] [decimal] (11, 2) NULL,
[VARB_NUM9] [decimal] (11, 2) NULL,
[VARB_RNR0] [nvarchar] (16) NULL,
[VARB_RNR1] [nvarchar] (16) NULL,
[VARB_RNR2] [nvarchar] (16) NULL,
[VARB_RNR3] [nvarchar] (16) NULL,
[VARB_RNR4] [nvarchar] (16) NULL,
[VARB_RNR5] [nvarchar] (16) NULL,
[VARB_RNR6] [nvarchar] (16) NULL,
[VARB_RNR7] [nvarchar] (16) NULL,
[VARB_RNR8] [nvarchar] (16) NULL,
[VARB_RNR9] [nvarchar] (16) NULL,
[VARB_ALFA0] [nvarchar] (1) NULL,
[VARB_ALFA1] [nvarchar] (1) NULL,
[VARB_ALFA2] [nvarchar] (1) NULL,
[VARB_ALFA3] [nvarchar] (1) NULL,
[VARB_ALFA4] [nvarchar] (1) NULL,
[VARB_ALFA5] [nvarchar] (1) NULL,
[VARB_ALFA6] [nvarchar] (1) NULL,
[VARB_ALFA7] [nvarchar] (1) NULL,
[VARB_ALFA8] [nvarchar] (1) NULL,
[VARB_ALFA9] [nvarchar] (1) NULL
)
GO
