USE [master]
GO
/****** Object:  Database [HBR]    Script Date: 1/16/2022 7:39:43 PM ******/
CREATE DATABASE [HBR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HBR', FILENAME = N'D:\SQLServer_2019\MSSQL15.MSSQLSERVER\MSSQL\DATA\HBR.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HBR_log', FILENAME = N'D:\SQLServer_2019\MSSQL15.MSSQLSERVER\MSSQL\DATA\HBR_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HBR] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HBR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HBR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HBR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HBR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HBR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HBR] SET ARITHABORT OFF 
GO
ALTER DATABASE [HBR] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HBR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HBR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HBR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HBR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HBR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HBR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HBR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HBR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HBR] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HBR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HBR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HBR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HBR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HBR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HBR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HBR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HBR] SET RECOVERY FULL 
GO
ALTER DATABASE [HBR] SET  MULTI_USER 
GO
ALTER DATABASE [HBR] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HBR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HBR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HBR] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HBR] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HBR] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HBR', N'ON'
GO
ALTER DATABASE [HBR] SET QUERY_STORE = OFF
GO
USE [HBR]
GO
/****** Object:  Table [dbo].[CATEGORY]    Script Date: 1/16/2022 7:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORY](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](50) NOT NULL,
	[ENABLED] [bit] NOT NULL,
	[CREATED] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hbr_table]    Script Date: 1/16/2022 7:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hbr_table](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](50) NULL,
	[CATEGORY] [nvarchar](50) NULL,
	[PRODUCT] [nvarchar](50) NULL,
 CONSTRAINT [PK_hbr_table] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERSON]    Script Date: 1/16/2022 7:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSON](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FIRSTNAME] [varchar](50) NOT NULL,
	[LASTNAME] [varchar](50) NOT NULL,
	[EMAIL] [varchar](100) NOT NULL,
	[ENABLED] [bit] NOT NULL,
	[CREATE] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_PERSON] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 1/16/2022 7:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](50) NOT NULL,
	[DESCRIPTION] [varchar](150) NOT NULL,
	[URL_IMG] [varchar](200) NOT NULL,
	[ID_CATEGORY] [int] NOT NULL,
	[ENABLED] [bit] NOT NULL,
	[CREATED] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_PRODUCT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USER]    Script Date: 1/16/2022 7:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_PERSON] [int] NOT NULL,
	[USERNAME] [varchar](30) NOT NULL,
	[PASSWORD] [varchar](255) NOT NULL,
	[ENABLED] [bit] NOT NULL,
	[CREATE] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CATEGORY] ON 
GO
INSERT [dbo].[CATEGORY] ([ID], [NAME], [ENABLED], [CREATED]) VALUES (23, N'Laptops', 1, CAST(N'2021-10-14T12:35:01.9000000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[CATEGORY] ([ID], [NAME], [ENABLED], [CREATED]) VALUES (24, N'Libros', 1, CAST(N'2021-10-14T12:59:21.1700000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[CATEGORY] ([ID], [NAME], [ENABLED], [CREATED]) VALUES (25, N'Gaming', 1, CAST(N'2022-01-04T11:06:38.0633333+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[CATEGORY] ([ID], [NAME], [ENABLED], [CREATED]) VALUES (26, N'test1', 0, CAST(N'2022-01-04T11:10:23.5866667+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[CATEGORY] ([ID], [NAME], [ENABLED], [CREATED]) VALUES (27, N'Home', 1, CAST(N'2022-01-05T17:30:51.7133333+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[CATEGORY] ([ID], [NAME], [ENABLED], [CREATED]) VALUES (28, N'zapatos nuevos', 0, CAST(N'2022-01-06T16:56:16.8200000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[CATEGORY] ([ID], [NAME], [ENABLED], [CREATED]) VALUES (29, N'test2', 0, CAST(N'2022-01-06T17:25:03.8866667+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[CATEGORY] ([ID], [NAME], [ENABLED], [CREATED]) VALUES (30, N'Category prueba 1', 0, CAST(N'2022-01-09T20:38:53.5133333+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[CATEGORY] ([ID], [NAME], [ENABLED], [CREATED]) VALUES (31, N'test1', 0, CAST(N'2022-01-10T19:16:04.4533333+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[CATEGORY] ([ID], [NAME], [ENABLED], [CREATED]) VALUES (32, N'test12', 0, CAST(N'2022-01-11T13:04:05.7666667+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[CATEGORY] ([ID], [NAME], [ENABLED], [CREATED]) VALUES (33, N'prueba2', 0, CAST(N'2022-01-11T13:32:01.0300000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[CATEGORY] ([ID], [NAME], [ENABLED], [CREATED]) VALUES (34, N'shampoo cabello graso', 0, CAST(N'2022-01-11T16:05:18.3166667+00:00' AS DateTimeOffset))
GO
SET IDENTITY_INSERT [dbo].[CATEGORY] OFF
GO
SET IDENTITY_INSERT [dbo].[hbr_table] ON 
GO
INSERT [dbo].[hbr_table] ([ID], [NAME], [CATEGORY], [PRODUCT]) VALUES (1, N'MacBook Air M1', N'Laptop', N'Technology')
GO
INSERT [dbo].[hbr_table] ([ID], [NAME], [CATEGORY], [PRODUCT]) VALUES (2, N'MacBook Pro M1', N'Laptop', N'Technology')
GO
INSERT [dbo].[hbr_table] ([ID], [NAME], [CATEGORY], [PRODUCT]) VALUES (3, N'Padre', N'Accion y aventura', N'Libros')
GO
INSERT [dbo].[hbr_table] ([ID], [NAME], [CATEGORY], [PRODUCT]) VALUES (5, N'Lenovo', N'Laptop', N'Technology')
GO
SET IDENTITY_INSERT [dbo].[hbr_table] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCT] ON 
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [URL_IMG], [ID_CATEGORY], [ENABLED], [CREATED]) VALUES (5, N'Macboock Pro M1 1', N'Una laptop potente para desarrollar.', N'https://i.ytimg.com/vi/d0PLLpqf4eg/maxresdefault.jpg', 25, 1, CAST(N'2021-10-14T12:36:27.9633333+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [URL_IMG], [ID_CATEGORY], [ENABLED], [CREATED]) VALUES (6, N'Clean Code', N'Libro para aprender buenas practicas de desarrollo.', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMP9iH2lrBCEOrNFU5WXE9Hjxqb91kuLJO2g&usqp=CAU', 24, 1, CAST(N'2021-10-14T13:00:01.5766667+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [URL_IMG], [ID_CATEGORY], [ENABLED], [CREATED]) VALUES (7, N'Lenovo', N'Es una Tinkpad Carbono', N'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.amazon.com%2F-%2Fes%2FThinkpad-X1-Carbon-i7-2-0-GHz-reacondicionado-certificado%2Fdp%2FB07CNCD16X&psig=AOvVaw151uXxQ8SGSgykmwdDTN0K&ust=1640932007', 23, 0, CAST(N'2021-12-29T15:34:42.7366667+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [URL_IMG], [ID_CATEGORY], [ENABLED], [CREATED]) VALUES (8, N'test', N'test', N'test', 23, 0, CAST(N'2021-12-30T12:33:27.3366667+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [URL_IMG], [ID_CATEGORY], [ENABLED], [CREATED]) VALUES (2008, N'test3', N'test3', N'test3', 24, 0, CAST(N'2022-01-04T10:21:11.7933333+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [URL_IMG], [ID_CATEGORY], [ENABLED], [CREATED]) VALUES (2009, N'Lenovo', N'es una buena laptop para trabajar.', N'https://www.notebookcheck.org/uploads/tx_nbc2/ThinkPad_X1_Carbon_G9_Black_05.jpg', 24, 1, CAST(N'2022-01-05T17:26:15.3866667+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [URL_IMG], [ID_CATEGORY], [ENABLED], [CREATED]) VALUES (2010, N'test0', N'test0', N'test0', 24, 0, CAST(N'2022-01-05T18:00:09.7133333+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [URL_IMG], [ID_CATEGORY], [ENABLED], [CREATED]) VALUES (2011, N'test11', N'test11', N'test11', 24, 0, CAST(N'2022-01-05T18:03:14.1300000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [URL_IMG], [ID_CATEGORY], [ENABLED], [CREATED]) VALUES (2012, N't', N't', N't', 24, 0, CAST(N'2022-01-05T18:05:50.0200000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [URL_IMG], [ID_CATEGORY], [ENABLED], [CREATED]) VALUES (2013, N'e', N'e', N'e', 24, 0, CAST(N'2022-01-05T18:06:19.7800000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [URL_IMG], [ID_CATEGORY], [ENABLED], [CREATED]) VALUES (2014, N'a', N'a', N'a', 24, 0, CAST(N'2022-01-05T18:07:00.9600000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [URL_IMG], [ID_CATEGORY], [ENABLED], [CREATED]) VALUES (2015, N'Prueba', N'Prueba con category', N'aa', 23, 1, CAST(N'2022-01-05T20:18:49.3666667+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [URL_IMG], [ID_CATEGORY], [ENABLED], [CREATED]) VALUES (2016, N'Desde Ajax', N'Ajax', N'img', 24, 1, CAST(N'2022-01-05T20:29:07.2533333+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [URL_IMG], [ID_CATEGORY], [ENABLED], [CREATED]) VALUES (2017, N'Desde Ajax', N'Ajax', N'img', 24, 1, CAST(N'2022-01-05T20:33:08.2566667+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [URL_IMG], [ID_CATEGORY], [ENABLED], [CREATED]) VALUES (2018, N'aas', N'ssss', N'sas', 24, 1, CAST(N'2022-01-05T20:39:57.4533333+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [URL_IMG], [ID_CATEGORY], [ENABLED], [CREATED]) VALUES (2019, N'aas', N'ssss', N'sas', 24, 1, CAST(N'2022-01-05T20:43:41.5233333+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [URL_IMG], [ID_CATEGORY], [ENABLED], [CREATED]) VALUES (2020, N'papa', N'aa', N'ssss', 23, 1, CAST(N'2022-01-05T20:45:15.5533333+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [URL_IMG], [ID_CATEGORY], [ENABLED], [CREATED]) VALUES (2021, N'test1', N'test1', N'https://cdn.pocket-lint.com/r/s/1200x/assets/images/143319-laptops-review-review-lenovo-thinkpad-x1-carbon-hdr-review-image1-dawkcj1vss.jpg', 23, 1, CAST(N'2022-01-06T16:25:48.7966667+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [URL_IMG], [ID_CATEGORY], [ENABLED], [CREATED]) VALUES (2022, N'prueba', N'prueba', N'111', 23, 0, CAST(N'2022-01-09T20:32:39.9166667+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [URL_IMG], [ID_CATEGORY], [ENABLED], [CREATED]) VALUES (2023, N'test1111', N'test2222', N'11111111113333', 23, 0, CAST(N'2022-01-09T20:40:11.8900000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [URL_IMG], [ID_CATEGORY], [ENABLED], [CREATED]) VALUES (2024, N'happy path1', N'happy path1', N'https://i.ytimg.com/vi/G0Kb05ik-gw/maxresdefault.jpg', 25, 0, CAST(N'2022-01-10T19:12:18.5700000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [URL_IMG], [ID_CATEGORY], [ENABLED], [CREATED]) VALUES (2025, N'prueba1', N'terminada1', N'https://thumbs.dreamstime.com/z/lista-de-control-terminada-65741204.jpg', 26, 1, CAST(N'2022-01-11T13:02:52.0200000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [URL_IMG], [ID_CATEGORY], [ENABLED], [CREATED]) VALUES (2026, N'final1', N'final1', N'https://thumbs.dreamstime.com/z/lista-de-control-terminada-65741204.jpg', 26, 0, CAST(N'2022-01-11T13:16:53.7300000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [URL_IMG], [ID_CATEGORY], [ENABLED], [CREATED]) VALUES (2027, N'prueba2', N'prueba2', N'https://thumbs.dreamstime.com/z/lista-de-control-terminada-65741204.jpg', 25, 0, CAST(N'2022-01-11T13:31:20.9066667+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [DESCRIPTION], [URL_IMG], [ID_CATEGORY], [ENABLED], [CREATED]) VALUES (3022, N'test', N'test', N'test', 23, 1, CAST(N'2022-01-14T09:09:06.6066667+00:00' AS DateTimeOffset))
GO
SET IDENTITY_INSERT [dbo].[PRODUCT] OFF
GO
ALTER TABLE [dbo].[CATEGORY] ADD  CONSTRAINT [DF_CATEGORY_ENABLED]  DEFAULT ((1)) FOR [ENABLED]
GO
ALTER TABLE [dbo].[PERSON] ADD  CONSTRAINT [DF_PERSON_ENABLED]  DEFAULT ((1)) FOR [ENABLED]
GO
ALTER TABLE [dbo].[PRODUCT] ADD  CONSTRAINT [DF_PRODUCT_ENABLED]  DEFAULT ((1)) FOR [ENABLED]
GO
ALTER TABLE [dbo].[USER] ADD  CONSTRAINT [DF_USER_ENABLED]  DEFAULT ((1)) FOR [ENABLED]
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCT_CATEGORY] FOREIGN KEY([ID_CATEGORY])
REFERENCES [dbo].[CATEGORY] ([ID])
GO
ALTER TABLE [dbo].[PRODUCT] CHECK CONSTRAINT [FK_PRODUCT_CATEGORY]
GO
ALTER TABLE [dbo].[USER]  WITH CHECK ADD  CONSTRAINT [FK_USER_PERSON] FOREIGN KEY([ID_PERSON])
REFERENCES [dbo].[PERSON] ([ID])
GO
ALTER TABLE [dbo].[USER] CHECK CONSTRAINT [FK_USER_PERSON]
GO
/****** Object:  StoredProcedure [dbo].[sp_category_create]    Script Date: 1/16/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_category_create]
	@NAME VARCHAR(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	--insert data
	INSERT INTO [dbo].[CATEGORY]
           ([NAME]
           ,[ENABLED]
           ,[CREATED])
     VALUES
           (@NAME
           ,1
           ,GETDATE());


	--get the last element insert
	/*SELECT TOP 1 *
	FROM [dbo].[CATEGORY]*/
	--WHERE ID = @@IDENTITY;

   
