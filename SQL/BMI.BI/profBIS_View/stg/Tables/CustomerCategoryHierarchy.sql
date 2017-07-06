CREATE TABLE [stg].[CustomerCategoryHierarchy] (
    [LeafId]        INT            NOT NULL,
    [ChildId]       INT            NOT NULL,
    [ParentId]      INT            NOT NULL,
    [RootId]        INT            NOT NULL,
    [hNodeFromLeaf] INT            NOT NULL,
    [hNodeFromRoot] BIGINT         NOT NULL,
    [LeafName]      NVARCHAR (100) NULL,
    [ChildName]     NVARCHAR (100) NULL,
    [ParentName]    NVARCHAR (100) NULL,
    [RootName]      NVARCHAR (100) NULL,
	[EtlCreatedOn]  datetime not null,
    CONSTRAINT [PK_stg_CustomerCategoryHierarchy] PRIMARY KEY CLUSTERED ([LeafId] ASC, [ChildId] ASC, [ParentId] ASC)
);
GO
GRANT ALTER
    ON OBJECT::[stg].[CustomerCategoryHierarchy] TO [EtlReaders]
    AS [dbo];

