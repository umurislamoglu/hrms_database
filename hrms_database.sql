--Create Databse HRMS
USE [HRMS]
GO

/****** Object:  Table [dbo].[activationcodes]    Script Date: 2.06.2021 19:58:26 ******/
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

/****** Object:  Table [dbo].[users]    Script Date: 2.06.2021 19:58:46 ******/
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

/****** Object:  Table [dbo].[systememployees]    Script Date: 2.06.2021 19:59:13 ******/
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

USE [HRMS]
GO

/****** Object:  Table [dbo].[employers]    Script Date: 2.06.2021 19:59:44 ******/
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

/****** Object:  Table [dbo].[jobseekers]    Script Date: 2.06.2021 19:59:58 ******/
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

/****** Object:  Table [dbo].[jobpositions]    Script Date: 2.06.2021 20:00:11 ******/
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

/****** Object:  Table [dbo].[jobadvertisements]    Script Date: 2.06.2021 20:00:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[jobadvertisements](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[employerid] [int] NOT NULL,
	[positionid] [int] NOT NULL,
	[positiondefinition] [nvarchar](max) NOT NULL,
	[city] [nvarchar](50) NOT NULL,
	[salarymin] [int] NULL,
	[salarymax] [int] NULL,
	[vacancy] [int] NOT NULL,
	[deadline] [date] NULL,
	[isactive] [bit] NOT NULL,
	[creationdate] [date] NULL,
 CONSTRAINT [PK_jobadvertisements] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[jobadvertisements]  WITH CHECK ADD  CONSTRAINT [FK_jobadvertisements_employers] FOREIGN KEY([employerid])
REFERENCES [dbo].[employers] ([id])
GO

ALTER TABLE [dbo].[jobadvertisements] CHECK CONSTRAINT [FK_jobadvertisements_employers]
GO

ALTER TABLE [dbo].[jobadvertisements]  WITH CHECK ADD  CONSTRAINT [FK_jobadvertisements_jobpositions] FOREIGN KEY([positionid])
REFERENCES [dbo].[jobpositions] ([id])
GO

ALTER TABLE [dbo].[jobadvertisements] CHECK CONSTRAINT [FK_jobadvertisements_jobpositions]
GO

USE [HRMS]
GO

/****** Object:  Table [dbo].[images]    Script Date: 2.06.2021 20:00:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[imageurl] [nvarchar](max) NOT NULL,
	[uploaddate] [date] NOT NULL,
	[jobseekerid] [int] NOT NULL,
	[imagename] [nvarchar](max) NOT NULL,
	[Cloudinaryid] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_images] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[images]  WITH CHECK ADD  CONSTRAINT [FK_images_jobseekers] FOREIGN KEY([jobseekerid])
REFERENCES [dbo].[jobseekers] ([id])
GO

ALTER TABLE [dbo].[images] CHECK CONSTRAINT [FK_images_jobseekers]
GO

USE [HRMS]
GO

/****** Object:  Table [dbo].[resumes]    Script Date: 2.06.2021 20:01:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[resumes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[jobseekerid] [int] NULL,
	[schoolid] [int] NULL,
	[jobexperienceid] [int] NULL,
	[languagesid] [int] NULL,
	[githubadress] [nvarchar](max) NULL,
	[linkedinadress] [nvarchar](max) NULL,
	[coverletter] [nvarchar](max) NULL,
	[skillid] [int] NULL,
	[creationdate] [date] NOT NULL,
 CONSTRAINT [PK_resumes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[resumes]  WITH CHECK ADD  CONSTRAINT [FK_resumes_jobexperiences] FOREIGN KEY([jobexperienceid])
REFERENCES [dbo].[jobexperiences] ([id])
GO

ALTER TABLE [dbo].[resumes] CHECK CONSTRAINT [FK_resumes_jobexperiences]
GO

ALTER TABLE [dbo].[resumes]  WITH CHECK ADD  CONSTRAINT [FK_resumes_jobseekers] FOREIGN KEY([jobseekerid])
REFERENCES [dbo].[jobseekers] ([id])
GO

ALTER TABLE [dbo].[resumes] CHECK CONSTRAINT [FK_resumes_jobseekers]
GO

ALTER TABLE [dbo].[resumes]  WITH CHECK ADD  CONSTRAINT [FK_resumes_languages] FOREIGN KEY([languagesid])
REFERENCES [dbo].[languages] ([id])
GO

ALTER TABLE [dbo].[resumes] CHECK CONSTRAINT [FK_resumes_languages]
GO

ALTER TABLE [dbo].[resumes]  WITH CHECK ADD  CONSTRAINT [FK_resumes_schools] FOREIGN KEY([schoolid])
REFERENCES [dbo].[schools] ([id])
GO

ALTER TABLE [dbo].[resumes] CHECK CONSTRAINT [FK_resumes_schools]
GO

ALTER TABLE [dbo].[resumes]  WITH CHECK ADD  CONSTRAINT [FK_resumes_skills] FOREIGN KEY([skillid])
REFERENCES [dbo].[skills] ([id])
GO

ALTER TABLE [dbo].[resumes] CHECK CONSTRAINT [FK_resumes_skills]
GO

USE [HRMS]
GO

/****** Object:  Table [dbo].[skills]    Script Date: 2.06.2021 20:01:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[skills](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[skillname] [nvarchar](max) NOT NULL,
	[creationdate] [date] NOT NULL,
 CONSTRAINT [PK_skills] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

USE [HRMS]
GO

/****** Object:  Table [dbo].[languages]    Script Date: 2.06.2021 20:01:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[languages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[languagename] [nvarchar](50) NOT NULL,
	[languagelevel] [int] NOT NULL,
	[creationdate] [date] NOT NULL,
 CONSTRAINT [PK_languages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [HRMS]
GO

/****** Object:  Table [dbo].[jobexperiences]    Script Date: 2.06.2021 20:01:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[jobexperiences](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[resumeid] [int] NOT NULL,
	[workplacename] [nvarchar](max) NOT NULL,
	[workposition] [nvarchar](max) NOT NULL,
	[startdate] [date] NOT NULL,
	[enddate] [date] NULL,
	[creationdate] [date] NOT NULL,
	[activestatus] [bit] NOT NULL,
 CONSTRAINT [PK_jobexperiences] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

USE [HRMS]
GO

/****** Object:  Table [dbo].[schools]    Script Date: 2.06.2021 20:02:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[schools](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[resumeid] [int] NOT NULL,
	[schoolname] [nvarchar](max) NOT NULL,
	[department] [nvarchar](max) NOT NULL,
	[startdate] [date] NOT NULL,
	[enddate] [date] NULL,
	[creationdate] [date] NOT NULL,
	[activestatus] [bit] NOT NULL,
 CONSTRAINT [PK_schools] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO




