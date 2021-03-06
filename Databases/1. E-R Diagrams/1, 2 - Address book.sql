USE [master]
GO
/****** Object:  Database [AddressBook]    Script Date: 7/12/2013 11:51:37 AM ******/
CREATE DATABASE [AddressBook]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AddressBook', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\AddressBook.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AddressBook_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\AddressBook_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AddressBook] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AddressBook].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AddressBook] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AddressBook] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AddressBook] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AddressBook] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AddressBook] SET ARITHABORT OFF 
GO
ALTER DATABASE [AddressBook] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AddressBook] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [AddressBook] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AddressBook] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AddressBook] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AddressBook] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AddressBook] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AddressBook] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AddressBook] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AddressBook] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AddressBook] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AddressBook] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AddressBook] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AddressBook] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AddressBook] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AddressBook] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AddressBook] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AddressBook] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AddressBook] SET RECOVERY FULL 
GO
ALTER DATABASE [AddressBook] SET  MULTI_USER 
GO
ALTER DATABASE [AddressBook] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AddressBook] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AddressBook] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AddressBook] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AddressBook', N'ON'
GO
USE [AddressBook]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 7/12/2013 11:51:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Address_text] [nchar](70) NOT NULL,
	[Town_Id] [int] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Continents]    Script Date: 7/12/2013 11:51:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](15) NOT NULL,
 CONSTRAINT [PK_Continents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Countries]    Script Date: 7/12/2013 11:51:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](20) NOT NULL,
	[Continent_Id] [int] NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[People]    Script Date: 7/12/2013 11:51:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [nchar](20) NOT NULL,
	[Last_Name] [nchar](20) NOT NULL,
	[Address_Id] [int] NOT NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Towns]    Script Date: 7/12/2013 11:51:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Towns](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](20) NOT NULL,
	[Country_Id] [int] NOT NULL,
 CONSTRAINT [PK_Towns] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([Id], [Address_text], [Town_Id]) VALUES (1, N'11 Somestrasse                                                        ', 5)
INSERT [dbo].[Addresses] ([Id], [Address_text], [Town_Id]) VALUES (2, N'45 Alexander Malinov Blvd                                             ', 1)
INSERT [dbo].[Addresses] ([Id], [Address_text], [Town_Id]) VALUES (3, N'10 Graf Ignatiev Str                                                  ', 1)
INSERT [dbo].[Addresses] ([Id], [Address_text], [Town_Id]) VALUES (4, N'1 Main Street                                                         ', 2)
SET IDENTITY_INSERT [dbo].[Addresses] OFF
SET IDENTITY_INSERT [dbo].[Continents] ON 

INSERT [dbo].[Continents] ([Id], [Name]) VALUES (1, N'Europe         ')
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (2, N'Asia           ')
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (3, N'Australia      ')
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (4, N'North America  ')
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (5, N'South America  ')
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (6, N'Africa         ')
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (7, N'Antartica      ')
SET IDENTITY_INSERT [dbo].[Continents] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Id], [Name], [Continent_Id]) VALUES (1, N'Bulgaria            ', 1)
INSERT [dbo].[Countries] ([Id], [Name], [Continent_Id]) VALUES (2, N'USA                 ', 4)
INSERT [dbo].[Countries] ([Id], [Name], [Continent_Id]) VALUES (4, N'France              ', 1)
INSERT [dbo].[Countries] ([Id], [Name], [Continent_Id]) VALUES (5, N'Germany             ', 1)
INSERT [dbo].[Countries] ([Id], [Name], [Continent_Id]) VALUES (6, N'Namibia             ', 6)
INSERT [dbo].[Countries] ([Id], [Name], [Continent_Id]) VALUES (7, N'South Africa        ', 6)
INSERT [dbo].[Countries] ([Id], [Name], [Continent_Id]) VALUES (8, N'China               ', 2)
INSERT [dbo].[Countries] ([Id], [Name], [Continent_Id]) VALUES (9, N'Japan               ', 2)
INSERT [dbo].[Countries] ([Id], [Name], [Continent_Id]) VALUES (10, N'Australia           ', 3)
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[People] ON 

INSERT [dbo].[People] ([Id], [First_Name], [Last_Name], [Address_Id]) VALUES (1, N'Scooby              ', N'Doo                 ', 4)
INSERT [dbo].[People] ([Id], [First_Name], [Last_Name], [Address_Id]) VALUES (2, N'Johnny              ', N'Bravo               ', 1)
INSERT [dbo].[People] ([Id], [First_Name], [Last_Name], [Address_Id]) VALUES (3, N'Courage             ', N'Cowardly Dog        ', 2)
INSERT [dbo].[People] ([Id], [First_Name], [Last_Name], [Address_Id]) VALUES (4, N'Tin                 ', N'Tin                 ', 2)
INSERT [dbo].[People] ([Id], [First_Name], [Last_Name], [Address_Id]) VALUES (5, N'Mickey              ', N'Mouse               ', 3)
SET IDENTITY_INSERT [dbo].[People] OFF
SET IDENTITY_INSERT [dbo].[Towns] ON 

INSERT [dbo].[Towns] ([Id], [Name], [Country_Id]) VALUES (1, N'Sofia               ', 1)
INSERT [dbo].[Towns] ([Id], [Name], [Country_Id]) VALUES (2, N'Plovdiv             ', 1)
INSERT [dbo].[Towns] ([Id], [Name], [Country_Id]) VALUES (3, N'Washington          ', 2)
INSERT [dbo].[Towns] ([Id], [Name], [Country_Id]) VALUES (4, N'Los Angeles         ', 2)
INSERT [dbo].[Towns] ([Id], [Name], [Country_Id]) VALUES (5, N'Sydney              ', 10)
INSERT [dbo].[Towns] ([Id], [Name], [Country_Id]) VALUES (6, N'Koln                ', 5)
INSERT [dbo].[Towns] ([Id], [Name], [Country_Id]) VALUES (7, N'Tokyo               ', 9)
SET IDENTITY_INSERT [dbo].[Towns] OFF
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Towns] FOREIGN KEY([Town_Id])
REFERENCES [dbo].[Towns] ([Id])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Towns]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Continents] FOREIGN KEY([Continent_Id])
REFERENCES [dbo].[Continents] ([Id])
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_Continents]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_Addresses] FOREIGN KEY([Address_Id])
REFERENCES [dbo].[Addresses] ([Id])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_People_Addresses]
GO
ALTER TABLE [dbo].[Towns]  WITH CHECK ADD  CONSTRAINT [FK_Towns_Countries] FOREIGN KEY([Country_Id])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Towns] CHECK CONSTRAINT [FK_Towns_Countries]
GO
USE [master]
GO
ALTER DATABASE [AddressBook] SET  READ_WRITE 
GO
