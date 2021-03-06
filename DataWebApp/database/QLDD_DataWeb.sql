USE [master]
GO
/****** Object:  Database [QLDD_DataWeb]    Script Date: 28/06/2020 11:22:30 SA ******/
CREATE DATABASE [QLDD_DataWeb]
GO
ALTER DATABASE [QLDD_DataWeb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLDD_DataWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLDD_DataWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLDD_DataWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLDD_DataWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLDD_DataWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLDD_DataWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLDD_DataWeb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLDD_DataWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLDD_DataWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLDD_DataWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLDD_DataWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLDD_DataWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLDD_DataWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLDD_DataWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLDD_DataWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLDD_DataWeb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLDD_DataWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLDD_DataWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLDD_DataWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLDD_DataWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLDD_DataWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLDD_DataWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLDD_DataWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLDD_DataWeb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLDD_DataWeb] SET  MULTI_USER 
GO
ALTER DATABASE [QLDD_DataWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLDD_DataWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLDD_DataWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLDD_DataWeb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLDD_DataWeb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QLDD_DataWeb]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 28/06/2020 11:22:30 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[id_Admin] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[phone] [varchar](10) NULL,
	[email] [varchar](100) NULL,
	[user_Name] [varchar](50) NULL,
	[password] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Admin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 28/06/2020 11:22:30 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Attendance](
	[id_User] [int] NOT NULL,
	[status_] [bit] NOT NULL,
	[id_AtteSchedule] [varchar](20) NOT NULL,
	[time_] [time](7) NOT NULL,
	[image_Place] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_User] ASC,
	[id_AtteSchedule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AtteSchedule]    Script Date: 28/06/2020 11:22:30 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AtteSchedule](
	[id_AtteSchedule] [varchar](20) NOT NULL,
	[id_AttleGroup] [varchar](20) NULL,
	[id_Place] [varchar](20) NULL,
	[start_Time] [datetime] NULL,
	[end_Time] [datetime] NULL,
	[id_User] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_AtteSchedule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AttleGroup]    Script Date: 28/06/2020 11:22:30 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AttleGroup](
	[id_AttleGroup] [varchar](20) NOT NULL,
	[id_ScheType] [varchar](20) NULL,
	[id_User] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_AttleGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Group_]    Script Date: 28/06/2020 11:22:30 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Group_](
	[id_Group] [int] IDENTITY(1,1) NOT NULL,
	[name_Group] [nvarchar](50) NULL,
	[level_Group] [int] NULL,
	[parent_Group] [int] NULL,
	[created_Date] [datetime] NULL DEFAULT (getdate()),
	[created_By] [varchar](50) NULL,
	[updated_Date] [datetime] NULL DEFAULT (getdate()),
	[updated_By] [varchar](50) NULL,
	[active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Image_]    Script Date: 28/06/2020 11:22:30 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Image_](
	[id_Image] [int] IDENTITY(1,1) NOT NULL,
	[image_Path] [varchar](100) NULL,
	[status] [bit] NULL,
	[created_Date] [datetime] NULL CONSTRAINT [DF__Image___created___1ED998B2]  DEFAULT (getdate()),
	[created_By] [varchar](50) NULL,
	[updated_Date] [datetime] NULL CONSTRAINT [DF__Image___updated___1FCDBCEB]  DEFAULT (getdate()),
	[updated_By] [varchar](50) NULL,
	[id_User] [int] NULL,
	[id_Question] [int] NULL,
	[note] [nvarchar](max) NULL,
 CONSTRAINT [PK__Image___C723C0005430B4A6] PRIMARY KEY CLUSTERED 
(
	[id_Image] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Member]    Script Date: 28/06/2020 11:22:30 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Member](
	[id_AttleGroup] [varchar](20) NOT NULL,
	[id_User] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_AttleGroup] ASC,
	[id_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Place]    Script Date: 28/06/2020 11:22:30 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Place](
	[id_Place] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Place] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Question]    Script Date: 28/06/2020 11:22:30 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Question](
	[id_Question] [int] IDENTITY(1,1) NOT NULL,
	[content] [ntext] NULL,
	[status] [bit] NULL,
	[obligatory] [bit] NULL,
	[image_Des] [varchar](100) NULL,
	[created_Date] [datetime] NULL DEFAULT (getdate()),
	[created_By] [varchar](50) NULL,
	[updated_Date] [datetime] NULL DEFAULT (getdate()),
	[updated_By] [varchar](50) NULL,
	[active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Question] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ScheType]    Script Date: 28/06/2020 11:22:30 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ScheType](
	[id_ScheGroup] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ScheGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrainModel]    Script Date: 28/06/2020 11:22:30 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrainModel](
	[id_Model] [varchar](20) NOT NULL,
	[id_AttleGroup] [varchar](20) NULL,
	[date_] [date] NULL,
	[status_] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Model] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User_]    Script Date: 28/06/2020 11:22:30 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User_](
	[id_User] [int] IDENTITY(1,1) NOT NULL,
	[id_Group] [int] NULL,
	[student_Code] [varchar](20) NULL,
	[name] [nvarchar](100) NULL,
	[gener] [bit] NULL,
	[cmt] [varchar](20) NULL,
	[birthday] [date] NULL,
	[address] [nvarchar](200) NULL,
	[phone] [varchar](20) NULL,
	[email] [varchar](100) NULL,
	[status] [bit] NULL,
	[created_Date] [datetime] NULL CONSTRAINT [DF__User___created_D__1A14E395]  DEFAULT (getdate()),
	[created_By] [nvarchar](100) NULL,
	[updated_Date] [datetime] NULL CONSTRAINT [DF__User___updated_D__1B0907CE]  DEFAULT (getdate()),
	[updated_By] [nvarchar](100) NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK__User___556495568C0E4642] PRIMARY KEY CLUSTERED 
