USE [website]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 09/12/2022 3:26:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](45) NULL,
	[password] [varchar](45) NULL,
	[role] [varchar](45) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth]    Script Date: 09/12/2022 3:26:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth](
	[id] [int] NULL,
	[first_name] [varchar](45) NULL,
	[last_name] [varchar](45) NULL,
	[username] [varchar](45) NULL,
	[email] [varchar](45) NULL,
	[password] [varchar](45) NULL,
	[phone] [varchar](45) NULL,
	[role] [varchar](45) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 09/12/2022 3:26:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[prod_name] [varchar](45) NOT NULL,
	[category] [varchar](45) NOT NULL,
	[description] [varchar](300) NOT NULL,
	[image] [varchar](100) NOT NULL,
	[stock] [int] NOT NULL,
	[cost] [int] NOT NULL,
	[order_id] [int] NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
