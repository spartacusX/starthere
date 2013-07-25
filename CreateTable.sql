USE [StartHere]
GO

/****** Object:  Table [dbo].[shSites]    Script Date: 07/25/2013 19:33:52 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[shSites]') AND type in (N'U'))
DROP TABLE [dbo].[shSites]
GO

USE [StartHere]
GO

/****** Object:  Table [dbo].[shSites]    Script Date: 07/25/2013 19:33:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[shSites](
	[lSiteId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NOT NULL,
	[bSystem] [int] NOT NULL,
	[Language] [nchar](50) NULL,
	[Organization] [nvarchar](50) NULL,
	[Icon] [varbinary](max) NULL,
 CONSTRAINT [PK_shSites] PRIMARY KEY CLUSTERED 
(
	[lSiteId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The unique identifier of the site' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSites', @level2type=N'COLUMN',@level2name=N'lSiteId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The site name that is displayed on front-end' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSites', @level2type=N'COLUMN',@level2name=N'Name'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of the site' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSites', @level2type=N'COLUMN',@level2name=N'Type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The real site address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSites', @level2type=N'COLUMN',@level2name=N'Address'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 means oob site; 0 means customized site' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSites', @level2type=N'COLUMN',@level2name=N'bSystem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Language type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSites', @level2type=N'COLUMN',@level2name=N'Language'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Belong to which corporation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSites', @level2type=N'COLUMN',@level2name=N'Organization'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The icon for current site' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'shSites', @level2type=N'COLUMN',@level2name=N'Icon'
GO