(
	[id_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([id_Admin], [name], [phone], [email], [user_Name], [password]) VALUES (1, N'Trần Đức Soạn', N'0423252443', N'dsv@gmail.com', N'admin1', N'827ccb0eea8a706c4c34a16891f84e7b')
INSERT [dbo].[Admin] ([id_Admin], [name], [phone], [email], [user_Name], [password]) VALUES (2, N'Ngô Thế Hải', N'0742532436', N'nth@gmail.com', N'admin2', N'827ccb0eea8a706c4c34a16891f84e7b')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Group_] ON 

INSERT [dbo].[Group_] ([id_Group], [name_Group], [level_Group], [parent_Group], [created_Date], [created_By], [updated_Date], [updated_By], [active]) VALUES (1, N'Đại học Điện Lực', 1, NULL, CAST(N'2020-05-14 16:54:51.923' AS DateTime), NULL, CAST(N'2020-05-14 16:54:51.923' AS DateTime), NULL, 1)
INSERT [dbo].[Group_] ([id_Group], [name_Group], [level_Group], [parent_Group], [created_Date], [created_By], [updated_Date], [updated_By], [active]) VALUES (2, N'Công nghệ thông tin', 2, 1, CAST(N'2020-05-14 16:55:09.310' AS DateTime), NULL, CAST(N'2020-05-14 16:55:09.310' AS DateTime), NULL, 1)
INSERT [dbo].[Group_] ([id_Group], [name_Group], [level_Group], [parent_Group], [created_Date], [created_By], [updated_Date], [updated_By], [active]) VALUES (3, N'Công nghệ phần mềm 1', 3, 2, CAST(N'2020-05-14 16:55:27.723' AS DateTime), NULL, CAST(N'2020-05-14 16:55:27.723' AS DateTime), NULL, 0)
INSERT [dbo].[Group_] ([id_Group], [name_Group], [level_Group], [parent_Group], [created_Date], [created_By], [updated_Date], [updated_By], [active]) VALUES (4, N'Công nghệ phần mềm 2', 3, 2, CAST(N'2020-05-14 16:55:45.977' AS DateTime), NULL, CAST(N'2020-05-14 16:55:45.977' AS DateTime), NULL, 1)
INSERT [dbo].[Group_] ([id_Group], [name_Group], [level_Group], [parent_Group], [created_Date], [created_By], [updated_Date], [updated_By], [active]) VALUES (5, N'Thương mại điện tử', 3, 2, CAST(N'2020-05-14 16:56:32.280' AS DateTime), NULL, CAST(N'2020-05-14 16:56:32.280' AS DateTime), NULL, 1)
INSERT [dbo].[Group_] ([id_Group], [name_Group], [level_Group], [parent_Group], [created_Date], [created_By], [updated_Date], [updated_By], [active]) VALUES (6, N'Quản trị an ninh mạng', 3, 2, CAST(N'2020-05-14 16:56:46.363' AS DateTime), NULL, CAST(N'2020-05-14 16:56:46.363' AS DateTime), NULL, 1)
INSERT [dbo].[Group_] ([id_Group], [name_Group], [level_Group], [parent_Group], [created_Date], [created_By], [updated_Date], [updated_By], [active]) VALUES (7, N'Khoa kĩ thuật điện', 2, 1, CAST(N'2020-05-22 17:43:18.660' AS DateTime), NULL, CAST(N'2020-05-22 17:43:18.660' AS DateTime), NULL, 1)
INSERT [dbo].[Group_] ([id_Group], [name_Group], [level_Group], [parent_Group], [created_Date], [created_By], [updated_Date], [updated_By], [active]) VALUES (8, N'Kĩ thuật điện 1', 3, 7, CAST(N'2020-05-22 17:44:11.400' AS DateTime), NULL, CAST(N'2020-05-22 17:44:11.400' AS DateTime), NULL, 1)
INSERT [dbo].[Group_] ([id_Group], [name_Group], [level_Group], [parent_Group], [created_Date], [created_By], [updated_Date], [updated_By], [active]) VALUES (9, N'Kỹ thuật điện 2', 3, 7, CAST(N'2020-05-23 16:58:36.727' AS DateTime), NULL, CAST(N'2020-05-23 16:58:36.727' AS DateTime), NULL, 1)
INSERT [dbo].[Group_] ([id_Group], [name_Group], [level_Group], [parent_Group], [created_Date], [created_By], [updated_Date], [updated_By], [active]) VALUES (11, N'Kế toán', 2, 1, CAST(N'2020-05-23 12:22:41.863' AS DateTime), N'', CAST(N'2020-05-23 12:22:41.863' AS DateTime), N'', 1)
INSERT [dbo].[Group_] ([id_Group], [name_Group], [level_Group], [parent_Group], [created_Date], [created_By], [updated_Date], [updated_By], [active]) VALUES (12, N'Kế toán 1', 3, 11, CAST(N'2020-05-23 12:23:04.077' AS DateTime), N'', CAST(N'2020-05-23 12:23:04.077' AS DateTime), N'', 1)
SET IDENTITY_INSERT [dbo].[Group_] OFF
SET IDENTITY_INSERT [dbo].[Image_] ON 

INSERT [dbo].[Image_] ([id_Image], [image_Path], [status], [created_Date], [created_By], [updated_Date], [updated_By], [id_User], [id_Question], [note]) VALUES (3, N'DataWeb_UserImage_202052901053.jpg', 1, CAST(N'2020-05-28 23:45:22.117' AS DateTime), N'', CAST(N'2020-05-29 01:46:58.133' AS DateTime), N'', 3, 1, N'')
INSERT [dbo].[Image_] ([id_Image], [image_Path], [status], [created_Date], [created_By], [updated_Date], [updated_By], [id_User], [id_Question], [note]) VALUES (4, N'DataWeb_UserImage_20205291489.jpg', 1, CAST(N'2020-05-28 23:45:59.073' AS DateTime), N'', CAST(N'2020-05-29 01:48:49.923' AS DateTime), N'', 3, 2, N'')
INSERT [dbo].[Image_] ([id_Image], [image_Path], [status], [created_Date], [created_By], [updated_Date], [updated_By], [id_User], [id_Question], [note]) VALUES (5, N'DataWeb_UserImage_2020528234652.jpg', 0, CAST(N'2020-05-28 23:46:52.957' AS DateTime), N'', CAST(N'2020-05-28 23:46:52.957' AS DateTime), N'', 3, 3, NULL)
INSERT [dbo].[Image_] ([id_Image], [image_Path], [status], [created_Date], [created_By], [updated_Date], [updated_By], [id_User], [id_Question], [note]) VALUES (6, N'DataWeb_UserImage_202052823476.jpg', 0, CAST(N'2020-05-28 23:47:06.830' AS DateTime), N'', CAST(N'2020-05-28 23:47:06.830' AS DateTime), N'', 3, 5, NULL)
SET IDENTITY_INSERT [dbo].[Image_] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([id_Question], [content], [status], [obligatory], [image_Des], [created_Date], [created_By], [updated_Date], [updated_By], [active]) VALUES (1, N'Chụp ảnh chính diện', 1, 1, N'DataWeb_QuestionImage_202052321526.jpg', CAST(N'2020-05-23 21:52:06.267' AS DateTime), NULL, CAST(N'2020-05-23 21:52:06.267' AS DateTime), NULL, 1)
INSERT [dbo].[Question] ([id_Question], [content], [status], [obligatory], [image_Des], [created_Date], [created_By], [updated_Date], [updated_By], [active]) VALUES (2, N'Chụp ảnh bên trái', 1, 1, N'DataWeb_QuestionImage_202052322844.jpg', CAST(N'2020-05-23 22:08:44.430' AS DateTime), N'', CAST(N'2020-05-23 22:08:44.430' AS DateTime), N'', 1)
INSERT [dbo].[Question] ([id_Question], [content], [status], [obligatory], [image_Des], [created_Date], [created_By], [updated_Date], [updated_By], [active]) VALUES (3, N'Chụp ảnh bên phải', 1, 1, N'DataWeb_QuestionImage_202052322112.jpg', CAST(N'2020-05-23 22:11:02.250' AS DateTime), N'', CAST(N'2020-05-23 22:11:02.250' AS DateTime), N'', 1)
INSERT [dbo].[Question] ([id_Question], [content], [status], [obligatory], [image_Des], [created_Date], [created_By], [updated_Date], [updated_By], [active]) VALUES (5, N'Chụp cả người', 0, 0, N'DataWeb_QuestionImage_2020523222556.jpg', CAST(N'2020-05-23 22:25:56.763' AS DateTime), N'', CAST(N'2020-05-23 22:25:56.763' AS DateTime), N'', 1)
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[User_] ON 

INSERT [dbo].[User_] ([id_User], [id_Group], [student_Code], [name], [gener], [cmt], [birthday], [address], [phone], [email], [status], [created_Date], [created_By], [updated_Date], [updated_By], [active]) VALUES (2, 3, N'3435', N'Trần Đức Soạn', 1, N'45364356', CAST(N'1999-10-11' AS Date), N'Nam Định', N'5252213', N'dsv@gmail.com', 1, CAST(N'2020-05-24 11:12:00.480' AS DateTime), NULL, CAST(N'2020-05-24 11:12:00.480' AS DateTime), NULL, 1)
INSERT [dbo].[User_] ([id_User], [id_Group], [student_Code], [name], [gener], [cmt], [birthday], [address], [phone], [email], [status], [created_Date], [created_By], [updated_Date], [updated_By], [active]) VALUES (3, 4, N'12345', N'Tran Duc Soan', 1, N'4535', CAST(N'1999-10-11' AS Date), N'Nam Định', N'43252', N'ducsoan@gmail.com', 1, CAST(N'2020-05-24 11:31:39.740' AS DateTime), N'', CAST(N'2020-05-24 17:09:08.050' AS DateTime), N'', 1)
INSERT [dbo].[User_] ([id_User], [id_Group], [student_Code], [name], [gener], [cmt], [birthday], [address], [phone], [email], [status], [created_Date], [created_By], [updated_Date], [updated_By], [active]) VALUES (4, 4, N'124', N'Nguyen Ngoc Quy', 1, N'52453', CAST(N'1999-02-12' AS Date), N'Hà Nội', N'43252523', N'ngocquy@gmail.com', 0, CAST(N'2020-05-24 11:31:39.770' AS DateTime), N'', CAST(N'2020-05-24 18:06:22.717' AS DateTime), N'', 1)
INSERT [dbo].[User_] ([id_User], [id_Group], [student_Code], [name], [gener], [cmt], [birthday], [address], [phone], [email], [status], [created_Date], [created_By], [updated_Date], [updated_By], [active]) VALUES (5, 4, N'125', N'Ngo The Hai', 0, N'52352', CAST(N'1999-04-03' AS Date), N'Hà Nội', N'42424', N'thehai@gmail.com', 0, CAST(N'2020-05-24 11:31:39.790' AS DateTime), N'', CAST(N'2020-05-24 18:06:22.743' AS DateTime), N'', 1)
INSERT [dbo].[User_] ([id_User], [id_Group], [student_Code], [name], [gener], [cmt], [birthday], [address], [phone], [email], [status], [created_Date], [created_By], [updated_Date], [updated_By], [active]) VALUES (7, 4, N'123', N'Tran Duc Soan', 1, N'4535', CAST(N'1999-10-11' AS Date), N'Nam Định', N'43252', N'ducsoan@gmail.com', 0, CAST(N'2020-05-24 17:14:36.770' AS DateTime), N'', CAST(N'2020-05-24 18:06:22.600' AS DateTime), N'', 1)
SET IDENTITY_INSERT [dbo].[User_] OFF
ALTER TABLE [dbo].[Attendance] ADD  DEFAULT ((0)) FOR [status_]
GO
ALTER TABLE [dbo].[AtteSchedule] ADD  DEFAULT (getdate()) FOR [start_Time]
GO
ALTER TABLE [dbo].[TrainModel] ADD  DEFAULT (getdate()) FOR [date_]
GO
ALTER TABLE [dbo].[TrainModel] ADD  DEFAULT ((0)) FOR [status_]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD FOREIGN KEY([id_AtteSchedule])
REFERENCES [dbo].[AtteSchedule] ([id_AtteSchedule])
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK__Attendanc__id_Us__33D4B598] FOREIGN KEY([id_User])
REFERENCES [dbo].[User_] ([id_User])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK__Attendanc__id_Us__33D4B598]
GO
ALTER TABLE [dbo].[AtteSchedule]  WITH CHECK ADD FOREIGN KEY([id_AttleGroup])
REFERENCES [dbo].[AttleGroup] ([id_AttleGroup])
GO
ALTER TABLE [dbo].[AtteSchedule]  WITH CHECK ADD FOREIGN KEY([id_Place])
REFERENCES [dbo].[Place] ([id_Place])
GO
ALTER TABLE [dbo].[AtteSchedule]  WITH CHECK ADD  CONSTRAINT [FK__AtteSched__id_Us__2E1BDC42] FOREIGN KEY([id_User])
REFERENCES [dbo].[User_] ([id_User])
GO
ALTER TABLE [dbo].[AtteSchedule] CHECK CONSTRAINT [FK__AtteSched__id_Us__2E1BDC42]
GO
ALTER TABLE [dbo].[AttleGroup]  WITH CHECK ADD FOREIGN KEY([id_ScheType])
REFERENCES [dbo].[ScheType] ([id_ScheGroup])
GO
ALTER TABLE [dbo].[AttleGroup]  WITH CHECK ADD  CONSTRAINT [FK__AttleGrou__id_Us__29572725] FOREIGN KEY([id_User])
REFERENCES [dbo].[User_] ([id_User])
GO
ALTER TABLE [dbo].[AttleGroup] CHECK CONSTRAINT [FK__AttleGrou__id_Us__29572725]
GO
ALTER TABLE [dbo].[Image_]  WITH CHECK ADD  CONSTRAINT [FK__Image___id_Quest__20C1E124] FOREIGN KEY([id_Question])
REFERENCES [dbo].[Question] ([id_Question])
GO
ALTER TABLE [dbo].[Image_] CHECK CONSTRAINT [FK__Image___id_Quest__20C1E124]
GO
ALTER TABLE [dbo].[Image_]  WITH CHECK ADD  CONSTRAINT [FK__Image___id_User__21B6055D] FOREIGN KEY([id_User])
REFERENCES [dbo].[User_] ([id_User])
GO
ALTER TABLE [dbo].[Image_] CHECK CONSTRAINT [FK__Image___id_User__21B6055D]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD FOREIGN KEY([id_AttleGroup])
REFERENCES [dbo].[AttleGroup] ([id_AttleGroup])
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK__Member__id_User__36B12243] FOREIGN KEY([id_User])
REFERENCES [dbo].[User_] ([id_User])
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK__Member__id_User__36B12243]
GO
ALTER TABLE [dbo].[TrainModel]  WITH CHECK ADD FOREIGN KEY([id_AttleGroup])
REFERENCES [dbo].[AttleGroup] ([id_AttleGroup])
GO
ALTER TABLE [dbo].[User_]  WITH CHECK ADD  CONSTRAINT [FK__User___id_Group__1BFD2C07] FOREIGN KEY([id_Group])
REFERENCES [dbo].[Group_] ([id_Group])
GO
ALTER TABLE [dbo].[User_] CHECK CONSTRAINT [FK__User___id_Group__1BFD2C07]
GO
USE [master]
GO
ALTER DATABASE [QLDD_DataWeb] SET  READ_WRITE 
GO
