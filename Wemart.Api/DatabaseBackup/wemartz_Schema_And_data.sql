USE [master]
GO
/****** Object:  Database [wemartzDB]    Script Date: 7/4/2023 11:49:55 PM ******/
CREATE DATABASE [wemartzDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'wemartzDB_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\wemartzDB.mdf' , SIZE = 8192KB , MAXSIZE = 30720KB , FILEGROWTH = 22528KB )
 LOG ON 
( NAME = N'wemartzDB_Logs', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\wemartzDB.ldf' , SIZE = 8192KB , MAXSIZE = 30720KB , FILEGROWTH = 22528KB )
GO
ALTER DATABASE [wemartzDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [wemartzDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [wemartzDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [wemartzDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [wemartzDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [wemartzDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [wemartzDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [wemartzDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [wemartzDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [wemartzDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [wemartzDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [wemartzDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [wemartzDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [wemartzDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [wemartzDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [wemartzDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [wemartzDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [wemartzDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [wemartzDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [wemartzDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [wemartzDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [wemartzDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [wemartzDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [wemartzDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [wemartzDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [wemartzDB] SET  MULTI_USER 
GO
ALTER DATABASE [wemartzDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [wemartzDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [wemartzDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [wemartzDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [wemartzDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [wemartzDB] SET QUERY_STORE = OFF
GO
USE [wemartzDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [wemartzDB]
GO
/****** Object:  User [hmhamzakhan_SQLLogin_1]    Script Date: 7/4/2023 11:49:56 PM ******/
CREATE USER [hmhamzakhan_SQLLogin_1] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [hmhamzakhan_SQLLogin_1]
GO
/****** Object:  Schema [hmhamzakhan_SQLLogin_1]    Script Date: 7/4/2023 11:49:57 PM ******/
CREATE SCHEMA [hmhamzakhan_SQLLogin_1]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 7/4/2023 11:49:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[ID] [bigint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Number] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Token] [nvarchar](max) NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[ApprovedBy] [int] NOT NULL,
	[CreatedOn] [nvarchar](50) NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [nvarchar](50) NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AcountRoles]    Script Date: 7/4/2023 11:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcountRoles](
	[RoleId] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_AcountRoles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 7/4/2023 11:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Token] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Admins] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/4/2023 11:49:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[CategoryImg] [nvarchar](50) NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[AddedBy] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProducts]    Script Date: 7/4/2023 11:49:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProducts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_OrderProducts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderRoutes]    Script Date: 7/4/2023 11:49:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderRoutes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Latitude] [decimal](10, 8) NOT NULL,
	[Longitude] [decimal](11, 8) NOT NULL,
 CONSTRAINT [PK_OrderRoutes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/4/2023 11:49:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] NOT NULL,
	[ShopID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[CreatedTime] [time](7) NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[StatusID] [smallint] NOT NULL,
	[RiderID] [int] NULL,
	[Location] [nvarchar](200) NULL,
	[Latitude] [decimal](10, 8) NULL,
	[Longitude] [decimal](11, 8) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductReviews]    Script Date: 7/4/2023 11:49:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductReviews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ReviewOn] [datetime] NOT NULL,
	[Rating] [int] NOT NULL,
	[Comments] [nvarchar](255) NULL,
 CONSTRAINT [PK_ProductReviews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/4/2023 11:49:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ShopCatID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Img] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Unit] [nvarchar](20) NOT NULL,
	[IsApproved] [nvarchar](50) NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[CreatedTime] [time](7) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Riders]    Script Date: 7/4/2023 11:49:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Riders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Number] [nvarchar](50) NOT NULL,
	[Token] [nvarchar](max) NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[Img] [nvarchar](50) NULL,
	[CreatedDate] [date] NOT NULL,
	[CreatedTime] [time](7) NOT NULL,
 CONSTRAINT [PK_Riders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/4/2023 11:49:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopCategories]    Script Date: 7/4/2023 11:49:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopCategories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ShopID] [int] NOT NULL,
	[CatID] [int] NOT NULL,
 CONSTRAINT [PK_ShopCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shops]    Script Date: 7/4/2023 11:49:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shops](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Number] [nvarchar](14) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Token] [nvarchar](max) NOT NULL,
	[Img] [nvarchar](200) NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[CreatedTime] [time](7) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[Location] [nvarchar](200) NULL,
	[Latitude] [decimal](10, 8) NULL,
	[Longitude] [decimal](11, 8) NULL,
 CONSTRAINT [PK_Shops] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Number] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Token] [nvarchar](max) NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[CreatedTime] [time](7) NOT NULL,
	[Img] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admins] ON 

INSERT [dbo].[Admins] ([ID], [Number], [Password], [Name], [Email], [Token]) VALUES (1, N'03423519691', N'j10S8Rgc1wBMaftzsZ7DHjFYm0Y04bWP5GG0wXi1fgI=', N'Hamza', N'hamza.khan8910@gmail.com', N'QWRtaW4sVmVuZG9yLFJpZGVyLFVzZXI6MDM0MjM1MTk2OTFqMTBTOFJnYzF3Qk1hZnR6c1o3REhqRlltMFkwNGJXUDVHRzB3WGkxZmdJPQ==')
INSERT [dbo].[Admins] ([ID], [Number], [Password], [Name], [Email], [Token]) VALUES (2, N'03102685620', N'JD0JoXzifS1Y+JgnBtwpspcG55IXIIW5T9atWrYDsGU=', N'Nabeel', N'nabeel@wemart.com', N'QWRtaW4sVmVuZG9yLFJpZGVyLFVzZXI6MDMxMDI2ODU2MjBKRDBKb1h6aWZTMVkrSmduQnR3cHNwY0c1NUlYSUlXNVQ5YXRXcllEc0dVPQ==')
INSERT [dbo].[Admins] ([ID], [Number], [Password], [Name], [Email], [Token]) VALUES (3, N'03342764726', N'JD0JoXzifS1Y+JgnBtwpspcG55IXIIW5T9atWrYDsGU=', N'Taha', N'taha@wemart.com', N'QWRtaW4sVmVuZG9yLFJpZGVyLFVzZXI6MDMzNDI3NjQ3MjZKRDBKb1h6aWZTMVkrSmduQnR3cHNwY0c1NUlYSUlXNVQ5YXRXcllEc0dVPQ==')
INSERT [dbo].[Admins] ([ID], [Number], [Password], [Name], [Email], [Token]) VALUES (4, N'03403961531', N'JD0JoXzifS1Y+JgnBtwpspcG55IXIIW5T9atWrYDsGU=', N'Shoaib', N'shoaib@wemart.com', N'QWRtaW4sVmVuZG9yLFJpZGVyLFVzZXI6MDM0MDM5NjE1MzFKRDBKb1h6aWZTMVkrSmduQnR3cHNwY0c1NUlYSUlXNVQ5YXRXcllEc0dVPQ==')
INSERT [dbo].[Admins] ([ID], [Number], [Password], [Name], [Email], [Token]) VALUES (5, N'03352423216', N'JD0JoXzifS1Y+JgnBtwpspcG55IXIIW5T9atWrYDsGU=', N'Hammad', N'hammad@wemart.com', N'QWRtaW4sVmVuZG9yLFJpZGVyLFVzZXI6MDMzNTI0MjMyMTZKRDBKb1h6aWZTMVkrSmduQnR3cHNwY0c1NUlYSUlXNVQ5YXRXcllEc0dVPQ==')
INSERT [dbo].[Admins] ([ID], [Number], [Password], [Name], [Email], [Token]) VALUES (6, N'03002841180', N'JD0JoXzifS1Y+JgnBtwpspcG55IXIIW5T9atWrYDsGU=', N'Shahroze', N'shahroze@wemart.com', N'QWRtaW4sVmVuZG9yLFJpZGVyLFVzZXI6MDMwMDI4NDExODBKRDBKb1h6aWZTMVkrSmduQnR3cHNwY0c1NUlYSUlXNVQ5YXRXcllEc0dVPQ==')
SET IDENTITY_INSERT [dbo].[Admins] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([ID], [CategoryName], [CategoryImg], [IsApproved], [AddedBy]) VALUES (1, N'Meat', N'-', 1, NULL)
INSERT [dbo].[Categories] ([ID], [CategoryName], [CategoryImg], [IsApproved], [AddedBy]) VALUES (2, N'Vegetables', N'-', 1, NULL)
INSERT [dbo].[Categories] ([ID], [CategoryName], [CategoryImg], [IsApproved], [AddedBy]) VALUES (3, N'Groceries', N'-', 1, NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[OrderProducts] ON 

INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (8, 1, 6, 3, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (9, 1, 7, 3, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (10, 2, 10, 3, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (11, 1, 9, 3, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (12, 2, 6, 3, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (13, 2, 9, 3, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (14, 5, 6, 2, CAST(62.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (15, 5, 10, 15, CAST(1015.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (16, 5, 8, 3, CAST(83.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (17, 6, 6, 2, CAST(62.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (18, 6, 10, 15, CAST(1015.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (19, 6, 8, 3, CAST(83.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (20, 7, 20, 5, CAST(11111.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (21, 8, 7, 1, CAST(29.90 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (22, 9, 7, 1, CAST(29.90 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (23, 10, 6, 1, CAST(29.90 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (24, 11, 9, 3, CAST(29.90 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (25, 12, 26, 1, CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (26, 12, 26, 2, CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (27, 13, 10, 1, CAST(29.90 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (28, 14, 26, 1, CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (29, 15, 20, 4, CAST(11111.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (30, 16, 26, 1, CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (31, 17, 26, 1, CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (32, 18, 10, 1, CAST(29.90 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (33, 19, 26, 1, CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (34, 20, 27, 3, CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (35, 20, 28, 3, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (36, 21, 26, 1, CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (37, 22, 33, 2, CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (38, 23, 33, 1, CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (39, 24, 32, 1, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (40, 25, 33, 1, CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (41, 26, 39, 2, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (1041, 27, 6, 3, CAST(29.90 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (1042, 28, 6, 1, CAST(29.90 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (1043, 29, 1039, 2, CAST(124.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (1044, 30, 1040, 1, CAST(22.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderProducts] ([ID], [OrderID], [ProductID], [Quantity], [TotalPrice]) VALUES (1045, 30, 1039, 2, CAST(124.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[OrderProducts] OFF
SET IDENTITY_INSERT [dbo].[OrderRoutes] ON 

INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (7, 2, CAST(24.22200000 AS Decimal(10, 8)), CAST(64.22200000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (8, 2, CAST(24.22200000 AS Decimal(10, 8)), CAST(63.22200000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (9, 2, CAST(24.22200000 AS Decimal(10, 8)), CAST(50.22200000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (10, 10, CAST(27.88880000 AS Decimal(10, 8)), CAST(28.99980000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (11, 10, CAST(27.88880000 AS Decimal(10, 8)), CAST(29.99980000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (12, 10, CAST(27.88880000 AS Decimal(10, 8)), CAST(29.99980000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (13, 10, CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (14, 10, CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (15, 12, CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (16, 12, CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (17, 12, CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (18, 12, CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (19, 12, CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (20, 12, CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (21, 12, CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (22, 12, CAST(37.42199830 AS Decimal(10, 8)), CAST(-122.08400000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (23, 12, CAST(37.42199830 AS Decimal(10, 8)), CAST(-122.08400000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (24, 12, CAST(37.42199830 AS Decimal(10, 8)), CAST(-122.08400000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (25, 12, CAST(37.42199830 AS Decimal(10, 8)), CAST(-122.08400000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (26, 12, CAST(37.42199830 AS Decimal(10, 8)), CAST(-122.08400000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (27, 12, CAST(37.42199830 AS Decimal(10, 8)), CAST(-122.08400000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (28, 12, CAST(37.42199830 AS Decimal(10, 8)), CAST(-122.08400000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (29, 12, CAST(37.42199830 AS Decimal(10, 8)), CAST(-122.08400000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (30, 12, CAST(37.42199830 AS Decimal(10, 8)), CAST(-122.08400000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (31, 12, CAST(37.42199830 AS Decimal(10, 8)), CAST(-122.08400000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (32, 12, CAST(37.42199830 AS Decimal(10, 8)), CAST(-122.08400000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (33, 12, CAST(37.42199830 AS Decimal(10, 8)), CAST(-122.08400000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (34, 10, CAST(24.94281110 AS Decimal(10, 8)), CAST(67.05569480 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (35, 10, CAST(24.94281110 AS Decimal(10, 8)), CAST(67.05569480 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (36, 10, CAST(24.94281110 AS Decimal(10, 8)), CAST(67.05569480 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (37, 10, CAST(24.94281110 AS Decimal(10, 8)), CAST(67.05569480 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (38, 10, CAST(24.94281110 AS Decimal(10, 8)), CAST(67.05569480 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (39, 10, CAST(24.94281110 AS Decimal(10, 8)), CAST(67.05569480 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (40, 10, CAST(24.94281110 AS Decimal(10, 8)), CAST(67.05569480 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (41, 10, CAST(24.94281110 AS Decimal(10, 8)), CAST(67.05569480 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (42, 10, CAST(24.94281110 AS Decimal(10, 8)), CAST(67.05569480 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (43, 12, CAST(37.42199830 AS Decimal(10, 8)), CAST(-122.08400000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (44, 12, CAST(37.42199830 AS Decimal(10, 8)), CAST(-122.08400000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (45, 12, CAST(37.42199830 AS Decimal(10, 8)), CAST(-122.08400000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (46, 12, CAST(37.42199830 AS Decimal(10, 8)), CAST(-122.08400000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (47, 12, CAST(37.42199830 AS Decimal(10, 8)), CAST(-122.08400000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (48, 12, CAST(37.42199830 AS Decimal(10, 8)), CAST(-122.08400000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (49, 12, CAST(37.42199830 AS Decimal(10, 8)), CAST(-122.08400000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (50, 12, CAST(37.42199830 AS Decimal(10, 8)), CAST(-122.08400000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (51, 12, CAST(37.42199830 AS Decimal(10, 8)), CAST(-122.08400000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (52, 12, CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (53, 12, CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (54, 12, CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (55, 12, CAST(24.92021790 AS Decimal(10, 8)), CAST(67.02855560 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (56, 12, CAST(24.92027550 AS Decimal(10, 8)), CAST(67.02843180 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (57, 12, CAST(24.92018830 AS Decimal(10, 8)), CAST(67.02860040 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (58, 10, CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (59, 10, CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (60, 10, CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (61, 10, CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (62, 10, CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (63, 1, CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (64, 1, CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (65, 1, CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (66, 1, CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (67, 1, CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (68, 1, CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (69, 1, CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (70, 1, CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (71, 1, CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (72, 12, CAST(24.92018010 AS Decimal(10, 8)), CAST(67.02878610 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (73, 12, CAST(24.92018010 AS Decimal(10, 8)), CAST(67.02878610 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (74, 12, CAST(24.92018010 AS Decimal(10, 8)), CAST(67.02878610 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (75, 12, CAST(24.92018690 AS Decimal(10, 8)), CAST(67.02888020 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (76, 12, CAST(24.92025030 AS Decimal(10, 8)), CAST(67.02863020 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (77, 12, CAST(24.92025030 AS Decimal(10, 8)), CAST(67.02863020 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (78, 12, CAST(24.92025030 AS Decimal(10, 8)), CAST(67.02863020 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (79, 12, CAST(24.92025030 AS Decimal(10, 8)), CAST(67.02863020 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (80, 12, CAST(24.92024780 AS Decimal(10, 8)), CAST(67.02855110 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (81, 12, CAST(24.92025420 AS Decimal(10, 8)), CAST(67.02853420 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (82, 12, CAST(24.92364850 AS Decimal(10, 8)), CAST(67.02725660 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (83, 12, CAST(24.92364850 AS Decimal(10, 8)), CAST(67.02725660 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (84, 12, CAST(24.92364850 AS Decimal(10, 8)), CAST(67.02725660 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (85, 12, CAST(24.92364850 AS Decimal(10, 8)), CAST(67.02725660 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (86, 12, CAST(24.92020610 AS Decimal(10, 8)), CAST(67.02869620 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (87, 1, CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (88, 1, CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (89, 1, CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (90, 1, CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (91, 12, CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (92, 12, CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (93, 12, CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (94, 12, CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (95, 12, CAST(24.92018940 AS Decimal(10, 8)), CAST(67.02868130 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (96, 12, CAST(24.92018940 AS Decimal(10, 8)), CAST(67.02868130 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (97, 12, CAST(24.92054840 AS Decimal(10, 8)), CAST(67.02839430 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (98, 12, CAST(24.92039640 AS Decimal(10, 8)), CAST(67.02846090 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (99, 12, CAST(24.92039640 AS Decimal(10, 8)), CAST(67.02846090 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (100, 12, CAST(24.92039640 AS Decimal(10, 8)), CAST(67.02846090 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (101, 12, CAST(24.92039640 AS Decimal(10, 8)), CAST(67.02846090 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (102, 12, CAST(24.92028180 AS Decimal(10, 8)), CAST(67.02842710 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (103, 22, CAST(24.92134430 AS Decimal(10, 8)), CAST(67.02735520 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (104, 22, CAST(24.92143010 AS Decimal(10, 8)), CAST(67.02731600 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (105, 22, CAST(24.92134580 AS Decimal(10, 8)), CAST(67.02735310 AS Decimal(11, 8)))
GO
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (106, 22, CAST(24.92124650 AS Decimal(10, 8)), CAST(67.02738630 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (107, 22, CAST(24.92134860 AS Decimal(10, 8)), CAST(67.02735530 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (108, 22, CAST(24.92122220 AS Decimal(10, 8)), CAST(67.02730720 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (109, 22, CAST(24.92112810 AS Decimal(10, 8)), CAST(67.02733610 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (110, 22, CAST(24.92121690 AS Decimal(10, 8)), CAST(67.02731140 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (111, 22, CAST(24.92135040 AS Decimal(10, 8)), CAST(67.02735270 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (112, 22, CAST(24.92129470 AS Decimal(10, 8)), CAST(67.02737890 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (113, 22, CAST(24.92122000 AS Decimal(10, 8)), CAST(67.02728950 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (114, 22, CAST(24.92125000 AS Decimal(10, 8)), CAST(67.02725350 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (115, 22, CAST(24.92125660 AS Decimal(10, 8)), CAST(67.02729570 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (116, 22, CAST(24.92132200 AS Decimal(10, 8)), CAST(67.02737660 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (117, 22, CAST(24.92133820 AS Decimal(10, 8)), CAST(67.02741100 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (118, 22, CAST(24.92124160 AS Decimal(10, 8)), CAST(67.02731980 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (119, 22, CAST(24.92131880 AS Decimal(10, 8)), CAST(67.02742920 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (120, 22, CAST(24.92138940 AS Decimal(10, 8)), CAST(67.02752840 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (121, 22, CAST(24.92145750 AS Decimal(10, 8)), CAST(67.02744050 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (122, 22, CAST(24.92151670 AS Decimal(10, 8)), CAST(67.02735890 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (123, 22, CAST(24.92152910 AS Decimal(10, 8)), CAST(67.02725620 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (124, 22, CAST(24.92143610 AS Decimal(10, 8)), CAST(67.02723630 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (125, 22, CAST(24.92150950 AS Decimal(10, 8)), CAST(67.02715620 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (126, 22, CAST(24.92139190 AS Decimal(10, 8)), CAST(67.02729390 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (127, 22, CAST(24.92132790 AS Decimal(10, 8)), CAST(67.02736560 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (128, 22, CAST(24.92133480 AS Decimal(10, 8)), CAST(67.02738280 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (129, 22, CAST(24.92134700 AS Decimal(10, 8)), CAST(67.02719650 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (130, 22, CAST(24.92135670 AS Decimal(10, 8)), CAST(67.02734540 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (131, 22, CAST(24.92134860 AS Decimal(10, 8)), CAST(67.02737140 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (132, 22, CAST(24.92144720 AS Decimal(10, 8)), CAST(67.02732200 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (133, 22, CAST(24.92136070 AS Decimal(10, 8)), CAST(67.02740810 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (134, 22, CAST(24.92131380 AS Decimal(10, 8)), CAST(67.02750290 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (135, 22, CAST(24.92131330 AS Decimal(10, 8)), CAST(67.02752000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (136, 22, CAST(24.92134890 AS Decimal(10, 8)), CAST(67.02738180 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (137, 22, CAST(24.92135700 AS Decimal(10, 8)), CAST(67.02735790 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (138, 22, CAST(24.92131360 AS Decimal(10, 8)), CAST(67.02738380 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (139, 22, CAST(24.92127200 AS Decimal(10, 8)), CAST(67.02738860 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (140, 22, CAST(24.92132520 AS Decimal(10, 8)), CAST(67.02741030 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (141, 22, CAST(24.92124140 AS Decimal(10, 8)), CAST(67.02736110 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (142, 22, CAST(24.92123640 AS Decimal(10, 8)), CAST(67.02742850 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (143, 22, CAST(24.92128210 AS Decimal(10, 8)), CAST(67.02742850 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (144, 22, CAST(24.92124260 AS Decimal(10, 8)), CAST(67.02733350 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (145, 22, CAST(24.92120000 AS Decimal(10, 8)), CAST(67.02743840 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (146, 22, CAST(24.92118180 AS Decimal(10, 8)), CAST(67.02747970 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (147, 22, CAST(24.92129800 AS Decimal(10, 8)), CAST(67.02747410 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (148, 22, CAST(24.92136360 AS Decimal(10, 8)), CAST(67.02754610 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (149, 22, CAST(24.92128310 AS Decimal(10, 8)), CAST(67.02748840 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (150, 22, CAST(24.92119510 AS Decimal(10, 8)), CAST(67.02742980 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (151, 22, CAST(24.92133110 AS Decimal(10, 8)), CAST(67.02736090 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (152, 22, CAST(24.92133200 AS Decimal(10, 8)), CAST(67.02738210 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (153, 22, CAST(24.92136780 AS Decimal(10, 8)), CAST(67.02735000 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (154, 22, CAST(24.92120210 AS Decimal(10, 8)), CAST(67.02738160 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (155, 22, CAST(24.92135350 AS Decimal(10, 8)), CAST(67.02735600 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (156, 22, CAST(24.92133170 AS Decimal(10, 8)), CAST(67.02736280 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (157, 22, CAST(24.92124840 AS Decimal(10, 8)), CAST(67.02756160 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (158, 22, CAST(24.92116820 AS Decimal(10, 8)), CAST(67.02751200 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (159, 23, CAST(24.92133810 AS Decimal(10, 8)), CAST(67.02735450 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (160, 23, CAST(24.92134700 AS Decimal(10, 8)), CAST(67.02735240 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (161, 23, CAST(24.92121510 AS Decimal(10, 8)), CAST(67.02741660 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (162, 23, CAST(24.92125750 AS Decimal(10, 8)), CAST(67.02745560 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (163, 26, CAST(24.91623340 AS Decimal(10, 8)), CAST(67.07665730 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (164, 26, CAST(24.91624370 AS Decimal(10, 8)), CAST(67.07667500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (1163, 29, CAST(24.92133780 AS Decimal(10, 8)), CAST(67.02736050 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (1164, 29, CAST(24.92137150 AS Decimal(10, 8)), CAST(67.02741640 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (1165, 29, CAST(24.92124760 AS Decimal(10, 8)), CAST(67.02735760 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (1166, 29, CAST(24.92116100 AS Decimal(10, 8)), CAST(67.02730500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (1167, 29, CAST(24.92134120 AS Decimal(10, 8)), CAST(67.02736020 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (1168, 29, CAST(24.92134820 AS Decimal(10, 8)), CAST(67.02735240 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (1169, 29, CAST(24.92110660 AS Decimal(10, 8)), CAST(67.02748680 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (1170, 29, CAST(24.92113510 AS Decimal(10, 8)), CAST(67.02739220 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (1171, 29, CAST(24.92123620 AS Decimal(10, 8)), CAST(67.02738440 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (1172, 29, CAST(24.92126500 AS Decimal(10, 8)), CAST(67.02742130 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (1173, 29, CAST(24.92133410 AS Decimal(10, 8)), CAST(67.02736880 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (1174, 29, CAST(24.92133880 AS Decimal(10, 8)), CAST(67.02736510 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (1175, 30, CAST(24.92132030 AS Decimal(10, 8)), CAST(67.02737460 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (1176, 30, CAST(24.92114220 AS Decimal(10, 8)), CAST(67.02727860 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (1177, 30, CAST(24.92121150 AS Decimal(10, 8)), CAST(67.02734920 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (1178, 30, CAST(24.92124650 AS Decimal(10, 8)), CAST(67.02737500 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (1179, 30, CAST(24.92130050 AS Decimal(10, 8)), CAST(67.02735610 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (1180, 30, CAST(24.92126630 AS Decimal(10, 8)), CAST(67.02745140 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (1181, 30, CAST(24.92134190 AS Decimal(10, 8)), CAST(67.02736070 AS Decimal(11, 8)))
INSERT [dbo].[OrderRoutes] ([ID], [OrderID], [Latitude], [Longitude]) VALUES (1182, 30, CAST(24.92137940 AS Decimal(10, 8)), CAST(67.02732650 AS Decimal(11, 8)))
SET IDENTITY_INSERT [dbo].[OrderRoutes] OFF
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (1, 3, 1, CAST(90.00 AS Decimal(18, 2)), CAST(N'2020-10-10' AS Date), CAST(N'17:00:00' AS Time), 1, 3, 8, N'nearrer', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (2, 3, 2, CAST(90.00 AS Decimal(18, 2)), CAST(N'2020-10-10' AS Date), CAST(N'17:00:00' AS Time), 1, 3, 1, N'nearrer', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (3, 3, 1, CAST(90.00 AS Decimal(18, 2)), CAST(N'2020-10-10' AS Date), CAST(N'17:00:00' AS Time), 1, 3, 1, N'nearrer', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (4, 3, 2, CAST(90.00 AS Decimal(18, 2)), CAST(N'2020-10-10' AS Date), CAST(N'17:00:00' AS Time), 1, 2, 1, N'nearrer', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (5, 3, 1, CAST(900.00 AS Decimal(18, 2)), CAST(N'2020-10-21' AS Date), CAST(N'00:46:48.8591185' AS Time), 1, 3, 1, N'', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (6, 3, 2, CAST(900.00 AS Decimal(18, 2)), CAST(N'2020-10-20' AS Date), CAST(N'13:11:03.9207016' AS Time), 0, 2, 1, N'', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (7, 3, 9, CAST(55555.00 AS Decimal(18, 2)), CAST(N'2020-10-29' AS Date), CAST(N'04:31:02.1309212' AS Time), 0, 1, NULL, N'1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA', CAST(37.42199830 AS Decimal(10, 8)), CAST(-122.08400000 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (8, 3, 9, CAST(29.90 AS Decimal(18, 2)), CAST(N'2020-10-29' AS Date), CAST(N'05:48:14.2329400' AS Time), 0, 1, NULL, N'', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (9, 3, 9, CAST(29.90 AS Decimal(18, 2)), CAST(N'2020-10-29' AS Date), CAST(N'06:17:16.9824633' AS Time), 0, 1, NULL, N'', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (10, 6, 11, CAST(29.90 AS Decimal(18, 2)), CAST(N'2020-10-30' AS Date), CAST(N'06:18:04.8825488' AS Time), 1, 5, 8, N'Plot A 460, Block L North Nazimabad Town, Karachi, Karachi City, Sindh, Pakistan', CAST(24.94281110 AS Decimal(10, 8)), CAST(67.05569480 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (11, 3, 11, CAST(89.70 AS Decimal(18, 2)), CAST(N'2020-10-30' AS Date), CAST(N'08:02:49.2625635' AS Time), 0, 1, NULL, N'Plot A 460, Block L North Nazimabad Town, Karachi, Karachi City, Sindh, Pakistan', CAST(24.94280860 AS Decimal(10, 8)), CAST(67.05570020 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (12, 18, 12, CAST(150.00 AS Decimal(18, 2)), CAST(N'2020-11-02' AS Date), CAST(N'03:54:04.3310748' AS Time), 1, 2, 6, N'1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA', CAST(37.42199830 AS Decimal(10, 8)), CAST(-122.08400000 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (13, 3, 12, CAST(29.90 AS Decimal(18, 2)), CAST(N'2020-11-03' AS Date), CAST(N'00:56:53.5603737' AS Time), 0, 1, NULL, N'Office 110, Progressive Center, Shahrah-e-Faisal Rd, Pakistan Employees Co-Operative Housing Society Block 6 PECHS, Karachi, Karachi City, Sindh, Pakistan', CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (14, 18, 12, CAST(50.00 AS Decimal(18, 2)), CAST(N'2020-11-04' AS Date), CAST(N'00:57:25.2808575' AS Time), 0, 1, NULL, N'Office 110, Progressive Center, Shahrah-e-Faisal Rd, Pakistan Employees Co-Operative Housing Society Block 6 PECHS, Karachi, Karachi City, Sindh, Pakistan', CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (15, 3, 12, CAST(44444.00 AS Decimal(18, 2)), CAST(N'2020-11-04' AS Date), CAST(N'03:31:04.1381688' AS Time), 0, 1, NULL, N'Office 110, Progressive Center, Shahrah-e-Faisal Rd, Pakistan Employees Co-Operative Housing Society Block 6 PECHS, Karachi, Karachi City, Sindh, Pakistan', CAST(24.86312170 AS Decimal(10, 8)), CAST(67.07430500 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (16, 18, 14, CAST(50.00 AS Decimal(18, 2)), CAST(N'2020-11-04' AS Date), CAST(N'07:41:20.8320032' AS Time), 0, 1, NULL, N'11, Federal B Area Block 8 Yaseenabad, Karachi, Karachi City, Sindh 75600, Pakistan', CAST(24.91619600 AS Decimal(10, 8)), CAST(67.07666350 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (17, 18, 14, CAST(50.00 AS Decimal(18, 2)), CAST(N'2020-11-05' AS Date), CAST(N'08:20:43.1304434' AS Time), 0, 1, NULL, N'11, Federal B Area Block 8 Yaseenabad, Karachi, Karachi City, Sindh 75600, Pakistan', CAST(24.91619710 AS Decimal(10, 8)), CAST(67.07667950 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (18, 3, 13, CAST(29.90 AS Decimal(18, 2)), CAST(N'2020-11-05' AS Date), CAST(N'08:29:42.6287466' AS Time), 0, 1, NULL, N'Block 14 Gulistan-e-Johar, Karachi, Karachi City, Sindh, Block 14 Gulistan-e-Johar, Karachi, Karachi City, Sindh, Pakistan', CAST(24.91991070 AS Decimal(10, 8)), CAST(67.13204480 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (19, 18, 14, CAST(50.00 AS Decimal(18, 2)), CAST(N'2020-11-07' AS Date), CAST(N'09:52:18.1144429' AS Time), 0, 1, NULL, N'Plot 27 V, P.E.C.H.S Block 2 Block 2 PECHS, Karachi, Karachi City, Sindh, Pakistan', CAST(24.86478070 AS Decimal(10, 8)), CAST(67.04825740 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (20, 18, 1, CAST(510.00 AS Decimal(18, 2)), CAST(N'2020-11-07' AS Date), CAST(N'10:21:49.7822434' AS Time), 1, 2, NULL, N'Plot C 14/2B, Block 3 Nazimabad, Karachi, Karachi City, Sindh 74600, Pakistan', CAST(24.92027050 AS Decimal(10, 8)), CAST(67.02849340 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (21, 18, 13, CAST(50.00 AS Decimal(18, 2)), CAST(N'2020-11-09' AS Date), CAST(N'12:31:42.2631662' AS Time), 0, 1, NULL, N'Block 14 Gulistan-e-Johar, Karachi, Karachi City, Sindh, Block 14 Gulistan-e-Johar, Karachi, Karachi City, Sindh, Pakistan', CAST(24.91993300 AS Decimal(10, 8)), CAST(67.13206700 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (22, 21, 11, CAST(2000.00 AS Decimal(18, 2)), CAST(N'2020-11-09' AS Date), CAST(N'14:31:05.8344080' AS Time), 1, 5, 9, N'Plot C 4/23A, Block 5 Block 5 C Block 5 Nazimabad, Karachi, Karachi City, Sindh 74600, Pakistan', CAST(24.92133220 AS Decimal(10, 8)), CAST(67.02735350 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (23, 21, 11, CAST(1000.00 AS Decimal(18, 2)), CAST(N'2020-11-09' AS Date), CAST(N'15:52:55.2950788' AS Time), 1, 5, 9, N'Plot C 4/23A, Block 5 Block 5 C Block 5 Nazimabad, Karachi, Karachi City, Sindh 74600, Pakistan', CAST(24.92134400 AS Decimal(10, 8)), CAST(67.02735750 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (24, 21, 11, CAST(2.00 AS Decimal(18, 2)), CAST(N'2020-11-09' AS Date), CAST(N'15:59:35.8075095' AS Time), 1, 2, 10, N'', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (25, 21, 16, CAST(1000.00 AS Decimal(18, 2)), CAST(N'2020-11-09' AS Date), CAST(N'05:48:22.4953127' AS Time), 0, 1, NULL, N'Block 14 Gulistan-e-Johar, Karachi, Karachi City, Sindh, Block 14 Gulistan-e-Johar, Karachi, Karachi City, Sindh, Pakistan', CAST(24.91990850 AS Decimal(10, 8)), CAST(67.13206000 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (26, 20, 17, CAST(200.00 AS Decimal(18, 2)), CAST(N'2020-11-11' AS Date), CAST(N'08:35:19.5527174' AS Time), 1, 4, 10, N'11, Federal B Area Block 8 Yaseenabad, Karachi, Karachi City, Sindh 75600, Pakistan', CAST(24.91625300 AS Decimal(10, 8)), CAST(67.07669050 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (27, 3, 11, CAST(89.70 AS Decimal(18, 2)), CAST(N'2020-11-12' AS Date), CAST(N'12:17:32.4753379' AS Time), 0, 1, NULL, N'Plot C, 4/22, Block 5 Block 5 C Block 5 Nazimabad, Karachi, Karachi City, Sindh 74600, Pakistan', CAST(24.92135260 AS Decimal(10, 8)), CAST(67.02735660 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (28, 3, 11, CAST(29.90 AS Decimal(18, 2)), CAST(N'2020-11-12' AS Date), CAST(N'14:31:04.8227483' AS Time), 0, 1, NULL, N'Plot C 4/23A, Block 5 Block 5 C Block 5 Nazimabad, Karachi, Karachi City, Sindh 74600, Pakistan', CAST(24.92134190 AS Decimal(10, 8)), CAST(67.02736010 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (29, 1023, 11, CAST(248.00 AS Decimal(18, 2)), CAST(N'2020-11-12' AS Date), CAST(N'08:39:26.4348766' AS Time), 1, 5, 9, N'Plot C, 4/22, Block 5 Block 5 C Block 5 Nazimabad, Karachi, Karachi City, Sindh 74600, Pakistan', CAST(24.92139420 AS Decimal(10, 8)), CAST(67.02731340 AS Decimal(11, 8)))
INSERT [dbo].[Orders] ([ID], [ShopID], [UserID], [TotalPrice], [CreatedDate], [CreatedTime], [IsApproved], [StatusID], [RiderID], [Location], [Latitude], [Longitude]) VALUES (30, 1023, 11, CAST(270.00 AS Decimal(18, 2)), CAST(N'2020-11-12' AS Date), CAST(N'09:06:43.9624568' AS Time), 1, 4, 1010, N'Plot C 4/23A, Block 5 Block 5 C Block 5 Nazimabad, Karachi, Karachi City, Sindh 74600, Pakistan', CAST(24.92133560 AS Decimal(10, 8)), CAST(67.02736720 AS Decimal(11, 8)))
SET IDENTITY_INSERT [dbo].[ProductReviews] ON 

INSERT [dbo].[ProductReviews] ([ID], [UserID], [ProductID], [ReviewOn], [Rating], [Comments]) VALUES (1, 6, 7, CAST(N'2020-10-26T04:24:45.547' AS DateTime), 4, N'such a great product to use')
INSERT [dbo].[ProductReviews] ([ID], [UserID], [ProductID], [ReviewOn], [Rating], [Comments]) VALUES (2, 3, 4, CAST(N'2020-10-29T11:09:21.247' AS DateTime), 4, N'good')
INSERT [dbo].[ProductReviews] ([ID], [UserID], [ProductID], [ReviewOn], [Rating], [Comments]) VALUES (3, 55, 55, CAST(N'2020-10-29T11:09:21.247' AS DateTime), 4, N'good')
INSERT [dbo].[ProductReviews] ([ID], [UserID], [ProductID], [ReviewOn], [Rating], [Comments]) VALUES (4, 999999, 999999, CAST(N'2020-10-29T11:09:21.247' AS DateTime), 4, N'good')
INSERT [dbo].[ProductReviews] ([ID], [UserID], [ProductID], [ReviewOn], [Rating], [Comments]) VALUES (5, 9, 17, CAST(N'2020-10-29T16:23:15.000' AS DateTime), 5, N'Abba to phr Abba hai')
INSERT [dbo].[ProductReviews] ([ID], [UserID], [ProductID], [ReviewOn], [Rating], [Comments]) VALUES (6, 9, 20, CAST(N'2020-10-29T16:27:49.000' AS DateTime), 5, N'not a greate')
INSERT [dbo].[ProductReviews] ([ID], [UserID], [ProductID], [ReviewOn], [Rating], [Comments]) VALUES (7, 9, 9, CAST(N'2020-10-29T18:03:11.000' AS DateTime), 5, N'sssss')
INSERT [dbo].[ProductReviews] ([ID], [UserID], [ProductID], [ReviewOn], [Rating], [Comments]) VALUES (8, 1, 26, CAST(N'2020-10-29T19:51:46.000' AS DateTime), 3, N'just ok')
INSERT [dbo].[ProductReviews] ([ID], [UserID], [ProductID], [ReviewOn], [Rating], [Comments]) VALUES (9, 1, 20, CAST(N'2020-10-29T19:56:55.000' AS DateTime), 2, N'too expensive')
INSERT [dbo].[ProductReviews] ([ID], [UserID], [ProductID], [ReviewOn], [Rating], [Comments]) VALUES (10, 11, 9, CAST(N'2020-10-30T20:02:01.000' AS DateTime), 4, N'tttt')
INSERT [dbo].[ProductReviews] ([ID], [UserID], [ProductID], [ReviewOn], [Rating], [Comments]) VALUES (11, 11, 33, CAST(N'2020-11-09T03:30:44.000' AS DateTime), 5, N'it''s yummy')
INSERT [dbo].[ProductReviews] ([ID], [UserID], [ProductID], [ReviewOn], [Rating], [Comments]) VALUES (12, 11, 1039, CAST(N'2020-11-12T21:39:12.000' AS DateTime), 3, N'good')
SET IDENTITY_INSERT [dbo].[ProductReviews] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID], [ShopCatID], [Name], [Img], [Price], [Unit], [IsApproved], [CreatedDate], [CreatedTime]) VALUES (6, 2, N'Supreme Supari', N'/ProductImages/Supreme Supari637385741932124679.jpg', CAST(29.90 AS Decimal(18, 2)), N'-', N'1', CAST(N'2020-10-17' AS Date), CAST(N'23:29:53.2124425' AS Time))
INSERT [dbo].[Products] ([ID], [ShopCatID], [Name], [Img], [Price], [Unit], [IsApproved], [CreatedDate], [CreatedTime]) VALUES (7, 3, N'Supreme Supari', N'/ProductImages/Supreme Supari637385741990343429.jpg', CAST(29.90 AS Decimal(18, 2)), N'-', N'1', CAST(N'2020-10-17' AS Date), CAST(N'23:29:59.0343260' AS Time))
INSERT [dbo].[Products] ([ID], [ShopCatID], [Name], [Img], [Price], [Unit], [IsApproved], [CreatedDate], [CreatedTime]) VALUES (8, 3, N'Supreme Supari', N'/ProductImages/Supreme Supari637385744160317074.jpg', CAST(29.90 AS Decimal(18, 2)), N'-', N'1', CAST(N'2020-10-17' AS Date), CAST(N'23:33:36.0316847' AS Time))
INSERT [dbo].[Products] ([ID], [ShopCatID], [Name], [Img], [Price], [Unit], [IsApproved], [CreatedDate], [CreatedTime]) VALUES (9, 3, N'Supreme Supari', N'/ProductImages/Supreme Supari637385744580386310.jpg', CAST(29.90 AS Decimal(18, 2)), N'-', N'1', CAST(N'2020-10-17' AS Date), CAST(N'23:34:18.0386075' AS Time))
INSERT [dbo].[Products] ([ID], [ShopCatID], [Name], [Img], [Price], [Unit], [IsApproved], [CreatedDate], [CreatedTime]) VALUES (10, 1, N'Supreme Supari', N'/ProductImages/Supreme Supari637385744899157898.jpg', CAST(29.90 AS Decimal(18, 2)), N'-', N'1', CAST(N'2020-10-17' AS Date), CAST(N'23:34:49.9157705' AS Time))
INSERT [dbo].[Products] ([ID], [ShopCatID], [Name], [Img], [Price], [Unit], [IsApproved], [CreatedDate], [CreatedTime]) VALUES (17, 3, N'abba', N'/ProductImages/abba637391966594085374.jpg', CAST(1111.00 AS Decimal(18, 2)), N'ml', N'1', CAST(N'2020-10-25' AS Date), CAST(N'04:24:19.4085107' AS Time))
INSERT [dbo].[Products] ([ID], [ShopCatID], [Name], [Img], [Price], [Unit], [IsApproved], [CreatedDate], [CreatedTime]) VALUES (18, 3, N'tttt', N'/ProductImages/tttt637392331616621983.png', CAST(22222.00 AS Decimal(18, 2)), N'kg', N'1', CAST(N'2020-10-25' AS Date), CAST(N'14:32:41.6621447' AS Time))
INSERT [dbo].[Products] ([ID], [ShopCatID], [Name], [Img], [Price], [Unit], [IsApproved], [CreatedDate], [CreatedTime]) VALUES (19, 3, N'tygyg', N'/ProductImages/tygyg637392332647391710.jpg', CAST(25252.00 AS Decimal(18, 2)), N'kg', N'1', CAST(N'2020-10-25' AS Date), CAST(N'14:34:24.7391467' AS Time))
INSERT [dbo].[Products] ([ID], [ShopCatID], [Name], [Img], [Price], [Unit], [IsApproved], [CreatedDate], [CreatedTime]) VALUES (20, 2, N'bhaaap', N'/ProductImages/bhaaap637392337739375525.jpg', CAST(11111.00 AS Decimal(18, 2)), N'kg', N'1', CAST(N'2020-10-25' AS Date), CAST(N'14:42:53.9375145' AS Time))
INSERT [dbo].[Products] ([ID], [ShopCatID], [Name], [Img], [Price], [Unit], [IsApproved], [CreatedDate], [CreatedTime]) VALUES (21, 3, N'tttt', N'/ProductImages/tttt637392338070914715.jpg', CAST(222.00 AS Decimal(18, 2)), N'kg', N'1', CAST(N'2020-10-25' AS Date), CAST(N'14:43:27.0914555' AS Time))
INSERT [dbo].[Products] ([ID], [ShopCatID], [Name], [Img], [Price], [Unit], [IsApproved], [CreatedDate], [CreatedTime]) VALUES (22, 3, N'tyfyfhf', N'/ProductImages/tyfyfhf637392339104319775.jpg', CAST(55558.00 AS Decimal(18, 2)), N'kg', N'1', CAST(N'2020-10-25' AS Date), CAST(N'14:45:10.4319557' AS Time))
INSERT [dbo].[Products] ([ID], [ShopCatID], [Name], [Img], [Price], [Unit], [IsApproved], [CreatedDate], [CreatedTime]) VALUES (23, 3, N'trf', N'/ProductImages/trf637392341448735358.jpg', CAST(25555.00 AS Decimal(18, 2)), N'ml', N'1', CAST(N'2020-10-25' AS Date), CAST(N'14:49:04.8735212' AS Time))
INSERT [dbo].[Products] ([ID], [ShopCatID], [Name], [Img], [Price], [Unit], [IsApproved], [CreatedDate], [CreatedTime]) VALUES (26, 8, N'Potato', N'/ProductImages/Potato637393847075327103.jpg', CAST(50.00 AS Decimal(18, 2)), N'kg', N'1', CAST(N'2020-10-27' AS Date), CAST(N'08:38:27.5324843' AS Time))
INSERT [dbo].[Products] ([ID], [ShopCatID], [Name], [Img], [Price], [Unit], [IsApproved], [CreatedDate], [CreatedTime]) VALUES (27, 8, N'Potatoes', N'invalid file', CAST(150.00 AS Decimal(18, 2)), N'kg', N'1', CAST(N'2020-11-07' AS Date), CAST(N'09:07:59.2217906' AS Time))
INSERT [dbo].[Products] ([ID], [ShopCatID], [Name], [Img], [Price], [Unit], [IsApproved], [CreatedDate], [CreatedTime]) VALUES (28, 8, N'Potatoes', N'invalid file', CAST(20.00 AS Decimal(18, 2)), N'kg', N'1', CAST(N'2020-11-07' AS Date), CAST(N'09:56:25.6867282' AS Time))
INSERT [dbo].[Products] ([ID], [ShopCatID], [Name], [Img], [Price], [Unit], [IsApproved], [CreatedDate], [CreatedTime]) VALUES (32, 13, N'y', N'/ProductImages/y637404402682149525.jpg', CAST(2.00 AS Decimal(18, 2)), N'kg', N'1', CAST(N'2020-11-08' AS Date), CAST(N'13:51:08.2149333' AS Time))
INSERT [dbo].[Products] ([ID], [ShopCatID], [Name], [Img], [Price], [Unit], [IsApproved], [CreatedDate], [CreatedTime]) VALUES (33, 13, N'cake', N'/ProductImages/cake637404403106159600.jpg', CAST(1000.00 AS Decimal(18, 2)), N'kg', N'1', CAST(N'2020-11-08' AS Date), CAST(N'13:51:50.6159299' AS Time))
INSERT [dbo].[Products] ([ID], [ShopCatID], [Name], [Img], [Price], [Unit], [IsApproved], [CreatedDate], [CreatedTime]) VALUES (38, 15, N'potatoes', N'/ProductImages/potatoes637406803796772108.png', CAST(100.00 AS Decimal(18, 2)), N'kg', N'1', CAST(N'2020-11-11' AS Date), CAST(N'08:32:59.6771738' AS Time))
INSERT [dbo].[Products] ([ID], [ShopCatID], [Name], [Img], [Price], [Unit], [IsApproved], [CreatedDate], [CreatedTime]) VALUES (39, 10, N'Potatoes', N'/ProductImages/Potatoes637406804128663343.jpg', CAST(100.00 AS Decimal(18, 2)), N'kg', N'1', CAST(N'2020-11-11' AS Date), CAST(N'08:33:32.8663214' AS Time))
INSERT [dbo].[Products] ([ID], [ShopCatID], [Name], [Img], [Price], [Unit], [IsApproved], [CreatedDate], [CreatedTime]) VALUES (1038, 15, N'sceneary', N'/ProductImages/sceneary637407668695698296.png', CAST(123.00 AS Decimal(18, 2)), N'kg', N'1', CAST(N'2020-11-12' AS Date), CAST(N'08:34:29.5697647' AS Time))
INSERT [dbo].[Products] ([ID], [ShopCatID], [Name], [Img], [Price], [Unit], [IsApproved], [CreatedDate], [CreatedTime]) VALUES (1039, 1017, N't', N'/ProductImages/t637407668967290864.png', CAST(124.00 AS Decimal(18, 2)), N'kg', N'1', CAST(N'2020-11-12' AS Date), CAST(N'08:34:56.7290405' AS Time))
INSERT [dbo].[Products] ([ID], [ShopCatID], [Name], [Img], [Price], [Unit], [IsApproved], [CreatedDate], [CreatedTime]) VALUES (1040, 1017, N'y', N'/ProductImages/y637407669566170451.png', CAST(22.00 AS Decimal(18, 2)), N'kg', N'1', CAST(N'2020-11-12' AS Date), CAST(N'08:35:56.6170327' AS Time))
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Riders] ON 

INSERT [dbo].[Riders] ([ID], [Name], [Password], [Email], [Number], [Token], [IsApproved], [Img], [CreatedDate], [CreatedTime]) VALUES (1, N'New Shop', N'j10S8Rgc1wBMaftzsZ7DHjFYm0Y04bWP5GG0wXi1fgI=', N'newshop@gmail.com', N'03423519691', N'UmlkZXI6MDM0MjM1MTk2OTFCc3RpbmRhd3JsZA==', 1, N'E:\Visual Studio Project\Wemart\Wemart.Api\wwwroot', CAST(N'2020-10-04' AS Date), CAST(N'23:28:27.3122292' AS Time))
INSERT [dbo].[Riders] ([ID], [Name], [Password], [Email], [Number], [Token], [IsApproved], [Img], [CreatedDate], [CreatedTime]) VALUES (2, N'New Navaila  rider', N'j10S8Rgc1wBMaftzsZ7DHjFYm0Y04bWP5GG0wXi1fgI=', N'newnavailarider@gmail.com', N'03423519692', N'UmlkZXI6MDM0MjM1MTk2OTJCc3RpbmRhd3JsZA==', 1, N'E:\Visual Studio Project\Wemart\Wemart.Api\wwwroot', CAST(N'2020-10-05' AS Date), CAST(N'21:12:48.2299701' AS Time))
INSERT [dbo].[Riders] ([ID], [Name], [Password], [Email], [Number], [Token], [IsApproved], [Img], [CreatedDate], [CreatedTime]) VALUES (3, N'New Navaila  rider', N'j10S8Rgc1wBMaftzsZ7DHjFYm0Y04bWP5GG0wXi1fgI=', N'newnavailarider@gmail.com', N'03423519693', N'UmlkZXI6MDM0MjM1MTk2OTJCc3RpbmRhd3JsZA==', 1, N'/ProductImages/abba637391966594085374.jpg', CAST(N'2020-10-05' AS Date), CAST(N'21:12:48.2299701' AS Time))
INSERT [dbo].[Riders] ([ID], [Name], [Password], [Email], [Number], [Token], [IsApproved], [Img], [CreatedDate], [CreatedTime]) VALUES (4, N'New Navaila  rider', N'j10S8Rgc1wBMaftzsZ7DHjFYm0Y04bWP5GG0wXi1fgI=', N'newnavailarider@gmail.com', N'03423519694', N'UmlkZXI6MDM0MjM1MTk2OTJCc3RpbmRhd3JsZA==', 1, N'/ProductImages/abba637391966594085374.jpg', CAST(N'2020-10-05' AS Date), CAST(N'21:12:48.2299701' AS Time))
INSERT [dbo].[Riders] ([ID], [Name], [Password], [Email], [Number], [Token], [IsApproved], [Img], [CreatedDate], [CreatedTime]) VALUES (5, N'yousuf', N'ADX4VeuwJ0BAoXSOXntYdJQJoRd61V+N/TNePnJfu38=', N'mubbashir126@gmail.com', N'0342123456', N'UmlkZXI6MDM0MjEyMzQ1NjEyMzQ1Njc4', 1, N'/RiderImages/0342123456.jpg', CAST(N'2020-10-30' AS Date), CAST(N'06:27:16.0845865' AS Time))
INSERT [dbo].[Riders] ([ID], [Name], [Password], [Email], [Number], [Token], [IsApproved], [Img], [CreatedDate], [CreatedTime]) VALUES (6, N'dump', N'ADX4VeuwJ0BAoXSOXntYdJQJoRd61V+N/TNePnJfu38=', N'mubbashir126@gmail.com', N'03421234567', N'UmlkZXI6MDM0MjEyMzQ1NjcxMjM0NTY3OA==', 1, N'/RiderImages/03421234567.jpg', CAST(N'2020-10-30' AS Date), CAST(N'06:31:04.0200282' AS Time))
INSERT [dbo].[Riders] ([ID], [Name], [Password], [Email], [Number], [Token], [IsApproved], [Img], [CreatedDate], [CreatedTime]) VALUES (7, N'shakeel', N'ADX4VeuwJ0BAoXSOXntYdAjr0CMni4/DuqJUOMeJYRY=', N'shakeel@gmail.com', N'01234567890', N'UmlkZXI6MDEyMzQ1Njc4OTAxMjM0NTY3ODk=', 1, N'/RiderImages/01234567890.jpg', CAST(N'2020-11-04' AS Date), CAST(N'04:58:29.7706100' AS Time))
INSERT [dbo].[Riders] ([ID], [Name], [Password], [Email], [Number], [Token], [IsApproved], [Img], [CreatedDate], [CreatedTime]) VALUES (8, N'mubbashir', N'ADX4VeuwJ0BAoXSOXntYdJQJoRd61V+N/TNePnJfu38=', N'mubbashir126@gmail.com', N'12345678912', N'UmlkZXI6MTIzNDU2Nzg5MTIxMjM0NTY3OA==', 1, N'/RiderImages/12345678912.jpg', CAST(N'2020-11-04' AS Date), CAST(N'06:08:48.8299861' AS Time))
INSERT [dbo].[Riders] ([ID], [Name], [Password], [Email], [Number], [Token], [IsApproved], [Img], [CreatedDate], [CreatedTime]) VALUES (9, N'new rider', N'ADX4VeuwJ0BAoXSOXntYdAoHysOPPzbUN+gHnDLkBHU=', N'mubbashir126@gmail.com', N'09874563210', N'UmlkZXI6MDk4NzQ1NjMyMTAxMjM0NTY3ODg=', 1, N'/RiderImages/09874563210.jpg', CAST(N'2020-11-08' AS Date), CAST(N'14:08:41.8569221' AS Time))
INSERT [dbo].[Riders] ([ID], [Name], [Password], [Email], [Number], [Token], [IsApproved], [Img], [CreatedDate], [CreatedTime]) VALUES (10, N'Nabeel khan', N'MXycF+EycmROHtef+KNap+tN2UeRzwE2OZdB8wDEu8g=', N'abc123@gmail.com', N'03120290066', N'UmlkZXI6MDMxMjAyOTAwNjZyYWl6YWRhMTI=', 1, N'/RiderImages/03120290066.png', CAST(N'2020-11-11' AS Date), CAST(N'08:29:31.6394004' AS Time))
INSERT [dbo].[Riders] ([ID], [Name], [Password], [Email], [Number], [Token], [IsApproved], [Img], [CreatedDate], [CreatedTime]) VALUES (1010, N'no pasha', N'ADX4VeuwJ0BAoXSOXntYdJQJoRd61V+N/TNePnJfu38=', N'hamza.khan8910@gmail.com', N'12365478900', N'UmlkZXI6MTIzNjU0Nzg5MDAxMjM0NTY3OA==', 1, N'/RiderImages/12365478900.jpg', CAST(N'2020-11-12' AS Date), CAST(N'09:02:16.8487507' AS Time))
SET IDENTITY_INSERT [dbo].[Riders] OFF
SET IDENTITY_INSERT [dbo].[ShopCategories] ON 

INSERT [dbo].[ShopCategories] ([ID], [ShopID], [CatID]) VALUES (1, 3, 3)
INSERT [dbo].[ShopCategories] ([ID], [ShopID], [CatID]) VALUES (2, 3, 2)
INSERT [dbo].[ShopCategories] ([ID], [ShopID], [CatID]) VALUES (3, 3, 1)
INSERT [dbo].[ShopCategories] ([ID], [ShopID], [CatID]) VALUES (6, 13, 1)
INSERT [dbo].[ShopCategories] ([ID], [ShopID], [CatID]) VALUES (7, 17, 3)
INSERT [dbo].[ShopCategories] ([ID], [ShopID], [CatID]) VALUES (8, 18, 2)
INSERT [dbo].[ShopCategories] ([ID], [ShopID], [CatID]) VALUES (10, 20, 2)
INSERT [dbo].[ShopCategories] ([ID], [ShopID], [CatID]) VALUES (13, 21, 1)
INSERT [dbo].[ShopCategories] ([ID], [ShopID], [CatID]) VALUES (14, 21, 3)
INSERT [dbo].[ShopCategories] ([ID], [ShopID], [CatID]) VALUES (15, 21, 2)
INSERT [dbo].[ShopCategories] ([ID], [ShopID], [CatID]) VALUES (1017, 1023, 1)
SET IDENTITY_INSERT [dbo].[ShopCategories] OFF
SET IDENTITY_INSERT [dbo].[Shops] ON 

INSERT [dbo].[Shops] ([ID], [Name], [Number], [Password], [Email], [Token], [Img], [IsApproved], [CreatedDate], [CreatedTime], [Address], [Location], [Latitude], [Longitude]) VALUES (2, N'New Shop', N'03423519691', N'j10S8Rgc1wBMaftzsZ7DHjFYm0Y04bWP5GG0wXi1fgI=', N'newshop@gmail.com', N'VmVuZG9yLFJpZGVyLFVzZXI6MDM0MjM1MTk2OTFCc3RpbmRhd3JsZA==', N'/ShopImgs/03423519691.PNG', 1, CAST(N'2020-10-04' AS Date), CAST(N'22:28:21.4689105' AS Time), N'bht hi neear shop', N'bht hi neear shop', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)))
INSERT [dbo].[Shops] ([ID], [Name], [Number], [Password], [Email], [Token], [Img], [IsApproved], [CreatedDate], [CreatedTime], [Address], [Location], [Latitude], [Longitude]) VALUES (3, N'Nai Navaili Shop', N'03423519692', N'j10S8Rgc1wBMaftzsZ7DHjFYm0Y04bWP5GG0wXi1fgI=', N'nainavailishop@gmail.com', N'VmVuZG9yLFJpZGVyLFVzZXI6MDM0MjM1MTk2OTJCc3RpbmRhd3JsZA==', N'/ShopImgs/03423519692.jpg', 1, CAST(N'2020-10-05' AS Date), CAST(N'20:40:46.2334684' AS Time), N'bht hi neear shop', N'bht hi neear shop', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)))
INSERT [dbo].[Shops] ([ID], [Name], [Number], [Password], [Email], [Token], [Img], [IsApproved], [CreatedDate], [CreatedTime], [Address], [Location], [Latitude], [Longitude]) VALUES (4, N'Nai Navaili Shop', N'03423519693', N'j10S8Rgc1wBMaftzsZ7DHjFYm0Y04bWP5GG0wXi1fgI=', N'nainavailishop@gmail.com', N'VmVuZG9yLFJpZGVyLFVzZXI6MDM0MjM1MTk2OTNCc3RpbmRhd3JsZA==', N'/ShopImgs/03423519693.jpg', 1, CAST(N'2020-10-12' AS Date), CAST(N'23:22:59.3634697' AS Time), N'bht hi neear shop', N'bht hi neear shop', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)))
INSERT [dbo].[Shops] ([ID], [Name], [Number], [Password], [Email], [Token], [Img], [IsApproved], [CreatedDate], [CreatedTime], [Address], [Location], [Latitude], [Longitude]) VALUES (5, N'MyShop', N'03432849689', N'Wj7VoVOy/+7ytLNAvim/Yw==', N'shop@gmail.com', N'VmVuZG9yLFJpZGVyLFVzZXI6MDM0MzI4NDk2ODkxMjM0NQ==', N'/ShopImgs/03432849689.png', 1, CAST(N'2020-10-16' AS Date), CAST(N'09:18:44.2761248' AS Time), N'address', N'address', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.12300000 AS Decimal(11, 8)))
INSERT [dbo].[Shops] ([ID], [Name], [Number], [Password], [Email], [Token], [Img], [IsApproved], [CreatedDate], [CreatedTime], [Address], [Location], [Latitude], [Longitude]) VALUES (6, N'MyShop', N'034328439689', N'Wj7VoVOy/+7ytLNAvim/Yw==', N'shop@gmail.com', N'VmVuZG9yLFJpZGVyLFVzZXI6MDM0MzI4NDM5Njg5MTIzNDU=', N'/ShopImgs/034328439689.jpg', 1, CAST(N'2020-10-16' AS Date), CAST(N'09:25:44.3967297' AS Time), N'address', N'address', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.12300000 AS Decimal(11, 8)))
INSERT [dbo].[Shops] ([ID], [Name], [Number], [Password], [Email], [Token], [Img], [IsApproved], [CreatedDate], [CreatedTime], [Address], [Location], [Latitude], [Longitude]) VALUES (7, N'MynnnShop', N'03432800439689', N'Wj7VoVOy/+7ytLNAvim/Yw==', N'shokp@gmail.com', N'VmVuZG9yLFJpZGVyLFVzZXI6MDM0MzI4MDA0Mzk2ODkxMjM0NQ==', N'/ShopImgs/03432800439689.jpg', 0, CAST(N'2020-10-20' AS Date), CAST(N'16:37:40.2694057' AS Time), N'address', N'address', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.12300000 AS Decimal(11, 8)))
INSERT [dbo].[Shops] ([ID], [Name], [Number], [Password], [Email], [Token], [Img], [IsApproved], [CreatedDate], [CreatedTime], [Address], [Location], [Latitude], [Longitude]) VALUES (8, N't', N'22222222222', N'123', N'mubbashir126@gmail.com', N'VmVuZG9yLFJpZGVyLFVzZXI6MjIyMjIyMjIyMjIxMjM=', N'/ShopImgs/22222222222.jpg', 0, CAST(N'2020-10-25' AS Date), CAST(N'08:57:59.3724563' AS Time), N'Plot C 4/23A, Block 5 Block 5 C Block 5 Nazimabad,', N'Plot C 4/23A, Block 5 Block 5 C Block 5 Nazimabad, Karachi, Karachi City, Sindh 74600, Pakistan', CAST(24.92128500 AS Decimal(10, 8)), CAST(67.02728167 AS Decimal(11, 8)))
INSERT [dbo].[Shops] ([ID], [Name], [Number], [Password], [Email], [Token], [Img], [IsApproved], [CreatedDate], [CreatedTime], [Address], [Location], [Latitude], [Longitude]) VALUES (9, N't', N'22333333333', N'123', N'mubbashir126@gmail.com', N'VmVuZG9yLFJpZGVyLFVzZXI6MjIzMzMzMzMzMzMxMjM0NTY3OA==', N'/ShopImgs/22333333333.jpg', 0, CAST(N'2020-10-25' AS Date), CAST(N'08:59:53.7877748' AS Time), N'Plot C, 4/22, Block 5 Block 5 C Block 5 Nazimabad,', N'Plot C, 4/22, Block 5 Block 5 C Block 5 Nazimabad, Karachi, Karachi City, Sindh 74600, Pakistan', CAST(24.92129500 AS Decimal(10, 8)), CAST(67.02744000 AS Decimal(11, 8)))
INSERT [dbo].[Shops] ([ID], [Name], [Number], [Password], [Email], [Token], [Img], [IsApproved], [CreatedDate], [CreatedTime], [Address], [Location], [Latitude], [Longitude]) VALUES (10, N'mub', N'66666666666', N'123', N'mubbashir126@gmail.com', N'VmVuZG9yLFJpZGVyLFVzZXI6NjY2NjY2NjY2NjYxMjM0NTY3OA==', N'/ShopImgs/66666666666.jpg', 1, CAST(N'2020-10-25' AS Date), CAST(N'09:09:47.5718807' AS Time), N'Plot C 3/12B, Block 5 Block 5 C Block 5 Nazimabad,', N'Plot C 3/12B, Block 5 Block 5 C Block 5 Nazimabad, Karachi, Karachi City, Sindh 74600, Pakistan', CAST(24.92124833 AS Decimal(10, 8)), CAST(67.02752500 AS Decimal(11, 8)))
INSERT [dbo].[Shops] ([ID], [Name], [Number], [Password], [Email], [Token], [Img], [IsApproved], [CreatedDate], [CreatedTime], [Address], [Location], [Latitude], [Longitude]) VALUES (11, N'shopify', N'12345612345', N'123', N'mubbashir126@gmail.com', N'VmVuZG9yLFJpZGVyLFVzZXI6MTIzNDU2MTIzNDUxMjM0NTY3ODk=', N'/ShopImgs/12345612345.jpg', 1, CAST(N'2020-10-25' AS Date), CAST(N'09:24:44.7600435' AS Time), N'Plot C 3/12B, Block 5 Block 5 C Block 5 Nazimabad,', N'Plot C 3/12B, Block 5 Block 5 C Block 5 Nazimabad, Karachi, Karachi City, Sindh 74600, Pakistan', CAST(24.92122500 AS Decimal(10, 8)), CAST(67.02752500 AS Decimal(11, 8)))
INSERT [dbo].[Shops] ([ID], [Name], [Number], [Password], [Email], [Token], [Img], [IsApproved], [CreatedDate], [CreatedTime], [Address], [Location], [Latitude], [Longitude]) VALUES (12, N'r', N'25555885555', N'at8DH0DvWQybsTHpm3q9Hg==', N'NehaMehmood789@gmail.com', N'VmVuZG9yLFJpZGVyLFVzZXI6MjU1NTU4ODU1NTVx', N'/ShopImgs/25555885555.jpg', 1, CAST(N'2020-10-25' AS Date), CAST(N'14:12:15.6874354' AS Time), N'Plot C 4/23A, Block 5 Block 5 C Block 5 Nazimabad,', N'Plot C 4/23A, Block 5 Block 5 C Block 5 Nazimabad, Karachi, Karachi City, Sindh 74600, Pakistan', CAST(24.92135930 AS Decimal(10, 8)), CAST(67.02732760 AS Decimal(11, 8)))
INSERT [dbo].[Shops] ([ID], [Name], [Number], [Password], [Email], [Token], [Img], [IsApproved], [CreatedDate], [CreatedTime], [Address], [Location], [Latitude], [Longitude]) VALUES (13, N'abba', N'12121212121', N'123', N'mubbashir126@gmail.com', N'VmVuZG9yLFJpZGVyLFVzZXI6MTIxMjEyMTIxMjExMjM0NTY3OA==', N'/ShopImgs/12121212121.jpg', 1, CAST(N'2020-10-25' AS Date), CAST(N'14:16:34.1377108' AS Time), N'Plot C, 4/22, Block 5 Block 5 C Block 5 Nazimabad,', N'Plot C, 4/22, Block 5 Block 5 C Block 5 Nazimabad, Karachi, Karachi City, Sindh 74600, Pakistan', CAST(24.92135470 AS Decimal(10, 8)), CAST(67.02734030 AS Decimal(11, 8)))
INSERT [dbo].[Shops] ([ID], [Name], [Number], [Password], [Email], [Token], [Img], [IsApproved], [CreatedDate], [CreatedTime], [Address], [Location], [Latitude], [Longitude]) VALUES (14, N'h', N'25252525222', N'ADX4VeuwJ0BAoXSOXntYdJQJoRd61V+N/TNePnJfu38=', N'nehamehmood789@gmail.com', N'VmVuZG9yLFJpZGVyLFVzZXI6MjUyNTI1MjUyMjIxMjM0NTY3OA==', N'/ShopImgs/25252525222.jpg', 1, CAST(N'2020-10-25' AS Date), CAST(N'16:14:32.9023670' AS Time), N'Plot C, 4/22, Block 5 Block 5 C Block 5 Nazimabad,', N'Plot C, 4/22, Block 5 Block 5 C Block 5 Nazimabad, Karachi, Karachi City, Sindh 74600, Pakistan', CAST(24.92133090 AS Decimal(10, 8)), CAST(67.02738020 AS Decimal(11, 8)))
INSERT [dbo].[Shops] ([ID], [Name], [Number], [Password], [Email], [Token], [Img], [IsApproved], [CreatedDate], [CreatedTime], [Address], [Location], [Latitude], [Longitude]) VALUES (15, N'babu', N'01234567890', N'ADX4VeuwJ0BAoXSOXntYdJQJoRd61V+N/TNePnJfu38=', N'mubbashir126@gmail.com', N'VmVuZG9yLFJpZGVyLFVzZXI6MDEyMzQ1Njc4OTAxMjM0NTY3OA==', N'/ShopImgs/01234567890.jpg', 1, CAST(N'2020-10-26' AS Date), CAST(N'12:34:50.2856145' AS Time), N'Plot C, 4/22, Block 5 Block 5 C Block 5 Nazimabad,', N'Plot C, 4/22, Block 5 Block 5 C Block 5 Nazimabad, Karachi, Karachi City, Sindh 74600, Pakistan', CAST(24.92134860 AS Decimal(10, 8)), CAST(67.02733590 AS Decimal(11, 8)))
INSERT [dbo].[Shops] ([ID], [Name], [Number], [Password], [Email], [Token], [Img], [IsApproved], [CreatedDate], [CreatedTime], [Address], [Location], [Latitude], [Longitude]) VALUES (16, N'tryt', N'03333333151', N'ADX4VeuwJ0BAoXSOXntYdJQJoRd61V+N/TNePnJfu38=', N'mubbashir126@gmail.com', N'VmVuZG9yLFJpZGVyLFVzZXI6MDMzMzMzMzMxNTExMjM0NTY3OA==', N'/ShopImgs/03333333151.jpg', 1, CAST(N'2020-10-26' AS Date), CAST(N'12:35:44.6971599' AS Time), N'Plot C, 4/22, Block 5 Block 5 C Block 5 Nazimabad,', N'Plot C, 4/22, Block 5 Block 5 C Block 5 Nazimabad, Karachi, Karachi City, Sindh 74600, Pakistan', CAST(24.92135440 AS Decimal(10, 8)), CAST(67.02733970 AS Decimal(11, 8)))
INSERT [dbo].[Shops] ([ID], [Name], [Number], [Password], [Email], [Token], [Img], [IsApproved], [CreatedDate], [CreatedTime], [Address], [Location], [Latitude], [Longitude]) VALUES (17, N'rate', N'03343781214', N'ADX4VeuwJ0BAoXSOXntYdJQJoRd61V+N/TNePnJfu38=', N'hamza.khan8910@gmail.com', N'VmVuZG9yLFJpZGVyLFVzZXI6MDMzNDM3ODEyMTQxMjM0NTY3OA==', N'/ShopImgs/03343781214.jpg', 1, CAST(N'2020-10-26' AS Date), CAST(N'12:50:49.9040936' AS Time), N'Plot C 4/23A, Block 5 Block 5 C Block 5 Nazimabad,', N'Plot C 4/23A, Block 5 Block 5 C Block 5 Nazimabad, Karachi, Karachi City, Sindh 74600, Pakistan', CAST(24.92134360 AS Decimal(10, 8)), CAST(67.02733860 AS Decimal(11, 8)))
INSERT [dbo].[Shops] ([ID], [Name], [Number], [Password], [Email], [Token], [Img], [IsApproved], [CreatedDate], [CreatedTime], [Address], [Location], [Latitude], [Longitude]) VALUES (18, N'Nabeel khan', N'03120290066', N'MXycF+EycmROHtef+KNap+tN2UeRzwE2OZdB8wDEu8g=', N'bsndndnndndnns@gmail.com', N'VmVuZG9yLFJpZGVyLFVzZXI6MDMxMjAyOTAwNjZyYWl6YWRhMTI=', N'/ShopImgs/03120290066.jpg', 1, CAST(N'2020-10-26' AS Date), CAST(N'19:23:49.6190173' AS Time), N'Jutland St, Central Jacob Lines Jat Land Lines, Ka', N'Jutland St, Central Jacob Lines Jat Land Lines, Karachi, Karachi City, Sindh, Pakistan', CAST(24.86738530 AS Decimal(10, 8)), CAST(67.04521850 AS Decimal(11, 8)))
INSERT [dbo].[Shops] ([ID], [Name], [Number], [Password], [Email], [Token], [Img], [IsApproved], [CreatedDate], [CreatedTime], [Address], [Location], [Latitude], [Longitude]) VALUES (19, N'shehroz', N'03002841180', N'shaikh123', N'shehrozshakh37@gmail.com', N'VmVuZG9yLFJpZGVyLFVzZXI6MDMwMDI4NDExODBzaGVocm96MTE=', N'/ShopImgs/03002841180.jpg', 1, CAST(N'2020-10-26' AS Date), CAST(N'20:29:27.3045311' AS Time), N'Block 14 Gulistan-e-Johar, Karachi, Karachi City, ', N'Block 14 Gulistan-e-Johar, Karachi, Karachi City, Sindh, Block 14 Gulistan-e-Johar, Karachi, Karachi City, Sindh, Pakistan', CAST(24.91987840 AS Decimal(10, 8)), CAST(67.13208450 AS Decimal(11, 8)))
INSERT [dbo].[Shops] ([ID], [Name], [Number], [Password], [Email], [Token], [Img], [IsApproved], [CreatedDate], [CreatedTime], [Address], [Location], [Latitude], [Longitude]) VALUES (20, N'Chase Up Value Centre', N'03102685620', N'MXycF+EycmROHtef+KNap+tN2UeRzwE2OZdB8wDEu8g=', N'abc123@gmail.com', N'VmVuZG9yLFJpZGVyLFVzZXI6MDMxMDI2ODU2MjByYWl6YWRhMTI=', N'invalid file', 1, CAST(N'2020-11-07' AS Date), CAST(N'09:54:17.9918139' AS Time), N'Plot 27/1 V, P.E.C.H.S Block 2 Block 2 PECHS, Kara', N'Plot 27/1 V, P.E.C.H.S Block 2 Block 2 PECHS, Karachi, Karachi City, Sindh, Pakistan', CAST(24.86478720 AS Decimal(10, 8)), CAST(67.04827820 AS Decimal(11, 8)))
INSERT [dbo].[Shops] ([ID], [Name], [Number], [Password], [Email], [Token], [Img], [IsApproved], [CreatedDate], [CreatedTime], [Address], [Location], [Latitude], [Longitude]) VALUES (21, N'new user', N'09876543210', N'ADX4VeuwJ0BAoXSOXntYdAjr0CMni4/DuqJUOMeJYRY=', N'mubbashir126@gmail.com', N'VmVuZG9yLFJpZGVyLFVzZXI6MDk4NzY1NDMyMTAxMjM0NTY3ODk=', N'/ShopImgs/09876543210.jpg', 1, CAST(N'2020-11-08' AS Date), CAST(N'13:44:36.6859144' AS Time), N'Plot C, 4/22, Block 5 Block 5 C Block 5 Nazimabad,', N'Plot C, 4/22, Block 5 Block 5 C Block 5 Nazimabad, Karachi, Karachi City, Sindh 74600, Pakistan', CAST(24.92135430 AS Decimal(10, 8)), CAST(67.02736300 AS Decimal(11, 8)))
INSERT [dbo].[Shops] ([ID], [Name], [Number], [Password], [Email], [Token], [Img], [IsApproved], [CreatedDate], [CreatedTime], [Address], [Location], [Latitude], [Longitude]) VALUES (22, N'crash', N'03333333333', N'ADX4VeuwJ0BAoXSOXntYdMc1HEsveT0UCFjhyeGCArM=', N'checkincrash@crash.com', N'VmVuZG9yLFJpZGVyLFVzZXI6MDMzMzMzMzMzMzMxMjM0NTY3ODkw', N'/ShopImgs/03333333333.jpg', 0, CAST(N'2020-11-11' AS Date), CAST(N'09:46:16.8546082' AS Time), N'Plot C 13/2B, Block 3 Nazimabad, Karachi, Karachi ', N'Plot C 13/2B, Block 3 Nazimabad, Karachi, Karachi City, Sindh 74600, Pakistan', CAST(24.92044220 AS Decimal(10, 8)), CAST(67.02835660 AS Decimal(11, 8)))
INSERT [dbo].[Shops] ([ID], [Name], [Number], [Password], [Email], [Token], [Img], [IsApproved], [CreatedDate], [CreatedTime], [Address], [Location], [Latitude], [Longitude]) VALUES (23, N'syed store', N'03342764736', N'WcHwUTH33PRFVVr+sc0TBtTfcZ5A4SPf11lL6AL2ctE=', N'syedmuhammadtaha6@gmail.com', N'VmVuZG9yLFJpZGVyLFVzZXI6MDMzNDI3NjQ3MzZhYmMxMjM=', N'/ShopImgs/03342764736.jpg', 1, CAST(N'2020-11-11' AS Date), CAST(N'10:11:31.7525681' AS Time), N'Plot A 59, Block 13 C Gulshan-e-Iqbal, Karachi, Ka', N'Plot A 59, Block 13 C Gulshan-e-Iqbal, Karachi, Karachi City, Sindh, Pakistan', CAST(24.91234210 AS Decimal(10, 8)), CAST(67.08571560 AS Decimal(11, 8)))
INSERT [dbo].[Shops] ([ID], [Name], [Number], [Password], [Email], [Token], [Img], [IsApproved], [CreatedDate], [CreatedTime], [Address], [Location], [Latitude], [Longitude]) VALUES (1023, N'riderNew', N'07896541230', N'ADX4VeuwJ0BAoXSOXntYdJQJoRd61V+N/TNePnJfu38=', N'mubbashir126@gmail.com', N'VmVuZG9yLFJpZGVyLFVzZXI6MDc4OTY1NDEyMzAxMjM0NTY3OA==', N'/ShopImgs/07896541230.png', 1, CAST(N'2020-11-12' AS Date), CAST(N'08:31:33.5923879' AS Time), N'Plot C 4/23A, Block 5 Block 5 C Block 5 Nazimabad,', N'Plot C 4/23A, Block 5 Block 5 C Block 5 Nazimabad, Karachi, Karachi City, Sindh 74600, Pakistan', CAST(24.92133700 AS Decimal(10, 8)), CAST(67.02736470 AS Decimal(11, 8)))
SET IDENTITY_INSERT [dbo].[Shops] OFF
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([ID], [Status]) VALUES (1, N'Order Sent To The Shop')
INSERT [dbo].[Status] ([ID], [Status]) VALUES (2, N'Approved By Shop')
INSERT [dbo].[Status] ([ID], [Status]) VALUES (3, N'Approved By Rider')
INSERT [dbo].[Status] ([ID], [Status]) VALUES (4, N'On The Way')
INSERT [dbo].[Status] ([ID], [Status]) VALUES (5, N'Delievered')
SET IDENTITY_INSERT [dbo].[Status] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [Name], [Number], [Password], [Email], [Token], [CreatedDate], [CreatedTime], [Img]) VALUES (1, N'Hafiz Muhammad Hamza Khan', N'03423519691', N'ADX4VeuwJ0BAoXSOXntYdMc1HEsveT0UCFjhyeGCArM=', N'hamza.khan8910@gmail.com', N'VXNlcjowMzQyMzUxOTY5MWRod3cvdXJEVnJZbzFKS3ZGc01vd0lUUmlNRzlhMGo0bkd2YmdoZEVNUzA9', CAST(N'2020-10-04' AS Date), CAST(N'17:52:01.4895790' AS Time), N'-')
INSERT [dbo].[Users] ([ID], [Name], [Number], [Password], [Email], [Token], [CreatedDate], [CreatedTime], [Img]) VALUES (2, N'Syed Muhammad Mubashir Ali Zaidi', N'03423519692', N'ADX4VeuwJ0BAoXSOXntYdMc1HEsveT0UCFjhyeGCArM=', N'hamza.khan8910@gmail.com', N'VXNlcjowMzQyMzUxOTY5MlRQcndRNUMzd0VTUTRsOUVlRjBoT1RTRk1rWTNubklvbHk3c1pvOENtZ009', CAST(N'2020-10-04' AS Date), CAST(N'18:03:02.2689895' AS Time), N'-')
INSERT [dbo].[Users] ([ID], [Name], [Number], [Password], [Email], [Token], [CreatedDate], [CreatedTime], [Img]) VALUES (3, N'string', N'03432849689', N'Wj7VoVOy/+7ytLNAvim/Yw==', N'string@gmail.com', N'VXNlcjowMzQzMjg0OTY4OVdqN1ZvVk95Lys3eXRMTkF2aW0vWXc9PQ==', CAST(N'2020-10-13' AS Date), CAST(N'12:23:42.5926199' AS Time), N'-')
INSERT [dbo].[Users] ([ID], [Name], [Number], [Password], [Email], [Token], [CreatedDate], [CreatedTime], [Img]) VALUES (4, N'Osama ', N'03211234567', N'oTh2LWKdCAoDIm43tHSs9wh0Q13eX7+i6+T+DJWS9ss=', N'osama@gmail.com', N'VXNlcjowMzIxMTIzNDU2N29UaDJMV0tkQ0FvREltNDN0SFNzOXdoMFExM2VYNytpNitUK0RKV1M5c3M9', CAST(N'2020-10-16' AS Date), CAST(N'12:09:46.4632904' AS Time), N'-')
INSERT [dbo].[Users] ([ID], [Name], [Number], [Password], [Email], [Token], [CreatedDate], [CreatedTime], [Img]) VALUES (5, N'hh', N'0987654321', N'0Vz9ds3J6KDrAi80UuEdqNlMHhd+XV76r3kqqGuP+ic=', N'g', N'VXNlcjowOTg3NjU0MzIxMFZ6OWRzM0o2S0RyQWk4MFV1RWRxTmxNSGhkK1hWNzZyM2txcUd1UCtpYz0=', CAST(N'2020-10-25' AS Date), CAST(N'01:02:32.9256913' AS Time), N'-')
INSERT [dbo].[Users] ([ID], [Name], [Number], [Password], [Email], [Token], [CreatedDate], [CreatedTime], [Img]) VALUES (6, N'ali', N'0345678914165', N'svkLRj9nYEgZo7gWDJD5IQ==', N'ali@email.com', N'VXNlcjowMzQ1Njc4OTE0MTY1c3ZrTFJqOW5ZRWdabzdnV0RKRDVJUT09', CAST(N'2020-10-26' AS Date), CAST(N'00:44:14.6256328' AS Time), N'-')
INSERT [dbo].[Users] ([ID], [Name], [Number], [Password], [Email], [Token], [CreatedDate], [CreatedTime], [Img]) VALUES (7, N'ali', N'03432849698', N'ADX4VeuwJ0BAoXSOXntYdJQJoRd61V+N/TNePnJfu38=', N'mubbashir126@gmail.com', N'VXNlcjowMzQzMjg0OTY5OEFEWDRWZXV3SjBCQW9YU09YbnRZZEpRSm9SZDYxVitOL1ROZVBuSmZ1Mzg9', CAST(N'2020-10-26' AS Date), CAST(N'05:52:18.2268853' AS Time), N'-')
INSERT [dbo].[Users] ([ID], [Name], [Number], [Password], [Email], [Token], [CreatedDate], [CreatedTime], [Img]) VALUES (8, N'Hamza Khan', N'03423519669', N'ADX4VeuwJ0BAoXSOXntYdMc1HEsveT0UCFjhyeGCArM=', N'hamza.khan8910@gmail.com', N'VXNlcjowMzQyMzUxOTY2OUFEWDRWZXV3SjBCQW9YU09YbnRZZEpRSm9SZDYxVitOL1ROZVBuSmZ1Mzg9', CAST(N'2020-10-26' AS Date), CAST(N'10:57:04.1525994' AS Time), N'-')
INSERT [dbo].[Users] ([ID], [Name], [Number], [Password], [Email], [Token], [CreatedDate], [CreatedTime], [Img]) VALUES (9, N'sufwn', N'03423579689', N'ADX4VeuwJ0BAoXSOXntYdAjr0CMni4/DuqJUOMeJYRY=', N'mubbashir126@gmail.com', N'VXNlcjowMzQyMzU3OTY4OUFEWDRWZXV3SjBCQW9YU09YbnRZZEFqcjBDTW5pNC9EdXFKVU9NZUpZUlk9', CAST(N'2020-10-27' AS Date), CAST(N'03:18:45.0783209' AS Time), N'-')
INSERT [dbo].[Users] ([ID], [Name], [Number], [Password], [Email], [Token], [CreatedDate], [CreatedTime], [Img]) VALUES (10, N'qutub', N'03432859689', N'ADX4VeuwJ0BAoXSOXntYdJQJoRd61V+N/TNePnJfu38=', N'mubbashir126@gmail.com', N'VXNlcjowMzQzMjg1OTY4OUFEWDRWZXV3SjBCQW9YU09YbnRZZEpRSm9SZDYxVitOL1ROZVBuSmZ1Mzg9', CAST(N'2020-10-28' AS Date), CAST(N'12:57:57.4778371' AS Time), N'-')
INSERT [dbo].[Users] ([ID], [Name], [Number], [Password], [Email], [Token], [CreatedDate], [CreatedTime], [Img]) VALUES (11, N'yousuf', N'03431234567', N'ADX4VeuwJ0BAoXSOXntYdJQJoRd61V+N/TNePnJfu38=', N'mubbashir126@gmail.com', N'VXNlcjowMzQzMTIzNDU2N0FEWDRWZXV3SjBCQW9YU09YbnRZZEpRSm9SZDYxVitOL1ROZVBuSmZ1Mzg9', CAST(N'2020-10-30' AS Date), CAST(N'06:16:55.5323384' AS Time), N'-')
INSERT [dbo].[Users] ([ID], [Name], [Number], [Password], [Email], [Token], [CreatedDate], [CreatedTime], [Img]) VALUES (12, N'ahmed', N'03341234567', N'ADX4VeuwJ0BAoXSOXntYdAjr0CMni4/DuqJUOMeJYRY=', N'mubbashir126@gmail.com', N'VXNlcjowMzM0MTIzNDU2N0FEWDRWZXV3SjBCQW9YU09YbnRZZEFqcjBDTW5pNC9EdXFKVU9NZUpZUlk9', CAST(N'2020-11-02' AS Date), CAST(N'03:36:17.9599877' AS Time), N'-')
INSERT [dbo].[Users] ([ID], [Name], [Number], [Password], [Email], [Token], [CreatedDate], [CreatedTime], [Img]) VALUES (13, N'shehroz', N'03002841180', N'/nKWMtCb+nRS7chj3ekeNCJpiaSewdaeG36WdI/PKF0=', N'ss@gmail.com', N'VXNlcjowMzAwMjg0MTE4MC9uS1dNdENiK25SUzdjaGozZWtlTkNKcGlhU2V3ZGFlRzM2V2RJL1BLRjA9', CAST(N'2020-11-04' AS Date), CAST(N'04:45:22.3999705' AS Time), N'-')
INSERT [dbo].[Users] ([ID], [Name], [Number], [Password], [Email], [Token], [CreatedDate], [CreatedTime], [Img]) VALUES (14, N'Nabeel khan', N'03102685620', N'0Zk4ryetSQyBxvwJlZDFZ3vbyW/DQaga8hxlwQojQ/Y=', N'abc123@gmail.com', N'VXNlcjowMzEwMjY4NTYyMDBaazRyeWV0U1F5Qnh2d0psWkRGWjN2YnlXL0RRYWdhOGh4bHdRb2pRL1k9', CAST(N'2020-11-04' AS Date), CAST(N'04:51:27.6249642' AS Time), N'-')
INSERT [dbo].[Users] ([ID], [Name], [Number], [Password], [Email], [Token], [CreatedDate], [CreatedTime], [Img]) VALUES (15, N'Syed Muhammad taha', N'03342764736', N'WcHwUTH33PRFVVr+sc0TBtTfcZ5A4SPf11lL6AL2ctE=', N'syedmuhammadtaha6@gmail.com', N'VXNlcjowMzM0Mjc2NDczNldjSHdVVEgzM1BSRlZWcitzYzBUQnRUZmNaNUE0U1BmMTFsTDZBTDJjdEU9', CAST(N'2020-11-05' AS Date), CAST(N'19:34:29.6731902' AS Time), N'-')
INSERT [dbo].[Users] ([ID], [Name], [Number], [Password], [Email], [Token], [CreatedDate], [CreatedTime], [Img]) VALUES (16, N'shehroz', N'03002841181', N'XIC2hbQG7h+LNOkqzlEz4AVeJU/ePtmN2GVlVvjE/+E=', N'ss@gmail.com', N'VXNlcjowMzAwMjg0MTE4MVhJQzJoYlFHN2grTE5Pa3F6bEV6NEFWZUpVL2VQdG1OMkdWbFZ2akUvK0U9', CAST(N'2020-11-09' AS Date), CAST(N'05:47:41.1147936' AS Time), N'-')
INSERT [dbo].[Users] ([ID], [Name], [Number], [Password], [Email], [Token], [CreatedDate], [CreatedTime], [Img]) VALUES (17, N'Nabeel khan', N'03120290066', N'MXycF+EycmROHtef+KNap+tN2UeRzwE2OZdB8wDEu8g=', N'khannabeel03120290066@gmail.com', N'VXNlcjowMzEyMDI5MDA2Nk1YeWNGK0V5Y21ST0h0ZWYrS05hcCt0TjJVZVJ6d0UyT1pkQjh3REV1OGc9', CAST(N'2020-11-11' AS Date), CAST(N'08:25:29.0681144' AS Time), N'-')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UserTypes] ON 

INSERT [dbo].[UserTypes] ([ID], [UserType]) VALUES (1, N'Admin')
INSERT [dbo].[UserTypes] ([ID], [UserType]) VALUES (2, N'Shop')
INSERT [dbo].[UserTypes] ([ID], [UserType]) VALUES (3, N'User')
INSERT [dbo].[UserTypes] ([ID], [UserType]) VALUES (4, N'Rider')
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
ALTER TABLE [dbo].[OrderProducts]  WITH CHECK ADD  CONSTRAINT [FK_OrderProducts_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderProducts] CHECK CONSTRAINT [FK_OrderProducts_Orders]
GO
ALTER TABLE [dbo].[OrderProducts]  WITH CHECK ADD  CONSTRAINT [FK_OrderProducts_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[OrderProducts] CHECK CONSTRAINT [FK_OrderProducts_Products]
GO
ALTER TABLE [dbo].[OrderRoutes]  WITH CHECK ADD  CONSTRAINT [FK_OrderRoutes_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderRoutes] CHECK CONSTRAINT [FK_OrderRoutes_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Riders] FOREIGN KEY([RiderID])
REFERENCES [dbo].[Riders] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Riders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shops] FOREIGN KEY([ShopID])
REFERENCES [dbo].[Shops] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shops]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Status]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ShopCategories] FOREIGN KEY([ShopCatID])
REFERENCES [dbo].[ShopCategories] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ShopCategories]
GO
ALTER TABLE [dbo].[ShopCategories]  WITH CHECK ADD  CONSTRAINT [FK_ShopCategories_Categories] FOREIGN KEY([CatID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[ShopCategories] CHECK CONSTRAINT [FK_ShopCategories_Categories]
GO
ALTER TABLE [dbo].[ShopCategories]  WITH CHECK ADD  CONSTRAINT [FK_ShopCategories_Shops] FOREIGN KEY([ShopID])
REFERENCES [dbo].[Shops] ([ID])
GO
ALTER TABLE [dbo].[ShopCategories] CHECK CONSTRAINT [FK_ShopCategories_Shops]
GO
/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCategory]
 
@CategoryName	nvarchar(50)	,
@CategoryImg	nvarchar(50)	,
@IsApproved	bit	,
@AddedBy	int	

AS
BEGIN

insert into Categories (CategoryName, CategoryImg, IsApproved, AddedBy) values (@CategoryName, @CategoryImg, @IsApproved, @AddedBy)
insert into ShopCategories (CatID, ShopID) values ((select Max(ID) from Categories), @AddedBy)


END
GO
/****** Object:  StoredProcedure [dbo].[spAddCurrentRiderLocation]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spAddCurrentRiderLocation]

@OrderID	int	,
@Latitude	decimal(10, 8),
@Longitude	decimal(11, 8)	

AS
BEGIN

insert into OrderRoutes (OrderID, Latitude, Longitude) values (@OrderID, @Latitude, @Longitude)

END
GO
/****** Object:  StoredProcedure [dbo].[spAddProduct]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAddProduct]

@CatID	int	,
@ShopID	int	,
@Name	nvarchar(50)	,
@Img	nvarchar(50)	,
@Price	decimal(18, 2)	,
@Unit	nvarchar(20)	,
@IsApproved	nvarchar(50)	,
@CreatedDate	date	,
@CreatedTime	time(7)	

AS
BEGIN
declare  @ShopCatID int = (SELECT ID FROM ShopCategories WHERE ShopID = @ShopID and CatID = @CatID)
IF(@ShopCatID = 0 or @ShopCatID is null)
BEGIN
insert into ShopCategories (ShopID, CatID) values (@ShopID, @CatID) 
set @ShopCatID = (select Max(ID) from ShopCategories)
END

insert into Products (ShopCatID, Name, Img, Price, Unit, IsApproved, CreatedDate, CreatedTime) 
		values (@ShopCatID, @Name, @Img, @Price, @Unit, @IsApproved, @CreatedDate, @CreatedTime)

END
GO
/****** Object:  StoredProcedure [dbo].[spAddUpdateRating]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spAddUpdateRating] 

@UserID int,
@ProductID int,
@ReviewOn datetime, 
@Rating int, 
@Comments nvarchar(255)

AS
declare @ID int = (select ID from ProductReviews where UserID = @UserID and ProductID = @ProductID)
if(@ID is null) 
BEGIN
insert into ProductReviews (ProductID, UserID, ReviewOn, Rating, Comments) values(@ProductID, @UserID, @ReviewOn, @Rating, @Comments)
END

else
begin
update ProductReviews
set ReviewOn = @ReviewOn, Rating = @Rating
where ID = @ID 
end
GO
/****** Object:  StoredProcedure [dbo].[spAdminLogin]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spAdminLogin]

@Number nvarchar(50),
@Password nvarchar(MAX)

AS
BEGIN
	
select * from Admins where Number = @Number and Password = @Password

END
GO
/****** Object:  StoredProcedure [dbo].[spAdminRegistration]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAdminRegistration]

@Number	nvarchar(50)	,
@Password	nvarchar(MAX)	,
@Name	nvarchar(50)	,
@Email	nvarchar(50)	,
@Token	nvarchar(MAX)	

AS
BEGIN

insert into Admins (Number, Password, Name, Email, Token) values (@Number, @Password, @Name, @Email, @Token)

END
GO
/****** Object:  StoredProcedure [dbo].[spApproveShopByID]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spApproveShopByID]

@ID int

AS
BEGIN

update Shops
set IsApproved = 1
where ID = @ID

END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllCategoriesByShopID]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetAllCategoriesByShopID] 

@ShopID int

AS
BEGIN

select cat.*, sp.ID as ShopCatID from Categories cat
join ShopCategories sp on cat.ID =sp.CatId
where sp.ShopID = @ShopID and IsApproved = 1

END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllProductsByShopCatID]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllProductsByShopCatID] 

@ShopCatID int

AS
BEGIN

Select * from Products where ShopCatID = @ShopCatID and IsApproved = 1

END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllShops]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetAllShops] 
 
AS
BEGIN

select * from Shops

END
GO
/****** Object:  StoredProcedure [dbo].[spGetApprovedOrders]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetApprovedOrders]
	
@ID int

AS
BEGIN


select 
ordrs.ID as OrderID,
(select [Name] from Users where ID = ordrs.UserID) as UserName,
(select [Number] from Users where ID = ordrs.UserID) as UserNumber,
(select isnull([Name], '-') from Riders where ID = ordrs. RiderID) as RiderName,
(select isnull([Number], '-') from Riders where ID = ordrs. RiderID) as RiderNumber,
(select isnull([Img], '-') from Riders where ID = ordrs. RiderID) as RiderImg,
(select [Name] from Shops where ID = ordrs.ShopID) as ShopName,
(select Img from Shops where ID = ordrs.ShopID) as ShopImg,
(select Latitude from Shops where ID = ordrs.ShopID) as ShopLat,
(select Longitude from Shops where ID = ordrs.ShopID) as ShopLang,
(select Address from Shops where ID = ordrs.ShopID) as ShopAddress,
(select [Status] from Status where ID = ordrs.StatusID) as StatusName,
(Select SUBSTRING( 
(SELECT ', ' + CONVERT(varchar, Quantity) + 'x ' + (Select [Name] from Products where ID = ProductID) AS 'data()'
         FROM OrderProducts 
		 where OrderID = ordrs.ID
		 FOR XML PATH('') 
), 2 , 9999)) As ProductDetails,
ordrs.TotalPrice,
ordrs.Latitude as UserLat,
ordrs.Longitude as UserLang,
ordrs.[Location] as UserLocation,
ordrs.CreatedTime as OrderTime,
ordrs.CreatedDate as OrderDate
from Orders ordrs



where ordrs.IsApproved = 1 


END
GO
/****** Object:  StoredProcedure [dbo].[spGetApprovedShops]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetApprovedShops]

AS
BEGIN

Select * from Shops where IsApproved = 1

END
GO
/****** Object:  StoredProcedure [dbo].[spGetCategories]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetCategories]

AS
BEGIN
	select cat.*, sp.ID as ShopCatID from Categories cat join ShopCategories sp on cat.ID = sp.CatID
END
GO
/****** Object:  StoredProcedure [dbo].[spGetCurrentRiderLocation]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetCurrentRiderLocation] 

@OrderID int

AS
BEGIN

Select * from OrderRoutes where ID = (select MAX(ID) from OrderRoutes where OrderID = @OrderID)

END
GO
/****** Object:  StoredProcedure [dbo].[spGetOrderDetailsByID]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetOrderDetailsByID]

@OrderID int 

AS
BEGIN

select 

ordrs.ID as 'OrderID',
ordrs.TotalPrice,
ordrs.CreatedDate as 'OrderDate',
ordrs.CreatedTime as 'OrderTime',
ordrs.IsApproved as  'IsApprovedOrder',
ordrs.Location as  'OrderLocation',
ordrs.Latitude as  'OrderLat',
ordrs.Longitude as  'OrderLang',

usr.ID as 'UserID',
usr.Name as 'FullName',
usr.Number as 'UserNumber',
usr.Email as 'Email',

shp.Name as 'ShopName',
shp.img as 'ShopImg',
shp.Latitude as 'ShopLat',
shp.Longitude as 'ShopLang',
shp.Address as 'ShopAddress',
shp.Number as 'ShopNumber',

ordrs.StatusID As 'StatusID',
(select [Status] from Status where ID = ordrs.StatusID) as 'StatusName',

(select isnull([Name], '-') from Riders where ID = ordrs. RiderID) as 'RiderName',

(Select SUBSTRING( 
(SELECT ', ' + CONVERT(varchar, Quantity) + ' x   ' + (Select [Name] from Products where ID = ProductID) AS 'data()'
         FROM OrderProducts 
		 where OrderID = ordrs.ID
		 FOR XML PATH('') 
), 2 , 9999)) As 'ProductDetails'


from Orders ordrs

inner join Users usr on usr.ID = ordrs.UserID
inner join Shops shp on shp.ID = ordrs.ShopID

where ordrs.ID = @OrderID


END
GO
/****** Object:  StoredProcedure [dbo].[spGetOrdersByRiderID]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetOrdersByRiderID]

@ID int

AS
BEGIN

select 
ordrs.ID as OrderID,
(select [Name] from Users where ID = ordrs.UserID) as UserName,
(select [Number] from Users where ID = ordrs.UserID) as UserNumber,
(select [Name] from Shops where ID = ordrs.ShopID) as ShopName,
(select Img from Shops where ID = ordrs.ShopID) as ShopImg,
(select Latitude from Shops where ID = ordrs.ShopID) as ShopLat,
(select Longitude from Shops where ID = ordrs.ShopID) as ShopLang,
(select Address from Shops where ID = ordrs.ShopID) as ShopAddress,
ordrs.StatusID As StatusID,
(select [Status] from Status where ID = ordrs.StatusID) as StatusName,
(Select SUBSTRING( 
(SELECT ', ' + CONVERT(varchar, Quantity) + 'x ' + (Select [Name] from Products where ID = ProductID) AS 'data()'
         FROM OrderProducts 
		 where OrderID = ordrs.ID
		 FOR XML PATH('') 
), 2 , 9999)) As ProductDetails,
ordrs.TotalPrice,
ordrs.Latitude as UserLat,
ordrs.Longitude as UserLang,
ordrs.[Location] as UserLocation,
ordrs.CreatedTime as OrderTime,
ordrs.CreatedDate as OrderDate,
ordrs.IsApproved as IsApprovedOrder
from Orders ordrs

inner join Riders rs on rs.ID = ordrs.RiderID

where rs.ID = @ID 

END
GO
/****** Object:  StoredProcedure [dbo].[spGetOrdersByShopID]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetOrdersByShopID] 

@ID int

AS
BEGIN
	
select ordrs.ID as OrderID,
(select [Name] from Users where ID = ordrs.UserID) as UserName,
(select [Number] from Users where ID = ordrs.UserID) as UserNumber,
(select isnull([Name], '-') from Riders where ID = ordrs. RiderID) as RiderName,
(select isnull([Number], '-') from Riders where ID = ordrs. RiderID) as RiderNumber,
(select isnull([Img], '-') from Riders where ID = ordrs. RiderID) as RiderImg,
ordrs.StatusID As StatusID,
(select [Status] from Status where ID = ordrs.StatusID) as StatusName,
(Select SUBSTRING( 
(SELECT ', ' + CONVERT(varchar, Quantity) + 'x ' + (Select [Name] from Products where ID = ProductID) AS 'data()' FROM OrderProducts 
		 where OrderID = ordrs.ID
		 FOR XML PATH('') 
), 2 , 9999)) As ProductDetails,
ordrs.TotalPrice,
ordrs.Latitude as UserLat,
ordrs.Longitude as UserLang,
ordrs.[Location] as UserLocation,
ordrs.CreatedTime as OrderTime,
ordrs.CreatedDate as OrderDate,
ordrs.IsApproved as IsApprovedOrder

from Orders ordrs
inner join Shops sp on sp.ID = ordrs.ShopID
where sp.ID = @ID 

END
GO
/****** Object:  StoredProcedure [dbo].[spGetOrdersByUserID]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetOrdersByUserID]

@ID int

AS
BEGIN

select 
ordrs.ID as OrderID,
(select [Name] from Shops where ID = ordrs.ShopID) as ShopName,
(select Img from Shops where ID = ordrs.ShopID) as ShopImg,
(select Latitude from Shops where ID = ordrs.ShopID) as ShopLat,
(select Longitude from Shops where ID = ordrs.ShopID) as ShopLang,
(select Address from Shops where ID = ordrs.ShopID) as ShopAddress,
(select isnull([Name], '-') from Riders where ID = ordrs. RiderID) as RiderName,
ordrs.StatusID As StatusID,
(select [Status] from Status where ID = ordrs.StatusID) as StatusName,
(Select SUBSTRING( 
(SELECT ', ' + CONVERT(varchar, Quantity) + 'x ' + (Select [Name] from Products where ID = ProductID) AS 'data()'
         FROM OrderProducts 
		 where OrderID = ordrs.ID
		 FOR XML PATH('') 
), 2 , 9999)) As ProductDetails,
ordrs.TotalPrice,
ordrs.CreatedDate as OrderDate,
ordrs.CreatedTime as OrderTime,
ordrs.IsApproved as IsApprovedOrder

from Orders ordrs

inner join Users usr on usr.ID = ordrs.UserID

where usr.ID = @ID 

END
GO
/****** Object:  StoredProcedure [dbo].[spGetProductsByShopID]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetProductsByShopID]

@ID int

AS
BEGIN

select p.*, (select CategoryName from Categories where ID = (select ID from ShopCategories where ID = p.ShopCatID)) from Products p join ShopCategories sc on sc.ID = p.ShopCatID where sc.ShopID = @ID

END
GO
/****** Object:  StoredProcedure [dbo].[spGetRiderLocationByID]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetRiderLocationByID] 

@OrderID int

AS
BEGIN

select top 1 * from OrderRoutes where OrderID = @OrderID order by ID asc

END
GO
/****** Object:  StoredProcedure [dbo].[spRiderLogin]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRiderLogin]

@Number nvarchar(50),
@Password nvarchar(MAX)

AS
BEGIN
DECLARE @ID int = (SELECT ID FROM Riders WHERE Number = @Number and Password = @Password)
IF(@ID is null)
BEGIN
SELECT 'Invalid Username or Password' as ResponseMsg
END

ELSE
BEGIN
DECLARE @IsApproved bit = (select IsApproved from Riders where ID = @ID)
IF(@IsApproved = 0)
BEGIN
SELECT 'Your are not approved yet' 
END

ELSE
BEGIN
Select * from Riders where ID = @ID
END
END

End
GO
/****** Object:  StoredProcedure [dbo].[spRiderRegistration]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRiderRegistration]

@Name	nvarchar(50)	,
@Password	nvarchar(MAX)	,
@Email	nvarchar(50)	,
@Number	nvarchar(50)	,
@Token	nvarchar(MAX)	,
@Img	nvarchar(50)	,
@IsApproved	bit	,
@CreatedDate	date	,
@CreatedTime	time(7)	

AS
BEGIN

insert into Riders (Name, Password, Email, Number, Token, IsApproved, Img, CreatedDate, CreatedTime) 
		values (@Name, @Password, @Email, @Number, @Token, @IsApproved, @Img, @CreatedDate, @CreatedTime)

END
GO
/****** Object:  StoredProcedure [dbo].[spShopLogin]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spShopLogin] 

@Number nvarchar(50),
@Password nvarchar(MAX)

AS
BEGIN
DECLARE @ID int = (SELECT ID FROM Shops WHERE Number = @Number and Password = @Password)
IF(@ID is null)
BEGIN
SELECT 'Invalid Username or Password' as ResponseMsg
END

ELSE
BEGIN
DECLARE @IsApproved bit = (select IsApproved from Shops where ID = @ID)
IF(@IsApproved = 0)
BEGIN
SELECT 'Your shop is not approved yet' 
END

ELSE
BEGIN
Select * from Shops where ID = @ID
END

END

End
GO
/****** Object:  StoredProcedure [dbo].[spShopRegistration]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spShopRegistration]

@Name	nvarchar(50)	,
@Number	nvarchar(14)	,
@Password	nvarchar(MAX),
@Email	nvarchar(50)	,
@Img	nvarchar(200)	,
@IsApproved	bit	,
@CreatedDate	date	,
@CreatedTime	time(7)	,
@Address	nvarchar(50),
@Token nvarchar(MAX),
@Location	nvarchar(200)	,
@Latitude	decimal(10, 8)	,
@Longitude	decimal(11, 8)	

AS
BEGIN

insert into Shops (Name, Number, Password, Email, Img, IsApproved, CreatedDate, CreatedTime, Address, Token, Location, Latitude, Longitude) 
			values (@Name, @Number, @Password, @Email, @Img, @IsApproved, @CreatedDate, @CreatedTime, @Address, @Token, @Location, @Latitude, @Longitude)

END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateApproveShop]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateApproveShop]

@ID int

AS
BEGIN

update Shops
set IsApproved = 1
where ID = @ID

END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateShopLocation]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateShopLocation]

@ID int,
@Location	nvarchar(200)	,
@Latitude	decimal(10, 8)	,
@Longitude	decimal(11, 8)	


AS
BEGIN

update Shops
set Location = @Location, Latitude = @Latitude, Longitude = @Longitude
where ID = @ID

END
GO
/****** Object:  StoredProcedure [dbo].[spUserLogin]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUserLogin]

@Number nvarchar(50),
@Password nvarchar(MAX)

AS
BEGIN
	
select * from Users where Number = @Number and Password = @Password

END
GO
/****** Object:  StoredProcedure [dbo].[spUserRegistration]    Script Date: 7/4/2023 11:50:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUserRegistration]

@Name	nvarchar(50)	,
@Password	nvarchar(MAX)	,
@Email	nvarchar(50)	,
@Number	nvarchar(50)	,
@CreatedDate	date	,
@CreatedTime	time(7)	,
@Token	nvarchar(MAX)	,
@Img	nvarchar(50)	
		

AS
BEGIN

insert into Users (Name, Password, Email, Number, CreatedDate, CreatedTime, Img,Token) values (@Name, @Password, @Email, @Number, @CreatedDate, @CreatedTime, @Img,@Token)


END
GO
USE [master]
GO
ALTER DATABASE [wemartzDB] SET  READ_WRITE 
GO
