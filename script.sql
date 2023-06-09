USE [master]
GO
/****** Object:  Database [FirmaSiparisAPIDb]    Script Date: 31.03.2023 18:32:46 ******/
CREATE DATABASE [FirmaSiparisAPIDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FirmaSiparisAPIDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FirmaSiparisAPIDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FirmaSiparisAPIDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FirmaSiparisAPIDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FirmaSiparisAPIDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET RECOVERY FULL 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET  MULTI_USER 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FirmaSiparisAPIDb', N'ON'
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET QUERY_STORE = OFF
GO
USE [FirmaSiparisAPIDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 31.03.2023 18:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 31.03.2023 18:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
	[OrderStartTime] [nvarchar](max) NOT NULL,
	[OrderFinishTime] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyOrder]    Script Date: 31.03.2023 18:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyOrder](
	[CompaniesId] [int] NOT NULL,
	[OrdersId] [int] NOT NULL,
 CONSTRAINT [PK_CompanyOrder] PRIMARY KEY CLUSTERED 
(
	[CompaniesId] ASC,
	[OrdersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 31.03.2023 18:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrdersId] [int] NOT NULL,
	[ProductsId] [int] NOT NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[OrdersId] ASC,
	[ProductsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 31.03.2023 18:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[OrdersName] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CargoBarcode] [int] NOT NULL,
	[RMACode] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 31.03.2023 18:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Stock] [int] NOT NULL,
	[Price] [bigint] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230220121617_mig_1', N'7.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230331114202_mig_2', N'7.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230331144730_mig_2', N'7.0.3')
GO
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([Id], [OrderId], [OrderStatus], [OrderStartTime], [OrderFinishTime], [Name], [CreatedDate]) VALUES (1, 0, N'Kargoda', N'Bugün', N'Çarşamba', N'Enoca', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Companies] ([Id], [OrderId], [OrderStatus], [OrderStartTime], [OrderFinishTime], [Name], [CreatedDate]) VALUES (2, 0, N'Alındı', N'Bugün', N'Cuma', N'Flo Ayakkabı', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Companies] ([Id], [OrderId], [OrderStatus], [OrderStartTime], [OrderFinishTime], [Name], [CreatedDate]) VALUES (3, 0, N'Alındı', N'Pazartesi', N'Perşembe', N'Starbucks', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Companies] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [CompanyId], [ProductId], [OrdersName], [Name], [CreatedDate], [CargoBarcode], [RMACode]) VALUES (5, 1, 1, N'Hüdanur', N'Yazılım', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 533417, 257425)
INSERT [dbo].[Orders] ([Id], [CompanyId], [ProductId], [OrdersName], [Name], [CreatedDate], [CargoBarcode], [RMACode]) VALUES (6, 2, 3, N'Hüdanur', N'Bot', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 695214, 753951)
INSERT [dbo].[Orders] ([Id], [CompanyId], [ProductId], [OrdersName], [Name], [CreatedDate], [CargoBarcode], [RMACode]) VALUES (7, 3, 4, N'Ayşe', N'Kahve', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [CompanyId], [Stock], [Price], [Name], [CreatedDate]) VALUES (1, 1, 15, 10000, N'Yazılım', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Products] ([Id], [CompanyId], [Stock], [Price], [Name], [CreatedDate]) VALUES (2, 2, 200, 500, N'string', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Products] ([Id], [CompanyId], [Stock], [Price], [Name], [CreatedDate]) VALUES (3, 2, 200, 500, N'Bot', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Products] ([Id], [CompanyId], [Stock], [Price], [Name], [CreatedDate]) VALUES (4, 3, 200, 150, N'Kahve', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Products] ([Id], [CompanyId], [Stock], [Price], [Name], [CreatedDate]) VALUES (5, 1, 10, 50, N'Çorap', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
/****** Object:  Index [IX_CompanyOrder_OrdersId]    Script Date: 31.03.2023 18:32:46 ******/
CREATE NONCLUSTERED INDEX [IX_CompanyOrder_OrdersId] ON [dbo].[CompanyOrder]
(
	[OrdersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderProduct_ProductsId]    Script Date: 31.03.2023 18:32:46 ******/
CREATE NONCLUSTERED INDEX [IX_OrderProduct_ProductsId] ON [dbo].[OrderProduct]
(
	[ProductsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CompanyId]    Script Date: 31.03.2023 18:32:46 ******/
CREATE NONCLUSTERED INDEX [IX_Products_CompanyId] ON [dbo].[Products]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [CargoBarcode]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [RMACode]
GO
ALTER TABLE [dbo].[CompanyOrder]  WITH CHECK ADD  CONSTRAINT [FK_CompanyOrder_Companies_CompaniesId] FOREIGN KEY([CompaniesId])
REFERENCES [dbo].[Companies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CompanyOrder] CHECK CONSTRAINT [FK_CompanyOrder_Companies_CompaniesId]
GO
ALTER TABLE [dbo].[CompanyOrder]  WITH CHECK ADD  CONSTRAINT [FK_CompanyOrder_Orders_OrdersId] FOREIGN KEY([OrdersId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CompanyOrder] CHECK CONSTRAINT [FK_CompanyOrder_Orders_OrdersId]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Orders_OrdersId] FOREIGN KEY([OrdersId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Orders_OrdersId]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Products_ProductsId] FOREIGN KEY([ProductsId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Products_ProductsId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Companies_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Companies_CompanyId]
GO
USE [master]
GO
ALTER DATABASE [FirmaSiparisAPIDb] SET  READ_WRITE 
GO
