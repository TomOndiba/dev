CREATE TABLE [batch].[RunStateFlag]
(
[FlagBit] [int] NOT NULL,
[FlagName] [varchar] (50) NOT NULL
)
GO
ALTER TABLE [batch].[RunStateFlag] ADD CONSTRAINT [CK_RunStateFlag_FlagRange] CHECK (([FlagBit]=(4096) OR [FlagBit]=(2048) OR [FlagBit]=(1024) OR [FlagBit]=(512) OR [FlagBit]=(256) OR [FlagBit]=(128) OR [FlagBit]=(64) OR [FlagBit]=(32) OR [FlagBit]=(16) OR [FlagBit]=(8) OR [FlagBit]=(4) OR [FlagBit]=(2) OR [FlagBit]=(1) OR [FlagBit]=(0)))
GO
ALTER TABLE [batch].[RunStateFlag] ADD CONSTRAINT [PK_RunStateFlag] PRIMARY KEY CLUSTERED  ([FlagBit])
GO
ALTER TABLE [batch].[RunStateFlag] ADD CONSTRAINT [AK_RunStateFlag_Name] UNIQUE NONCLUSTERED  ([FlagName])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Bit-wise run state indicator used when evaluating run time precendence for SSIS Steps/Packages e.g. 1 = Started; 2 = In Progress; 4 = Succeeded, etc.', 'SCHEMA', N'batch', 'TABLE', N'RunStateFlag', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database-specific unique flag for a specific run state flag/bit', 'SCHEMA', N'batch', 'TABLE', N'RunStateFlag', 'COLUMN', N'FlagBit'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Unique, user-freindly name for a specific run state flag/bit', 'SCHEMA', N'batch', 'TABLE', N'RunStateFlag', 'COLUMN', N'FlagName'
GO
