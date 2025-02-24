USE [master]
GO
/****** Object:  Database [RentACar]    Script Date: 3/11/2021 12:06:20 AM ******/
CREATE DATABASE [RentACar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RentACar', FILENAME = N'C:\Users\Cem\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\RentACar.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RentACar_log', FILENAME = N'C:\Users\Cem\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\RentACar_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RentACar] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RentACar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RentACar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RentACar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RentACar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RentACar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RentACar] SET ARITHABORT OFF 
GO
ALTER DATABASE [RentACar] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [RentACar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RentACar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RentACar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RentACar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RentACar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RentACar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RentACar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RentACar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RentACar] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RentACar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RentACar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RentACar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RentACar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RentACar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RentACar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RentACar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RentACar] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RentACar] SET  MULTI_USER 
GO
ALTER DATABASE [RentACar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RentACar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RentACar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RentACar] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RentACar] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RentACar] SET QUERY_STORE = OFF
GO
USE [RentACar]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [RentACar]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 3/11/2021 12:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](50) NULL,
 CONSTRAINT [PK__Table__3214EC079A600FF8] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 3/11/2021 12:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BrandId] [int] NULL,
	[ColorId] [int] NULL,
	[ModelYear] [int] NULL,
	[DailyPrice] [decimal](5, 2) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK__tmp_ms_x__3214EC07FCD6A8F6] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 3/11/2021 12:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nvarchar](50) NULL,
 CONSTRAINT [PK__Colors__3214EC070E9DD299] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 3/11/2021 12:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[CompanyName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rentals]    Script Date: 3/11/2021 12:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rentals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarId] [int] NULL,
	[CustomerId] [int] NULL,
	[RentDate] [date] NULL,
	[ReturnDate] [date] NULL,
 CONSTRAINT [PK_Rentals] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/11/2021 12:06:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([Id], [BrandName]) VALUES (1, N'Audi')
INSERT [dbo].[Brands] ([Id], [BrandName]) VALUES (2, N'Alfa Romeo')
INSERT [dbo].[Brands] ([Id], [BrandName]) VALUES (3, N'BMW')
INSERT [dbo].[Brands] ([Id], [BrandName]) VALUES (4, N'Fiat')
INSERT [dbo].[Brands] ([Id], [BrandName]) VALUES (5, N'Ford')
INSERT [dbo].[Brands] ([Id], [BrandName]) VALUES (6, N'Opel')
INSERT [dbo].[Brands] ([Id], [BrandName]) VALUES (7, N'Renault')
INSERT [dbo].[Brands] ([Id], [BrandName]) VALUES (8, N'Toyota')
INSERT [dbo].[Brands] ([Id], [BrandName]) VALUES (9, N'Kia')
INSERT [dbo].[Brands] ([Id], [BrandName]) VALUES (10, N'Honda')
INSERT [dbo].[Brands] ([Id], [BrandName]) VALUES (11, N'Mercedes')
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description]) VALUES (1, 11, 3, 2020, CAST(350.00 AS Decimal(5, 2)), N'Mercedes E 200 d AMG')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description]) VALUES (3, 11, 2, 2019, CAST(245.00 AS Decimal(5, 2)), N'Mercedes-Benz Jeep')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description]) VALUES (4, 5, 6, 2019, CAST(180.00 AS Decimal(5, 2)), N'Ford Fiesta 1.0 Otomatik')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description]) VALUES (6, 4, 3, 2020, CAST(180.00 AS Decimal(5, 2)), N'Fiat Egea 1.4 Otomatik')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description]) VALUES (8, 2, 3, 2021, CAST(200.00 AS Decimal(5, 2)), N'Alfa Romeo Giulietta 1.6 JTD Sprint')
SET IDENTITY_INSERT [dbo].[Cars] OFF
GO
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([Id], [ColorName]) VALUES (1, N'Siyah')
INSERT [dbo].[Colors] ([Id], [ColorName]) VALUES (2, N'Beyaz')
INSERT [dbo].[Colors] ([Id], [ColorName]) VALUES (3, N'Gri')
INSERT [dbo].[Colors] ([Id], [ColorName]) VALUES (4, N'Kırmızı')
INSERT [dbo].[Colors] ([Id], [ColorName]) VALUES (5, N'Fuşya')
INSERT [dbo].[Colors] ([Id], [ColorName]) VALUES (6, N'Bordo')
INSERT [dbo].[Colors] ([Id], [ColorName]) VALUES (7, N'Lacivert')
INSERT [dbo].[Colors] ([Id], [ColorName]) VALUES (8, N'Yeşil')
SET IDENTITY_INSERT [dbo].[Colors] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (1, 1, N'Neomarin Denizcilik Ltd. Şti.')
INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (2, 4, N'Egemen Bilgi Teknolojileri Ltd. Şti.')
INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (4, 2, N'Sapphire Madeni Yağları Ltd. Şti. ')
INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (5, 6, N'Karabük Demir Çelik')
INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (6, 7, N'Nobull Project')
INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (7, 8, N'The Backyard Session')
INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (8, 9, N'The Pretty Reckless')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Rentals] ON 

INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate]) VALUES (2, 4, 1, CAST(N'2021-02-17' AS Date), CAST(N'2021-03-07' AS Date))
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate]) VALUES (3, 8, 6, CAST(N'2021-03-09' AS Date), NULL)
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate]) VALUES (4, 3, 7, CAST(N'2021-03-06' AS Date), NULL)
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate]) VALUES (5, 4, 8, CAST(N'2021-03-06' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Rentals] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (1, N'Yasin', N'Pekuysal', N'yasinpekuysal@mail.com', N'2we22')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (2, N'Büşra', N'Yıldız', N'busrayildiz@mail.com', N'33erd3d')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (4, N'Yasemin', N'Ermenek', N'yaseminermenek@mail.com', N'yaso123')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (6, N'Özlem', N'Sarı', N'ozlemsari@mail.com', N'v3erer33')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (7, N'Lauren', N'Fisher', N'laurenfisher@mail.com', N'433434')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (8, N'Miley', N'Cyrus', N'mileycyrus@mail.com', N'4rere33')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (9, N'Taylor', N'Momsen', N'taylarmomsen@mail.com', N'tylr33mom')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (10, N'Jessi', N'Valencia', N'jessivalencia@mail.com', N'jessjess12')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_CarsBrands] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_CarsBrands]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_CarsColors] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Colors] ([Id])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_CarsColors]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Users]
GO
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_Rentals_Cars] FOREIGN KEY([CarId])
REFERENCES [dbo].[Cars] ([Id])
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_Rentals_Cars]
GO
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_Rentals_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_Rentals_Customers]
GO
USE [master]
GO
ALTER DATABASE [RentACar] SET  READ_WRITE 
GO
