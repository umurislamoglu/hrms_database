CREATE DATABASE [HRMS]
USE [HRMS]
GO

/****** Object:  Table [dbo].[users]    Script Date: 23.05.2021 18:52:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[usertype] [nvarchar](50) NOT NULL,
	[isactive] [bit] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_users] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [HRMS]
GO

/****** Object:  Table [dbo].[jobpositions]    Script Date: 23.05.2021 18:53:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[jobpositions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[position] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_jobpositions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [HRMS]
GO

/****** Object:  Table [dbo].[activationcodes]    Script Date: 23.05.2021 18:53:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[activationcodes](
	[id] [int] NOT NULL,
	[userid] [int] NOT NULL,
	[activationcode] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_activationcodes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[activationcodes]  WITH CHECK ADD  CONSTRAINT [FK_activationcodes_users] FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([id])
GO

ALTER TABLE [dbo].[activationcodes] CHECK CONSTRAINT [FK_activationcodes_users]
GO

USE [HRMS]
GO

/****** Object:  Table [dbo].[employers]    Script Date: 23.05.2021 18:54:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[employers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[website] [nvarchar](50) NOT NULL,
	[companyname] [nvarchar](50) NOT NULL,
	[phonenumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_employers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[employers]  WITH CHECK ADD  CONSTRAINT [FK_employers_users1] FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([id])
GO

ALTER TABLE [dbo].[employers] CHECK CONSTRAINT [FK_employers_users1]
GO

USE [HRMS]
GO

/****** Object:  Table [dbo].[jobseekers]    Script Date: 23.05.2021 18:54:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[jobseekers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[firstname] [nvarchar](50) NOT NULL,
	[lastname] [nvarchar](50) NOT NULL,
	[nationalid] [nvarchar](50) NOT NULL,
	[birthday] [date] NOT NULL,
 CONSTRAINT [PK_jobseekers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[jobseekers]  WITH CHECK ADD  CONSTRAINT [FK_jobseekers_users] FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([id])
GO

ALTER TABLE [dbo].[jobseekers] CHECK CONSTRAINT [FK_jobseekers_users]
GO

USE [HRMS]
GO

/****** Object:  Table [dbo].[systememployees]    Script Date: 23.05.2021 18:54:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[systememployees](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[firstname] [nvarchar](50) NULL,
	[lastname] [nvarchar](50) NULL,
	[positionid] [int] NULL,
 CONSTRAINT [PK_systememployees] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[systememployees]  WITH CHECK ADD  CONSTRAINT [FK_systememployees_jobpositions] FOREIGN KEY([positionid])
REFERENCES [dbo].[jobpositions] ([id])
GO

ALTER TABLE [dbo].[systememployees] CHECK CONSTRAINT [FK_systememployees_jobpositions]
GO

ALTER TABLE [dbo].[systememployees]  WITH CHECK ADD  CONSTRAINT [FK_systememployees_users] FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([id])
GO

ALTER TABLE [dbo].[systememployees] CHECK CONSTRAINT [FK_systememployees_users]
GO

