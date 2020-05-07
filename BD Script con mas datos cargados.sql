USE [UnlaTravel]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vuelo]') AND type in (N'U'))
ALTER TABLE [dbo].[Vuelo] DROP CONSTRAINT IF EXISTS [FK_Vuelo_Origen]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vuelo]') AND type in (N'U'))
ALTER TABLE [dbo].[Vuelo] DROP CONSTRAINT IF EXISTS [FK_Vuelo_Destino]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reserva]') AND type in (N'U'))
ALTER TABLE [dbo].[Reserva] DROP CONSTRAINT IF EXISTS [FK_Reserva_Vuelo]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reserva]') AND type in (N'U'))
ALTER TABLE [dbo].[Reserva] DROP CONSTRAINT IF EXISTS [FK_Reserva_Usuario]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reserva]') AND type in (N'U'))
ALTER TABLE [dbo].[Reserva] DROP CONSTRAINT IF EXISTS [FK_Reserva_Paquete]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reserva]') AND type in (N'U'))
ALTER TABLE [dbo].[Reserva] DROP CONSTRAINT IF EXISTS [FK_Reserva_Destino]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reserva]') AND type in (N'U'))
ALTER TABLE [dbo].[Reserva] DROP CONSTRAINT IF EXISTS [FK_Reserva_Alojamiento]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reserva]') AND type in (N'U'))
ALTER TABLE [dbo].[Reserva] DROP CONSTRAINT IF EXISTS [FK_Reserva_Actividad]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paquete]') AND type in (N'U'))
ALTER TABLE [dbo].[Paquete] DROP CONSTRAINT IF EXISTS [FK_Paquete_Vuelo]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paquete]') AND type in (N'U'))
ALTER TABLE [dbo].[Paquete] DROP CONSTRAINT IF EXISTS [FK_Paquete_Destino]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paquete]') AND type in (N'U'))
ALTER TABLE [dbo].[Paquete] DROP CONSTRAINT IF EXISTS [FK_Paquete_Alojamiento]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paquete]') AND type in (N'U'))
ALTER TABLE [dbo].[Paquete] DROP CONSTRAINT IF EXISTS [FK_Paquete_Actividad]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Alojamiento]') AND type in (N'U'))
ALTER TABLE [dbo].[Alojamiento] DROP CONSTRAINT IF EXISTS [FK_Alojamiento_TipoRegimen]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Alojamiento]') AND type in (N'U'))
ALTER TABLE [dbo].[Alojamiento] DROP CONSTRAINT IF EXISTS [FK_Alojamiento_TipoAlojamiento]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Alojamiento]') AND type in (N'U'))
ALTER TABLE [dbo].[Alojamiento] DROP CONSTRAINT IF EXISTS [FK_Alojamiento_Destino]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Actividad]') AND type in (N'U'))
ALTER TABLE [dbo].[Actividad] DROP CONSTRAINT IF EXISTS [FK_Actividad_Destino]
GO
/****** Object:  Table [dbo].[Vuelo]    Script Date: 1/5/2020 6:56:21 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Vuelo]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 1/5/2020 6:56:21 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Usuario]
GO
/****** Object:  Table [dbo].[TipoRegimen]    Script Date: 1/5/2020 6:56:21 p. m. ******/
DROP TABLE IF EXISTS [dbo].[TipoRegimen]
GO
/****** Object:  Table [dbo].[TipoAlojamiento]    Script Date: 1/5/2020 6:56:21 p. m. ******/
DROP TABLE IF EXISTS [dbo].[TipoAlojamiento]
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 1/5/2020 6:56:21 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Reserva]
GO
/****** Object:  Table [dbo].[Paquete]    Script Date: 1/5/2020 6:56:21 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Paquete]
GO
/****** Object:  Table [dbo].[Destino]    Script Date: 1/5/2020 6:56:21 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Destino]
GO
/****** Object:  Table [dbo].[Alojamiento]    Script Date: 1/5/2020 6:56:21 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Alojamiento]
GO
/****** Object:  Table [dbo].[Actividad]    Script Date: 1/5/2020 6:56:21 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Actividad]
GO
/****** Object:  Table [dbo].[Actividad]    Script Date: 7/5/2020 16:19:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actividad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fechaDesde] [datetime] NOT NULL,
	[fechaHasta] [datetime] NOT NULL,
	[nombreActividad] [varchar](50) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[franjaHoraria] [varchar](50) NULL,
	[lugar] [varchar](50) NULL,
	[valoracion] [varchar](50) NULL,
	[accesoDiscapacitados] [bit] NOT NULL,
	[destino] [int] NOT NULL,
 CONSTRAINT [PK_Actividad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alojamiento]    Script Date: 7/5/2020 16:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alojamiento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cantidadEstrellas] [int] NULL,
	[nombreAlojamiento] [varchar](50) NOT NULL,
	[link] [varchar](max) NULL,
	[tipoServicio] [varchar](50) NOT NULL,
	[tipoHabitacion] [varchar](50) NOT NULL,
	[accesoDiscapacitados] [bit] NOT NULL,
	[destino] [int] NOT NULL,
	[tipoAlojamiento] [int] NOT NULL,
	[tipoRegimen] [int] NOT NULL,
 CONSTRAINT [PK_Alojamiento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destino]    Script Date: 7/5/2020 16:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destino](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pais] [varchar](50) NOT NULL,
	[region] [varchar](50) NOT NULL,
	[ciudad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Destino] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paquete]    Script Date: 7/5/2020 16:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paquete](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipoPaquete] [varchar](50) NOT NULL,
	[destino] [int] NOT NULL,
	[fechaIda] [datetime] NOT NULL,
	[fechaVuelta] [datetime] NOT NULL,
	[alojamiento] [int] NOT NULL,
	[vuelo] [int] NOT NULL,
	[actividad] [int] NOT NULL,
	[cantidadPersonas] [int] NOT NULL,
	[habitaciones] [int] NOT NULL,
	[accesoDiscapacitados] [bit] NOT NULL,
 CONSTRAINT [PK_Paquete] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 7/5/2020 16:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nroReserva] [varchar](50) NOT NULL,
	[usuario] [int] NOT NULL,
	[destino] [int] NOT NULL,
	[alojamiento] [int] NOT NULL,
	[actividad] [int] NOT NULL,
	[vuelo] [int] NOT NULL,
	[esUnPaquete] [bit] NOT NULL,
	[paquete] [int] NULL,
	[importe] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoAlojamiento]    Script Date: 7/5/2020 16:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoAlojamiento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_TipoAlojamiento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoRegimen]    Script Date: 7/5/2020 16:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoRegimen](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_TipoRegimen] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 7/5/2020 16:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dni] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[nacionalidad] [varchar](50) NOT NULL,
	[domicilio] [varchar](50) NOT NULL,
	[mail] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[contraseña] [varchar](50) NOT NULL,
	[rol] [bit] NOT NULL,
 CONSTRAINT [PK__Usuario__C0308574275D52DE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vuelo]    Script Date: 7/5/2020 16:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vuelo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fechaIda] [datetime] NOT NULL,
	[fechaVuelta] [datetime] NOT NULL,
	[origen] [int] NOT NULL,
	[destino] [int] NOT NULL,
	[idaVuelta] [bit] NOT NULL,
	[valoracionAereolinea] [int] NULL,
	[clase] [varchar](20) NOT NULL,
	[conEscala] [bit] NOT NULL,
	[accesoDiscapacitados] [bit] NOT NULL,
 CONSTRAINT [PK_Vuelo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Actividad] ON 

INSERT [dbo].[Actividad] ([id], [fechaDesde], [fechaHasta], [nombreActividad], [descripcion], [franjaHoraria], [lugar], [valoracion], [accesoDiscapacitados], [destino]) VALUES (1, CAST(N'2020-01-10T11:00:00.000' AS DateTime), CAST(N'2020-01-10T18:00:00.000' AS DateTime), N'La Cumbrecita', N'Excursion', N'7 horas', N'Peñon del Aguila', N'4 estrellas', 1, 1)
INSERT [dbo].[Actividad] ([id], [fechaDesde], [fechaHasta], [nombreActividad], [descripcion], [franjaHoraria], [lugar], [valoracion], [accesoDiscapacitados], [destino]) VALUES (2, CAST(N'2020-01-11T09:00:00.000' AS DateTime), CAST(N'2020-01-11T17:00:00.000' AS DateTime), N'Glaciar Perito Moreno', N'Excursion', N'8 horas', N'Perito Moreno', N'5 estrellas', 1, 2)
INSERT [dbo].[Actividad] ([id], [fechaDesde], [fechaHasta], [nombreActividad], [descripcion], [franjaHoraria], [lugar], [valoracion], [accesoDiscapacitados], [destino]) VALUES (3, CAST(N'2020-01-12T07:00:00.000' AS DateTime), CAST(N'2020-01-12T15:00:00.000' AS DateTime), N'Cataratas del Iguazú', N'Excursion', N'8 horas', N'Iguazú', N'5 estrellas', 1, 3)
INSERT [dbo].[Actividad] ([id], [fechaDesde], [fechaHasta], [nombreActividad], [descripcion], [franjaHoraria], [lugar], [valoracion], [accesoDiscapacitados], [destino]) VALUES (4, CAST(N'2020-01-13T10:00:00.000' AS DateTime), CAST(N'2020-01-13T16:00:00.000' AS DateTime), N'Tour Estadio Boca Jr', N'Excursion', N'6 horas', N'La Bombonera', N'5 estrellas', 1, 4)
INSERT [dbo].[Actividad] ([id], [fechaDesde], [fechaHasta], [nombreActividad], [descripcion], [franjaHoraria], [lugar], [valoracion], [accesoDiscapacitados], [destino]) VALUES (5, CAST(N'2020-01-14T09:00:00.000' AS DateTime), CAST(N'2020-01-14T19:00:00.000' AS DateTime), N'San Martin de los Andes', N'Excursion', N'10 horas', N'Lago Lácar', N'5 estrellas', 0, 5)
INSERT [dbo].[Actividad] ([id], [fechaDesde], [fechaHasta], [nombreActividad], [descripcion], [franjaHoraria], [lugar], [valoracion], [accesoDiscapacitados], [destino]) VALUES (6, CAST(N'2020-01-15T07:10:00.000' AS DateTime), CAST(N'2020-01-15T19:40:00.000' AS DateTime), N'Bodegas de Cafayate', N'Excursion', N'12h 30m', N'Quebrada de las conchas', N'4 estrellas', 0, 6)
INSERT [dbo].[Actividad] ([id], [fechaDesde], [fechaHasta], [nombreActividad], [descripcion], [franjaHoraria], [lugar], [valoracion], [accesoDiscapacitados], [destino]) VALUES (7, CAST(N'2020-01-16T07:00:00.000' AS DateTime), CAST(N'2020-01-16T19:00:00.000' AS DateTime), N'Visita Minas de Wanda', N'Excursion', N'4 - 12 horas', N'Ruinas de San Ignacio', N'4 estrellas', 0, 3)
INSERT [dbo].[Actividad] ([id], [fechaDesde], [fechaHasta], [nombreActividad], [descripcion], [franjaHoraria], [lugar], [valoracion], [accesoDiscapacitados], [destino]) VALUES (8, CAST(N'2020-01-17T18:00:00.000' AS DateTime), CAST(N'2020-01-17T22:00:00.000' AS DateTime), N'Madero Tango', N'Espectáculo', N'4 horas', N'Iguazú', N'5 estrellas', 1, 3)
INSERT [dbo].[Actividad] ([id], [fechaDesde], [fechaHasta], [nombreActividad], [descripcion], [franjaHoraria], [lugar], [valoracion], [accesoDiscapacitados], [destino]) VALUES (9, CAST(N'2020-01-18T07:00:00.000' AS DateTime), CAST(N'2020-01-18T17:00:00.000' AS DateTime), N'El Chaltén', N'Excursion', N'4 horas', N'El Chaltén', N'5 estrellas', 1, 2)
SET IDENTITY_INSERT [dbo].[Actividad] OFF
GO
SET IDENTITY_INSERT [dbo].[Alojamiento] ON 

INSERT [dbo].[Alojamiento] ([id], [cantidadEstrellas], [nombreAlojamiento], [link], [tipoServicio], [tipoHabitacion], [accesoDiscapacitados], [destino], [tipoAlojamiento], [tipoRegimen]) VALUES (1, 5, N'Llao Llao', NULL, N'Suite', N'Suite', 1, 5, 7, 4)
INSERT [dbo].[Alojamiento] ([id], [cantidadEstrellas], [nombreAlojamiento], [link], [tipoServicio], [tipoHabitacion], [accesoDiscapacitados], [destino], [tipoAlojamiento], [tipoRegimen]) VALUES (2, 5, N'Charming Luxury Lodge', N'www.charming-bariloche.com/', N'Suite y Apartamento', N'Suite', 1, 5, 4, 3)
INSERT [dbo].[Alojamiento] ([id], [cantidadEstrellas], [nombreAlojamiento], [link], [tipoServicio], [tipoHabitacion], [accesoDiscapacitados], [destino], [tipoAlojamiento], [tipoRegimen]) VALUES (3, 5, N'Santa Monica', NULL, N'Suite', N'Suite', 1, 2, 4, 3)
INSERT [dbo].[Alojamiento] ([id], [cantidadEstrellas], [nombreAlojamiento], [link], [tipoServicio], [tipoHabitacion], [accesoDiscapacitados], [destino], [tipoAlojamiento], [tipoRegimen]) VALUES (4, 3, N'Lupama', NULL, N' Suites', N'Suite Nupcial', 1, 2, 8, 3)
INSERT [dbo].[Alojamiento] ([id], [cantidadEstrellas], [nombreAlojamiento], [link], [tipoServicio], [tipoHabitacion], [accesoDiscapacitados], [destino], [tipoAlojamiento], [tipoRegimen]) VALUES (5, 4, N'Vain Boutique', NULL, N'Desayuno gratis', N'Suite', 1, 4, 6, 5)
INSERT [dbo].[Alojamiento] ([id], [cantidadEstrellas], [nombreAlojamiento], [link], [tipoServicio], [tipoHabitacion], [accesoDiscapacitados], [destino], [tipoAlojamiento], [tipoRegimen]) VALUES (6, 5, N'Loi Suites', NULL, N'Suites', N'Suite', 1, 3, 1, 4)
INSERT [dbo].[Alojamiento] ([id], [cantidadEstrellas], [nombreAlojamiento], [link], [tipoServicio], [tipoHabitacion], [accesoDiscapacitados], [destino], [tipoAlojamiento], [tipoRegimen]) VALUES (7, 5, N'Falls Iguazú', NULL, N'Suites', N'Suite', 1, 3, 1, 5)
INSERT [dbo].[Alojamiento] ([id], [cantidadEstrellas], [nombreAlojamiento], [link], [tipoServicio], [tipoHabitacion], [accesoDiscapacitados], [destino], [tipoAlojamiento], [tipoRegimen]) VALUES (8, 5, N'Yeraton', NULL, N'Suite', N'Suite', 1, 1, 10, 4)
INSERT [dbo].[Alojamiento] ([id], [cantidadEstrellas], [nombreAlojamiento], [link], [tipoServicio], [tipoHabitacion], [accesoDiscapacitados], [destino], [tipoAlojamiento], [tipoRegimen]) VALUES (9, 4, N'Nuquen', NULL, N'Suite', N'Suite', 1, 6, 4, 2)
SET IDENTITY_INSERT [dbo].[Alojamiento] OFF
GO
SET IDENTITY_INSERT [dbo].[Destino] ON 

INSERT [dbo].[Destino] ([id], [pais], [region], [ciudad]) VALUES (1, N'Argentina', N'Cordoba', N'Pueblo de cuentos')
INSERT [dbo].[Destino] ([id], [pais], [region], [ciudad]) VALUES (2, N'Argentina', N'Santa Cruz', N'El Calafate')
INSERT [dbo].[Destino] ([id], [pais], [region], [ciudad]) VALUES (3, N'Argentina', N'Misiones', N'Puerto Iguazú')
INSERT [dbo].[Destino] ([id], [pais], [region], [ciudad]) VALUES (4, N'Argentina', N'Buenos Aires', N'C.A.B.A.')
INSERT [dbo].[Destino] ([id], [pais], [region], [ciudad]) VALUES (5, N'Argentina', N'Rio Negro', N'Bariloche')
INSERT [dbo].[Destino] ([id], [pais], [region], [ciudad]) VALUES (6, N'Argentina', N'Salta', N'Salta')
SET IDENTITY_INSERT [dbo].[Destino] OFF
GO
SET IDENTITY_INSERT [dbo].[Paquete] ON 

INSERT [dbo].[Paquete] ([id], [tipoPaquete], [destino], [fechaIda], [fechaVuelta], [alojamiento], [vuelo], [actividad], [cantidadPersonas], [habitaciones], [accesoDiscapacitados]) VALUES (1, N'Circuito', 1, CAST(N'2020-01-10T10:00:00.000' AS DateTime), CAST(N'2020-01-30T11:00:00.000' AS DateTime), 8, 1, 1, 4, 1, 1)
INSERT [dbo].[Paquete] ([id], [tipoPaquete], [destino], [fechaIda], [fechaVuelta], [alojamiento], [vuelo], [actividad], [cantidadPersonas], [habitaciones], [accesoDiscapacitados]) VALUES (2, N'Larga Distancia', 2, CAST(N'2020-01-11T13:00:00.000' AS DateTime), CAST(N'2020-01-31T14:00:00.000' AS DateTime), 3, 2, 2, 10, 3, 0)
INSERT [dbo].[Paquete] ([id], [tipoPaquete], [destino], [fechaIda], [fechaVuelta], [alojamiento], [vuelo], [actividad], [cantidadPersonas], [habitaciones], [accesoDiscapacitados]) VALUES (3, N'Programas de Estancia', 3, CAST(N'2020-01-12T15:00:00.000' AS DateTime), CAST(N'2020-02-01T03:00:00.000' AS DateTime), 7, 3, 3, 5, 2, 0)
INSERT [dbo].[Paquete] ([id], [tipoPaquete], [destino], [fechaIda], [fechaVuelta], [alojamiento], [vuelo], [actividad], [cantidadPersonas], [habitaciones], [accesoDiscapacitados]) VALUES (4, N'Viajes alternativo', 4, CAST(N'2020-01-13T16:00:00.000' AS DateTime), CAST(N'2020-02-02T17:00:00.000' AS DateTime), 5, 4, 4, 2, 1, 1)
INSERT [dbo].[Paquete] ([id], [tipoPaquete], [destino], [fechaIda], [fechaVuelta], [alojamiento], [vuelo], [actividad], [cantidadPersonas], [habitaciones], [accesoDiscapacitados]) VALUES (5, N'Circuito', 5, CAST(N'2020-01-14T13:00:00.000' AS DateTime), CAST(N'2020-02-03T14:00:00.000' AS DateTime), 1, 5, 5, 3, 1, 1)
INSERT [dbo].[Paquete] ([id], [tipoPaquete], [destino], [fechaIda], [fechaVuelta], [alojamiento], [vuelo], [actividad], [cantidadPersonas], [habitaciones], [accesoDiscapacitados]) VALUES (6, N'Circuito', 6, CAST(N'2020-01-15T05:00:00.000' AS DateTime), CAST(N'2020-02-04T03:00:00.000' AS DateTime), 9, 6, 6, 1, 1, 0)
INSERT [dbo].[Paquete] ([id], [tipoPaquete], [destino], [fechaIda], [fechaVuelta], [alojamiento], [vuelo], [actividad], [cantidadPersonas], [habitaciones], [accesoDiscapacitados]) VALUES (7, N'Viajes alternativos', 4, CAST(N'2020-01-16T09:00:00.000' AS DateTime), CAST(N'2020-02-05T10:00:00.000' AS DateTime), 4, 9, 4, 3, 2, 1)
INSERT [dbo].[Paquete] ([id], [tipoPaquete], [destino], [fechaIda], [fechaVuelta], [alojamiento], [vuelo], [actividad], [cantidadPersonas], [habitaciones], [accesoDiscapacitados]) VALUES (8, N'Programas de estancia', 3, CAST(N'2020-01-17T08:00:00.000' AS DateTime), CAST(N'2020-02-06T10:00:00.000' AS DateTime), 6, 5, 7, 11, 4, 1)
INSERT [dbo].[Paquete] ([id], [tipoPaquete], [destino], [fechaIda], [fechaVuelta], [alojamiento], [vuelo], [actividad], [cantidadPersonas], [habitaciones], [accesoDiscapacitados]) VALUES (9, N'Circuito', 1, CAST(N'2020-01-18T13:00:00.000' AS DateTime), CAST(N'2020-02-07T15:00:00.000' AS DateTime), 8, 7, 1, 6, 1, 1)
SET IDENTITY_INSERT [dbo].[Paquete] OFF
GO
SET IDENTITY_INSERT [dbo].[Reserva] ON 

INSERT [dbo].[Reserva] ([id], [nroReserva], [usuario], [destino], [alojamiento], [actividad], [vuelo], [esUnPaquete], [paquete], [importe]) VALUES (1, N'1000', 1, 1, 8, 1, 1, 1, 1, CAST(10580 AS Decimal(18, 0)))
INSERT [dbo].[Reserva] ([id], [nroReserva], [usuario], [destino], [alojamiento], [actividad], [vuelo], [esUnPaquete], [paquete], [importe]) VALUES (2, N'1001', 2, 2, 3, 2, 2, 1, 2, CAST(5870 AS Decimal(18, 0)))
INSERT [dbo].[Reserva] ([id], [nroReserva], [usuario], [destino], [alojamiento], [actividad], [vuelo], [esUnPaquete], [paquete], [importe]) VALUES (3, N'1002', 3, 3, 7, 3, 3, 1, 3, CAST(3000 AS Decimal(18, 0)))
INSERT [dbo].[Reserva] ([id], [nroReserva], [usuario], [destino], [alojamiento], [actividad], [vuelo], [esUnPaquete], [paquete], [importe]) VALUES (4, N'1003', 4, 4, 5, 5, 4, 1, 4, CAST(15000 AS Decimal(18, 0)))
INSERT [dbo].[Reserva] ([id], [nroReserva], [usuario], [destino], [alojamiento], [actividad], [vuelo], [esUnPaquete], [paquete], [importe]) VALUES (5, N'1004', 5, 5, 1, 5, 5, 1, 5, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[Reserva] ([id], [nroReserva], [usuario], [destino], [alojamiento], [actividad], [vuelo], [esUnPaquete], [paquete], [importe]) VALUES (6, N'1005', 6, 3, 4, 2, 5, 0, NULL, CAST(30000 AS Decimal(18, 0)))
INSERT [dbo].[Reserva] ([id], [nroReserva], [usuario], [destino], [alojamiento], [actividad], [vuelo], [esUnPaquete], [paquete], [importe]) VALUES (7, N'1006', 7, 5, 4, 6, 6, 0, NULL, CAST(50000 AS Decimal(18, 0)))
INSERT [dbo].[Reserva] ([id], [nroReserva], [usuario], [destino], [alojamiento], [actividad], [vuelo], [esUnPaquete], [paquete], [importe]) VALUES (8, N'1007', 8, 4, 2, 7, 9, 0, NULL, CAST(4500 AS Decimal(18, 0)))
INSERT [dbo].[Reserva] ([id], [nroReserva], [usuario], [destino], [alojamiento], [actividad], [vuelo], [esUnPaquete], [paquete], [importe]) VALUES (9, N'1008', 9, 1, 4, 3, 1, 0, NULL, CAST(6000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Reserva] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoAlojamiento] ON 

INSERT [dbo].[TipoAlojamiento] ([id], [descripcion]) VALUES (1, N'Hotel')
INSERT [dbo].[TipoAlojamiento] ([id], [descripcion]) VALUES (2, N'Hostel')
INSERT [dbo].[TipoAlojamiento] ([id], [descripcion]) VALUES (3, N'Motel')
INSERT [dbo].[TipoAlojamiento] ([id], [descripcion]) VALUES (4, N'Apart-Hotel')
INSERT [dbo].[TipoAlojamiento] ([id], [descripcion]) VALUES (5, N'Apartment')
INSERT [dbo].[TipoAlojamiento] ([id], [descripcion]) VALUES (6, N'Boutique Hotel')
INSERT [dbo].[TipoAlojamiento] ([id], [descripcion]) VALUES (7, N'Resort')
INSERT [dbo].[TipoAlojamiento] ([id], [descripcion]) VALUES (8, N'Bed and Breakfast (B&B)')
INSERT [dbo].[TipoAlojamiento] ([id], [descripcion]) VALUES (9, N'Guest House')
INSERT [dbo].[TipoAlojamiento] ([id], [descripcion]) VALUES (10, N'Lodge')
INSERT [dbo].[TipoAlojamiento] ([id], [descripcion]) VALUES (11, N'Casa Rural')
INSERT [dbo].[TipoAlojamiento] ([id], [descripcion]) VALUES (12, N'Inn')
INSERT [dbo].[TipoAlojamiento] ([id], [descripcion]) VALUES (13, N'Pop-up Hotel')
INSERT [dbo].[TipoAlojamiento] ([id], [descripcion]) VALUES (14, N'Business Hotel')
INSERT [dbo].[TipoAlojamiento] ([id], [descripcion]) VALUES (15, N'Pensión')
INSERT [dbo].[TipoAlojamiento] ([id], [descripcion]) VALUES (16, N'Poshtel')
INSERT [dbo].[TipoAlojamiento] ([id], [descripcion]) VALUES (17, N'Eco Hotel')
INSERT [dbo].[TipoAlojamiento] ([id], [descripcion]) VALUES (18, N'Capsule Hotel')
INSERT [dbo].[TipoAlojamiento] ([id], [descripcion]) VALUES (19, N'Love Hotel')
INSERT [dbo].[TipoAlojamiento] ([id], [descripcion]) VALUES (20, N'Camping')
INSERT [dbo].[TipoAlojamiento] ([id], [descripcion]) VALUES (21, N'Glamping')
SET IDENTITY_INSERT [dbo].[TipoAlojamiento] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoRegimen] ON 

INSERT [dbo].[TipoRegimen] ([id], [descripcion]) VALUES (1, N'SA (Solo Alojamiento)')
INSERT [dbo].[TipoRegimen] ([id], [descripcion]) VALUES (2, N'MP (Media Pensión)')
INSERT [dbo].[TipoRegimen] ([id], [descripcion]) VALUES (3, N'AD (Alojamiento y Desayuno)')
INSERT [dbo].[TipoRegimen] ([id], [descripcion]) VALUES (4, N'TI (Todo Incluido)')
INSERT [dbo].[TipoRegimen] ([id], [descripcion]) VALUES (5, N'PC (Pensión Completa)')
INSERT [dbo].[TipoRegimen] ([id], [descripcion]) VALUES (6, N'SC (Sin Servicio de Comidas)')
INSERT [dbo].[TipoRegimen] ([id], [descripcion]) VALUES (7, N'SP (servicio según el programa vacacional)')
SET IDENTITY_INSERT [dbo].[TipoRegimen] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([id], [dni], [nombre], [apellido], [nacionalidad], [domicilio], [mail], [telefono], [contraseña], [rol]) VALUES (1, 10000001, N'Martin', N'Agostino', N'Argentino', N'H. Yrigoyen', N'martinagostino75@yahoo.com.ar', N'14532532', N'martin75', 1)
INSERT [dbo].[Usuario] ([id], [dni], [nombre], [apellido], [nacionalidad], [domicilio], [mail], [telefono], [contraseña], [rol]) VALUES (2, 10000002, N'Luciano', N'Otegui', N'Argentino', N'Galbán', N'luchootegui@gmail.com', N'33236334', N'lucho12', 1)
INSERT [dbo].[Usuario] ([id], [dni], [nombre], [apellido], [nacionalidad], [domicilio], [mail], [telefono], [contraseña], [rol]) VALUES (3, 10000003, N'Mauro', N'Pereyra', N'Argentino', N'Gabaston', N'mpereyra@andreani.com', N'24243435', N'mp34', 1)
INSERT [dbo].[Usuario] ([id], [dni], [nombre], [apellido], [nacionalidad], [domicilio], [mail], [telefono], [contraseña], [rol]) VALUES (4, 10000004, N'Tomas', N'Pereyra', N'Argentino', N'Santamarina', N'tomas.pereyra@gmail.com', N'34245663', N'tomasp56', 1)
INSERT [dbo].[Usuario] ([id], [dni], [nombre], [apellido], [nacionalidad], [domicilio], [mail], [telefono], [contraseña], [rol]) VALUES (5, 10000005, N'Gian', N'Nativo', N'Argentino', N'Legarreta', N'giannativo@gmail.com', N'62348742', N'giann78', 1)
INSERT [dbo].[Usuario] ([id], [dni], [nombre], [apellido], [nacionalidad], [domicilio], [mail], [telefono], [contraseña], [rol]) VALUES (6, 10000006, N'Juan', N'Duarte', N'Argentino', N'Garzon', N'juanduarte@yahoo.com', N'63464774', N'juand90', 1)
INSERT [dbo].[Usuario] ([id], [dni], [nombre], [apellido], [nacionalidad], [domicilio], [mail], [telefono], [contraseña], [rol]) VALUES (7, 10000007, N'Mauricio', N'Macri', N'Argentino', N'Corrientes', N'mmacri@andreani.com', N'34674437', N'macri12', 0)
INSERT [dbo].[Usuario] ([id], [dni], [nombre], [apellido], [nacionalidad], [domicilio], [mail], [telefono], [contraseña], [rol]) VALUES (8, 10000008, N'Alberto', N'Fernandez', N'Argentino', N'Colon', N'afernandez@gmail.com', N'25521454', N'afernandez34', 1)
INSERT [dbo].[Usuario] ([id], [dni], [nombre], [apellido], [nacionalidad], [domicilio], [mail], [telefono], [contraseña], [rol]) VALUES (9, 10000009, N'Ernesto', N'Nuñez', N'Argentino', N'Ulises', N'enuñez@live.com', N'63652534', N'enuñez56', 0)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Vuelo] ON 

INSERT [dbo].[Vuelo] ([id], [fechaIda], [fechaVuelta], [origen], [destino], [idaVuelta], [valoracionAereolinea], [clase], [conEscala], [accesoDiscapacitados]) VALUES (1, CAST(N'2020-01-10T06:00:00.000' AS DateTime), CAST(N'2020-01-30T20:00:00.000' AS DateTime), 4, 1, 1, 4, N'Ejecutivo', 1, 1)
INSERT [dbo].[Vuelo] ([id], [fechaIda], [fechaVuelta], [origen], [destino], [idaVuelta], [valoracionAereolinea], [clase], [conEscala], [accesoDiscapacitados]) VALUES (2, CAST(N'2020-01-11T07:00:00.000' AS DateTime), CAST(N'2020-01-31T15:00:00.000' AS DateTime), 4, 2, 0, 5, N'Primera clase', 1, 1)
INSERT [dbo].[Vuelo] ([id], [fechaIda], [fechaVuelta], [origen], [destino], [idaVuelta], [valoracionAereolinea], [clase], [conEscala], [accesoDiscapacitados]) VALUES (3, CAST(N'2020-01-12T05:00:00.000' AS DateTime), CAST(N'2020-02-01T16:00:00.000' AS DateTime), 2, 5, 1, 3, N'Económica', 0, 1)
INSERT [dbo].[Vuelo] ([id], [fechaIda], [fechaVuelta], [origen], [destino], [idaVuelta], [valoracionAereolinea], [clase], [conEscala], [accesoDiscapacitados]) VALUES (4, CAST(N'2020-01-13T07:00:00.000' AS DateTime), CAST(N'2020-02-02T17:00:00.000' AS DateTime), 2, 6, 1, 4, N'Económica', 1, 1)
INSERT [dbo].[Vuelo] ([id], [fechaIda], [fechaVuelta], [origen], [destino], [idaVuelta], [valoracionAereolinea], [clase], [conEscala], [accesoDiscapacitados]) VALUES (5, CAST(N'2020-01-14T08:00:00.000' AS DateTime), CAST(N'2020-02-03T18:00:00.000' AS DateTime), 1, 3, 0, 4, N'Primera clase', 1, 1)
INSERT [dbo].[Vuelo] ([id], [fechaIda], [fechaVuelta], [origen], [destino], [idaVuelta], [valoracionAereolinea], [clase], [conEscala], [accesoDiscapacitados]) VALUES (6, CAST(N'2020-01-15T10:00:00.000' AS DateTime), CAST(N'2020-02-04T11:00:00.000' AS DateTime), 2, 5, 1, 5, N'Ejecutivo', 0, 1)
INSERT [dbo].[Vuelo] ([id], [fechaIda], [fechaVuelta], [origen], [destino], [idaVuelta], [valoracionAereolinea], [clase], [conEscala], [accesoDiscapacitados]) VALUES (7, CAST(N'2020-01-16T13:00:00.000' AS DateTime), CAST(N'2020-02-05T15:00:00.000' AS DateTime), 3, 1, 1, 3, N'Primera clase', 0, 0)
INSERT [dbo].[Vuelo] ([id], [fechaIda], [fechaVuelta], [origen], [destino], [idaVuelta], [valoracionAereolinea], [clase], [conEscala], [accesoDiscapacitados]) VALUES (8, CAST(N'2020-01-17T15:00:00.000' AS DateTime), CAST(N'2020-02-06T23:00:00.000' AS DateTime), 4, 2, 0, 2, N'Económica', 1, 1)
INSERT [dbo].[Vuelo] ([id], [fechaIda], [fechaVuelta], [origen], [destino], [idaVuelta], [valoracionAereolinea], [clase], [conEscala], [accesoDiscapacitados]) VALUES (9, CAST(N'2020-01-18T19:00:00.000' AS DateTime), CAST(N'2020-02-07T01:00:00.000' AS DateTime), 3, 4, 1, 5, N'Ejecutivo', 1, 1)
SET IDENTITY_INSERT [dbo].[Vuelo] OFF
GO
ALTER TABLE [dbo].[Actividad]  WITH CHECK ADD  CONSTRAINT [FK_Actividad_Destino] FOREIGN KEY([destino])
REFERENCES [dbo].[Destino] ([id])
GO
ALTER TABLE [dbo].[Actividad] CHECK CONSTRAINT [FK_Actividad_Destino]
GO
ALTER TABLE [dbo].[Alojamiento]  WITH CHECK ADD  CONSTRAINT [FK_Alojamiento_Destino] FOREIGN KEY([destino])
REFERENCES [dbo].[Destino] ([id])
GO
ALTER TABLE [dbo].[Alojamiento] CHECK CONSTRAINT [FK_Alojamiento_Destino]
GO
ALTER TABLE [dbo].[Alojamiento]  WITH CHECK ADD  CONSTRAINT [FK_Alojamiento_TipoAlojamiento] FOREIGN KEY([tipoAlojamiento])
REFERENCES [dbo].[TipoAlojamiento] ([id])
GO
ALTER TABLE [dbo].[Alojamiento] CHECK CONSTRAINT [FK_Alojamiento_TipoAlojamiento]
GO
ALTER TABLE [dbo].[Alojamiento]  WITH CHECK ADD  CONSTRAINT [FK_Alojamiento_TipoRegimen] FOREIGN KEY([tipoRegimen])
REFERENCES [dbo].[TipoRegimen] ([id])
GO
ALTER TABLE [dbo].[Alojamiento] CHECK CONSTRAINT [FK_Alojamiento_TipoRegimen]
GO
ALTER TABLE [dbo].[Paquete]  WITH CHECK ADD  CONSTRAINT [FK_Paquete_Actividad] FOREIGN KEY([actividad])
REFERENCES [dbo].[Actividad] ([id])
GO
ALTER TABLE [dbo].[Paquete] CHECK CONSTRAINT [FK_Paquete_Actividad]
GO
ALTER TABLE [dbo].[Paquete]  WITH CHECK ADD  CONSTRAINT [FK_Paquete_Alojamiento] FOREIGN KEY([alojamiento])
REFERENCES [dbo].[Alojamiento] ([id])
GO
ALTER TABLE [dbo].[Paquete] CHECK CONSTRAINT [FK_Paquete_Alojamiento]
GO
ALTER TABLE [dbo].[Paquete]  WITH CHECK ADD  CONSTRAINT [FK_Paquete_Destino] FOREIGN KEY([destino])
REFERENCES [dbo].[Destino] ([id])
GO
ALTER TABLE [dbo].[Paquete] CHECK CONSTRAINT [FK_Paquete_Destino]
GO
ALTER TABLE [dbo].[Paquete]  WITH CHECK ADD  CONSTRAINT [FK_Paquete_Vuelo] FOREIGN KEY([vuelo])
REFERENCES [dbo].[Vuelo] ([id])
GO
ALTER TABLE [dbo].[Paquete] CHECK CONSTRAINT [FK_Paquete_Vuelo]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Actividad] FOREIGN KEY([actividad])
REFERENCES [dbo].[Actividad] ([id])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Actividad]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Alojamiento] FOREIGN KEY([alojamiento])
REFERENCES [dbo].[Alojamiento] ([id])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Alojamiento]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Destino] FOREIGN KEY([destino])
REFERENCES [dbo].[Destino] ([id])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Destino]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Paquete] FOREIGN KEY([paquete])
REFERENCES [dbo].[Paquete] ([id])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Paquete]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Usuario] FOREIGN KEY([usuario])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Usuario]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Vuelo] FOREIGN KEY([vuelo])
REFERENCES [dbo].[Vuelo] ([id])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Vuelo]
GO
ALTER TABLE [dbo].[Vuelo]  WITH CHECK ADD  CONSTRAINT [FK_Vuelo_Destino] FOREIGN KEY([destino])
REFERENCES [dbo].[Destino] ([id])
GO
ALTER TABLE [dbo].[Vuelo] CHECK CONSTRAINT [FK_Vuelo_Destino]
GO
ALTER TABLE [dbo].[Vuelo]  WITH CHECK ADD  CONSTRAINT [FK_Vuelo_Origen] FOREIGN KEY([origen])
REFERENCES [dbo].[Destino] ([id])
GO
ALTER TABLE [dbo].[Vuelo] CHECK CONSTRAINT [FK_Vuelo_Origen]
GO
