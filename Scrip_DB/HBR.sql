USE [master]
GO
/****** Object:  Database [HBR]    Script Date: 1/17/2022 2:09:50 AM ******/
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
/****** Object:  Table [dbo].[CATEGORY]    Script Date: 1/17/2022 2:09:51 AM ******/
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
/****** Object:  Table [dbo].[hbr_table]    Script Date: 1/17/2022 2:09:51 AM ******/
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
/****** Object:  Table [dbo].[PERSON]    Script Date: 1/17/2022 2:09:51 AM ******/
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
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 1/17/2022 2:09:51 AM ******/
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
/****** Object:  Table [dbo].[USER]    Script Date: 1/17/2022 2:09:51 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_category_create]    Script Date: 1/17/2022 2:09:51 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_category_delete]    Script Date: 1/17/2022 2:09:51 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_category_edit]    Script Date: 1/17/2022 2:09:51 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_category_get_id]    Script Date: 1/17/2022 2:09:51 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_category_get_list]    Script Date: 1/17/2022 2:09:51 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_category_search]    Script Date: 1/17/2022 2:09:51 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_product_create]    Script Date: 1/17/2022 2:09:51 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_product_edit]    Script Date: 1/17/2022 2:09:51 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_product_get_id]    Script Date: 1/17/2022 2:09:51 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_product_get_list]    Script Date: 1/17/2022 2:09:51 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_product_search]    Script Date: 1/17/2022 2:09:51 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_products_delete]    Script Date: 1/17/2022 2:09:51 AM ******/
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
