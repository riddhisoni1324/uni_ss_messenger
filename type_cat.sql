/****** Object:  Table [dbo].[CategoryMaster]    Script Date: 09/08/2015 00:57:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CategoryMaster]') AND type in (N'U'))
DROP TABLE [dbo].[CategoryMaster]
GO
/****** Object:  Table [dbo].[MemberMaster]    Script Date: 09/08/2015 00:57:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MemberMaster]') AND type in (N'U'))
DROP TABLE [dbo].[MemberMaster]
GO
/****** Object:  Table [dbo].[MemberType]    Script Date: 09/08/2015 00:57:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MemberType]') AND type in (N'U'))
DROP TABLE [dbo].[MemberType]
GO
/****** Object:  Table [dbo].[TypeMaster]    Script Date: 09/08/2015 00:57:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TypeMaster]') AND type in (N'U'))
DROP TABLE [dbo].[TypeMaster]
GO
/****** Object:  Default [DF_CategoryMaster_IsDeleted]    Script Date: 09/08/2015 00:57:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_CategoryMaster_IsDeleted]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryMaster]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CategoryMaster_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CategoryMaster] DROP CONSTRAINT [DF_CategoryMaster_IsDeleted]
END


End
GO
/****** Object:  Default [DF_CategoryMaster_UpdatedOn]    Script Date: 09/08/2015 00:57:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_CategoryMaster_UpdatedOn]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryMaster]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CategoryMaster_UpdatedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CategoryMaster] DROP CONSTRAINT [DF_CategoryMaster_UpdatedOn]
END


End
GO
/****** Object:  Default [DF_TypeMaster_IsDeleted]    Script Date: 09/08/2015 00:57:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TypeMaster_IsDeleted]') AND parent_object_id = OBJECT_ID(N'[dbo].[TypeMaster]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TypeMaster_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TypeMaster] DROP CONSTRAINT [DF_TypeMaster_IsDeleted]
END


End
GO
/****** Object:  Default [DF_TypeMaster_UpdatedOn]    Script Date: 09/08/2015 00:57:25 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TypeMaster_UpdatedOn]') AND parent_object_id = OBJECT_ID(N'[dbo].[TypeMaster]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TypeMaster_UpdatedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TypeMaster] DROP CONSTRAINT [DF_TypeMaster_UpdatedOn]
END


End
GO
/****** Object:  Table [dbo].[TypeMaster]    Script Date: 09/08/2015 00:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TypeMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TypeMaster](
	[TypeID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[TypeDesc] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsDeleted] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedBy] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedOn] [datetime] NULL
)
END
GO
SET IDENTITY_INSERT [dbo].[TypeMaster] ON
INSERT [dbo].[TypeMaster] ([TypeID], [TypeDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(1 AS Numeric(18, 0)), N'Senate Members', N'0', N'admin', CAST(0x0000A50C01773A6C AS DateTime))
INSERT [dbo].[TypeMaster] ([TypeID], [TypeDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(2 AS Numeric(18, 0)), N'Syndicate Members', N'0', N'admin', CAST(0x0000A50C0177B9CD AS DateTime))
INSERT [dbo].[TypeMaster] ([TypeID], [TypeDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(3 AS Numeric(18, 0)), N'trial', N'0', N'admin', CAST(0x0000A50D000A8535 AS DateTime))
SET IDENTITY_INSERT [dbo].[TypeMaster] OFF
/****** Object:  Table [dbo].[MemberType]    Script Date: 09/08/2015 00:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MemberType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MemberType](
	[MemberID] [numeric](18, 0) NULL,
	[TypeID] [numeric](18, 0) NULL,
	[CategoryID] [numeric](18, 0) NULL,
	[Isdeleted] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedBy] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedOn] [datetime] NULL
)
END
GO
/****** Object:  Table [dbo].[MemberMaster]    Script Date: 09/08/2015 00:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MemberMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MemberMaster](
	[MemberID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Code] [numeric](18, 0) NULL,
	[MemberName] [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MemberDesc] [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address1] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address2] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PinCode] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contact1] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contact2] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contact3] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailID] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LoginID] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LoginPass] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsDeleted] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedBy] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedOn] [datetime] NULL
)
END
GO
/****** Object:  Table [dbo].[CategoryMaster]    Script Date: 09/08/2015 00:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CategoryMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CategoryMaster](
	[CategoryID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[TypeID] [numeric](18, 0) NULL,
	[CategoryDesc] [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsDeleted] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedBy] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedOn] [datetime] NULL
)
END
GO
SET IDENTITY_INSERT [dbo].[CategoryMaster] ON
INSERT [dbo].[CategoryMaster] ([CategoryID], [TypeID], [CategoryDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'Members of the Senate', N'0', N'admin', CAST(0x0000A50D0008C400 AS DateTime))
INSERT [dbo].[CategoryMaster] ([CategoryID], [TypeID], [CategoryDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'Government Officers', N'0', N'admin', CAST(0x0000A50D0008FF9A AS DateTime))
INSERT [dbo].[CategoryMaster] ([CategoryID], [TypeID], [CategoryDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'Deans of Faculty', N'0', N'admin', CAST(0x0000A50D0009125D AS DateTime))
INSERT [dbo].[CategoryMaster] ([CategoryID], [TypeID], [CategoryDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(10 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), N'head', N'0', N'admin', CAST(0x0000A50D000A984C AS DateTime))
INSERT [dbo].[CategoryMaster] ([CategoryID], [TypeID], [CategoryDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'Principals/Heads of Institutions', N'0', N'admin', CAST(0x0000A50D000965E8 AS DateTime))
INSERT [dbo].[CategoryMaster] ([CategoryID], [TypeID], [CategoryDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N' Vice-Chancellor''s Nominee', N'0', N'admin', CAST(0x0000A50D00097CBF AS DateTime))
INSERT [dbo].[CategoryMaster] ([CategoryID], [TypeID], [CategoryDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N' Head of the Departments', N'0', N'admin', CAST(0x0000A50D000989A6 AS DateTime))
INSERT [dbo].[CategoryMaster] ([CategoryID], [TypeID], [CategoryDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N' Members of the Syndicate', N'0', N'admin', CAST(0x0000A50D00099A0B AS DateTime))
INSERT [dbo].[CategoryMaster] ([CategoryID], [TypeID], [CategoryDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N' Government Officers', N'0', N'admin', CAST(0x0000A50D0009C1F4 AS DateTime))
INSERT [dbo].[CategoryMaster] ([CategoryID], [TypeID], [CategoryDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(11 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), N'head', N'0', N'admin', CAST(0x0000A50D000AA22F AS DateTime))
SET IDENTITY_INSERT [dbo].[CategoryMaster] OFF
/****** Object:  Default [DF_CategoryMaster_IsDeleted]    Script Date: 09/08/2015 00:57:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_CategoryMaster_IsDeleted]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryMaster]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CategoryMaster_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CategoryMaster] ADD  CONSTRAINT [DF_CategoryMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END


End
GO
/****** Object:  Default [DF_CategoryMaster_UpdatedOn]    Script Date: 09/08/2015 00:57:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_CategoryMaster_UpdatedOn]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryMaster]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CategoryMaster_UpdatedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CategoryMaster] ADD  CONSTRAINT [DF_CategoryMaster_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
END


End
GO
/****** Object:  Default [DF_TypeMaster_IsDeleted]    Script Date: 09/08/2015 00:57:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TypeMaster_IsDeleted]') AND parent_object_id = OBJECT_ID(N'[dbo].[TypeMaster]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TypeMaster_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TypeMaster] ADD  CONSTRAINT [DF_TypeMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END


End
GO
/****** Object:  Default [DF_TypeMaster_UpdatedOn]    Script Date: 09/08/2015 00:57:25 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TypeMaster_UpdatedOn]') AND parent_object_id = OBJECT_ID(N'[dbo].[TypeMaster]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TypeMaster_UpdatedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TypeMaster] ADD  CONSTRAINT [DF_TypeMaster_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
END


End
GO
