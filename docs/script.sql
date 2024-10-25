USE [master]
GO
/****** Object:  Database [Trades]    Script Date: 25.10.2024 14:33:47 ******/
CREATE DATABASE [Trades]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'trade4', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\trade4.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'trade4_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\trade4_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Trades] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trades].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trades] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trades] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trades] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trades] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trades] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trades] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Trades] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trades] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trades] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trades] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trades] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trades] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trades] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trades] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trades] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Trades] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trades] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trades] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trades] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trades] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trades] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trades] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trades] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Trades] SET  MULTI_USER 
GO
ALTER DATABASE [Trades] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trades] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trades] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trades] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trades] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trades] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Trades] SET QUERY_STORE = ON
GO
ALTER DATABASE [Trades] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Trades]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 25.10.2024 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](max) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 25.10.2024 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Indexes]    Script Date: 25.10.2024 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Indexes](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Indexes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacture]    Script Date: 25.10.2024 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacture](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Manufacture] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 25.10.2024 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] NOT NULL,
	[IdClient] [int] NULL,
	[IdStatus] [int] NOT NULL,
	[DateOrder] [datetime] NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPoint] [int] NOT NULL,
	[CodeAsk] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 25.10.2024 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[ID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[IdProduct] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickPoint]    Script Date: 25.10.2024 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickPoint](
	[Id] [int] NOT NULL,
	[IdIndex] [int] NOT NULL,
	[IdCity] [int] NOT NULL,
	[IdStreet] [int] NOT NULL,
	[HouseNum] [int] NULL,
 CONSTRAINT [PK_PickPoint] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 25.10.2024 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] NOT NULL,
	[IdUnits] [int] NOT NULL,
	[IdProductName] [int] NOT NULL,
	[IdSupplier] [int] NOT NULL,
	[IdCategory] [int] NOT NULL,
	[Article] [nvarchar](50) NULL,
	[ProductDiscription] [nvarchar](1000) NOT NULL,
	[IdManufacturer] [int] NULL,
	[ProductCost] [decimal](19, 2) NOT NULL,
	[ProductDiscountAmount] [int] NOT NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[DiscountNow] [int] NULL,
	[PhotoName] [nvarchar](50) NULL,
	[ProductPhote] [image] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductName]    Script Date: 25.10.2024 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductName](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductName] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 25.10.2024 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusOrder]    Script Date: 25.10.2024 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StatusOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Street]    Script Date: 25.10.2024 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Street](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Street] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 25.10.2024 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Units]    Script Date: 25.10.2024 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Units](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameOfUnit] [nvarchar](max) NULL,
 CONSTRAINT [PK_Units] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 25.10.2024 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] NOT NULL,
	[IdUserRole] [int] NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__User__1788CCACAF2E2765] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Category]) VALUES (1, N'Для животных')
INSERT [dbo].[Category] ([Id], [Category]) VALUES (2, N'Товары для кошек')
INSERT [dbo].[Category] ([Id], [Category]) VALUES (3, N'Товары для собак')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[City] ([Id], [Name]) VALUES (1, N'г.Нефтеюганск')
GO
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (1, N'125061')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (2, N'125703')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (3, N'125837')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (4, N'190949')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (5, N'344288')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (6, N'394060')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (7, N'394242')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (8, N'394782')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (9, N'400562')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (10, N'410172')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (11, N'410542')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (12, N'410661')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (13, N'420151')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (14, N'426030')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (15, N'443890')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (16, N'450375')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (17, N'450558')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (18, N'450983')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (19, N'454311')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (20, N'603002')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (21, N'603036')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (22, N'603379')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (23, N'603721')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (24, N'614164')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (25, N'614510')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (26, N'614611')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (27, N'614753')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (28, N'620839')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (29, N'625283')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (30, N'625560')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (31, N'625590')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (32, N'625683')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (33, N'630201')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (34, N'630370')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (35, N'660007')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (36, N'660540')
GO
SET IDENTITY_INSERT [dbo].[Manufacture] ON 

