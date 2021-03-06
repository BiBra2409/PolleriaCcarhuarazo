USE [master]
GO
/****** Object:  Database [Restaurante]    Script Date: 14/01/2019 17:03:15 ******/
CREATE DATABASE [Restaurante]
ALTER DATABASE [Restaurante] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Restaurante].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Restaurante] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Restaurante] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Restaurante] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Restaurante] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Restaurante] SET ARITHABORT OFF 
GO
ALTER DATABASE [Restaurante] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Restaurante] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Restaurante] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Restaurante] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Restaurante] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Restaurante] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Restaurante] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Restaurante] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Restaurante] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Restaurante] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Restaurante] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Restaurante] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Restaurante] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Restaurante] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Restaurante] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Restaurante] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Restaurante] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Restaurante] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Restaurante] SET  MULTI_USER 
GO
ALTER DATABASE [Restaurante] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Restaurante] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Restaurante] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Restaurante] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Restaurante] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Restaurante] SET QUERY_STORE = OFF
GO
USE [Restaurante]
GO
/****** Object:  Table [dbo].[DBS]    Script Date: 14/01/2019 17:03:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdPedido] [int] NULL,
	[MontoTotal] [decimal](18, 0) NULL,
	[IdModoDePago] [int] NULL,
 CONSTRAINT [PK_DBS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleBoleta]    Script Date: 14/01/2019 17:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleBoleta](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdPedido] [int] NOT NULL,
	[MontoTotal] [decimal](18, 2) NOT NULL,
	[IdModoDePago] [int] NOT NULL,
 CONSTRAINT [PK_DetalleBoleta] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 14/01/2019 17:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[ID] [nvarchar](50) NOT NULL,
	[Contraseña] [nvarchar](50) NOT NULL,
	[IdTipoEmpleado] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Celular] [int] NOT NULL,
	[Correo] [nvarchar](100) NOT NULL,
	[Direccion] [nvarchar](50) NOT NULL,
	[Sueldo] [money] NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModoDePago]    Script Date: 14/01/2019 17:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModoDePago](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ModoDePago] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 14/01/2019 17:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Atendido] [bit] NOT NULL,
	[Detalle] [nvarchar](50) NOT NULL,
	[IdEmpleado] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PPS]    Script Date: 14/01/2019 17:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PPS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NULL,
	[IdPedido] [int] NULL,
	[Observacion] [nvarchar](50) NULL,
 CONSTRAINT [PK_PPS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 14/01/2019 17:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[IdTipoProducto] [int] NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
	[imagen] [nvarchar](50) NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos_Pedidos]    Script Date: 14/01/2019 17:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos_Pedidos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[IdPedido] [int] NOT NULL,
	[Observacion] [nvarchar](50) NULL,
 CONSTRAINT [PK_Productos_Pedidos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PS]    Script Date: 14/01/2019 17:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Atendido] [bit] NULL,
	[Detalle] [nvarchar](50) NULL,
 CONSTRAINT [PK_PS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEmpleado]    Script Date: 14/01/2019 17:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEmpleado](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[Sueldo] [decimal](18, 2) NULL,
 CONSTRAINT [PK_TipoEmpleado] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoProducto]    Script Date: 14/01/2019 17:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoProducto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TipoProducto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DetalleBoleta] ON 

INSERT [dbo].[DetalleBoleta] ([ID], [IdPedido], [MontoTotal], [IdModoDePago]) VALUES (1, 1, CAST(30.30 AS Decimal(18, 2)), 1)
INSERT [dbo].[DetalleBoleta] ([ID], [IdPedido], [MontoTotal], [IdModoDePago]) VALUES (2, 2, CAST(36.50 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[DetalleBoleta] OFF
INSERT [dbo].[Empleado] ([ID], [Contraseña], [IdTipoEmpleado], [Nombre], [Celular], [Correo], [Direccion], [Sueldo]) VALUES (N'ADMINMax', N'1234', 1, N'Max', 998877665, N'max2.lara435676@gmail.com', N'Alipio Ponce', 1200.0000)
INSERT [dbo].[Empleado] ([ID], [Contraseña], [IdTipoEmpleado], [Nombre], [Celular], [Correo], [Direccion], [Sueldo]) VALUES (N'ADMINRenato', N'1234', 1, N'Renato Zegarra Villa', 944645999, N'rezv98@gmail.com', N'Av Tupac 191', 0.0000)
INSERT [dbo].[Empleado] ([ID], [Contraseña], [IdTipoEmpleado], [Nombre], [Celular], [Correo], [Direccion], [Sueldo]) VALUES (N'ADMINRodrigo', N'1234', 1, N'Rodrigo Max Lara Camarena', 988403355, N'max.lara@hotmail.com', N'Av. LosAlamos 141', 0.0000)
INSERT [dbo].[Empleado] ([ID], [Contraseña], [IdTipoEmpleado], [Nombre], [Celular], [Correo], [Direccion], [Sueldo]) VALUES (N'ALC', N'1234', 5, N'Andrea Lara Camarena', 944645263, N'andrealara@hotmail.com', N'Av. LosAlamos 141', 0.0000)
INSERT [dbo].[Empleado] ([ID], [Contraseña], [IdTipoEmpleado], [Nombre], [Celular], [Correo], [Direccion], [Sueldo]) VALUES (N'CAAndrea', N'12345678', 2, N'Andrea', 988403360, N'andrea@hotmail.com', N'Av. Los Alamos 141', 800.0000)
INSERT [dbo].[Empleado] ([ID], [Contraseña], [IdTipoEmpleado], [Nombre], [Celular], [Correo], [Direccion], [Sueldo]) VALUES (N'CARodrigo', N'123456', 2, N'Rodrigo', 944645888, N'max.lara99999999@gmail.com', N'Av. Mariscal La Mar 175', 800.0000)
INSERT [dbo].[Empleado] ([ID], [Contraseña], [IdTipoEmpleado], [Nombre], [Celular], [Correo], [Direccion], [Sueldo]) VALUES (N'CodigoFuente', N'1234', 5, N'Rodrigo Max Lara Camarena', 944645247, N'CodigoFuente@gmail.com', N'Av. Mariscal La Mar 673', 0.0000)
INSERT [dbo].[Empleado] ([ID], [Contraseña], [IdTipoEmpleado], [Nombre], [Celular], [Correo], [Direccion], [Sueldo]) VALUES (N'COJorge', N'abcd', 3, N'Jorge', 999999999, N'jorge2@gmail.com', N'calle alamos 260', 600.0000)
INSERT [dbo].[Empleado] ([ID], [Contraseña], [IdTipoEmpleado], [Nombre], [Celular], [Correo], [Direccion], [Sueldo]) VALUES (N'CORenato', N'renato777', 3, N'Renato', 984018241, N'rezv98@gmail.com', N'Av Los Incas 323', 600.0000)
INSERT [dbo].[Empleado] ([ID], [Contraseña], [IdTipoEmpleado], [Nombre], [Celular], [Correo], [Direccion], [Sueldo]) VALUES (N'COSergio', N'12345', 3, N'Sergio', 998877664, N'sergio.slc@hotmail.com', N'Resid.Inclan Block 20', 600.0000)
INSERT [dbo].[Empleado] ([ID], [Contraseña], [IdTipoEmpleado], [Nombre], [Celular], [Correo], [Direccion], [Sueldo]) VALUES (N'daniprofe', N'1234', 5, N'daniel', 123456789, N'dancarvas2431@gmail.com', N'calle upc', 0.0000)
INSERT [dbo].[Empleado] ([ID], [Contraseña], [IdTipoEmpleado], [Nombre], [Celular], [Correo], [Direccion], [Sueldo]) VALUES (N'nuevo', N'1234', 2, N'pepe lucho di maria', 456789032, N'asd@upc.pe', N'av. la lucha', 0.0000)
SET IDENTITY_INSERT [dbo].[ModoDePago] ON 

INSERT [dbo].[ModoDePago] ([ID], [Descripcion]) VALUES (1, N'efectivo')
INSERT [dbo].[ModoDePago] ([ID], [Descripcion]) VALUES (2, N'visa')
INSERT [dbo].[ModoDePago] ([ID], [Descripcion]) VALUES (3, N'mastercard')
INSERT [dbo].[ModoDePago] ([ID], [Descripcion]) VALUES (4, N'dolares')
SET IDENTITY_INSERT [dbo].[ModoDePago] OFF
SET IDENTITY_INSERT [dbo].[Pedido] ON 

INSERT [dbo].[Pedido] ([ID], [Atendido], [Detalle], [IdEmpleado]) VALUES (1, 0, N'Andrea Lara Camarena', N'ADMINMax')
INSERT [dbo].[Pedido] ([ID], [Atendido], [Detalle], [IdEmpleado]) VALUES (2, 0, N'Rodrigo Max Lara Camarena', N'ADMINMax')
SET IDENTITY_INSERT [dbo].[Pedido] OFF
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (1, N'Pollo a la brasa', 1, CAST(9.50 AS Decimal(18, 2)), N'1/4 de pollo a la brasa más papas y ensalada', N'polloabrasa.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (2, N'Pollo broaster', 1, CAST(11.50 AS Decimal(18, 2)), N'de pollo broaster más papas y ensalada', N'pollobroaster.jpg')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (3, N'Pollo a la parrilla', 1, CAST(13.50 AS Decimal(18, 2)), N'Un filete de pollo a la plancha más papas y ensalada', N'filietepollo.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (4, N'Lomo a la parilla', 1, CAST(14.00 AS Decimal(18, 2)), N'Lomo fino a la parilla más papas y ensalada', N'lomo.jpg')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (5, N'Antichucho', 1, CAST(12.00 AS Decimal(18, 2)), N'2 Brochetas de carne de res más papas a horno', N'anticucho.jpg')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (6, N'Antichucho de corazon', 1, CAST(13.00 AS Decimal(18, 2)), N'2 Brochetas de carne de corazon más papas a horno', N'anticuchoscorazon.jpg')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (7, N'Pechuga rellena', 1, CAST(13.50 AS Decimal(18, 2)), N'Pechuga rellana de queso y jamon más papas', N'pechugarellena.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (8, N'Mostrito', 1, CAST(11.50 AS Decimal(18, 2)), N'Pollo broaster más chaufa y papas fritas', N'mostro.jpg')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (9, N'Chuleta a la parilla', 1, CAST(15.90 AS Decimal(18, 2)), N'Chuleta de cerdo a la parilla más papas y ensalada', N'chuletacerdo.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (10, N'Salchipapa', 1, CAST(9.50 AS Decimal(18, 2)), N'Porcion de papas fritas más hot dog', N'salchipapa.jpg')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (11, N'Papas Fritas', 2, CAST(5.50 AS Decimal(18, 2)), N'Papas fritas crocantes', N'papasfritas.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (12, N'Onion Rings', 2, CAST(7.90 AS Decimal(18, 2)), N'Aros empannizados rellenos de cebolla', N'OnionRings.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (13, N'Cheese Fingers', 2, CAST(8.90 AS Decimal(18, 2)), N'Palillos rellenos de queso', N'cheesefingers.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (14, N'Nuggets', 2, CAST(10.90 AS Decimal(18, 2)), N'Trozos de pollo crujientes', N'nuggets.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (15, N'San Mateo', 2, CAST(2.50 AS Decimal(18, 2)), N'Agua Mineral', N'sanmateo.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (16, N'San Luis', 2, CAST(2.00 AS Decimal(18, 2)), N'Agua Mineral', N'sanluis.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (17, N'Inka Kola', 2, CAST(12.00 AS Decimal(18, 2)), N'Gaseosa 3L ', N'inka.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (18, N'Coca Cola', 2, CAST(12.50 AS Decimal(18, 2)), N'Gaseosa 3L', N'cocacola.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (19, N'Seven Up', 2, CAST(2.50 AS Decimal(18, 2)), N'Gaseosa sabor a lima limon', N'sevenup.png')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (20, N'Pollo entero', 3, CAST(50.90 AS Decimal(18, 2)), N'1 Pollo a la braza entero más papas , ensalada y gaseosa ', N'polloentero.jpg')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (21, N'Parilla mixta', 3, CAST(40.90 AS Decimal(18, 2)), N'Filete de pollo,lomo más antichuchos ', N'parillamixta.jpg')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (22, N'Combo Familiar', 3, CAST(60.90 AS Decimal(18, 2)), N'1 Pollo a la braza entero + una porcion de chaufa+ papas +ensalada y gaseosa', N'combofamiliar.jpg')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (23, N'Braza Ccarhuarazo', 3, CAST(20.90 AS Decimal(18, 2)), N'1/4 de pollo a brasa + brocheta de aticucho+chorizo+papas y ensalda', N'comboC.jpg')
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (24, N'fanta', 2, CAST(2.50 AS Decimal(18, 2)), N'Gaseosa con sabor de naranja', N'fanta.png')
SET IDENTITY_INSERT [dbo].[Producto] OFF
SET IDENTITY_INSERT [dbo].[Productos_Pedidos] ON 

INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (1, 1, 1, NULL)
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (2, 7, 1, NULL)
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (3, 16, 1, NULL)
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (4, 1, 2, NULL)
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (5, 4, 2, NULL)
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (6, 11, 2, NULL)
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (7, 19, 2, NULL)
SET IDENTITY_INSERT [dbo].[Productos_Pedidos] OFF
SET IDENTITY_INSERT [dbo].[TipoEmpleado] ON 

INSERT [dbo].[TipoEmpleado] ([ID], [Descripcion], [Sueldo]) VALUES (1, N'admin', CAST(1200.00 AS Decimal(18, 2)))
INSERT [dbo].[TipoEmpleado] ([ID], [Descripcion], [Sueldo]) VALUES (2, N'cajero', CAST(800.00 AS Decimal(18, 2)))
INSERT [dbo].[TipoEmpleado] ([ID], [Descripcion], [Sueldo]) VALUES (3, N'cocinero', CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[TipoEmpleado] ([ID], [Descripcion], [Sueldo]) VALUES (5, N'cliente', CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[TipoEmpleado] ([ID], [Descripcion], [Sueldo]) VALUES (6, N'Seguridad', CAST(900.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[TipoEmpleado] OFF
SET IDENTITY_INSERT [dbo].[TipoProducto] ON 

INSERT [dbo].[TipoProducto] ([ID], [Descripcion]) VALUES (1, N'Platillo')
INSERT [dbo].[TipoProducto] ([ID], [Descripcion]) VALUES (2, N'Complemento')
INSERT [dbo].[TipoProducto] ([ID], [Descripcion]) VALUES (3, N'Combo')
SET IDENTITY_INSERT [dbo].[TipoProducto] OFF
ALTER TABLE [dbo].[DBS]  WITH CHECK ADD  CONSTRAINT [FK_DBS_ModoDePago] FOREIGN KEY([IdModoDePago])
REFERENCES [dbo].[ModoDePago] ([ID])
GO
ALTER TABLE [dbo].[DBS] CHECK CONSTRAINT [FK_DBS_ModoDePago]
GO
ALTER TABLE [dbo].[DBS]  WITH CHECK ADD  CONSTRAINT [FK_DBS_PS] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[PS] ([ID])
GO
ALTER TABLE [dbo].[DBS] CHECK CONSTRAINT [FK_DBS_PS]
GO
ALTER TABLE [dbo].[DetalleBoleta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleBoleta_ModoDePago] FOREIGN KEY([IdModoDePago])
REFERENCES [dbo].[ModoDePago] ([ID])
GO
ALTER TABLE [dbo].[DetalleBoleta] CHECK CONSTRAINT [FK_DetalleBoleta_ModoDePago]
GO
ALTER TABLE [dbo].[DetalleBoleta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleBoleta_Pedido] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedido] ([ID])
GO
ALTER TABLE [dbo].[DetalleBoleta] CHECK CONSTRAINT [FK_DetalleBoleta_Pedido]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_TipoEmpleado] FOREIGN KEY([IdTipoEmpleado])
REFERENCES [dbo].[TipoEmpleado] ([ID])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_TipoEmpleado]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Pedido] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([ID])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Pedido]
GO
ALTER TABLE [dbo].[PPS]  WITH CHECK ADD  CONSTRAINT [FK_PPS_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([ID])
GO
ALTER TABLE [dbo].[PPS] CHECK CONSTRAINT [FK_PPS_Producto]
GO
ALTER TABLE [dbo].[PPS]  WITH CHECK ADD  CONSTRAINT [FK_PPS_PS] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[PS] ([ID])
GO
ALTER TABLE [dbo].[PPS] CHECK CONSTRAINT [FK_PPS_PS]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_TipoProducto] FOREIGN KEY([IdTipoProducto])
REFERENCES [dbo].[TipoProducto] ([ID])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_TipoProducto]
GO
ALTER TABLE [dbo].[Productos_Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Pedidos_Pedido] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedido] ([ID])
GO
ALTER TABLE [dbo].[Productos_Pedidos] CHECK CONSTRAINT [FK_Productos_Pedidos_Pedido]
GO
ALTER TABLE [dbo].[Productos_Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Pedidos_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([ID])
GO
ALTER TABLE [dbo].[Productos_Pedidos] CHECK CONSTRAINT [FK_Productos_Pedidos_Producto]
GO
/****** Object:  StoredProcedure [dbo].[eliminar]    Script Date: 14/01/2019 17:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[eliminar]
AS
BEGIN
	delete from DBS 
	delete from PPS
    delete from PS
	DBCC CHECKIDENT (PS, RESEED,0)
	DBCC CHECKIDENT (PPS, RESEED,0)
	DBCC CHECKIDENT (DBS, RESEED,0)
END
GO
/****** Object:  StoredProcedure [dbo].[eliminarTodo]    Script Date: 14/01/2019 17:03:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[eliminarTodo] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
delete from DBS 
	delete from PPS
    delete from PS
	DBCC CHECKIDENT (PS, RESEED,0)
	DBCC CHECKIDENT (PPS, RESEED,0)
	DBCC CHECKIDENT (DBS, RESEED,0)
	END
GO
USE [master]
GO
ALTER DATABASE [Restaurante] SET  READ_WRITE 
GO
