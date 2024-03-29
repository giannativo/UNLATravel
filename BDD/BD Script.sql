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
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pasajero]') AND type in (N'U'))
ALTER TABLE [dbo].[Pasajero] DROP CONSTRAINT IF EXISTS [FK_Pasajero_Reserva]
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
/****** Object:  Table [dbo].[Pasajero]    Script Date: 1/5/2020 6:56:21 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Pasajero]
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
/****** Object:  Table [dbo].[Actividad]    Script Date: 1/5/2020 6:56:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actividad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fechaDesde] [datetime] NOT NULL,
	[fechaHasta] [datetime] NOT NULL,
	[nombreActividad] [varchar](50) NOT NULL,
	[link] [varchar](max) NULL,
	[descripcion] [varchar](50) NULL,
	[franjaHoraria] [varchar](50) NULL,
	[valoracion] [varchar](50) NULL,
	[accesoDiscapacitados] [bit] NOT NULL,
	[destino] [int] NOT NULL,
	[precio] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_Actividad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alojamiento]    Script Date: 1/5/2020 6:56:21 p. m. ******/
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
	[precio] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_Alojamiento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destino]    Script Date: 1/5/2020 6:56:21 p. m. ******/
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
/****** Object:  Table [dbo].[Paquete]    Script Date: 1/5/2020 6:56:21 p. m. ******/
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
	[precio] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_Paquete] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 1/5/2020 6:56:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nroReserva] [varchar](50) NOT NULL,
	[usuario] [int] NOT NULL,
	[destino] [int] NOT NULL,
	[alojamiento] [int] NULL,
	[actividad] [int] NULL,
	[vuelo] [int] NULL,
	[esUnPaquete] [bit] NOT NULL,
	[paquete] [int] NULL,
	[importe] [numeric](18, 2) NOT NULL,
	[reservaFinalizada] [bit] NOT NULL,
	[fechaEntrada] [datetime] NULL,
	[fechaSalida] [datetime] NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pasajero]    Script Date: 7/5/2020 16:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pasajero](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dni] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[nacionalidad] [varchar](50) NOT NULL,
	[domicilio] [varchar](50) NOT NULL,
	[mail] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[reserva] [int] NOT NULL,
 CONSTRAINT [PK_Pasajero] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoAlojamiento]    Script Date: 1/5/2020 6:56:21 p. m. ******/
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
/****** Object:  Table [dbo].[TipoRegimen]    Script Date: 1/5/2020 6:56:21 p. m. ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 1/5/2020 6:56:21 p. m. ******/
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
	[isAdmin] [bit] NOT NULL,
 CONSTRAINT [PK__Usuario__C0308574275D52DE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vuelo]    Script Date: 1/5/2020 6:56:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vuelo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fechaIda] [datetime] NOT NULL,
	[fechaVuelta] [datetime] NOT NULL,
	[nombreAereolinea] [varchar](50) NOT NULL,
	[link] [varchar](max) NULL,
	[origen] [int] NOT NULL,
	[destino] [int] NOT NULL,
	[idaVuelta] [bit] NOT NULL,
	[valoracionAereolinea] [int] NULL,
	[clase] [varchar](20) NOT NULL,
	[conEscala] [bit] NOT NULL,
	[accesoDiscapacitados] [bit] NOT NULL,
	[precio] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_Vuelo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
ALTER TABLE [dbo].[Pasajero]  WITH CHECK ADD  CONSTRAINT [FK_Pasajero_Reserva] FOREIGN KEY([Reserva])
REFERENCES [dbo].[Reserva] ([id])
GO
ALTER TABLE [dbo].[Pasajero] CHECK CONSTRAINT [FK_Pasajero_Reserva]
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
