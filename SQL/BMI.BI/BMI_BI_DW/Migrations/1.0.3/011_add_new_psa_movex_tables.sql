-- <Migration ID="c865a9ad-2ad8-4058-82e2-ff61f3741374" />
go
if objectpropertyex(object_id(N'[psa].[ics_stg_movex_CCURRA]'), N'IsUserTable') is not null drop table [psa].[ics_stg_movex_CCURRA]
go
if objectpropertyex(object_id(N'[psa].[ics_stg_movex_CSYTAB]'), N'IsUserTable') is not null drop table [psa].[ics_stg_movex_CSYTAB]
go
if objectpropertyex(object_id(N'[psa].[ics_stg_movex_MILOMA]'), N'IsUserTable') is not null drop table [psa].[ics_stg_movex_MILOMA]
go
if objectpropertyex(object_id(N'[psa].[ics_stg_movex_MITAUN]'), N'IsUserTable') is not null drop table [psa].[ics_stg_movex_MITAUN]
go
if objectpropertyex(object_id(N'[psa].[ics_stg_movex_MITBAL]'), N'IsUserTable') is not null drop table [psa].[ics_stg_movex_MITBAL]
go
if objectpropertyex(object_id(N'[psa].[ics_stg_movex_MITFAC]'), N'IsUserTable') is not null drop table [psa].[ics_stg_movex_MITFAC]
go
if objectpropertyex(object_id(N'[psa].[ics_stg_movex_MITLOC]'), N'IsUserTable') is not null drop table [psa].[ics_stg_movex_MITLOC]
go
if objectpropertyex(object_id(N'[psa].[ics_stg_movex_MITMAS]'), N'IsUserTable') is not null drop table [psa].[ics_stg_movex_MITMAS]
go
if objectpropertyex(object_id(N'[psa].[ics_stg_movex_OCHCUS]'), N'IsUserTable') is not null drop table [psa].[ics_stg_movex_OCHCUS]
go
if objectpropertyex(object_id(N'[psa].[ics_stg_movex_OCUSMA]'), N'IsUserTable') is not null drop table [psa].[ics_stg_movex_OCUSMA]
go
if objectpropertyex(object_id(N'[psa].[ics_stg_movex_OINVOH]'), N'IsUserTable') is not null drop table [psa].[ics_stg_movex_OINVOH]
go
if objectpropertyex(object_id(N'[psa].[ics_stg_movex_OINVOL]'), N'IsUserTable') is not null drop table [psa].[ics_stg_movex_OINVOL]
go
if objectpropertyex(object_id(N'[psa].[ics_stg_movex_OOHEAD]'), N'IsUserTable') is not null drop table [psa].[ics_stg_movex_OOHEAD]
go
if objectpropertyex(object_id(N'[psa].[ics_stg_movex_OOLINE]'), N'IsUserTable') is not null drop table [psa].[ics_stg_movex_OOLINE]
go
if objectpropertyex(object_id(N'[psa].[ics_stg_movex_OSBSTD]'), N'IsUserTable') is not null drop table [psa].[ics_stg_movex_OSBSTD]
go
print N'Creating [psa].[ics_stg_movex_CCURRA]' ;
go
create table [psa].[ics_stg_movex_CCURRA]
(
  EtlRecordId bigint not null identity(1,1)
, EtlBatchRunId int not null
, EtlStepRunId int not null
, EtlThreadRunId int not null
, DataSourceKey int not null
, EtlSourceTable varchar(200) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, IsDeleted char(1) not null constraint DF_psa_ics_stg_movex_CCURRA_IsDeleted default ('N')
, IsIncomplete char(1) not null constraint DF_psa_ics_stg_movex_CCURRA_IsIncomplete default ('N')

, CUCONO decimal(3, 0) null
, CUDIVI nvarchar(255) null
, CUGLOC nvarchar(255) null
, CUCUCD nvarchar(255) null
, CUCRTP decimal(2, 0) null
, CUCUTD decimal(8, 0) null
, CUARAT decimal(11, 6) null
, CUTXID decimal(13, 0) null
, CULOCD nvarchar(255) null
, CUDMCU decimal(1, 0) null
, CURAFA decimal(1, 0) null
, CURGDT decimal(8, 0) null
, CURGTM decimal(6, 0) null
, CULMDT decimal(8, 0) null
, CUCHNO decimal(3, 0) null
, CUCHID nvarchar(255) null
, CULMTS decimal(18, 0) null
) ;
go
print N'Creating [psa].[ics_stg_movex_CSYTAB]' ;
go
create table [psa].[ics_stg_movex_CSYTAB]
(
  EtlRecordId bigint not null identity(1,1)
, EtlBatchRunId int not null
, EtlStepRunId int not null
, EtlThreadRunId int not null
, DataSourceKey int not null
, EtlSourceTable varchar(200) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, IsDeleted char(1) not null constraint DF_psa_ics_stg_movex_CSYTAB_IsDeleted default ('N')
, IsIncomplete char(1) not null constraint DF_psa_ics_stg_movex_CSYTAB_IsIncomplete default ('N')

, CTCONO decimal(3, 0) null
, CTDIVI nvarchar(255) null
, CTSTCO nvarchar(255) null
, CTSTKY nvarchar(255) null
, CTLNCD nvarchar(255) null
, CTTX40 nvarchar(255) null
, CTTX15 nvarchar(255) null
, CTPARM nvarchar(255) null
, CTTXID decimal(13, 0) null
, CTRGDT decimal(8, 0) null
, CTRGTM decimal(6, 0) null
, CTLMDT decimal(8, 0) null
, CTCHNO decimal(3, 0) null
, CTCHID nvarchar(255) null
, CTLMTS decimal(18, 0) null
) ;
go
print N'Creating [psa].[ics_stg_movex_MILOMA]' ;
go
create table [psa].[ics_stg_movex_MILOMA]
(
  EtlRecordId bigint not null identity(1,1)
, EtlBatchRunId int not null
, EtlStepRunId int not null
, EtlThreadRunId int not null
, DataSourceKey int not null
, EtlSourceTable varchar(200) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, IsDeleted char(1) not null constraint DF_psa_ics_stg_movex_MILOMA_IsDeleted default ('N')
, IsIncomplete char(1) not null constraint DF_psa_ics_stg_movex_MILOMA_IsIncomplete default ('N')

, LMCONO decimal(3, 0) null
, LMITNO nvarchar(255) null
, LMBANO nvarchar(255) null
, LMLOTY decimal(1, 0) null
, LMINRE decimal(1, 0) null
, LMALOC decimal(1, 0) null
, LMARLA nvarchar(255) null
, LMIDET nvarchar(255) null
, LMRORC decimal(1, 0) null
, LMRORN nvarchar(255) null
, LMRORL decimal(6, 0) null
, LMREPN decimal(10, 0) null
, LMSUNO nvarchar(255) null
, LMMFIT nvarchar(255) null
, LMMFSN nvarchar(255) null
, LMPROD nvarchar(255) null
, LMBREF nvarchar(255) null
, LMBRE2 nvarchar(255) null
, LMOWNC nvarchar(255) null
, LMLPCY decimal(5, 2) null
, LMORCO nvarchar(255) null
, LMLOTC decimal(17, 6) null
, LMREDA decimal(8, 0) null
, LMQIAD decimal(8, 0) null
, LMMFDT decimal(8, 0) null
, LMEXPI decimal(8, 0) null
, LMCNDT decimal(8, 0) null
, LMSEDT decimal(8, 0) null
, LMRCLS decimal(8, 0) null
, LMLATD decimal(8, 0) null
, LMCFI3 nvarchar(255) null
, LMCFJ0 nvarchar(255) null
, LMCFI2 decimal(15, 2) null
, LMECVE nvarchar(255) null
, LMFACI nvarchar(255) null
, LMAAGN nvarchar(255) null
, LMTXID decimal(13, 0) null
, LMATNR decimal(17, 0) null
, LMRGDT decimal(8, 0) null
, LMRGTM decimal(6, 0) null
, LMLMDT decimal(8, 0) null
, LMCHNO decimal(3, 0) null
, LMCHID nvarchar(255) null
, LMRORX decimal(3, 0) null
, LMLMTS decimal(18, 0) null
, LMLIRR decimal(1, 0) null
, LMBBDT decimal(8, 0) null
, LMHVDT decimal(8, 0) null
, LMHVIT nvarchar(255) null
, LMHVLT nvarchar(255) null
, LMTIHM decimal(4, 0) null
, LMCUEX nvarchar(2000) null -- string(2000)
) ;
go
print N'Creating [psa].[ics_stg_movex_MITAUN]' ;
go
create table [psa].[ics_stg_movex_MITAUN]
(
  EtlRecordId bigint not null identity(1,1)
, EtlBatchRunId int not null
, EtlStepRunId int not null
, EtlThreadRunId int not null
, DataSourceKey int not null
, EtlSourceTable varchar(200) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, IsDeleted char(1) not null constraint DF_psa_ics_stg_movex_MITAUN_IsDeleted default ('N')
, IsIncomplete char(1) not null constraint DF_psa_ics_stg_movex_MITAUN_IsIncomplete default ('N')

, MUCONO decimal(3, 0) null
, MUITNO nvarchar(255) null
, MUAUTP decimal(1, 0) null
, MUALUN nvarchar(255) null
, MUDCCD decimal(1, 0) null
, MUCOFA decimal(15, 9) null
, MUDMCF decimal(1, 0) null
, MUPCOF decimal(15, 9) null
, MUAUS1 decimal(1, 0) null
, MUAUS2 decimal(1, 0) null
, MUAUS3 decimal(1, 0) null
, MUAUS4 decimal(1, 0) null
, MUAUS5 decimal(1, 0) null
, MUAUS6 decimal(1, 0) null
, MUAUS9 decimal(1, 0) null
, MUUNMU decimal(15, 6) null
, MUFMID nvarchar(255) null
, MURESI nvarchar(255) null
, MUTXID decimal(13, 0) null
, MURGDT decimal(8, 0) null
, MURGTM decimal(6, 0) null
, MULMDT decimal(8, 0) null
, MUCHNO decimal(3, 0) null
, MUCHID nvarchar(255) null
, MULMTS decimal(18, 0) null
, MUPACT nvarchar(255) null
, MUAUSC decimal(1, 0) null
, MUAUSB decimal(1, 0) null
, MUCUEX nvarchar(255) null
, MULGUN decimal(1, 0) null
) ;
go
print N'Creating [psa].[ics_stg_movex_MITBAL]' ;
go
create table [psa].[ics_stg_movex_MITBAL]
(
  EtlRecordId bigint not null identity(1,1)
, EtlBatchRunId int not null
, EtlStepRunId int not null
, EtlThreadRunId int not null
, DataSourceKey int not null
, EtlSourceTable varchar(200) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, IsDeleted char(1) not null constraint DF_psa_ics_stg_movex_MITBAL_IsDeleted default ('N')
, IsIncomplete char(1) not null constraint DF_psa_ics_stg_movex_MITBAL_IsIncomplete default ('N')

, MBCONO decimal(3, 0) null
, MBWHLO nvarchar(255) null
, MBITNO nvarchar(255) null
, MBSTQT decimal(15, 6) null
, MBQUQT decimal(15, 6) null
, MBRJQT decimal(15, 6) null
, MBALQT decimal(15, 6) null
, MBAVAL decimal(15, 6) null
, MBPLQT decimal(15, 6) null
, MBCOMG decimal(1, 0) null
, MBALMT decimal(1, 0) null
, MBSTMT decimal(1, 0) null
, MBSPMT decimal(1, 0) null
, MBSTTX nvarchar(255) null
, MBORQT decimal(15, 6) null
, MBREQT decimal(15, 6) null
, MBRLQT decimal(15, 6) null
, MBREQP decimal(15, 6) null
, MBIDDT decimal(8, 0) null
, MBODDT decimal(8, 0) null
, MBINDT decimal(8, 0) null
, MBPRDC decimal(1, 0) null
, MBINCD nvarchar(255) null
, MBNUIN decimal(4, 0) null
, MBUSYE decimal(15, 6) null
, MBAVST decimal(15, 6) null
, MBDILE decimal(15, 6) null
, MBRESP nvarchar(255) null
, MBBUYE nvarchar(255) null
, MBSUNO nvarchar(255) null
, MBWHTY nvarchar(255) null
, MBWHSY nvarchar(255) null
, MBINSC decimal(1, 0) null
, MBDIGR nvarchar(255) null
, MBWHSL nvarchar(255) null
, MBSLTP nvarchar(255) null
, MBNUS7 decimal(7, 0) null
, MBTOMU decimal(15, 6) null
, MBWHLT nvarchar(255) null
, MBPISE nvarchar(255) null
, MBPLCD nvarchar(255) null
, MBMABC nvarchar(255) null
, MBABCD nvarchar(255) null
, MBABCM decimal(1, 0) null
, MBABFC nvarchar(255) null
, MBABFM decimal(1, 0) null
, MBACOC nvarchar(255) null
, MBACOM decimal(1, 0) null
, MBPRIF decimal(3, 0) null
, MBSODY decimal(3, 0) null
, MBREOP decimal(15, 6) null
, MBOPOM decimal(1, 0) null
, MBSSQT decimal(15, 6) null
, MBSSMT decimal(1, 0) null
, MBMSSQ decimal(15, 6) null
, MBSSDA decimal(3, 0) null
, MBSCGR decimal(3, 1) null
, MBMXST decimal(15, 6) null
, MBMXSM decimal(1, 0) null
, MBMXPC decimal(3, 0) null
, MBEOQT decimal(15, 6) null
, MBEOQM decimal(2, 0) null
, MBEQDA decimal(3, 0) null
, MBYEQT decimal(15, 6) null
, MBYEQM decimal(1, 0) null
, MBLOQT decimal(15, 6) null
, MBMOQT decimal(15, 6) null
, MBPUIT decimal(1, 0) null
, MBSUWH nvarchar(255) null
, MBDPID decimal(2, 0) null
, MBPRCD nvarchar(255) null
, MBFCCM nvarchar(255) null
, MBLYQT decimal(15, 6) null
, MBLRYE decimal(15, 6) null
, MBPFTM decimal(3, 0) null
, MBLEA1 decimal(3, 0) null
, MBLEA2 decimal(3, 0) null
, MBLEA3 decimal(3, 0) null
, MBLEAT decimal(3, 0) null
, MBUNMU decimal(15, 6) null
, MBSVEI decimal(1, 0) null
, MBLEVL decimal(2, 0) null
, MBLEVD decimal(2, 0) null
, MBPLHZ decimal(3, 0) null
, MBDMFN decimal(3, 0) null
, MBORTY nvarchar(255) null
, MBCONC decimal(1, 0) null
, MBSATD decimal(3, 0) null
, MBALQC decimal(1, 0) null
, MBOPLC decimal(1, 0) null
, MBMSCH decimal(1, 0) null
, MBSHCC decimal(1, 0) null
, MBZCAC decimal(1, 0) null
, MBINSL nvarchar(255) null
, MBNCCA decimal(1, 0) null
, MBFACI nvarchar(255) null
, MBDIVI nvarchar(255) null
, MBDDEX decimal(1, 0) null
, MBSTRL decimal(1, 0) null
, MBPLIC decimal(1, 0) null
, MBPPMC decimal(1, 0) null
, MBMPCD decimal(8, 0) null
, MBMPCT decimal(6, 0) null
, MBDCSS decimal(1, 0) null
, MBRPOP decimal(1, 0) null
, MBBCOS decimal(17, 6) null
, MBTXID decimal(13, 0) null
, MBDTID decimal(13, 0) null
, MBDPLO nvarchar(255) null
, MBDDLO nvarchar(255) null
, MBSPLC nvarchar(255) null
, MBALS1 decimal(1, 0) null
, MBPOOT nvarchar(255) null
, MBSTAT nvarchar(255) null
, MBVTCP decimal(2, 0) null
, MBVTCS decimal(2, 0) null
, MBMNUN nvarchar(255) null
, MBGRTS nvarchar(255) null
, MBSLDY decimal(5, 0) null
, MBREDY decimal(5, 0) null
, MBSAEL decimal(5, 0) null
, MBCPCD nvarchar(255) null
, MBLEAQ decimal(3, 0) null
, MBSCHT decimal(1, 0) null
, MBSALM decimal(1, 0) null
, MBCDYN decimal(1, 0) null
, MBPAFL decimal(1, 0) null
, MBMRQT decimal(15, 6) null
, MBRGDT decimal(8, 0) null
, MBRGTM decimal(6, 0) null
, MBLMDT decimal(8, 0) null
, MBCHNO decimal(3, 0) null
, MBCHID nvarchar(255) null
, MBAGDY decimal(5, 0) null
, MBAGHO decimal(4, 0) null
, MBLMTS decimal(18, 0) null
, MBSCPO nvarchar(255) null
, MBSESO decimal(1, 0) null
, MBALUN nvarchar(255) null
, MBMRPQ decimal(15, 6) null
, MBPLNT nvarchar(255) null
, MBPLID decimal(8, 0) null
, MBPLIT decimal(6, 0) null
, MBKTEX decimal(1, 0) null
, MBSTCW decimal(15, 6) null
, MBQUCW decimal(15, 6) null
, MBRJCW decimal(15, 6) null
, MBBALO decimal(1, 0) null
, MBDITI nvarchar(255) null
, MBRNRI decimal(1, 0) null
, MBRMSG decimal(1, 0) null
, MBPAFI decimal(1, 0) null
, MBSCRQ decimal(1, 0) null
, MBAGDA decimal(8, 0) null
, MBIPLA nvarchar(255) null
, MBSURT nvarchar(255) null
, MBAGMI decimal(2, 0) null
, MBBBTM decimal(5, 0) null
, MBFSSQ decimal(1, 0) null
, MBCUEX nvarchar(255) null
, MBINSH decimal(1, 0) null
, MBSSRE nvarchar(255) null
) ;
go
print N'Creating [psa].[ics_stg_movex_MITFAC]' ;
go
create table [psa].[ics_stg_movex_MITFAC]
(
  EtlRecordId bigint not null identity(1,1)
, EtlBatchRunId int not null
, EtlStepRunId int not null
, EtlThreadRunId int not null
, DataSourceKey int not null
, EtlSourceTable varchar(200) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, IsDeleted char(1) not null constraint DF_psa_ics_stg_movex_MITFAC_IsDeleted default ('N')
, IsIncomplete char(1) not null constraint DF_psa_ics_stg_movex_MITFAC_IsIncomplete default ('N')

, M9CONO decimal(3, 0) null
, M9FACI nvarchar(255) null
, M9ITNO nvarchar(255) null
, M9LEA4 decimal(3, 0) null
, M9CSNO nvarchar(255) null
, M9SPFA decimal(15, 9) null
, M9ORCO nvarchar(255) null
, M9APPR decimal(17, 6) null
, M9UCOS decimal(17, 6) null
, M9SOCO decimal(17, 6) null
, M9EXPC decimal(5, 2) null
, M9BQTY decimal(15, 6) null
, M9BQTM decimal(1, 0) null
, M9LLCM decimal(2, 0) null
, M9DLET decimal(1, 0) null
, M9DLEF decimal(3, 0) null
, M9DIDY decimal(1, 0) null
, M9DIDF decimal(3, 0) null
, M9PRRA decimal(1, 0) null
, M9TRHC decimal(5, 2) null
, M9MARC decimal(1, 0) null
, M9JITF decimal(1, 0) null
, M9REWH nvarchar(255) null
, M9OPFQ decimal(15, 6) null
, M9FANO decimal(15, 6) null
, M9FANQ decimal(15, 6) null
, M9FANR decimal(15, 6) null
, M9FATM decimal(1, 0) null
, M9WCLN nvarchar(255) null
, M9EDEC nvarchar(255) null
, M9AUGE decimal(1, 0) null
, M9ECCC nvarchar(255) null
, M9ECAR nvarchar(255) null
, M9CPRI nvarchar(255) null
, M9CPRE nvarchar(255) null
, M9WSCA nvarchar(255) null
, M9PRCM nvarchar(255) null
, M9PLAP nvarchar(255) null
, M9PLUP nvarchar(255) null
, M9SCMO nvarchar(255) null
, M9CPL0 decimal(1, 0) null
, M9CPL1 decimal(1, 0) null
, M9CPL2 decimal(1, 0) null
, M9PPL0 decimal(1, 0) null
, M9PPL1 decimal(1, 0) null
, M9PPL2 decimal(1, 0) null
, M9TXID decimal(13, 0) null
, M9DTID decimal(13, 0) null
, M9CPDC decimal(1, 0) null
, M9COCD decimal(5, 0) null
, M9EVGR nvarchar(255) null
, M9VAMT decimal(1, 0) null
, M9LAMA decimal(5, 2) null
, M9GRTI nvarchar(255) null
, M9MOLL decimal(5, 2) null
, M9RGDT decimal(8, 0) null
, M9RGTM decimal(6, 0) null
, M9LMDT decimal(8, 0) null
, M9CHNO decimal(3, 0) null
, M9CHID nvarchar(255) null
, M9LMTS decimal(18, 0) null
, M9CRTM decimal(1, 0) null
, M9DICM nvarchar(255) null
, M9ACRF nvarchar(255) null
, M9ECVE nvarchar(255) null
, M9ATTC decimal(1, 0) null
, M9ATNR decimal(17, 0) null
, M9STCW decimal(15, 6) null
, M9QUCW decimal(15, 6) null
, M9RJCW decimal(15, 6) null
, M9CAWC decimal(1, 0) null
, M9COFA decimal(15, 9) null
, M9CUEX nvarchar(2000) null -- source is string(2000)
) ;
go
print N'Creating [psa].[ics_stg_movex_MITLOC]' ;
go
create table [psa].[ics_stg_movex_MITLOC]
(
  EtlRecordId bigint not null identity(1,1)
, EtlBatchRunId int not null
, EtlStepRunId int not null
, EtlThreadRunId int not null
, DataSourceKey int not null
, EtlSourceTable varchar(200) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, IsDeleted char(1) not null constraint DF_psa_ics_stg_movex_MITLOC_IsDeleted default ('N')
, IsIncomplete char(1) not null constraint DF_psa_ics_stg_movex_MITLOC_IsIncomplete default ('N')

, MLCONO decimal(3, 0) null
, MLWHLO nvarchar(255) null
, MLITNO nvarchar(255) null
, MLWHSL nvarchar(255) null
, MLBANO nvarchar(255) null
, MLCAMU nvarchar(255) null
, MLFACI nvarchar(255) null
, MLWHLT nvarchar(255) null
, MLSTQT decimal(15, 6) null
, MLPOCY decimal(5, 2) null
, MLALQT decimal(15, 6) null
, MLPLQT decimal(15, 6) null
, MLALOC decimal(1, 0) null
, MLPUAB decimal(1, 0) null
, MLSTAS nvarchar(255) null
, MLPPRI nvarchar(255) null
, MLPRDT decimal(8, 0) null
, MLREPN decimal(10, 0) null
, MLIDDT decimal(8, 0) null
, MLODDT decimal(8, 0) null
, MLINDT decimal(8, 0) null
, MLINON decimal(1, 0) null
, MLBREF nvarchar(255) null
, MLBRE2 nvarchar(255) null
, MLBREM nvarchar(255) null
, MLSLTP nvarchar(255) null
, MLPACT nvarchar(255) null
, MLSTES decimal(1, 0) null
, MLTXID decimal(13, 0) null
, MLDTID decimal(13, 0) null
, MLAUDE decimal(1, 0) null
, MLAUDD decimal(3, 0) null
, MLRCLS decimal(8, 0) null
, MLRCLN decimal(7, 0) null
, MLATNR decimal(17, 0) null
, MLCNDT decimal(8, 0) null
, MLSEDT decimal(8, 0) null
, MLSTQM decimal(15, 6) null
, MLRGDT decimal(8, 0) null
, MLRGTM decimal(6, 0) null
, MLLMDT decimal(8, 0) null
, MLCHNO decimal(3, 0) null
, MLCHID nvarchar(255) null
, MLLMTS decimal(18, 0) null
, MLINVC decimal(1, 0) null
, MLATV1 nvarchar(255) null
, MLATV2 nvarchar(255) null
, MLATV3 nvarchar(255) null
, MLATV4 nvarchar(255) null
, MLATV5 nvarchar(255) null
, MLCANB decimal(17, 0) null
, MLSTNB decimal(10, 0) null
, MLOPAN nvarchar(255) null
, MLCAWE decimal(15, 6) null
, MLINCW decimal(15, 6) null
, MLIQTY decimal(15, 6) null
, MLACUW decimal(15, 6) null
, MLACUQ decimal(15, 6) null
, MLADJW decimal(15, 6) null
, MLFIFL decimal(1, 0) null
, MLSEMO decimal(2, 0) null
, MLQIAD decimal(8, 0) null
, MLANNO decimal(2, 0) null
, MLNALO decimal(1, 0) null
, MLTIHM decimal(4, 0) null
, MLQRID nvarchar(255) null
) ;
go
print N'Creating [psa].[ics_stg_movex_MITMAS]' ;
go
create table [psa].[ics_stg_movex_MITMAS]
(
  EtlRecordId bigint not null identity(1,1)
, EtlBatchRunId int not null
, EtlStepRunId int not null
, EtlThreadRunId int not null
, DataSourceKey int not null
, EtlSourceTable varchar(200) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, IsDeleted char(1) not null constraint DF_psa_ics_stg_movex_MITMAS_IsDeleted default ('N')
, IsIncomplete char(1) not null constraint DF_psa_ics_stg_movex_MITMAS_IsIncomplete default ('N')

, MMCONO decimal(3, 0) null
, MMSTAT nvarchar(255) null
, MMITNO nvarchar(255) null
, MMITDS nvarchar(255) null
, MMFUDS nvarchar(255) null
, MMDWNO nvarchar(255) null
, MMRESP nvarchar(255) null
, MMDCCD decimal(1, 0) null
, MMUNMS nvarchar(255) null
, MMITGR nvarchar(255) null
, MMITCL nvarchar(255) null
, MMBUAR nvarchar(255) null
, MMEVGR nvarchar(255) null
, MMITTY nvarchar(255) null
, MMTPCD decimal(2, 0) null
, MMMABU decimal(1, 0) null
, MMCHCD decimal(1, 0) null
, MMSTCD decimal(1, 0) null
, MMBACD decimal(1, 0) null
, MMVOL3 decimal(9, 3) null
, MMNEWE decimal(9, 3) null
, MMGRWE decimal(9, 3) null
, MMPPUN nvarchar(255) null
, MMBYPR decimal(1, 0) null
, MMWAPC decimal(5, 2) null
, MMQACD decimal(1, 0) null
, MMEPCD decimal(1, 0) null
, MMPOCY decimal(5, 2) null
, MMACTI decimal(1, 0) null
, MMHIE1 nvarchar(255) null
, MMHIE2 nvarchar(255) null
, MMHIE3 nvarchar(255) null
, MMHIE4 nvarchar(255) null
, MMHIE5 nvarchar(255) null
, MMGRP1 nvarchar(255) null
, MMGRP2 nvarchar(255) null
, MMGRP3 nvarchar(255) null
, MMGRP4 nvarchar(255) null
, MMGRP5 nvarchar(255) null
, MMCFI1 nvarchar(255) null
, MMCFI2 decimal(15, 2) null
, MMCFI3 nvarchar(255) null
, MMCFI4 nvarchar(255) null
, MMCFI5 nvarchar(255) null
, MMECCC nvarchar(255) null
, MMTXID decimal(13, 0) null
, MMDTID decimal(13, 0) null
, MMECVE nvarchar(255) null
, MMECAC nvarchar(255) null
, MMECMA decimal(1, 0) null
, MMECFL decimal(1, 0) null
, MMWSCA nvarchar(255) null
, MMPRGP nvarchar(255) null
, MMETRF nvarchar(255) null
, MMACRF nvarchar(255) null
, MMINDI decimal(1, 0) null
, MMPUUN nvarchar(255) null
, MMAUTC decimal(1, 0) null
, MMALUC decimal(1, 0) null
, MMPDCC decimal(1, 0) null
, MMIEAA decimal(1, 0) null
, MMRIDE nvarchar(255) null
, MMRIDC decimal(1, 0) null
, MMGRTI nvarchar(255) null
, MMGRTS nvarchar(255) null
, MMEXPD decimal(1, 0) null
, MMITRF nvarchar(255) null
, MMPRCM nvarchar(255) null
, MMGRMT nvarchar(255) null
, MMHAZI decimal(1, 0) null
, MMSALE decimal(1, 0) null
, MMFRAG decimal(2, 0) null
, MMTAXC nvarchar(255) null
, MMATMO nvarchar(255) null
, MMATMN decimal(1, 0) null
, MMTPLI nvarchar(255) null
, MMFCU1 decimal(11, 3) null
, MMSUNO nvarchar(255) null
, MMPUPR decimal(17, 6) null
, MMPUCD decimal(5, 0) null
, MMCUCD nvarchar(255) null
, MMPPDT decimal(8, 0) null
, MMSAPR decimal(17, 6) null
, MMSTUN nvarchar(255) null
, MMSACD decimal(5, 0) null
, MMCUCS nvarchar(255) null
, MMSPDT decimal(8, 0) null
, MMDIGI nvarchar(255) null
, MMBGRP nvarchar(255) null
, MMPRVG nvarchar(255) null
, MMFRE3 nvarchar(255) null
, MMFRE4 nvarchar(255) null
, MMOTDI decimal(1, 0) null
, MMBOGR decimal(1, 0) null
, MMPRGR decimal(1, 0) null
, MMLAMA decimal(5, 2) null
, MMACHK decimal(1, 0) null
, MMBPEY decimal(1, 0) null
, MMSPUN nvarchar(255) null
, MMSPUC decimal(1, 0) null
, MMALUN nvarchar(255) null
, MMUNNN decimal(4, 0) null
, MMUNPA nvarchar(255) null
, MMHAC1 nvarchar(255) null
, MMHAC2 nvarchar(255) null
, MMHAC3 nvarchar(255) null
, MMDIM1 nvarchar(255) null
, MMDIM2 nvarchar(255) null
, MMDIM3 nvarchar(255) null
, MMSPE1 nvarchar(255) null
, MMSPE2 nvarchar(255) null
, MMSPE3 nvarchar(255) null
, MMSPE4 nvarchar(255) null
, MMSPE5 nvarchar(255) null
, MMCETY nvarchar(255) null
, MMSTCN nvarchar(255) null
, MMSPAC nvarchar(255) null
, MMTRPA nvarchar(255) null
, MMPROD nvarchar(255) null
, MMSMFI decimal(1, 0) null
, MMTANK decimal(2, 0) null
, MMARPA nvarchar(255) null
, MMARPR nvarchar(255) null
, MMAMPT decimal(3, 0) null
, MMAWDY decimal(5, 0) null
, MMNPTO decimal(3, 0) null
, MMMES1 nvarchar(255) null
, MMMES2 nvarchar(255) null
, MMMES3 nvarchar(255) null
, MMMES4 nvarchar(255) null
, MMMVA1 decimal(15, 6) null
, MMMVA2 decimal(15, 6) null
, MMMVA3 decimal(15, 6) null
, MMMVA4 decimal(15, 6) null
, MMPEQ1 decimal(5, 0) null
, MMPEQ2 decimal(5, 0) null
, MMPEQ3 decimal(5, 0) null
, MMPEQ4 decimal(5, 0) null
, MMPET1 decimal(1, 0) null
, MMPET2 decimal(1, 0) null
, MMPET3 decimal(1, 0) null
, MMPET4 decimal(1, 0) null
, MMMPGM nvarchar(255) null
, MMORTY nvarchar(255) null
, MMPLCD nvarchar(255) null
, MMMAPL nvarchar(255) null
, MMTOHI decimal(1, 0) null
, MMTORE decimal(1, 0) null
, MMFEBA decimal(1, 0) null
, MMMAPN decimal(1, 0) null
, MMDOID nvarchar(255) null
, MMSEPR decimal(17, 6) null
, MMSTCS decimal(15, 2) null
, MMNESA nvarchar(255) null
, MMNSUF nvarchar(255) null
, MMFCCM nvarchar(255) null
, MMDPID decimal(2, 0) null
, MMCONC decimal(1, 0) null
, MMPLMZ decimal(4, 0) null
, MMCCO1 decimal(5, 3) null
, MMCCO2 decimal(5, 3) null
, MMCCO3 decimal(5, 3) null
, MMWADY decimal(5, 0) null
, MMTBSR decimal(15, 6) null
, MMMBSR nvarchar(255) null
, MMTBUR decimal(15, 6) null
, MMMBUR nvarchar(255) null
, MMTBFR decimal(15, 6) null
, MMMBFR nvarchar(255) null
, MMAESC decimal(1, 0) null
, MMAES2 decimal(1, 0) null
, MMAMOR decimal(1, 0) null
, MMFUNC nvarchar(255) null
, MMSTNC nvarchar(255) null
, MMDIRR decimal(15, 6) null
, MMMDIR nvarchar(255) null
, MMSCGR decimal(3, 1) null
, MMARR1 decimal(1, 0) null
, MMAEQY decimal(15, 6) null
, MMLEAI decimal(3, 0) null
, MMWAL1 decimal(15, 6) null
, MMWAL2 decimal(15, 6) null
, MMWAL3 decimal(15, 6) null
, MMWAL4 decimal(15, 6) null
, MMIACP decimal(1, 0) null
, MMHDPR nvarchar(255) null
, MMAAD0 decimal(1, 0) null
, MMAAD1 decimal(1, 0) null
, MMCHCL decimal(1, 0) null
, MMITRC decimal(1, 0) null
, MMVTCP decimal(2, 0) null
, MMVTCS decimal(2, 0) null
, MMRGDT decimal(8, 0) null
, MMRGTM decimal(6, 0) null
, MMLMDT decimal(8, 0) null
, MMCHNO decimal(3, 0) null
, MMCHID nvarchar(255) null
, MMLMTS decimal(18, 0) null
, MMATNR decimal(17, 0) null
, MMNMIT nvarchar(255) null
, MMTECR nvarchar(255) null
, MMEXCA decimal(1, 0) null
, MMCAWP decimal(1, 0) null
, MMCWUN nvarchar(255) null
, MMCPUN nvarchar(255) null
, MMILEN decimal(5, 3) null
, MMIWID decimal(5, 3) null
, MMIHEI decimal(5, 3) null
, MMRNRI decimal(1, 0) null
, MMSAFC nvarchar(255) null
, MMRMSG decimal(1, 0) null
, MMMOTP nvarchar(255) null
, MMACMC nvarchar(255) null
, MMACCG nvarchar(255) null
, MMCCI1 nvarchar(255) null
, MMCCCM nvarchar(255) null
, MMCRI1 nvarchar(255) null
, MMITRU decimal(1, 0) null
, MMHVMT decimal(1, 0) null
, MMITNE nvarchar(255) null
, MMCUEX nvarchar(255) null
, MMQMGP nvarchar(255) null
, MMSPGV decimal(9, 6) null
, MMRUID nvarchar(255) null
, MMSPIH decimal(1, 0) null
, MMQIRQ decimal(1, 0) null
, MMPDLN nvarchar(255) null
, MMCPGR nvarchar(255) null
) ;
go
print N'Creating [psa].[ics_stg_movex_OCHCUS]' ;
go
create table [psa].[ics_stg_movex_OCHCUS]
(
  EtlRecordId bigint not null identity(1,1)
, EtlBatchRunId int not null
, EtlStepRunId int not null
, EtlThreadRunId int not null
, DataSourceKey int not null
, EtlSourceTable varchar(200) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, IsDeleted char(1) not null constraint DF_psa_ics_stg_movex_OCHCUS_IsDeleted default ('N')
, IsIncomplete char(1) not null constraint DF_psa_ics_stg_movex_OCHCUS_IsIncomplete default ('N')

, OSCONO decimal(3, 0) null
, OSCUNO nvarchar(255) null
, OSCHCT nvarchar(255) null
, OSCHL1 nvarchar(255) null
, OSCHL2 nvarchar(255) null
, OSCHL3 nvarchar(255) null
, OSCHL4 nvarchar(255) null
, OSFVDT decimal(8, 0) null
, OSLVDT decimal(8, 0) null
, OSCHMB nvarchar(255) null
, OSMBST decimal(1, 0) null
, OSTXID decimal(13, 0) null
, OSRGDT decimal(8, 0) null
, OSRGTM decimal(6, 0) null
, OSLMDT decimal(8, 0) null
, OSCHNO decimal(3, 0) null
, OSCHID nvarchar(255) null
) ;
go
print N'Creating [psa].[ics_stg_movex_OCUSMA]' ;
go
create table [psa].[ics_stg_movex_OCUSMA]
(
  EtlRecordId bigint not null identity(1,1)
, EtlBatchRunId int not null
, EtlStepRunId int not null
, EtlThreadRunId int not null
, DataSourceKey int not null
, EtlSourceTable varchar(200) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, IsDeleted char(1) not null constraint DF_psa_ics_stg_movex_OCUSMA_IsDeleted default ('N')
, IsIncomplete char(1) not null constraint DF_psa_ics_stg_movex_OCUSMA_IsIncomplete default ('N')

, OKCONO decimal(3, 0) null
, OKDIVI nvarchar(255) null
, OKSTAT nvarchar(255) null
, OKCUNO nvarchar(255) null
, OKCUCL nvarchar(255) null
, OKCUTP decimal(1, 0) null
, OKALCU nvarchar(255) null
, OKCUNM nvarchar(255) null
, OKCUA1 nvarchar(255) null
, OKCUA2 nvarchar(255) null
, OKCUA3 nvarchar(255) null
, OKCUA4 nvarchar(255) null
, OKADID nvarchar(255) null
, OKADBO decimal(1, 0) null
, OKPHNO nvarchar(255) null
, OKPHN2 nvarchar(255) null
, OKTFNO nvarchar(255) null
, OKCORG nvarchar(255) null
, OKCOR2 nvarchar(255) null
, OKYREF nvarchar(255) null
, OKYRE2 nvarchar(255) null
, OKOREF nvarchar(255) null
, OKCUSU nvarchar(255) null
, OKEXCD nvarchar(255) null
, OKTEPY nvarchar(255) null
, OKOT75 decimal(1, 0) null
, OKTECD nvarchar(255) null
, OKTEDL nvarchar(255) null
, OKMODL nvarchar(255) null
, OKSMCD nvarchar(255) null
, OKRESP nvarchar(255) null
, OKRONO nvarchar(255) null
, OKDIPC decimal(5, 2) null
, OKDISY nvarchar(255) null
, OKDIGC nvarchar(255) null
, OKVTCD decimal(2, 0) null
, OKTXAP decimal(1, 0) null
, OKCUCD nvarchar(255) null
, OKCRTP decimal(2, 0) null
, OKPLTB nvarchar(255) null
, OKPRVG nvarchar(255) null
, OKBREC nvarchar(255) null
, OKDTFM nvarchar(255) null
, OKEDIT nvarchar(255) null
, OKORTP nvarchar(255) null
, OKWHLO nvarchar(255) null
, OKPRIC decimal(1, 0) null
, OKSDST nvarchar(255) null
, OKCSCD nvarchar(255) null
, OKAGNT nvarchar(255) null
, OKAGN2 nvarchar(255) null
, OKAGN3 nvarchar(255) null
, OKAGN4 nvarchar(255) null
, OKAGN5 nvarchar(255) null
, OKAGN6 nvarchar(255) null
, OKAGN7 nvarchar(255) null
, OKINSU nvarchar(255) null
, OKPYNO nvarchar(255) null
, OKCUST nvarchar(255) null
, OKTEPA nvarchar(255) null
, OKLHCD nvarchar(255) null
, OKCRLM decimal(15, 2) null
, OKCRL2 decimal(15, 2) null
, OKCRL3 decimal(15, 2) null
, OKBLCD decimal(1, 0) null
, OKPRIO decimal(1, 0) null
, OKTBLG decimal(15, 2) null
, OKTOIN decimal(15, 2) null
, OKTDIN decimal(15, 2) null
, OKLIDT decimal(8, 0) null
, OKININ decimal(3, 0) null
, OKACRF nvarchar(255) null
, OKAICD decimal(1, 0) null
, OKBOCD decimal(1, 0) null
, OKFRE1 nvarchar(255) null
, OKFRE2 nvarchar(255) null
, OKBGRP nvarchar(255) null
, OKDOGR nvarchar(255) null
, OKBLII decimal(1, 0) null
, OKIICT nvarchar(255) null
, OKCLCD decimal(1, 0) null
, OKBLPR decimal(1, 0) null
, OKRMCT nvarchar(255) null
, OKBLAC decimal(1, 0) null
, OKADCA nvarchar(255) null
, OKPYDI nvarchar(255) null
, OKPONO nvarchar(255) null
, OKAUGI decimal(1, 0) null
, OKAGPA decimal(1, 0) null
, OKCCUS nvarchar(255) null
, OKWAYB decimal(1, 0) null
, OKADTG decimal(1, 0) null
, OKODTG decimal(1, 0) null
, OKMAIL decimal(1, 0) null
, OKENHD decimal(1, 0) null
, OKEURI decimal(1, 0) null
, OKEDIP decimal(1, 0) null
, OKCFC1 nvarchar(255) null
, OKCFC2 decimal(15, 2) null
, OKCFC3 nvarchar(255) null
, OKCFC4 nvarchar(255) null
, OKCFC5 nvarchar(255) null
, OKCFC6 nvarchar(255) null
, OKCFC7 decimal(15, 2) null
, OKCFC8 nvarchar(255) null
, OKCFC9 nvarchar(255) null
, OKCFC0 nvarchar(255) null
, OKLSID nvarchar(255) null
, OKLSAD nvarchar(255) null
, OKMEAL nvarchar(255) null
, OKVRNO nvarchar(255) null
, OKAGCH decimal(1, 0) null
, OKAGCT decimal(1, 0) null
, OKDUCD decimal(1, 0) null
, OKUSR1 nvarchar(255) null
, OKUSR2 nvarchar(255) null
, OKUSR3 nvarchar(255) null
, OKDTE1 decimal(8, 0) null
, OKDTE2 decimal(8, 0) null
, OKDTE3 decimal(8, 0) null
, OKCDRC nvarchar(255) null
, OKINCO nvarchar(255) null
, OKINSN nvarchar(255) null
, OKCUIC nvarchar(255) null
, OKINSS decimal(1, 0) null
, OKNALI decimal(15, 2) null
, OKDTL1 decimal(8, 0) null
, OKUSL1 nvarchar(255) null
, OKINLI decimal(15, 2) null
, OKDTL2 decimal(8, 0) null
, OKUSL2 nvarchar(255) null
, OKVRCD nvarchar(255) null
, OKEDES nvarchar(255) null
, OKROUT nvarchar(255) null
, OKRODN decimal(3, 0) null
, OKULZO nvarchar(255) null
, OKECLC nvarchar(255) null
, OKECF1 nvarchar(255) null
, OKECF2 nvarchar(255) null
, OKECF3 nvarchar(255) null
, OKECF4 nvarchar(255) null
, OKECF5 nvarchar(255) null
, OKPYCD nvarchar(255) null
, OKGRPY decimal(1, 0) null
, OKTXID decimal(13, 0) null
, OKSERC decimal(2, 0) null
, OKSRES nvarchar(255) null
, OKTECH nvarchar(255) null
, OKTRTI decimal(7, 2) null
, OKLZON decimal(2, 0) null
, OKDIST decimal(5, 0) null
, OKTVCD nvarchar(255) null
, OKSOTP nvarchar(255) null
, OKMTIC decimal(1, 0) null
, OKPWMT nvarchar(255) null
, OKBPCD decimal(1, 0) null
, OKBPEX decimal(1, 0) null
, OKACHK decimal(1, 0) null
, OKTINC decimal(1, 0) null
, OKBUSE decimal(1, 0) null
, OKTCEX decimal(1, 0) null
, OKPYOP decimal(1, 0) null
, OKALWT decimal(2, 0) null
, OKPOPN nvarchar(255) null
, OKSOOP decimal(1, 0) null
, OKPRS1 nvarchar(255) null
, OKPRS2 nvarchar(255) null
, OKPRS3 nvarchar(255) null
, OKPRS4 nvarchar(255) null
, OKPRS5 nvarchar(255) null
, OKDMSO nvarchar(255) null
, OKLSOI decimal(8, 0) null
, OKODUD decimal(3, 0) null
, OKODUE decimal(3, 0) null
, OKEALO decimal(13, 0) null
, OKECAR nvarchar(255) null
, OKGEOC decimal(9, 0) null
, OKTECN nvarchar(255) null
, OKTEEC decimal(8, 0) null
, OKAGPY nvarchar(255) null
, OKAGCP nvarchar(255) null
, OKAGAC nvarchar(255) null
, OKAGBP nvarchar(255) null
, OKACLB nvarchar(255) null
, OKAACB nvarchar(255) null
, OKAGPN nvarchar(255) null
, OKAGBG decimal(10, 0) null
, OKAGPG decimal(10, 0) null
, OKAGCA decimal(1, 0) null
, OKAGTD decimal(8, 0) null
, OKAGTN decimal(10, 0) null
, OKINRC nvarchar(255) null
, OKCESA nvarchar(255) null
, OKCHSY nvarchar(255) null
, OKTAXC nvarchar(255) null
, OKHAFE nvarchar(255) null
, OKOT89 decimal(1, 0) null
, OKPRDL decimal(1, 0) null
, OKMCON decimal(1, 0) null
, OKRAN1 decimal(2, 0) null
, OKRAN2 decimal(2, 0) null
, OKRAN3 decimal(2, 0) null
, OKRAN4 decimal(2, 0) null
, OKQUCK decimal(1, 0) null
, OKIVGP nvarchar(255) null
, OKACEI decimal(1, 0) null
, OKVDLA decimal(1, 0) null
, OKFACI nvarchar(255) null
, OKDTID decimal(13, 0) null
, OKDESV nvarchar(255) null
, OKCHCL decimal(1, 0) null
, OKMCOS decimal(1, 0) null
, OKSPLM nvarchar(255) null
, OKEXPT decimal(1, 0) null
, OKATPR nvarchar(255) null
, OKACGR nvarchar(255) null
, OKSTMS decimal(1, 0) null
, OKSTMR nvarchar(255) null
, OKBCKO decimal(1, 0) null
, OKPADL decimal(1, 0) null
, OKTOWN nvarchar(255) null
, OKADVI nvarchar(255) null
, OKESAL decimal(1, 0) null
, OKRGDT decimal(8, 0) null
, OKRGTM decimal(6, 0) null
, OKLMDT decimal(8, 0) null
, OKCHNO decimal(3, 0) null
, OKCHID nvarchar(255) null
, OKLMTS decimal(18, 0) null
, OKSCED decimal(1, 0) null
, OKOT86 decimal(1, 0) null
, OKBOP1 decimal(1, 0) null
, OKRPLT nvarchar(255) null
, OKRDIS nvarchar(255) null
, OKRPYN nvarchar(255) null
, OKRTEP nvarchar(255) null
, OKRSMC nvarchar(255) null
, OKTRSU nvarchar(255) null
, OKAOTP nvarchar(255) null
, OKCUEX nvarchar(255) null
, OKFRCO nvarchar(255) null
, OKSPLE nvarchar(255) null
, OKRASN nvarchar(255) null
) ;
go
print N'Creating [psa].[ics_stg_movex_OINVOH]' ;
go
create table [psa].[ics_stg_movex_OINVOH]
(
  EtlRecordId bigint not null identity(1,1)
, EtlBatchRunId int not null
, EtlStepRunId int not null
, EtlThreadRunId int not null
, DataSourceKey int not null
, EtlSourceTable varchar(200) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, IsDeleted char(1) not null constraint DF_psa_ics_stg_movex_OINVOH_IsDeleted default ('N')
, IsIncomplete char(1) not null constraint DF_psa_ics_stg_movex_OINVOH_IsIncomplete default ('N')

, UHCONO decimal(3, 0) null
, UHDIVI nvarchar(255) null
, UHFACI nvarchar(255) null
, UHIVNO decimal(9, 0) null
, UHYEA4 decimal(4, 0) null
, UHPYNO nvarchar(255) null
, UHINST nvarchar(255) null
, UHIVAM decimal(15, 2) null
, UHIVLA decimal(15, 2) null
, UHCUCD nvarchar(255) null
, UHRAIN decimal(11, 6) null
, UHDUDT decimal(8, 0) null
, UHVSER nvarchar(255) null
, UHVONO decimal(8, 0) null
, UHIDAT decimal(8, 0) null
, UHACDT decimal(8, 0) null
, UHIVTP nvarchar(255) null
, UHUPEC decimal(1, 0) null
, UHUPBC decimal(1, 0) null
, UHUPAC decimal(1, 0) null
, UHINRC nvarchar(255) null
, UHNVAT decimal(1, 0) null
, UHMUST decimal(1, 0) null
, UHCASH decimal(1, 0) null
, UHRAFC decimal(15, 2) null
, UHRALC decimal(15, 2) null
, UHFAC2 nvarchar(255) null
, UHORIG decimal(1, 0) null
, UHNREF nvarchar(255) null
, UH3RDP nvarchar(255) null
, UHRGDT decimal(8, 0) null
, UHRGTM decimal(6, 0) null
, UHLMDT decimal(8, 0) null
, UHCHNO decimal(3, 0) null
, UHCHID nvarchar(255) null
, UHRYEA decimal(4, 0) null
, UHRIVN decimal(9, 0) null
, UHINPX nvarchar(255) null
, UHEXIN nvarchar(255) null
, UHRINP nvarchar(255) null
, UHRXIN nvarchar(255) null
, UHLMTS decimal(18, 0) null
, UHSBTO decimal(1, 0) null
, UHNESI decimal(1, 0) null
, UHLCUR nvarchar(255) null
, UHLVAT decimal(15, 2) null
, UHARAT decimal(11, 6) null
, UHIVBA decimal(15, 2) null
, UHPDYR decimal(4, 0) null
, UHPDNO nvarchar(255) null
) ;
go
print N'Creating [psa].[ics_stg_movex_OINVOL]' ;
go
create table [psa].[ics_stg_movex_OINVOL]
(
  EtlRecordId bigint not null identity(1,1)
, EtlBatchRunId int not null
, EtlStepRunId int not null
, EtlThreadRunId int not null
, DataSourceKey int not null
, EtlSourceTable varchar(200) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, IsDeleted char(1) not null constraint DF_psa_ics_stg_movex_OINVOL_IsDeleted default ('N')
, IsIncomplete char(1) not null constraint DF_psa_ics_stg_movex_OINVOL_IsIncomplete default ('N')

, ONCONO decimal(3, 0) null
, ONDIVI nvarchar(255) null
, ONIVNO decimal(9, 0) null
, ONYEA4 decimal(4, 0) null
, ONPYNO nvarchar(255) null
, ONIVSQ decimal(3, 0) null
, ONIVTP nvarchar(255) null
, ONORNO nvarchar(255) null
, ONDLIX decimal(11, 0) null
, ONWHLO nvarchar(255) null
, ONIVRF nvarchar(255) null
, ONIVAM decimal(15, 2) null
, ONIVLA decimal(15, 2) null
, ONIVBA decimal(15, 2) null
, ONCVT1 decimal(15, 2) null
, ONCVT2 decimal(15, 2) null
, ONVTAM decimal(15, 2) null
, ONIVFR nvarchar(255) null
, ONIVAV decimal(15, 2) null
, ONBSCD nvarchar(255) null
, ONECAR nvarchar(255) null
, ONFTCO nvarchar(255) null
, ONVTCD decimal(2, 0) null
, ONVTP1 decimal(5, 2) null
, ONVTP2 decimal(5, 2) null
, ONVRIN nvarchar(255) null
, ONVRNO nvarchar(255) null
, ONRGDT decimal(8, 0) null
, ONRGTM decimal(6, 0) null
, ONLMDT decimal(8, 0) null
, ONCHNO decimal(3, 0) null
, ONCHID nvarchar(255) null
, ONINPX nvarchar(255) null
, ONEXIN nvarchar(255) null
, ONTEPY nvarchar(255) null
, ONCVDT decimal(8, 0) null
) ;
go
print N'Creating [psa].[ics_stg_movex_OOHEAD]' ;
go
create table [psa].[ics_stg_movex_OOHEAD]
(
  EtlRecordId bigint not null identity(1,1)
, EtlBatchRunId int not null
, EtlStepRunId int not null
, EtlThreadRunId int not null
, DataSourceKey int not null
, EtlSourceTable varchar(200) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, IsDeleted char(1) not null constraint DF_psa_ics_stg_movex_OOHEAD_IsDeleted default ('N')
, IsIncomplete char(1) not null constraint DF_psa_ics_stg_movex_OOHEAD_IsIncomplete default ('N')

, OACONO decimal(3, 0) null
, OADIVI nvarchar(255) null
, OAORNO nvarchar(255) null
, OAORTP nvarchar(255) null
, OAFACI nvarchar(255) null
, OAWHLO nvarchar(255) null
, OAORST nvarchar(255) null
, OAORSL nvarchar(255) null
, OACHL1 nvarchar(255) null
, OACHL2 nvarchar(255) null
, OACHL3 nvarchar(255) null
, OACHL4 nvarchar(255) null
, OACUNO nvarchar(255) null
, OAORDT decimal(8, 0) null
, OACUDT decimal(8, 0) null
, OARLDT decimal(8, 0) null
, OARLHM decimal(4, 0) null
, OARLDZ decimal(8, 0) null
, OARLHZ decimal(4, 0) null
, OATIZO nvarchar(255) null
, OADMDT decimal(8, 0) null
, OACURD decimal(8, 0) null
, OAFDDT decimal(8, 0) null
, OAOPRI decimal(1, 0) null
, OAAICD decimal(1, 0) null
, OAOBLC decimal(1, 0) null
, OAECTT decimal(1, 0) null
, OAOT38 decimal(1, 0) null
, OALNCD nvarchar(255) null
, OATEPY nvarchar(255) null
, OAPYCD nvarchar(255) null
, OATECD nvarchar(255) null
, OAMODL nvarchar(255) null
, OATEDL nvarchar(255) null
, OATEL2 nvarchar(255) null
, OATEPA nvarchar(255) null
, OAADID nvarchar(255) null
, OASMCD nvarchar(255) null
, OAOFNO nvarchar(255) null
, OAOREF nvarchar(255) null
, OAYREF nvarchar(255) null
, OACUOR nvarchar(255) null
, OAPROJ nvarchar(255) null
, OAELNO nvarchar(255) null
, OAWCON nvarchar(255) null
, OAVRCD nvarchar(255) null
, OAFRE1 nvarchar(255) null
, OAPYNO nvarchar(255) null
, OAINRC nvarchar(255) null
, OAAGNO nvarchar(255) null
, OABAGC nvarchar(255) null
, OABAGD decimal(8, 0) null
, OAPLTB nvarchar(255) null
, OADISY nvarchar(255) null
, OAEXCD nvarchar(255) null
, OATINC decimal(1, 0) null
, OALOCD nvarchar(255) null
, OACUCD nvarchar(255) null
, OADCCD decimal(1, 0) null
, OACRTP decimal(2, 0) null
, OAFECN nvarchar(255) null
, OAARAT decimal(11, 6) null
, OADMCU decimal(1, 0) null
, OABREC nvarchar(255) null
, OAAGNT nvarchar(255) null
, OAGRWE decimal(9, 3) null
, OANEWE decimal(9, 3) null
, OAVOL3 decimal(9, 3) null
, OACOAM decimal(17, 6) null
, OABRAM decimal(15, 2) null
, OABRLA decimal(15, 2) null
, OANTAM decimal(15, 2) null
, OANTLA decimal(15, 2) null
, OARPIV decimal(15, 2) null
, OAIPIV decimal(15, 2) null
, OAIAPD decimal(15, 2) null
, OAVAPD decimal(15, 2) null
, OAOTBA decimal(15, 2) null
, OAOTDP decimal(13, 9) null
, OADICD decimal(1, 0) null
, OACMPN nvarchar(255) null
, OATOPR decimal(17, 6) null
, OATBLG decimal(15, 2) null
, OANBNS decimal(5, 0) null
, OAHOCD decimal(1, 0) null
, OACHSY nvarchar(255) null
, OAECLC nvarchar(255) null
, OACPRE nvarchar(255) null
, OAHAFE nvarchar(255) null
, OATAXC nvarchar(255) null
, OAJNA nvarchar(255) null
, OAJNU decimal(6, 0) null
, OATXID decimal(13, 0) null
, OAPRTX decimal(13, 0) null
, OAPOTX decimal(13, 0) null
, OADTID decimal(13, 0) null
, OAROUT nvarchar(255) null
, OARODN decimal(3, 0) null
, OADLSP nvarchar(255) null
, OADSTX nvarchar(255) null
, OAFDED decimal(8, 0) null
, OALDED decimal(8, 0) null
, OARESP nvarchar(255) null
, OASPLM nvarchar(255) null
, OABLRO decimal(15, 2) null
, OATXAP decimal(1, 0) null
, OAVTCD decimal(2, 0) null
, OANREF nvarchar(255) null
, OA3RDP nvarchar(255) null
, OAIPAD nvarchar(255) null
, OARGDT decimal(8, 0) null
, OARGTM decimal(6, 0) null
, OALMDT decimal(8, 0) null
, OACHNO decimal(3, 0) null
, OACHID nvarchar(255) null
, OASCED decimal(1, 0) null
, OALMTS decimal(18, 0) null
, OAPCLA decimal(17, 6) null
, OACUCH nvarchar(255) null
, OACCAC nvarchar(255) null
, OADECU nvarchar(255) null
, OAVCTP decimal(1, 0) null
, OAPYRE nvarchar(255) null
, OABKID nvarchar(255) null
, OAABNO decimal(1, 0) null
, OARASN nvarchar(255) null
) ;
go
print N'Creating [psa].[ics_stg_movex_OOLINE]' ;
go
create table [psa].[ics_stg_movex_OOLINE]
(
  EtlRecordId bigint not null identity(1,1)
, EtlBatchRunId int not null
, EtlStepRunId int not null
, EtlThreadRunId int not null
, DataSourceKey int not null
, EtlSourceTable varchar(200) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, IsDeleted char(1) not null constraint DF_psa_ics_stg_movex_OOLINE_IsDeleted default ('N')
, IsIncomplete char(1) not null constraint DF_psa_ics_stg_movex_OOLINE_IsIncomplete default ('N')

, OBCONO decimal(3, 0) null
, OBDIVI nvarchar(255) null
, OBORNO nvarchar(255) null
, OBPONR decimal(5, 0) null
, OBPOSX decimal(3, 0) null
, OBLTYP nvarchar(255) null
, OBORST nvarchar(255) null
, OBFACI nvarchar(255) null
, OBWHLO nvarchar(255) null
, OBITNO nvarchar(255) null
, OBREPI nvarchar(255) null
, OBITDS nvarchar(255) null
, OBTEDS nvarchar(255) null
, OBORQT decimal(15, 6) null
, OBORQA decimal(15, 6) null
, OBRNQT decimal(15, 6) null
, OBRNQA decimal(15, 6) null
, OBALQT decimal(15, 6) null
, OBALQA decimal(15, 6) null
, OBPLQT decimal(15, 6) null
, OBPLQA decimal(15, 6) null
, OBDLQT decimal(15, 6) null
, OBDLQA decimal(15, 6) null
, OBIVQT decimal(15, 6) null
, OBIVQA decimal(15, 6) null
, OBDCCD decimal(1, 0) null
, OBALUN nvarchar(255) null
, OBDCCA decimal(1, 0) null
, OBCOFA decimal(15, 9) null
, OBDMCF decimal(1, 0) null
, OBSPUN nvarchar(255) null
, OBPCOF decimal(15, 9) null
, OBDCCS decimal(1, 0) null
, OBCOFS decimal(15, 9) null
, OBDMCS decimal(1, 0) null
, OBPOPN nvarchar(255) null
, OBALWT decimal(2, 0) null
, OBALWQ nvarchar(255) null
, OBSAPR decimal(17, 6) null
, OBNEPR decimal(17, 6) null
, OBSACD decimal(5, 0) null
, OBPRMO nvarchar(255) null
, OBDIC1 decimal(1, 0) null
, OBDIC2 decimal(1, 0) null
, OBDIC3 decimal(1, 0) null
, OBDIC4 decimal(1, 0) null
, OBDIC5 decimal(1, 0) null
, OBDIC6 decimal(1, 0) null
, OBDIP1 decimal(5, 2) null
, OBDIP2 decimal(5, 2) null
, OBDIP3 decimal(5, 2) null
, OBDIP4 decimal(5, 2) null
, OBDIP5 decimal(5, 2) null
, OBDIP6 decimal(5, 2) null
, OBDIA1 decimal(15, 2) null
, OBDIA2 decimal(15, 2) null
, OBDIA3 decimal(15, 2) null
, OBDIA4 decimal(15, 2) null
, OBDIA5 decimal(15, 2) null
, OBDIA6 decimal(15, 2) null
, OBCMP1 nvarchar(255) null
, OBCMP2 nvarchar(255) null
, OBCMP3 nvarchar(255) null
, OBCMP4 nvarchar(255) null
, OBCMP5 nvarchar(255) null
, OBCMP6 nvarchar(255) null
, OBDIBE nvarchar(255) null
, OBDIRE nvarchar(255) null
, OBDCHA decimal(1, 0) null
, OBDPST decimal(1, 0) null
, OBDDSU decimal(1, 0) null
, OBIDSC decimal(1, 0) null
, OBACRF nvarchar(255) null
, OBOTDI decimal(1, 0) null
, OBDWDT decimal(8, 0) null
, OBDWHM decimal(4, 0) null
, OBCODT decimal(8, 0) null
, OBCOHM decimal(4, 0) null
, OBDWDZ decimal(8, 0) null
, OBDWHZ decimal(4, 0) null
, OBCODZ decimal(8, 0) null
, OBCOHZ decimal(4, 0) null
, OBTIZO nvarchar(255) null
, OBDLTS decimal(4, 0) null
, OBSTCD decimal(1, 0) null
, OBPRCH decimal(1, 0) null
, OBRORC decimal(1, 0) null
, OBRORN nvarchar(255) null
, OBRORL decimal(6, 0) null
, OBUCOS decimal(17, 6) null
, OBCOCD decimal(5, 0) null
, OBUCCD decimal(1, 0) null
, OBCMNO nvarchar(255) null
, OBHDPR nvarchar(255) null
, OBCFIN decimal(10, 0) null
, OBECVS decimal(3, 0) null
, OBVTCD decimal(2, 0) null
, OBJDCD nvarchar(255) null
, OBDLSP nvarchar(255) null
, OBLNAM decimal(15, 2) null
, OBLNA2 decimal(15, 2) null
, OBDINR decimal(5, 0) null
, OBDISX decimal(3, 0) null
, OBAGNO nvarchar(255) null
, OBBAGC nvarchar(255) null
, OBBAGD decimal(8, 0) null
, OBAGLN decimal(7, 0) null
, OBPRRF nvarchar(255) null
, OBNTCD decimal(1, 0) null
, OBCNQT decimal(15, 6) null
, OBEDFP decimal(17, 6) null
, OBSMCD nvarchar(255) null
, OBBNCD decimal(1, 0) null
, OBPRAC decimal(1, 0) null
, OBVRCD nvarchar(255) null
, OBECLC nvarchar(255) null
, OBORCO nvarchar(255) null
, OBPRTX decimal(13, 0) null
, OBPOTX decimal(13, 0) null
, OBDTID decimal(13, 0) null
, OBDELS decimal(1, 0) null
, OBE0PA nvarchar(255) null
, OBDSGP nvarchar(255) null
, OBMOYE nvarchar(255) null
, OBPUSN nvarchar(255) null
, OBPUTP decimal(1, 0) null
, OBQTQL decimal(1, 0) null
, OBTEPA nvarchar(255) null
, OBPACT nvarchar(255) null
, OBCUPA nvarchar(255) null
, OBD1QT decimal(15, 6) null
, OBCUNO nvarchar(255) null
, OBCUOR nvarchar(255) null
, OBCUPO decimal(7, 0) null
, OBCUSX decimal(3, 0) null
, OBSMCC decimal(1, 0) null
, OBRSCD nvarchar(255) null
, OBMUFT decimal(2, 0) null
, OBINPR decimal(17, 6) null
, OBCUCT nvarchar(255) null
, OBABNO decimal(1, 0) null
, OBPROJ nvarchar(255) null
, OBELNO nvarchar(255) null
, OBBPAT nvarchar(255) null
, OBBPST decimal(1, 0) null
, OBNOAA decimal(1, 0) null
, OBCPRE nvarchar(255) null
, OBHAFE nvarchar(255) null
, OBCAWE decimal(15, 6) null
, OBWHSL nvarchar(255) null
, OBBANO nvarchar(255) null
, OBCAMU nvarchar(255) null
, OBADID nvarchar(255) null
, OBROUT nvarchar(255) null
, OBRODN decimal(3, 0) null
, OBDSDT decimal(8, 0) null
, OBDSHM decimal(4, 0) null
, OBDSTX nvarchar(255) null
, OBDEFC decimal(3, 0) null
, OBPLDT decimal(8, 0) null
, OBPLHM decimal(4, 0) null
, OBSRCD decimal(1, 0) null
, OBSPLC nvarchar(255) null
, OBDLBU decimal(1, 0) null
, OBSPOS decimal(3, 0) null
, OBFDED decimal(8, 0) null
, OBLDED decimal(8, 0) null
, OBAETY decimal(1, 0) null
, OBATNR decimal(17, 0) null
, OBSCMO nvarchar(255) null
, OBPRPR decimal(1, 0) null
, OBCINA decimal(1, 0) null
, OBATV1 decimal(15, 6) null
, OBATV2 decimal(15, 6) null
, OBATV3 decimal(15, 6) null
, OBATV4 decimal(15, 6) null
, OBATV5 decimal(15, 6) null
, OBATV6 nvarchar(255) null
, OBATV7 nvarchar(255) null
, OBATV8 nvarchar(255) null
, OBATV9 nvarchar(255) null
, OBATV0 nvarchar(255) null
, OBCNNR decimal(11, 0) null
, OBMNIN nvarchar(255) null
, OBREPN decimal(10, 0) null
, OBATPR nvarchar(255) null
, OBATMO nvarchar(255) null
, OBORTY nvarchar(255) null
, OBSUNO nvarchar(255) null
, OBPUPR decimal(17, 6) null
, OBPUCD decimal(5, 0) null
, OBPPUN nvarchar(255) null
, OBCUCD nvarchar(255) null
, OBODI1 decimal(5, 2) null
, OBODI2 decimal(5, 2) null
, OBODI3 decimal(5, 2) null
, OBOURR nvarchar(255) null
, OBOURT nvarchar(255) null
, OBBUYE nvarchar(255) null
, OBFWHL nvarchar(255) null
, OBPRNO nvarchar(255) null
, OBSCHN decimal(11, 0) null
, OBMODL nvarchar(255) null
, OBTEDL nvarchar(255) null
, OBTEL2 nvarchar(255) null
, OBRGDT decimal(8, 0) null
, OBRGTM decimal(6, 0) null
, OBLMDT decimal(8, 0) null
, OBCHNO decimal(3, 0) null
, OBCHID nvarchar(255) null
, OBRORX decimal(3, 0) null
, OBLMTS decimal(18, 0) null
, OBRTQA decimal(15, 6) null
, OBRTQT decimal(15, 6) null
, OBPRHL nvarchar(255) null
, OBSERN nvarchar(255) null
, OBCTNO nvarchar(255) null
, OBAPBA decimal(1, 0) null
, OBCFGL nvarchar(255) null
, OBWATP nvarchar(255) null
, OBGWTP nvarchar(255) null
, OBPRHW nvarchar(255) null
, OBSERW nvarchar(255) null
, OBPWNR decimal(5, 0) null
, OBPWSX decimal(3, 0) null
, OBEWST decimal(1, 0) null
, OBAGNB nvarchar(255) null
, OBCTNS nvarchar(255) null
, OBWATQ decimal(1, 0) null
, OBTECN nvarchar(255) null
, OBINAP nvarchar(255) null
, OBPCNR decimal(5, 0) null
, OBPCSU decimal(3, 0) null
, OBRELI decimal(5, 0) null
, OBPIDE nvarchar(255) null
, OBPCLA decimal(17, 6) null
, OBBOP1 decimal(1, 0) null
, OBSCLB decimal(15, 2) null
, OBOFNO nvarchar(255) null
, OBVERS decimal(2, 0) null
, OBOFNR decimal(5, 0) null
, OBOFSX decimal(3, 0) null
, OBDECU nvarchar(255) null
, OBTEPY nvarchar(255) null
, OBARST decimal(2, 0) null
, OBRSC1 nvarchar(255) null
, OBPMOR decimal(1, 0) null
, OBCBSM decimal(1, 0) null
, OBINIP decimal(1, 0) null
, OBUPAV decimal(1, 0) null
, OBQTBC decimal(15, 6) null
, OBMPID decimal(1, 0) null
, OBTOMU decimal(15, 6) null
, OBENNO nvarchar(255) null
, OBLNCL decimal(1, 0) null
, OBPRIO decimal(1, 0) null
, OBCCSA decimal(17, 6) null
, OBRAGN nvarchar(255) null
, OBRASN nvarchar(255) null
, OBCLAT nvarchar(255) null
) ;
go
print N'Creating [psa].[ics_stg_movex_OSBSTD]' ;
go
create table [psa].[ics_stg_movex_OSBSTD]
(
  EtlRecordId bigint not null identity(1,1)
, EtlBatchRunId int not null
, EtlStepRunId int not null
, EtlThreadRunId int not null
, DataSourceKey int not null
, EtlSourceTable varchar(200) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, IsDeleted char(1) not null constraint DF_psa_ics_stg_movex_OSBSTD_IsDeleted default ('N')
, IsIncomplete char(1) not null constraint DF_psa_ics_stg_movex_OSBSTD_IsIncomplete default ('N')

, UCCONO decimal(3, 0) null
, UCDIVI nvarchar(255) null
, UCFACI nvarchar(255) null
, UCORNO nvarchar(255) null
, UCDLIX decimal(11, 0) null
, UCPONR decimal(5, 0) null
, UCPOSX decimal(3, 0) null
, UCIVNO decimal(9, 0) null
, UCORDT decimal(8, 0) null
, UCDWDT decimal(8, 0) null
, UCCODT decimal(8, 0) null
, UCDLDT decimal(8, 0) null
, UCIVDT decimal(8, 0) null
, UCYEA4 decimal(4, 0) null
, UCACDT decimal(8, 0) null
, UCCUNO nvarchar(255) null
, UCCUCL nvarchar(255) null
, UCCUTP decimal(1, 0) null
, UCCUST nvarchar(255) null
, UCORTP nvarchar(255) null
, UCAGNT nvarchar(255) null
, UCPYNO nvarchar(255) null
, UCCHL1 nvarchar(255) null
, UCCHL2 nvarchar(255) null
, UCCHL3 nvarchar(255) null
, UCCHL4 nvarchar(255) null
, UCCUCD nvarchar(255) null
, UCRAIN decimal(11, 6) null
, UCDMCU decimal(1, 0) null
, UCSMCD nvarchar(255) null
, UCSDST nvarchar(255) null
, UCCSCD nvarchar(255) null
, UCFRE1 nvarchar(255) null
, UCFRE2 nvarchar(255) null
, UCWCON nvarchar(255) null
, UCBPAT nvarchar(255) null
, UCWHLO nvarchar(255) null
, UCITNO nvarchar(255) null
, UCITGR nvarchar(255) null
, UCITTY nvarchar(255) null
, UCITCL nvarchar(255) null
, UCSUNO nvarchar(255) null
, UCFRE3 nvarchar(255) null
, UCFRE4 nvarchar(255) null
, UCREPI nvarchar(255) null
, UCLTYP nvarchar(255) null
, UCMUFT decimal(2, 0) null
, UCSTUN nvarchar(255) null
, UCALUN nvarchar(255) null
, UCSPUN nvarchar(255) null
, UCPRMO nvarchar(255) null
, UCDISY nvarchar(255) null
, UCCMP1 nvarchar(255) null
, UCCMP2 nvarchar(255) null
, UCCMP3 nvarchar(255) null
, UCCMP4 nvarchar(255) null
, UCCMP5 nvarchar(255) null
, UCCMP6 nvarchar(255) null
, UCPRCH decimal(1, 0) null
, UCUCCD decimal(1, 0) null
, UCSMCC decimal(1, 0) null
, UCCMNO nvarchar(255) null
, UCVANO nvarchar(255) null
, UCCFIN decimal(10, 0) null
, UCORTK nvarchar(255) null
, UCADID nvarchar(255) null
, UCFECN nvarchar(255) null
, UCAGNO nvarchar(255) null
, UCDPNR nvarchar(255) null
, UCORIG decimal(1, 0) null
, UCIDCD decimal(1, 0) null
, UCJOBN decimal(3, 0) null
, UCJBSX decimal(2, 0) null
, UCSETP nvarchar(255) null
, UCINNO nvarchar(255) null
, UCIITN nvarchar(255) null
, UCINGR nvarchar(255) null
, UCSRES nvarchar(255) null
, UCTECH nvarchar(255) null
, UCESCO nvarchar(255) null
, UCERCO nvarchar(255) null
, UCERCL nvarchar(255) null
, UCMECO nvarchar(255) null
, UCMECL nvarchar(255) null
, UCCTNO nvarchar(255) null
, UCAGTP nvarchar(255) null
, UCCONS nvarchar(255) null
, UCMINO nvarchar(255) null
, UCRSCD nvarchar(255) null
, UCPROJ nvarchar(255) null
, UCELNO nvarchar(255) null
, UCIVQT decimal(15, 6) null
, UCOFQS decimal(15, 6) null
, UCIVQA decimal(15, 6) null
, UCIVQS decimal(15, 6) null
, UCORQT decimal(15, 6) null
, UCORQS decimal(15, 6) null
, UCORQA decimal(15, 6) null
, UCORQB decimal(15, 6) null
, UCGRWE decimal(9, 3) null
, UCNEWE decimal(9, 3) null
, UCVOL3 decimal(9, 3) null
, UCSAAM decimal(15, 2) null
, UCSGAM decimal(15, 2) null
, UCCUAM decimal(15, 2) null
, UCDIA1 decimal(15, 2) null
, UCDIA2 decimal(15, 2) null
, UCDIA3 decimal(15, 2) null
, UCDIA4 decimal(15, 2) null
, UCDIA5 decimal(15, 2) null
, UCDIA6 decimal(15, 2) null
, UCOFRA decimal(15, 2) null
, UCUCOS decimal(17, 6) null
, UCDCOS decimal(17, 6) null
, UCMFAM decimal(17, 6) null
, UCONK1 decimal(15, 2) null
, UCONK2 decimal(15, 2) null
, UCONK3 decimal(15, 2) null
, UCONK4 decimal(15, 2) null
, UCONK5 decimal(15, 2) null
, UCALBO decimal(15, 2) null
, UCDDF1 decimal(3, 0) null
, UCDDF2 decimal(3, 0) null
, UCDDF3 decimal(3, 0) null
, UCDDF4 decimal(3, 0) null
, UCDDF5 decimal(3, 0) null
, UCTDEL decimal(1, 0) null
, UCTORL decimal(1, 0) null
, UCFULL decimal(1, 0) null
, UCRQTY decimal(1, 0) null
, UCRTME decimal(1, 0) null
, UCLOWM decimal(1, 0) null
, UCMPRO decimal(1, 0) null
, UCBAOL decimal(1, 0) null
, UCBGOL decimal(1, 0) null
, UCCAOL decimal(1, 0) null
, UCCGOL decimal(1, 0) null
, UCINRC nvarchar(255) null
, UCIITG nvarchar(255) null
, UCFCTN nvarchar(255) null
, UCASST nvarchar(255) null
, UCHDPR nvarchar(255) null
, UCSDEP nvarchar(255) null
, UCBUAR nvarchar(255) null
, UCSTRT nvarchar(255) null
, UCSUFI nvarchar(255) null
, UCROUT nvarchar(255) null
, UCRODN decimal(3, 0) null
, UCDEMA decimal(15, 6) null
, UCATV1 nvarchar(255) null
, UCATV2 nvarchar(255) null
, UCATV3 nvarchar(255) null
, UCATV4 nvarchar(255) null
, UCATV5 nvarchar(255) null
, UCAAV1 decimal(15, 6) null
, UCAAV2 decimal(15, 6) null
, UCAAV3 decimal(15, 6) null
, UCAAV4 decimal(15, 6) null
, UCAAV5 decimal(15, 6) null
, UCATMO nvarchar(255) null
, UCMTCO nvarchar(255) null
, UCMTX1 nvarchar(255) null
, UCMTX2 nvarchar(255) null
, UCCINF nvarchar(255) null
, UCCSHC nvarchar(255) null
, UCAOTP nvarchar(255) null
, UCASCL nvarchar(255) null
, UCASCA decimal(2, 0) null
, UCRSDJ decimal(8, 0) null
, UCRFDJ decimal(8, 0) null
, UCSCOD decimal(1, 0) null
, UCPRRF nvarchar(255) null
, UCINTY decimal(1, 0) null
, UCCUOW nvarchar(255) null
, UCBRAN nvarchar(255) null
, UCCFE1 nvarchar(255) null
, UCCFE2 decimal(15, 2) null
, UCCFE3 nvarchar(255) null
, UCCFE4 nvarchar(255) null
, UCCFE5 nvarchar(255) null
, UCCFE6 nvarchar(255) null
, UCCFE7 decimal(15, 2) null
, UCCFE8 nvarchar(255) null
, UCCFE9 nvarchar(255) null
, UCDLNI decimal(1, 0) null
, UCRGDT decimal(8, 0) null
, UCRGTM decimal(6, 0) null
, UCLMDT decimal(8, 0) null
, UCCHNO decimal(3, 0) null
, UCCHID nvarchar(255) null
, UCPRHL nvarchar(255) null
, UCSERN nvarchar(255) null
, UCAPBA decimal(1, 0) null
, UCCFGL nvarchar(255) null
, UCWATP nvarchar(255) null
, UCGWTP nvarchar(255) null
, UCPRHW nvarchar(255) null
, UCSERW nvarchar(255) null
, UCINPX nvarchar(255) null
, UCEXIN nvarchar(255) null
, UCDMA2 decimal(15, 6) null
, UCCAWE decimal(15, 6) null
, UCTECN nvarchar(255) null
, UCINAP nvarchar(255) null
, UCLMTS decimal(18, 0) null
, UCSMC0 nvarchar(255) null
, UCSMC1 nvarchar(255) null
, UCSMC2 nvarchar(255) null
, UCSMC3 nvarchar(255) null
, UCSMC4 nvarchar(255) null
, UCSMC5 nvarchar(255) null
, UCSMC6 nvarchar(255) null
, UCSMC7 nvarchar(255) null
, UCSMC8 nvarchar(255) null
, UCSMC9 nvarchar(255) null
, UCPIDE nvarchar(255) null
, UCPCLA decimal(17, 6) null
, UCACOS decimal(17, 6) null
, UCBOP1 decimal(1, 0) null
, UCTEPY nvarchar(255) null
, UCRSC1 nvarchar(255) null
, UCDECU nvarchar(255) null
, UCDPCL decimal(17, 6) null
, UCENNO nvarchar(255) null
, UCLNCL decimal(1, 0) null
, UCAPRM nvarchar(255) null
, UCRQWH nvarchar(255) null
, UCRAGN nvarchar(255) null
, UCCLAT nvarchar(255) null
) ;
go