END
GO
/****** Object:  StoredProcedure [dbo].[sp_category_delete]    Script Date: 1/16/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_category_delete]
	@ID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE [HBR].[dbo].[CATEGORY] SET
	ENABLED = 0
	WHERE ID = @ID;

	SELECT 1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_category_edit]    Script Date: 1/16/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_category_edit]
	@ID INT,
	@NAME VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE [HBR].[dbo].[CATEGORY] SET
	[NAME] = @NAME
	WHERE ID = @ID;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_category_get_id]    Script Date: 1/16/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_category_get_id]
@ID INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT *
	FROM [HBR].[dbo].[CATEGORY] 
	WHERE [ENABLED] = 1
	AND [ID] = @ID;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_category_get_list]    Script Date: 1/16/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_category_get_list]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT  [ID]
      ,[NAME]
      ,[ENABLED]
      ,[CREATED]
	FROM [HBR].[dbo].[CATEGORY]
	WHERE [ENABLED] = 1;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_category_search]    Script Date: 1/16/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_category_search]
	@KEYWORD VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  SELECT TOP (5) [ID]
      ,[NAME]
      ,[ENABLED]
      ,[CREATED]
  FROM [HBR].[dbo].[CATEGORY]
	WHERE [ENABLED] = 1
	AND [NAME] LIKE '%' + UPPER(@KEYWORD) + '%';

END
GO
/****** Object:  StoredProcedure [dbo].[sp_product_create]    Script Date: 1/16/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_product_create]
	@NAME VARCHAR(50),
	@DESCRIPTION VARCHAR(150),
	@ID_CATEGORY INT,
	@URL_IMG VARCHAR(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [dbo].[PRODUCT]
           ([NAME]
           ,[DESCRIPTION]
           ,[URL_IMG]
           ,[ID_CATEGORY]
           ,[ENABLED]
           ,[CREATED])
     VALUES
           (@NAME
           ,@DESCRIPTION
           ,@URL_IMG
           ,@ID_CATEGORY
           ,1
           ,GETDATE());


	SELECT 1



END
GO
/****** Object:  StoredProcedure [dbo].[sp_product_edit]    Script Date: 1/16/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_product_edit]
	@ID INT,
	@NAME VARCHAR(50),
	@DESCRIPTION VARCHAR(150),
	@ID_CATEGORY INT,
	@URL_IMG VARCHAR(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[PRODUCT]
    SET [NAME] = @NAME
      ,[DESCRIPTION] = @DESCRIPTION
      ,[URL_IMG] = @URL_IMG
      ,[ID_CATEGORY] = @ID_CATEGORY
	 WHERE ID = @ID;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_product_get_id]    Script Date: 1/16/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_product_get_id]
@ID INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT prt.[ID]
      ,prt.[NAME]
      ,prt.[DESCRIPTION]
      ,prt.[URL_IMG]
      ,prt.[ID_CATEGORY]
      ,prt.[ENABLED]
      ,prt.[CREATED]
	  ,cgy.[NAME] as [NAME_CATEGORY]
  FROM [HBR].[dbo].[PRODUCT] prt
  INNER JOIN [HBR].[dbo].[CATEGORY] cgy ON cgy.ID = prt.ID_CATEGORY
	WHERE prt.[ENABLED] = 1
	AND prt.[ID] = @ID;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_product_get_list]    Script Date: 1/16/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_product_get_list]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT prt.[ID]
      ,prt.[NAME]
      ,prt.[DESCRIPTION]
      ,prt.[URL_IMG]
      ,prt.[ID_CATEGORY]
      ,prt.[ENABLED]
      ,prt.[CREATED]
	  ,cgy.[NAME] as [NAME_CATEGORY]
  FROM [HBR].[dbo].[PRODUCT] prt
  INNER JOIN [HBR].[dbo].[CATEGORY] cgy ON cgy.ID = prt.ID_CATEGORY
	WHERE prt.[ENABLED] = 1;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_product_search]    Script Date: 1/16/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_product_search]
	@KEYWORD VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT TOP 5 [ID]
      ,UPPER([NAME]) AS [NAME]
      ,[DESCRIPTION]
      ,[URL_IMG]
      ,[ID_CATEGORY]
      ,[ENABLED]
      ,[CREATED]
  FROM [HBR].[dbo].[PRODUCT]
	WHERE [ENABLED] = 1
	AND [NAME] LIKE '%' + UPPER(@KEYWORD) + '%';

END
GO
/****** Object:  StoredProcedure [dbo].[sp_products_delete]    Script Date: 1/16/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_products_delete]
	@ID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE [HBR].[dbo].[PRODUCT] SET
	[ENABLED] = 0
	WHERE ID = @ID;

	SELECT 1
END
GO
USE [master]
GO
ALTER DATABASE [HBR] SET  READ_WRITE 
GO
