CREATE TABLE [tsa].[ics_land_M3V10gen_POL_MPHEAD]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF__ics_land___Exclu__52AF0DCA] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF__ics_land___IsDup__53A33203] DEFAULT ((0)),
[IAAGNT] [nchar] (10) NULL,
[IAAGRA] [numeric] (18, 0) NULL,
[IAATDT] [numeric] (18, 0) NULL,
[IAAURE] [nchar] (10) NULL,
[IABRAM] [numeric] (18, 0) NULL,
[IABUYE] [nchar] (10) NULL,
[IACHID] [nchar] (10) NULL,
[IACHNO] [numeric] (18, 0) NULL,
[IACMCO] [nchar] (2) NULL,
[IACOAM] [numeric] (18, 0) NULL,
[IACONO] [numeric] (18, 0) NULL,
[IACPRI] [nchar] (5) NULL,
[IACUCD] [nchar] (3) NULL,
[IACUTE] [numeric] (18, 0) NULL,
[IADIVI] [nchar] (3) NULL,
[IADTID] [numeric] (18, 0) NULL,
[IADUDT] [numeric] (18, 0) NULL,
[IADWDT] [numeric] (18, 0) NULL,
[IAECLC] [nchar] (2) NULL,
[IAELNO] [nchar] (8) NULL,
[IAEXAT] [numeric] (18, 0) NULL,
[IAEXAV] [numeric] (18, 0) NULL,
[IAEXEP] [numeric] (18, 0) NULL,
[IAFACI] [nchar] (3) NULL,
[IAFIDS] [nchar] (6) NULL,
[IAFUSC] [nchar] (3) NULL,
[IAGRWE] [numeric] (18, 0) NULL,
[IAHAFE] [nchar] (6) NULL,
[IAHDDT] [numeric] (18, 0) NULL,
[IAINEP] [numeric] (18, 0) NULL,
[IALEDT] [numeric] (18, 0) NULL,
[IALIDT] [numeric] (18, 0) NULL,
[IALMDT] [numeric] (18, 0) NULL,
[IALMTS] [numeric] (18, 0) NULL,
[IALNCD] [nchar] (2) NULL,
[IALRED] [numeric] (18, 0) NULL,
[IAMEDC] [nchar] (10) NULL,
[IAMODL] [nchar] (3) NULL,
[IAMTDP] [numeric] (18, 0) NULL,
[IAMTWP] [numeric] (18, 0) NULL,
[IANOLN] [numeric] (18, 0) NULL,
[IANOPP] [numeric] (18, 0) NULL,
[IANTAM] [numeric] (18, 0) NULL,
[IAODAM] [numeric] (18, 0) NULL,
[IAORTY] [nchar] (3) NULL,
[IAOTBA] [numeric] (18, 0) NULL,
[IAOTPC] [numeric] (18, 0) NULL,
[IAOURR] [nchar] (10) NULL,
[IAOURT] [nchar] (1) NULL,
[IAPOPO] [numeric] (18, 0) NULL,
[IAPOTC] [nchar] (2) NULL,
[IAPOTX] [numeric] (18, 0) NULL,
[IAPRLA] [numeric] (18, 0) NULL,
[IAPROJ] [nchar] (7) NULL,
[IAPRSU] [nchar] (10) NULL,
[IAPRTX] [numeric] (18, 0) NULL,
[IAPTAC] [numeric] (18, 0) NULL,
[IAPUDT] [numeric] (18, 0) NULL,
[IAPUNO] [nchar] (7) NULL,
[IAPURC] [nchar] (10) NULL,
[IAPUSL] [nchar] (2) NULL,
[IAPUST] [nchar] (2) NULL,
[IAPYAD] [nchar] (3) NULL,
[IAPYME] [nchar] (3) NULL,
[IARCDT] [numeric] (18, 0) NULL,
[IARFID] [nchar] (10) NULL,
[IARGDT] [numeric] (18, 0) NULL,
[IARGTM] [numeric] (18, 0) NULL,
[IARTAC] [numeric] (18, 0) NULL,
[IASCDT] [numeric] (18, 0) NULL,
[IASHVI] [nchar] (6) NULL,
[IASLDT] [numeric] (18, 0) NULL,
[IASUNO] [nchar] (10) NULL,
[IATEAF] [nchar] (3) NULL,
[IATEDL] [nchar] (3) NULL,
[IATEL1] [nvarchar] (36) NULL,
[IATEOR] [numeric] (18, 0) NULL,
[IATEPA] [nchar] (3) NULL,
[IATEPY] [nchar] (3) NULL,
[IATFNO] [nchar] (16) NULL,
[IATIHM] [numeric] (18, 0) NULL,
[IATLEX] [numeric] (18, 0) NULL,
[IATLIN] [numeric] (18, 0) NULL,
[IATOQT] [numeric] (18, 0) NULL,
[IATXID] [numeric] (18, 0) NULL,
[IAVOL3] [numeric] (18, 0) NULL,
[IAWHLO] [nchar] (3) NULL,
[IAYRE1] [nvarchar] (36) NULL
)
GO
