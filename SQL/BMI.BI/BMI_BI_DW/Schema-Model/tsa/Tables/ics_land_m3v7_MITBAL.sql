CREATE TABLE [tsa].[ics_land_m3v7_MITBAL]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3v7_MITBAL_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3v7_MITBAL_IsDuplicate] DEFAULT ((0)),
[MBCONO] [decimal] (3, 0) NULL,
[MBWHLO] [nvarchar] (255) NULL,
[MBITNO] [nvarchar] (255) NULL,
[MBSTQT] [decimal] (15, 6) NULL,
[MBQUQT] [decimal] (15, 6) NULL,
[MBRJQT] [decimal] (15, 6) NULL,
[MBALQT] [decimal] (15, 6) NULL,
[MBAVAL] [decimal] (15, 6) NULL,
[MBPLQT] [decimal] (15, 6) NULL,
[MBCOMG] [decimal] (1, 0) NULL,
[MBALMT] [decimal] (1, 0) NULL,
[MBSTMT] [decimal] (1, 0) NULL,
[MBSPMT] [decimal] (1, 0) NULL,
[MBSTTX] [nvarchar] (255) NULL,
[MBORQT] [decimal] (15, 6) NULL,
[MBREQT] [decimal] (15, 6) NULL,
[MBRLQT] [decimal] (15, 6) NULL,
[MBREQP] [decimal] (15, 6) NULL,
[MBIDDT] [decimal] (8, 0) NULL,
[MBODDT] [decimal] (8, 0) NULL,
[MBINDT] [decimal] (8, 0) NULL,
[MBPRDC] [decimal] (1, 0) NULL,
[MBINCD] [nvarchar] (255) NULL,
[MBNUIN] [decimal] (4, 0) NULL,
[MBUSYE] [decimal] (15, 6) NULL,
[MBAVST] [decimal] (15, 6) NULL,
[MBDILE] [decimal] (15, 6) NULL,
[MBRESP] [nvarchar] (255) NULL,
[MBBUYE] [nvarchar] (255) NULL,
[MBSUNO] [nvarchar] (255) NULL,
[MBWHTY] [nvarchar] (255) NULL,
[MBWHSY] [nvarchar] (255) NULL,
[MBINSC] [decimal] (1, 0) NULL,
[MBDIGR] [nvarchar] (255) NULL,
[MBWHSL] [nvarchar] (255) NULL,
[MBSLTP] [nvarchar] (255) NULL,
[MBNUS7] [decimal] (7, 0) NULL,
[MBTOMU] [decimal] (15, 6) NULL,
[MBWHLT] [nvarchar] (255) NULL,
[MBPISE] [nvarchar] (255) NULL,
[MBPLCD] [nvarchar] (255) NULL,
[MBMABC] [nvarchar] (255) NULL,
[MBABCD] [nvarchar] (255) NULL,
[MBABCM] [decimal] (1, 0) NULL,
[MBABFC] [nvarchar] (255) NULL,
[MBABFM] [decimal] (1, 0) NULL,
[MBACOC] [nvarchar] (255) NULL,
[MBACOM] [decimal] (1, 0) NULL,
[MBPRIF] [decimal] (3, 0) NULL,
[MBSODY] [decimal] (3, 0) NULL,
[MBREOP] [decimal] (15, 6) NULL,
[MBOPOM] [decimal] (1, 0) NULL,
[MBSSQT] [decimal] (15, 6) NULL,
[MBSSMT] [decimal] (1, 0) NULL,
[MBMSSQ] [decimal] (15, 6) NULL,
[MBSSDA] [decimal] (3, 0) NULL,
[MBSCGR] [decimal] (3, 1) NULL,
[MBMXST] [decimal] (15, 6) NULL,
[MBMXSM] [decimal] (1, 0) NULL,
[MBMXPC] [decimal] (3, 0) NULL,
[MBEOQT] [decimal] (15, 6) NULL,
[MBEOQM] [decimal] (2, 0) NULL,
[MBEQDA] [decimal] (3, 0) NULL,
[MBYEQT] [decimal] (15, 6) NULL,
[MBYEQM] [decimal] (1, 0) NULL,
[MBLOQT] [decimal] (15, 6) NULL,
[MBMOQT] [decimal] (15, 6) NULL,
[MBPUIT] [decimal] (1, 0) NULL,
[MBSUWH] [nvarchar] (255) NULL,
[MBDPID] [decimal] (2, 0) NULL,
[MBPRCD] [nvarchar] (255) NULL,
[MBFCCM] [nvarchar] (255) NULL,
[MBLYQT] [decimal] (15, 6) NULL,
[MBLRYE] [decimal] (15, 6) NULL,
[MBPFTM] [decimal] (3, 0) NULL,
[MBLEA1] [decimal] (3, 0) NULL,
[MBLEA2] [decimal] (3, 0) NULL,
[MBLEA3] [decimal] (3, 0) NULL,
[MBLEAT] [decimal] (3, 0) NULL,
[MBUNMU] [decimal] (15, 6) NULL,
[MBSVEI] [decimal] (1, 0) NULL,
[MBLEVL] [decimal] (2, 0) NULL,
[MBLEVD] [decimal] (2, 0) NULL,
[MBPLHZ] [decimal] (3, 0) NULL,
[MBDMFN] [decimal] (3, 0) NULL,
[MBORTY] [nvarchar] (255) NULL,
[MBCONC] [decimal] (1, 0) NULL,
[MBSATD] [decimal] (3, 0) NULL,
[MBALQC] [decimal] (1, 0) NULL,
[MBOPLC] [decimal] (1, 0) NULL,
[MBMSCH] [decimal] (1, 0) NULL,
[MBSHCC] [decimal] (1, 0) NULL,
[MBZCAC] [decimal] (1, 0) NULL,
[MBINSL] [nvarchar] (255) NULL,
[MBNCCA] [decimal] (1, 0) NULL,
[MBFACI] [nvarchar] (255) NULL,
[MBDIVI] [nvarchar] (255) NULL,
[MBDDEX] [decimal] (1, 0) NULL,
[MBSTRL] [decimal] (1, 0) NULL,
[MBPLIC] [decimal] (1, 0) NULL,
[MBPPMC] [decimal] (1, 0) NULL,
[MBMPCD] [decimal] (8, 0) NULL,
[MBMPCT] [decimal] (6, 0) NULL,
[MBDCSS] [decimal] (1, 0) NULL,
[MBRPOP] [decimal] (1, 0) NULL,
[MBBCOS] [decimal] (17, 6) NULL,
[MBTXID] [decimal] (13, 0) NULL,
[MBDTID] [decimal] (13, 0) NULL,
[MBDPLO] [nvarchar] (255) NULL,
[MBDDLO] [nvarchar] (255) NULL,
[MBSPLC] [nvarchar] (255) NULL,
[MBALS1] [decimal] (1, 0) NULL,
[MBPOOT] [nvarchar] (255) NULL,
[MBSTAT] [nvarchar] (255) NULL,
[MBVTCP] [decimal] (2, 0) NULL,
[MBVTCS] [decimal] (2, 0) NULL,
[MBMNUN] [nvarchar] (255) NULL,
[MBGRTS] [nvarchar] (255) NULL,
[MBSLDY] [decimal] (5, 0) NULL,
[MBREDY] [decimal] (5, 0) NULL,
[MBSAEL] [decimal] (5, 0) NULL,
[MBCPCD] [nvarchar] (255) NULL,
[MBLEAQ] [decimal] (3, 0) NULL,
[MBSCHT] [decimal] (1, 0) NULL,
[MBSALM] [decimal] (1, 0) NULL,
[MBCDYN] [decimal] (1, 0) NULL,
[MBPAFL] [decimal] (1, 0) NULL,
[MBMRQT] [decimal] (15, 6) NULL,
[MBRGDT] [decimal] (8, 0) NULL,
[MBRGTM] [decimal] (6, 0) NULL,
[MBLMDT] [decimal] (8, 0) NULL,
[MBCHNO] [decimal] (3, 0) NULL,
[MBCHID] [nvarchar] (255) NULL,
[MBAGDY] [decimal] (5, 0) NULL,
[MBAGHO] [decimal] (4, 0) NULL,
[MBLMTS] [decimal] (18, 0) NULL,
[MBSCPO] [nvarchar] (255) NULL,
[MBSESO] [decimal] (1, 0) NULL,
[MBALUN] [nvarchar] (255) NULL,
[MBMRPQ] [decimal] (15, 6) NULL,
[MBPLNT] [nvarchar] (255) NULL,
[MBPLID] [decimal] (8, 0) NULL,
[MBPLIT] [decimal] (6, 0) NULL,
[MBKTEX] [decimal] (1, 0) NULL,
[MBSTCW] [decimal] (15, 6) NULL,
[MBQUCW] [decimal] (15, 6) NULL,
[MBRJCW] [decimal] (15, 6) NULL,
[MBBALO] [decimal] (1, 0) NULL,
[MBDITI] [nvarchar] (255) NULL,
[MBRNRI] [decimal] (1, 0) NULL,
[MBRMSG] [decimal] (1, 0) NULL,
[MBPAFI] [decimal] (1, 0) NULL,
[MBSCRQ] [decimal] (1, 0) NULL,
[MBAGDA] [decimal] (8, 0) NULL,
[MBIPLA] [nvarchar] (255) NULL,
[MBSURT] [nvarchar] (255) NULL,
[MBAGMI] [decimal] (2, 0) NULL,
[MBBBTM] [decimal] (5, 0) NULL,
[MBFSSQ] [decimal] (1, 0) NULL,
[MBCUEX] [nvarchar] (255) NULL,
[MBINSH] [decimal] (1, 0) NULL,
[MBSSRE] [nvarchar] (255) NULL
)
GO