INSERT [dbo].[Manufacture] ([Id], [Name]) VALUES (1, N'Cat Chow')
INSERT [dbo].[Manufacture] ([Id], [Name]) VALUES (2, N'Chappy')
INSERT [dbo].[Manufacture] ([Id], [Name]) VALUES (3, N'Dog Chow')
INSERT [dbo].[Manufacture] ([Id], [Name]) VALUES (4, N'Dreames')
INSERT [dbo].[Manufacture] ([Id], [Name]) VALUES (5, N'Fancy Pets')
INSERT [dbo].[Manufacture] ([Id], [Name]) VALUES (6, N'LIKER')
INSERT [dbo].[Manufacture] ([Id], [Name]) VALUES (7, N'Nobby')
INSERT [dbo].[Manufacture] ([Id], [Name]) VALUES (8, N'Pro Plan')
INSERT [dbo].[Manufacture] ([Id], [Name]) VALUES (9, N'TitBit')
INSERT [dbo].[Manufacture] ([Id], [Name]) VALUES (10, N'Triol')
INSERT [dbo].[Manufacture] ([Id], [Name]) VALUES (11, N'trixie')
INSERT [dbo].[Manufacture] ([Id], [Name]) VALUES (12, N'True Touch')
INSERT [dbo].[Manufacture] ([Id], [Name]) VALUES (13, N'ZooM')
SET IDENTITY_INSERT [dbo].[Manufacture] OFF
GO
INSERT [dbo].[Order] ([OrderID], [IdClient], [IdStatus], [DateOrder], [OrderDeliveryDate], [OrderPickupPoint], [CodeAsk]) VALUES (1, NULL, 2, CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2022-05-12T00:00:00.000' AS DateTime), 25, 601)
INSERT [dbo].[Order] ([OrderID], [IdClient], [IdStatus], [DateOrder], [OrderDeliveryDate], [OrderPickupPoint], [CodeAsk]) VALUES (2, NULL, 2, CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2022-05-12T00:00:00.000' AS DateTime), 20, 602)
INSERT [dbo].[Order] ([OrderID], [IdClient], [IdStatus], [DateOrder], [OrderDeliveryDate], [OrderPickupPoint], [CodeAsk]) VALUES (3, 9, 1, CAST(N'2022-05-08T00:00:00.000' AS DateTime), CAST(N'2022-05-14T00:00:00.000' AS DateTime), 22, 603)
INSERT [dbo].[Order] ([OrderID], [IdClient], [IdStatus], [DateOrder], [OrderDeliveryDate], [OrderPickupPoint], [CodeAsk]) VALUES (4, NULL, 1, CAST(N'2022-05-08T00:00:00.000' AS DateTime), CAST(N'2022-05-14T00:00:00.000' AS DateTime), 24, 604)
INSERT [dbo].[Order] ([OrderID], [IdClient], [IdStatus], [DateOrder], [OrderDeliveryDate], [OrderPickupPoint], [CodeAsk]) VALUES (5, NULL, 1, CAST(N'2022-05-10T00:00:00.000' AS DateTime), CAST(N'2022-05-16T00:00:00.000' AS DateTime), 25, 605)
INSERT [dbo].[Order] ([OrderID], [IdClient], [IdStatus], [DateOrder], [OrderDeliveryDate], [OrderPickupPoint], [CodeAsk]) VALUES (6, 7, 1, CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2022-05-17T00:00:00.000' AS DateTime), 28, 606)
INSERT [dbo].[Order] ([OrderID], [IdClient], [IdStatus], [DateOrder], [OrderDeliveryDate], [OrderPickupPoint], [CodeAsk]) VALUES (7, NULL, 2, CAST(N'2022-05-12T00:00:00.000' AS DateTime), CAST(N'2022-05-18T00:00:00.000' AS DateTime), 36, 607)
INSERT [dbo].[Order] ([OrderID], [IdClient], [IdStatus], [DateOrder], [OrderDeliveryDate], [OrderPickupPoint], [CodeAsk]) VALUES (8, NULL, 2, CAST(N'2022-05-13T00:00:00.000' AS DateTime), CAST(N'2022-05-19T00:00:00.000' AS DateTime), 32, 608)
INSERT [dbo].[Order] ([OrderID], [IdClient], [IdStatus], [DateOrder], [OrderDeliveryDate], [OrderPickupPoint], [CodeAsk]) VALUES (9, 1, 2, CAST(N'2022-05-15T00:00:00.000' AS DateTime), CAST(N'2022-05-21T00:00:00.000' AS DateTime), 34, 609)
INSERT [dbo].[Order] ([OrderID], [IdClient], [IdStatus], [DateOrder], [OrderDeliveryDate], [OrderPickupPoint], [CodeAsk]) VALUES (10, 8, 1, CAST(N'2022-05-15T00:00:00.000' AS DateTime), CAST(N'2022-05-21T00:00:00.000' AS DateTime), 36, 610)
GO
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IdProduct], [Count]) VALUES (1, 1, 30, 15)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IdProduct], [Count]) VALUES (2, 2, 10, 15)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IdProduct], [Count]) VALUES (3, 3, 9, 10)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IdProduct], [Count]) VALUES (4, 4, 11, 1)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IdProduct], [Count]) VALUES (5, 5, 23, 1)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IdProduct], [Count]) VALUES (6, 6, 16, 1)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IdProduct], [Count]) VALUES (7, 7, 14, 2)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IdProduct], [Count]) VALUES (8, 8, 19, 1)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IdProduct], [Count]) VALUES (9, 9, 27, 1)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IdProduct], [Count]) VALUES (10, 10, 21, 1)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IdProduct], [Count]) VALUES (11, 1, 12, 1)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IdProduct], [Count]) VALUES (12, 2, 29, 15)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IdProduct], [Count]) VALUES (13, 3, 25, 10)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IdProduct], [Count]) VALUES (14, 4, 5, 2)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IdProduct], [Count]) VALUES (15, 5, 6, 10)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IdProduct], [Count]) VALUES (16, 6, 4, 1)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IdProduct], [Count]) VALUES (17, 7, 22, 2)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IdProduct], [Count]) VALUES (18, 8, 27, 1)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IdProduct], [Count]) VALUES (19, 9, 20, 1)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IdProduct], [Count]) VALUES (20, 10, 28, 1)
GO
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (1, 5, 1, 28, 1)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (2, 24, 1, 25, 30)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (3, 7, 1, 7, 43)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (4, 36, 1, 23, 25)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (5, 3, 1, 30, 40)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (6, 2, 1, 16, 49)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (7, 29, 1, 17, 46)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (8, 26, 1, 11, 50)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (9, 19, 1, 14, 19)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (10, 35, 1, 15, 19)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (11, 21, 1, 20, 4)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (12, 18, 1, 8, 26)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (13, 8, 1, 28, 3)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (14, 20, 1, 4, 28)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (15, 17, 1, 12, 30)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (16, 6, 1, 26, 43)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (17, 12, 1, 29, 50)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (18, 31, 1, 7, 20)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (19, 32, 1, 1, NULL)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (20, 9, 1, 5, 32)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (21, 25, 1, 9, 47)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (22, 11, 1, 21, 46)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (23, 28, 1, 27, 8)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (24, 15, 1, 7, 1)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (25, 22, 1, 24, 46)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (26, 23, 1, 3, 41)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (27, 10, 1, 22, 13)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (28, 13, 1, 2, 32)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (29, 1, 1, 18, 8)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (30, 34, 1, 30, 24)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (31, 27, 1, 19, 35)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (32, 14, 1, 9, 44)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (33, 16, 1, 6, 44)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (34, 30, 1, 13, 12)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (35, 33, 1, 8, 17)
INSERT [dbo].[PickPoint] ([Id], [IdIndex], [IdCity], [IdStreet], [HouseNum]) VALUES (36, 4, 1, 10, 26)
GO
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (1, 1, 3, 1, 2, N'А112Т4', N'Лакомство для кошек Dreamies Подушечки с курицей, 140 г', 4, CAST(123.00 AS Decimal(19, 2)), 30, 6, 3, N'А112Т4.png', NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (2, 1, 8, 2, 1, N'G453T5', N'Щетка-варежка True Touch для вычесывания шерсти, синий', 12, CAST(149.00 AS Decimal(19, 2)), 15, 7, 2, N'G453T5.jpg', NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (3, 1, 7, 2, 2, N'F432F4', N'Сухой корм для кошек Pro Plan с чувствительным пищеварением', 8, CAST(1200.00 AS Decimal(19, 2)), 10, 15, 3, N'F432F4.jpg', NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (4, 1, 3, 1, 3, N'Y324F4', N'Лакомство для собак Titbit Косточки мясные с индейкой и ягненком, 145 г', 9, CAST(86.00 AS Decimal(19, 2)), 5, 17, 4, N'Y324F4.jpg', NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (5, 1, 3, 1, 3, N'E532Q5', N'Лакомство для собак Titbit Печенье Био Десерт с лососем стандарт, 350 г', 9, CAST(166.00 AS Decimal(19, 2)), 15, 18, 5, N'E532Q5.jpg', NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (6, 1, 7, 2, 3, N'T432F4', N'Сухой корм для собак Chappi говядина по-домашнему, с овощами', 2, CAST(1700.00 AS Decimal(19, 2)), 25, 5, 2, N'T432F4.jpg', NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (7, 1, 6, 2, 3, N'G345E4', N'Мячик для собак LIKER Мячик Лайкер (6294) оранжевый', 6, CAST(300.00 AS Decimal(19, 2)), 5, 19, 3, N'G345E4.jpg', NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (8, 1, 1, 2, 2, N'E345R4', N'Игрушка для животных «Котик» с кошачьей мятой FANCY PETS', 5, CAST(199.00 AS Decimal(19, 2)), 5, 7, 5, N'E345R4.jpg', NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (9, 1, 5, 1, 3, N'R356F4', N'Миска Nobby с рисунком Dog для собак 130 мл красный', 7, CAST(234.00 AS Decimal(19, 2)), 10, 17, 3, N'R356F4.jpg', NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (10, 1, 3, 2, 3, N'E431R5', N'Лакомство для собак Triol Кость из жил 7.5 см, 4шт. в уп.', 10, CAST(170.00 AS Decimal(19, 2)), 5, 5, 5, N'E431R5.png', NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (11, 1, 1, 1, 3, N'D563F4', N'Игрушка для собак Triol Бобер 41 см 12141053 бежевый', 10, CAST(600.00 AS Decimal(19, 2)), 10, 5, 5, NULL, NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (12, 1, 1, 1, 3, N'H436R4', N'Игрушка для собак Triol 3D плетение EC-04/12171005 бежевый', 10, CAST(300.00 AS Decimal(19, 2)), 15, 15, 2, NULL, NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (13, 1, 7, 1, 2, N'D643B5', N'Сухой корм для котят CAT CHOW с высоким содержанием домашней птицы', 1, CAST(4100.00 AS Decimal(19, 2)), 30, 9, 4, NULL, NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (14, 1, 5, 2, 1, N'H432F4', N'Миска Triol 9002/KIDP3211/30261087 400 мл серебристый', 10, CAST(385.00 AS Decimal(19, 2)), 10, 17, 2, NULL, NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (15, 1, 7, 2, 2, N'S245R4', N'Сухой корм для кошек CAT CHOW', 1, CAST(280.00 AS Decimal(19, 2)), 15, 8, 3, NULL, NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (16, 1, 7, 1, 3, N'V352R4', N'Сухой корм для собак Chappi Мясное изобилие, мясное ассорти', 2, CAST(1700.00 AS Decimal(19, 2)), 25, 9, 4, NULL, NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (17, 1, 1, 2, 3, N'H342F5', N'Игрушка для собак Triol Енот 41 см 12141063 серый', 10, CAST(510.00 AS Decimal(19, 2)), 5, 17, 2, NULL, NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (18, 1, 1, 2, 3, N'Q245F5', N'Игрушка для собак Triol Бобер 41 см 12141063 серый', 10, CAST(510.00 AS Decimal(19, 2)), 5, 17, 2, NULL, NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (19, 1, 7, 1, 3, N'G542F5', N'Сухой корм для собак Pro Plan при чувствительном пищеварении, ягненок', 8, CAST(2190.00 AS Decimal(19, 2)), 30, 7, 4, NULL, NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (20, 1, 3, 2, 3, N'H542R6', N'Лакомство для собак Triol Мясные полоски из кролика, 70 г', 10, CAST(177.00 AS Decimal(19, 2)), 15, 15, 3, NULL, NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (21, 1, 6, 2, 3, N'K436T5', N'Мячик для собак Triol с косточками 12101096 желтый/зеленый', 10, CAST(100.00 AS Decimal(19, 2)), 5, 21, 4, NULL, NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (22, 1, 1, 1, 3, N'V527T5', N'Игрушка для собак Triol Ящерица 39 см коричневый', 10, CAST(640.00 AS Decimal(19, 2)), 5, 4, 5, NULL, NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (23, 1, 4, 2, 3, N'K452T5', N'Лежак для собак и кошек ZooM Lama 40х30х8 см бежевый', 13, CAST(800.00 AS Decimal(19, 2)), 25, 17, 2, NULL, NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (24, 1, 2, 2, 3, N'E466T6', N'Клетка для собак Triol 30671002 61х45.5х52 см серый/белый', 10, CAST(3500.00 AS Decimal(19, 2)), 30, 3, 5, NULL, NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (25, 1, 5, 2, 1, N'B427R5', N'Миска для животных Triol "Стрекоза", 450 мл', 10, CAST(400.00 AS Decimal(19, 2)), 15, 5, 4, NULL, NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (26, 1, 5, 1, 1, N'H643W2', N'Миска Triol CB02/30231002 100 мл бежевый/голубой', 10, CAST(292.00 AS Decimal(19, 2)), 25, 13, 3, NULL, NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (27, 1, 6, 1, 3, N'D356R4', N'Мячик для собак TRIXIE DentaFun (32942) зеленый / белый', 11, CAST(600.00 AS Decimal(19, 2)), 15, 16, 2, NULL, NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (28, 1, 3, 2, 3, N'E434U6', N'Лакомство для собак Titbit Лакомый кусочек Нарезка из говядины, 80 г', 9, CAST(140.00 AS Decimal(19, 2)), 20, 19, 3, NULL, NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (29, 1, 3, 2, 3, N'M356R4', N'Лакомство для собак Titbit Гематоген мясной Classic, 35 г', 9, CAST(50.00 AS Decimal(19, 2)), 5, 6, 4, NULL, NULL)
INSERT [dbo].[Product] ([Id], [IdUnits], [IdProductName], [IdSupplier], [IdCategory], [Article], [ProductDiscription], [IdManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [DiscountNow], [PhotoName], [ProductPhote]) VALUES (30, 1, 7, 1, 3, N'W548O7', N'Сухой корм для щенков DOG CHOW Puppy, ягненок 2.5 кг', 3, CAST(600.00 AS Decimal(19, 2)), 15, 15, 5, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ProductName] ON 

INSERT [dbo].[ProductName] ([Id], [Name]) VALUES (1, N'Игрушка')
INSERT [dbo].[ProductName] ([Id], [Name]) VALUES (2, N'Клетка')
INSERT [dbo].[ProductName] ([Id], [Name]) VALUES (3, N'Лакомство')
INSERT [dbo].[ProductName] ([Id], [Name]) VALUES (4, N'Лежак')
INSERT [dbo].[ProductName] ([Id], [Name]) VALUES (5, N'Миска')
INSERT [dbo].[ProductName] ([Id], [Name]) VALUES (6, N'Мячик')
INSERT [dbo].[ProductName] ([Id], [Name]) VALUES (7, N'Сухой корм')
INSERT [dbo].[ProductName] ([Id], [Name]) VALUES (8, N'Щетка-варежка')
SET IDENTITY_INSERT [dbo].[ProductName] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Менеджер')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[StatusOrder] ON 

INSERT [dbo].[StatusOrder] ([Id], [Status]) VALUES (1, N'Завершен')
INSERT [dbo].[StatusOrder] ([Id], [Status]) VALUES (2, N'Новый ')
SET IDENTITY_INSERT [dbo].[StatusOrder] OFF
GO
INSERT [dbo].[Street] ([Id], [Name]) VALUES (1, N'8 Марта')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (2, N'Вишневая')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (3, N'Гоголя')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (4, N'Дзержинского')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (5, N'Зеленая')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (6, N'Клубная')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (7, N'Коммунистическая')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (8, N'Комсомольская')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (9, N'Маяковского')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (10, N'Мичурина')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (11, N'Молодежная')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (12, N'Набережная')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (13, N'Некрасова')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (14, N'Новая')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (15, N'Октябрьская')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (16, N'Партизанская')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (17, N'Победы')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (18, N'Подгорная')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (19, N'Полевая')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (20, N'Садовая')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (21, N'Светлая')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (22, N'Северная')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (23, N'Солнечная')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (24, N'Спортивная')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (25, N'Степная')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (26, N'Фрунзе')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (27, N'Цветочная')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (28, N'Чехова')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (29, N'Школьная')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (30, N'Шоссейная')
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (1, N'PetShop')
INSERT [dbo].[Supplier] ([Id], [Name]) VALUES (2, N'ZooMir')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[Units] ON 

INSERT [dbo].[Units] ([Id], [NameOfUnit]) VALUES (1, N'шт.')
SET IDENTITY_INSERT [dbo].[Units] OFF
GO
INSERT [dbo].[User] ([UserID], [IdUserRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (1, 1, N'Суслов', N'Илья', N'Арсентьевич', N'pixil59@gmail.com', N'2L6KZG')
INSERT [dbo].[User] ([UserID], [IdUserRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (2, 1, N'Яковлева', N'Ярослава', N'Даниэльевна', N'deummecillummu-4992@mail.ru', N'uzWC67')
INSERT [dbo].[User] ([UserID], [IdUserRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (3, 1, N'Игнатьева', N'Алина', N'Михайловна', N'vilagajaunne-5170@yandex.ru', N'8ntwUp')
INSERT [dbo].[User] ([UserID], [IdUserRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (4, 3, N'Денисов', N'Михаил', N'Романович', N'frusubroppotou656@yandex.ru', N'YOyhfR')
INSERT [dbo].[User] ([UserID], [IdUserRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (5, 3, N'Тимофеев', N'Михаил', N'Елисеевич', N'leuttevitrafo1998@mail.ru', N'RSbvHv')
INSERT [dbo].[User] ([UserID], [IdUserRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (6, 3, N'Соловьев', N'Ярослав', N'Маркович', N'frapreubrulloba1141@yandex.ru', N'rwVDh9')
INSERT [dbo].[User] ([UserID], [IdUserRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (7, 2, N'Филимонов', N'Роберт', N'Васильевич', N'loudittoimmolau1900@gmail.com', N'LdNyos')
INSERT [dbo].[User] ([UserID], [IdUserRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (8, 2, N'Шилова', N'Майя', N'Артемьевна', N'hittuprofassa4984@mail.com', N'gynQMT')
INSERT [dbo].[User] ([UserID], [IdUserRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (9, 2, N'Чистякова', N'Виктория', N'Степановна', N'freineiciweijau888@yandex.ru', N'AtnDjr')
INSERT [dbo].[User] ([UserID], [IdUserRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (10, 2, N'Волкова', N'Эмилия', N'Артёмовна', N'nokupekidda2001@gmail.com', N'JlFRCZ')
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickPoint] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[PickPoint] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_StatusOrder] FOREIGN KEY([IdStatus])
REFERENCES [dbo].[StatusOrder] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_StatusOrder]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([IdClient])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Order]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Product] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Product]
GO
ALTER TABLE [dbo].[PickPoint]  WITH CHECK ADD  CONSTRAINT [FK_PickPoint_City] FOREIGN KEY([IdCity])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[PickPoint] CHECK CONSTRAINT [FK_PickPoint_City]
GO
ALTER TABLE [dbo].[PickPoint]  WITH CHECK ADD  CONSTRAINT [FK_PickPoint_Indexes] FOREIGN KEY([IdIndex])
REFERENCES [dbo].[Indexes] ([Id])
GO
ALTER TABLE [dbo].[PickPoint] CHECK CONSTRAINT [FK_PickPoint_Indexes]
GO
ALTER TABLE [dbo].[PickPoint]  WITH CHECK ADD  CONSTRAINT [FK_PickPoint_Street] FOREIGN KEY([IdStreet])
REFERENCES [dbo].[Street] ([Id])
GO
ALTER TABLE [dbo].[PickPoint] CHECK CONSTRAINT [FK_PickPoint_Street]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([IdCategory])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacture] FOREIGN KEY([IdManufacturer])
REFERENCES [dbo].[Manufacture] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacture]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductName] FOREIGN KEY([IdProductName])
REFERENCES [dbo].[ProductName] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductName]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([IdSupplier])
REFERENCES [dbo].[Supplier] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Units] FOREIGN KEY([IdUnits])
REFERENCES [dbo].[Units] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Units]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([IdUserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [Trades] SET  READ_WRITE 
GO
