USE [master]
GO
/****** Object:  Database [SmartPay]    Script Date: 14-09-2018 22:37:37 ******/
CREATE DATABASE [SmartPay]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SmartPay', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\SmartPay.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SmartPay_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\SmartPay_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SmartPay] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SmartPay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SmartPay] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SmartPay] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SmartPay] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SmartPay] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SmartPay] SET ARITHABORT OFF 
GO
ALTER DATABASE [SmartPay] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SmartPay] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SmartPay] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SmartPay] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SmartPay] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SmartPay] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SmartPay] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SmartPay] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SmartPay] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SmartPay] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SmartPay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SmartPay] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SmartPay] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SmartPay] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SmartPay] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SmartPay] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SmartPay] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SmartPay] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SmartPay] SET  MULTI_USER 
GO
ALTER DATABASE [SmartPay] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SmartPay] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SmartPay] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SmartPay] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SmartPay] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SmartPay] SET QUERY_STORE = OFF
GO
USE [SmartPay]
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
USE [SmartPay]
GO
/****** Object:  Table [dbo].[Peaje]    Script Date: 14-09-2018 22:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Peaje](
	[ruta] [varchar](50) NOT NULL,
	[precio] [decimal](18, 0) NULL,
	[cantPortico] [int] NULL,
	[descuento] [float] NULL,
 CONSTRAINT [PK_Peaje] PRIMARY KEY CLUSTERED 
(
	[ruta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroDescuento]    Script Date: 14-09-2018 22:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroDescuento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[porcentaje] [decimal](18, 0) NULL,
	[ruta] [varchar](50) NULL,
	[rut] [varchar](50) NULL,
	[peajes] [int] NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_Descuento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 14-09-2018 22:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[rut] [varchar](15) NOT NULL,
	[nombre] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[contraseña] [varchar](20) NULL,
	[saldo] [float] NULL,
	[FechaRegistro] [date] NULL,
	[activo] [varchar](2) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[rut] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehiculo]    Script Date: 14-09-2018 22:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehiculo](
	[patente] [varchar](15) NOT NULL,
	[marca] [varchar](25) NULL,
	[modelo] [varchar](25) NULL,
	[color] [varchar](25) NULL,
	[rut] [varchar](15) NULL,
 CONSTRAINT [PK_Vehiculo] PRIMARY KEY CLUSTERED 
(
	[patente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Viaje]    Script Date: 14-09-2018 22:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Viaje](
	[rut] [varchar](15) NULL,
	[patente] [varchar](15) NULL,
	[ruta] [varchar](50) NULL,
	[precio] [decimal](18, 0) NULL,
	[fecha] [date] NULL,
	[codigo] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Viaje] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Peaje] ([ruta], [precio], [cantPortico], [descuento]) VALUES (N'Santiago-La Serena', CAST(19000 AS Decimal(18, 0)), 6, 20)
GO
INSERT [dbo].[Peaje] ([ruta], [precio], [cantPortico], [descuento]) VALUES (N'Santiago-Lican Ray', CAST(22400 AS Decimal(18, 0)), 8, 20)
GO
INSERT [dbo].[Peaje] ([ruta], [precio], [cantPortico], [descuento]) VALUES (N'Santiago-Los Angeles', CAST(16000 AS Decimal(18, 0)), 5, 20)
GO
INSERT [dbo].[Peaje] ([ruta], [precio], [cantPortico], [descuento]) VALUES (N'Santiago-Mendoza', CAST(10200 AS Decimal(18, 0)), 4, 20)
GO
INSERT [dbo].[Peaje] ([ruta], [precio], [cantPortico], [descuento]) VALUES (N'Santiago-Viña del Mar', CAST(8800 AS Decimal(18, 0)), 3, 20)
GO
SET IDENTITY_INSERT [dbo].[RegistroDescuento] ON 
GO
INSERT [dbo].[RegistroDescuento] ([id], [porcentaje], [ruta], [rut], [peajes], [fecha]) VALUES (2021, CAST(20 AS Decimal(18, 0)), N'Santiago-Mendoza', N'19517447-4', 4, CAST(N'2018-09-12' AS Date))
GO
INSERT [dbo].[RegistroDescuento] ([id], [porcentaje], [ruta], [rut], [peajes], [fecha]) VALUES (2022, CAST(20 AS Decimal(18, 0)), N'Santiago-La Serena', N'19517447-4', 6, CAST(N'2018-09-12' AS Date))
GO
INSERT [dbo].[RegistroDescuento] ([id], [porcentaje], [ruta], [rut], [peajes], [fecha]) VALUES (2023, CAST(20 AS Decimal(18, 0)), N'Santiago-Lican Ray', N'19517447-4', 8, CAST(N'2018-09-12' AS Date))
GO
INSERT [dbo].[RegistroDescuento] ([id], [porcentaje], [ruta], [rut], [peajes], [fecha]) VALUES (2024, CAST(20 AS Decimal(18, 0)), N'Santiago-Viña del Mar', N'19517447-4', 3, CAST(N'2018-09-12' AS Date))
GO
INSERT [dbo].[RegistroDescuento] ([id], [porcentaje], [ruta], [rut], [peajes], [fecha]) VALUES (2025, CAST(20 AS Decimal(18, 0)), N'Santiago-Lican Ray', N'12641735-7', 8, CAST(N'2018-09-12' AS Date))
GO
INSERT [dbo].[RegistroDescuento] ([id], [porcentaje], [ruta], [rut], [peajes], [fecha]) VALUES (2026, CAST(20 AS Decimal(18, 0)), N'Santiago-La Serena', N'12641735-7', 6, CAST(N'2018-09-12' AS Date))
GO
INSERT [dbo].[RegistroDescuento] ([id], [porcentaje], [ruta], [rut], [peajes], [fecha]) VALUES (2027, CAST(20 AS Decimal(18, 0)), N'Santiago-Mendoza', N'12641735-7', 4, CAST(N'2018-09-12' AS Date))
GO
INSERT [dbo].[RegistroDescuento] ([id], [porcentaje], [ruta], [rut], [peajes], [fecha]) VALUES (2028, CAST(20 AS Decimal(18, 0)), N'Santiago-Los Angeles', N'17196757-0', 5, CAST(N'2018-09-12' AS Date))
GO
INSERT [dbo].[RegistroDescuento] ([id], [porcentaje], [ruta], [rut], [peajes], [fecha]) VALUES (2029, CAST(20 AS Decimal(18, 0)), N'Santiago-Mendoza', N'17196757-0', 4, CAST(N'2018-09-12' AS Date))
GO
INSERT [dbo].[RegistroDescuento] ([id], [porcentaje], [ruta], [rut], [peajes], [fecha]) VALUES (2030, CAST(20 AS Decimal(18, 0)), N'Santiago-La Serena', N'17196757-0', 6, CAST(N'2018-09-12' AS Date))
GO
INSERT [dbo].[RegistroDescuento] ([id], [porcentaje], [ruta], [rut], [peajes], [fecha]) VALUES (2031, CAST(20 AS Decimal(18, 0)), N'Santiago-La Serena', N'17196757-0', 6, CAST(N'2018-09-12' AS Date))
GO
INSERT [dbo].[RegistroDescuento] ([id], [porcentaje], [ruta], [rut], [peajes], [fecha]) VALUES (2074, CAST(20 AS Decimal(18, 0)), N'Santiago-La Serena', N'18408289-6', 6, CAST(N'2018-09-13' AS Date))
GO
INSERT [dbo].[RegistroDescuento] ([id], [porcentaje], [ruta], [rut], [peajes], [fecha]) VALUES (2075, CAST(20 AS Decimal(18, 0)), N'Santiago-La Serena', N'17426398-K', 6, CAST(N'2018-09-13' AS Date))
GO
INSERT [dbo].[RegistroDescuento] ([id], [porcentaje], [ruta], [rut], [peajes], [fecha]) VALUES (2076, CAST(20 AS Decimal(18, 0)), N'Santiago-La Serena', N'18408289-6', 6, CAST(N'2018-09-14' AS Date))
GO
INSERT [dbo].[RegistroDescuento] ([id], [porcentaje], [ruta], [rut], [peajes], [fecha]) VALUES (2077, CAST(20 AS Decimal(18, 0)), N'Santiago-La Serena', N'18408289-6', 6, CAST(N'2018-09-14' AS Date))
GO
INSERT [dbo].[RegistroDescuento] ([id], [porcentaje], [ruta], [rut], [peajes], [fecha]) VALUES (2078, CAST(20 AS Decimal(18, 0)), N'Santiago-Lican Ray', N'17426398-K', 8, CAST(N'2018-09-14' AS Date))
GO
INSERT [dbo].[RegistroDescuento] ([id], [porcentaje], [ruta], [rut], [peajes], [fecha]) VALUES (2079, CAST(20 AS Decimal(18, 0)), N'Santiago-Los Angeles', N'17426398-K', 5, CAST(N'2018-09-14' AS Date))
GO
SET IDENTITY_INSERT [dbo].[RegistroDescuento] OFF
GO
INSERT [dbo].[Usuario] ([rut], [nombre], [direccion], [telefono], [contraseña], [saldo], [FechaRegistro], [activo]) VALUES (N'11111111-1', N'Juan Perez', N'el roble 1484', N'84547847', N'123', 50000, CAST(N'2018-09-12' AS Date), N'Si')
GO
INSERT [dbo].[Usuario] ([rut], [nombre], [direccion], [telefono], [contraseña], [saldo], [FechaRegistro], [activo]) VALUES (N'11111111-k', N'alex', N'333', N'333', N'333', 50000, CAST(N'2018-09-14' AS Date), N'Si')
GO
INSERT [dbo].[Usuario] ([rut], [nombre], [direccion], [telefono], [contraseña], [saldo], [FechaRegistro], [activo]) VALUES (N'12641735-7', N'Carlos Sotomayor', N'Quilicura', N'92353778', N'123', 8720, CAST(N'2018-09-12' AS Date), N'Si')
GO
INSERT [dbo].[Usuario] ([rut], [nombre], [direccion], [telefono], [contraseña], [saldo], [FechaRegistro], [activo]) VALUES (N'17196757-0', N'Javier Henriquez', N'Huechuraba', N'92968743', N'123', 1640, CAST(N'2018-09-12' AS Date), N'Si')
GO
INSERT [dbo].[Usuario] ([rut], [nombre], [direccion], [telefono], [contraseña], [saldo], [FechaRegistro], [activo]) VALUES (N'17426398-K', N'Anonimo', N'Santiago', N'aaaaaaaaaaaaaaaaaaa', N'123', 4080, CAST(N'2018-09-13' AS Date), N'Si')
GO
INSERT [dbo].[Usuario] ([rut], [nombre], [direccion], [telefono], [contraseña], [saldo], [FechaRegistro], [activo]) VALUES (N'18408289-4', N'Anonimo', N'papel', N'94314257', N'12345', 50000, CAST(N'2018-09-14' AS Date), N'Si')
GO
INSERT [dbo].[Usuario] ([rut], [nombre], [direccion], [telefono], [contraseña], [saldo], [FechaRegistro], [activo]) VALUES (N'18408289-6', N'Felipe Luna', N'Los flamencos 2044', N'58308177', N'123', 5600, CAST(N'2018-09-12' AS Date), N'Si')
GO
INSERT [dbo].[Usuario] ([rut], [nombre], [direccion], [telefono], [contraseña], [saldo], [FechaRegistro], [activo]) VALUES (N'19517447-4', N'Javier Vergara', N'el roble 1484', N'84547847', N'123', 1680, CAST(N'2018-09-12' AS Date), N'Si')
GO
INSERT [dbo].[Usuario] ([rut], [nombre], [direccion], [telefono], [contraseña], [saldo], [FechaRegistro], [activo]) VALUES (N'19517447-K', N'Rosa Melo', N'Santiago', N'994314257', N'123', 50000, CAST(N'2018-09-13' AS Date), N'Si')
GO
INSERT [dbo].[Usuario] ([rut], [nombre], [direccion], [telefono], [contraseña], [saldo], [FechaRegistro], [activo]) VALUES (N'admin', N'admin', N'xxx', N'xxx', N'admin', 0, CAST(N'2018-12-10' AS Date), N'Si')
GO
INSERT [dbo].[Usuario] ([rut], [nombre], [direccion], [telefono], [contraseña], [saldo], [FechaRegistro], [activo]) VALUES (N'XXXXXXXX-X', N'Pedro Perez', N'Santiago', N'23458976', N'123', 50000, CAST(N'2018-09-13' AS Date), N'Si')
GO
INSERT [dbo].[Vehiculo] ([patente], [marca], [modelo], [color], [rut]) VALUES (N'23JD90', N'Nissan', N'Skyline', N'Rojo', N'17426398-K')
GO
INSERT [dbo].[Vehiculo] ([patente], [marca], [modelo], [color], [rut]) VALUES (N'999999', N'Nissan', N'Skyline', N'Rojo', N'17426398-K')
GO
INSERT [dbo].[Vehiculo] ([patente], [marca], [modelo], [color], [rut]) VALUES (N'CPJT47', N'Chevrolet', N'Spark', N'Blanco', N'12641735-7')
GO
INSERT [dbo].[Vehiculo] ([patente], [marca], [modelo], [color], [rut]) VALUES (N'FXGH37', N'Chevrolet', N'Spark', N'Negro', N'19517447-4')
GO
INSERT [dbo].[Vehiculo] ([patente], [marca], [modelo], [color], [rut]) VALUES (N'JXCZ49', N'Toyota', N'Yaris', N'Grafito', N'17196757-0')
GO
INSERT [dbo].[Vehiculo] ([patente], [marca], [modelo], [color], [rut]) VALUES (N'RTEP58', N'Chevrolet', N'Camaro', N'Rojo', N'18408289-6')
GO
SET IDENTITY_INSERT [dbo].[Viaje] ON 
GO
INSERT [dbo].[Viaje] ([rut], [patente], [ruta], [precio], [fecha], [codigo]) VALUES (N'19517447-4', N'FXGH37', N'Santiago-Mendoza', CAST(8160 AS Decimal(18, 0)), CAST(N'2018-09-14' AS Date), 3023)
GO
INSERT [dbo].[Viaje] ([rut], [patente], [ruta], [precio], [fecha], [codigo]) VALUES (N'19517447-4', N'FXGH37', N'Santiago-La Serena', CAST(15200 AS Decimal(18, 0)), CAST(N'2018-09-22' AS Date), 3024)
GO
INSERT [dbo].[Viaje] ([rut], [patente], [ruta], [precio], [fecha], [codigo]) VALUES (N'19517447-4', N'FXGH37', N'Santiago-Lican Ray', CAST(17920 AS Decimal(18, 0)), CAST(N'2018-10-07' AS Date), 3025)
GO
INSERT [dbo].[Viaje] ([rut], [patente], [ruta], [precio], [fecha], [codigo]) VALUES (N'19517447-4', N'FXGH37', N'Santiago-Viña del Mar', CAST(7040 AS Decimal(18, 0)), CAST(N'2018-10-05' AS Date), 3026)
GO
INSERT [dbo].[Viaje] ([rut], [patente], [ruta], [precio], [fecha], [codigo]) VALUES (N'12641735-7', N'CPJT47', N'Santiago-Lican Ray', CAST(17920 AS Decimal(18, 0)), CAST(N'2018-09-21' AS Date), 3027)
GO
INSERT [dbo].[Viaje] ([rut], [patente], [ruta], [precio], [fecha], [codigo]) VALUES (N'12641735-7', N'CPJT47', N'Santiago-La Serena', CAST(15200 AS Decimal(18, 0)), CAST(N'2018-10-07' AS Date), 3028)
GO
INSERT [dbo].[Viaje] ([rut], [patente], [ruta], [precio], [fecha], [codigo]) VALUES (N'12641735-7', N'CPJT47', N'Santiago-Mendoza', CAST(8160 AS Decimal(18, 0)), CAST(N'2018-10-27' AS Date), 3029)
GO
INSERT [dbo].[Viaje] ([rut], [patente], [ruta], [precio], [fecha], [codigo]) VALUES (N'17196757-0', N'JXCZ49', N'Santiago-Los Angeles', CAST(12800 AS Decimal(18, 0)), CAST(N'2018-09-28' AS Date), 3030)
GO
INSERT [dbo].[Viaje] ([rut], [patente], [ruta], [precio], [fecha], [codigo]) VALUES (N'17196757-0', N'JXCZ49', N'Santiago-Mendoza', CAST(8160 AS Decimal(18, 0)), CAST(N'2018-10-07' AS Date), 3031)
GO
INSERT [dbo].[Viaje] ([rut], [patente], [ruta], [precio], [fecha], [codigo]) VALUES (N'17196757-0', N'JXCZ49', N'Santiago-La Serena', CAST(15200 AS Decimal(18, 0)), CAST(N'2018-10-11' AS Date), 3032)
GO
INSERT [dbo].[Viaje] ([rut], [patente], [ruta], [precio], [fecha], [codigo]) VALUES (N'17196757-0', N'JXCZ49', N'Santiago-La Serena', CAST(15200 AS Decimal(18, 0)), CAST(N'2018-10-27' AS Date), 3033)
GO
INSERT [dbo].[Viaje] ([rut], [patente], [ruta], [precio], [fecha], [codigo]) VALUES (N'18408289-6', N'RTEP58', N'Santiago-La Serena', CAST(15200 AS Decimal(18, 0)), CAST(N'2018-09-20' AS Date), 3034)
GO
INSERT [dbo].[Viaje] ([rut], [patente], [ruta], [precio], [fecha], [codigo]) VALUES (N'17426398-K', N'999999', N'Santiago-La Serena', CAST(15200 AS Decimal(18, 0)), CAST(N'2018-09-20' AS Date), 3035)
GO
INSERT [dbo].[Viaje] ([rut], [patente], [ruta], [precio], [fecha], [codigo]) VALUES (N'18408289-6', N'RTEP58', N'Santiago-La Serena', CAST(15200 AS Decimal(18, 0)), CAST(N'2018-09-27' AS Date), 3036)
GO
INSERT [dbo].[Viaje] ([rut], [patente], [ruta], [precio], [fecha], [codigo]) VALUES (N'18408289-6', N'RTEP58', N'Santiago-La Serena', CAST(15200 AS Decimal(18, 0)), CAST(N'2018-09-27' AS Date), 3037)
GO
INSERT [dbo].[Viaje] ([rut], [patente], [ruta], [precio], [fecha], [codigo]) VALUES (N'17426398-K', N'23JD90', N'Santiago-Lican Ray', CAST(17920 AS Decimal(18, 0)), CAST(N'2018-09-28' AS Date), 3038)
GO
INSERT [dbo].[Viaje] ([rut], [patente], [ruta], [precio], [fecha], [codigo]) VALUES (N'17426398-K', N'23JD90', N'Santiago-Los Angeles', CAST(12800 AS Decimal(18, 0)), CAST(N'2018-09-29' AS Date), 3039)
GO
SET IDENTITY_INSERT [dbo].[Viaje] OFF
GO
ALTER TABLE [dbo].[Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Vehiculo_Usuario] FOREIGN KEY([rut])
REFERENCES [dbo].[Usuario] ([rut])
GO
ALTER TABLE [dbo].[Vehiculo] CHECK CONSTRAINT [FK_Vehiculo_Usuario]
GO
ALTER TABLE [dbo].[Viaje]  WITH CHECK ADD  CONSTRAINT [FK_Viaje_Peaje] FOREIGN KEY([ruta])
REFERENCES [dbo].[Peaje] ([ruta])
GO
ALTER TABLE [dbo].[Viaje] CHECK CONSTRAINT [FK_Viaje_Peaje]
GO
ALTER TABLE [dbo].[Viaje]  WITH CHECK ADD  CONSTRAINT [FK_Viaje_Usuario] FOREIGN KEY([rut])
REFERENCES [dbo].[Usuario] ([rut])
GO
ALTER TABLE [dbo].[Viaje] CHECK CONSTRAINT [FK_Viaje_Usuario]
GO
USE [master]
GO
ALTER DATABASE [SmartPay] SET  READ_WRITE 
GO
