USE [EducationalPractice]
GO
/****** Object:  Table [dbo].[Academician]    Script Date: 11.11.2023 14:02:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Academician](
	[Id] [int] NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Specialization] [nvarchar](50) NOT NULL,
	[YearOfRankAssignment] [int] NOT NULL,
 CONSTRAINT [PK_Academician] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Animal_Manakov]    Script Date: 11.11.2023 14:02:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal_Manakov](
	[ID] [int] NOT NULL,
	[Otrad] [nvarchar](40) NULL,
 CONSTRAINT [Animal_ManakovID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationForm]    Script Date: 11.11.2023 14:02:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationForm](
	[Id] [int] NOT NULL,
	[DisciplineCode] [int] NOT NULL,
	[SpecializationNumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ApplicationForm_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Control_Manakov]    Script Date: 11.11.2023 14:02:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Control_Manakov](
	[ID] [int] NOT NULL,
	[Surname] [nvarchar](40) NULL,
 CONSTRAINT [Control_ManakovID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries_Manakov]    Script Date: 11.11.2023 14:02:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries_Manakov](
	[ID] [int] NOT NULL,
	[Square] [int] NOT NULL,
 CONSTRAINT [Countries_ManakovID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 11.11.2023 14:02:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[MainCity] [nvarchar](50) NULL,
	[Square] [int] NOT NULL,
	[Population] [int] NOT NULL,
	[Continent] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 11.11.2023 14:02:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Shifr] [nvarchar](2) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[FaculcyAbbr] [nvarchar](2) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Shifr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discipline]    Script Date: 11.11.2023 14:02:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discipline](
	[Code] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Implementer] [nvarchar](2) NOT NULL,
 CONSTRAINT [PK_Discipline] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 11.11.2023 14:02:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[TabNumber] [int] NOT NULL,
	[DepartmentShifr] [nvarchar](2) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Post] [nvarchar](50) NOT NULL,
	[Salary] [money] NOT NULL,
	[Chief] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[TabNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Engineer]    Script Date: 11.11.2023 14:02:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Engineer](
	[TabNumber] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Engineer] PRIMARY KEY CLUSTERED 
(
	[TabNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 11.11.2023 14:02:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[Id] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[DisciplineCode] [int] NOT NULL,
	[RegNumber] [int] NOT NULL,
	[TabNumber] [int] NOT NULL,
	[Auditorium] [nvarchar](50) NOT NULL,
	[Mark] [int] NOT NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculcy]    Script Date: 11.11.2023 14:02:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculcy](
	[Abbr] [nvarchar](2) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Faculcy] PRIMARY KEY CLUSTERED 
(
	[Abbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flowers_Manakov]    Script Date: 11.11.2023 14:02:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flowers_Manakov](
	[ID] [int] NOT NULL,
	[Class] [nvarchar](40) NULL,
 CONSTRAINT [Flowers_ManakovID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Learner]    Script Date: 11.11.2023 14:02:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Learner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Specialization] [nvarchar](50) NOT NULL,
	[School] [nvarchar](50) NOT NULL,
	[Scores] [float] NULL,
 CONSTRAINT [PK_Learner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Licei]    Script Date: 11.11.2023 14:02:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Licei](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Specialization] [nvarchar](50) NOT NULL,
	[School] [nvarchar](50) NOT NULL,
	[Scores] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialization]    Script Date: 11.11.2023 14:02:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialization](
	[Number] [nvarchar](50) NOT NULL,
	[Direction] [nvarchar](50) NOT NULL,
	[DepartmentShifr] [nvarchar](2) NOT NULL,
 CONSTRAINT [PK_Specialization] PRIMARY KEY CLUSTERED 
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 11.11.2023 14:02:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[RegNumber] [int] NOT NULL,
	[SpecializationNumber] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[RegNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 11.11.2023 14:02:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[TabNumber] [int] NOT NULL,
	[Rank] [nvarchar](50) NOT NULL,
	[Degree] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[TabNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[View_6]    Script Date: 11.11.2023 14:02:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[View_6](
	[Номер недели] [int] NULL,
	[Количество экзаменов] [int] NULL,
	[Количество студентов] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[View_7]    Script Date: 11.11.2023 14:02:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[View_7](
	[Continent] [varchar](50) NULL,
	[Square] [float] NULL,
	[Square1] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZavDepartment]    Script Date: 11.11.2023 14:02:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZavDepartment](
	[TabNumber] [int] NOT NULL,
	[WorkExperience] [int] NOT NULL,
 CONSTRAINT [PK_ZavDepartment] PRIMARY KEY CLUSTERED 
(
	[TabNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Academician] ([Id], [FullName], [BirthDate], [Specialization], [YearOfRankAssignment]) VALUES (1, N'Аничков Николай Николаевич', CAST(N'1885-11-03' AS Date), N'медицина', 1939)
INSERT [dbo].[Academician] ([Id], [FullName], [BirthDate], [Specialization], [YearOfRankAssignment]) VALUES (2, N'Бартольд Василий Владимирович', CAST(N'1869-11-15' AS Date), N'историк', 1913)
INSERT [dbo].[Academician] ([Id], [FullName], [BirthDate], [Specialization], [YearOfRankAssignment]) VALUES (3, N'Белопольский Аристарх Аполлонович', CAST(N'1854-07-13' AS Date), N'астрофизик', 1903)
INSERT [dbo].[Academician] ([Id], [FullName], [BirthDate], [Specialization], [YearOfRankAssignment]) VALUES (4, N'Бородин Иван Парфеньевич', CAST(N'1847-01-30' AS Date), N'ботаник', 1902)
INSERT [dbo].[Academician] ([Id], [FullName], [BirthDate], [Specialization], [YearOfRankAssignment]) VALUES (5, N'Вальден Павел Иванович', CAST(N'1863-07-26' AS Date), N'химик-технолог', 1910)
INSERT [dbo].[Academician] ([Id], [FullName], [BirthDate], [Specialization], [YearOfRankAssignment]) VALUES (6, N'Вернадский Владимир Иванович', CAST(N'1863-03-12' AS Date), N'геохимик', 1908)
INSERT [dbo].[Academician] ([Id], [FullName], [BirthDate], [Specialization], [YearOfRankAssignment]) VALUES (7, N'Виноградов Павел Гаврилович', CAST(N'1854-11-30' AS Date), N'историк', 1914)
INSERT [dbo].[Academician] ([Id], [FullName], [BirthDate], [Specialization], [YearOfRankAssignment]) VALUES (8, N'Ипатьев Владимир Николаевич', CAST(N'1867-11-21' AS Date), N'химик', 1916)
INSERT [dbo].[Academician] ([Id], [FullName], [BirthDate], [Specialization], [YearOfRankAssignment]) VALUES (9, N'Истрин Василий Михайлович', CAST(N'1865-02-22' AS Date), N'филолог', 1907)
INSERT [dbo].[Academician] ([Id], [FullName], [BirthDate], [Specialization], [YearOfRankAssignment]) VALUES (10, N'Карпинский Александр Петрович', CAST(N'1847-01-07' AS Date), N'геолог', 1889)
INSERT [dbo].[Academician] ([Id], [FullName], [BirthDate], [Specialization], [YearOfRankAssignment]) VALUES (11, N'Коковцов Павел Константинович', CAST(N'1861-07-01' AS Date), N'историк', 1906)
INSERT [dbo].[Academician] ([Id], [FullName], [BirthDate], [Specialization], [YearOfRankAssignment]) VALUES (12, N'Курнаков Николай Семёнович', CAST(N'1860-12-06' AS Date), N'химик', 1913)
INSERT [dbo].[Academician] ([Id], [FullName], [BirthDate], [Specialization], [YearOfRankAssignment]) VALUES (13, N'Марр Николай Яковлевич', CAST(N'1865-01-06' AS Date), N'лингвист', 1912)
INSERT [dbo].[Academician] ([Id], [FullName], [BirthDate], [Specialization], [YearOfRankAssignment]) VALUES (14, N'Насонов Николай Викторович', CAST(N'1855-02-26' AS Date), N'зоолог', 1906)
INSERT [dbo].[Academician] ([Id], [FullName], [BirthDate], [Specialization], [YearOfRankAssignment]) VALUES (15, N'Ольденбург Сергей Фёдорович', CAST(N'1863-09-26' AS Date), N'историк', 1903)
INSERT [dbo].[Academician] ([Id], [FullName], [BirthDate], [Specialization], [YearOfRankAssignment]) VALUES (16, N'Павлов Иван Петрович', CAST(N'1849-09-26' AS Date), N'физиолог', 1907)
INSERT [dbo].[Academician] ([Id], [FullName], [BirthDate], [Specialization], [YearOfRankAssignment]) VALUES (17, N'Перетц Владимир Николаевич', CAST(N'1870-01-31' AS Date), N'филолог', 1914)
INSERT [dbo].[Academician] ([Id], [FullName], [BirthDate], [Specialization], [YearOfRankAssignment]) VALUES (18, N'Соболевский Алексей Иванович', CAST(N'1857-01-07' AS Date), N'лингвист', 1900)
INSERT [dbo].[Academician] ([Id], [FullName], [BirthDate], [Specialization], [YearOfRankAssignment]) VALUES (19, N'Стеклов Владимир Андреевич', CAST(N'1864-01-09' AS Date), N'математик', 1912)
GO
INSERT [dbo].[ApplicationForm] ([Id], [DisciplineCode], [SpecializationNumber]) VALUES (1, 101, N'01.03.04')
INSERT [dbo].[ApplicationForm] ([Id], [DisciplineCode], [SpecializationNumber]) VALUES (2, 205, N'01.03.04')
INSERT [dbo].[ApplicationForm] ([Id], [DisciplineCode], [SpecializationNumber]) VALUES (3, 209, N'01.03.04')
INSERT [dbo].[ApplicationForm] ([Id], [DisciplineCode], [SpecializationNumber]) VALUES (4, 101, N'09.03.02')
INSERT [dbo].[ApplicationForm] ([Id], [DisciplineCode], [SpecializationNumber]) VALUES (5, 102, N'09.03.02')
INSERT [dbo].[ApplicationForm] ([Id], [DisciplineCode], [SpecializationNumber]) VALUES (6, 103, N'09.03.02')
INSERT [dbo].[ApplicationForm] ([Id], [DisciplineCode], [SpecializationNumber]) VALUES (7, 202, N'09.03.02')
INSERT [dbo].[ApplicationForm] ([Id], [DisciplineCode], [SpecializationNumber]) VALUES (8, 205, N'09.03.02')
INSERT [dbo].[ApplicationForm] ([Id], [DisciplineCode], [SpecializationNumber]) VALUES (9, 209, N'09.03.02')
INSERT [dbo].[ApplicationForm] ([Id], [DisciplineCode], [SpecializationNumber]) VALUES (10, 101, N'09.03.03')
INSERT [dbo].[ApplicationForm] ([Id], [DisciplineCode], [SpecializationNumber]) VALUES (11, 102, N'09.03.03')
INSERT [dbo].[ApplicationForm] ([Id], [DisciplineCode], [SpecializationNumber]) VALUES (12, 103, N'09.03.03')
INSERT [dbo].[ApplicationForm] ([Id], [DisciplineCode], [SpecializationNumber]) VALUES (13, 202, N'09.03.03')
INSERT [dbo].[ApplicationForm] ([Id], [DisciplineCode], [SpecializationNumber]) VALUES (14, 205, N'09.03.03')
INSERT [dbo].[ApplicationForm] ([Id], [DisciplineCode], [SpecializationNumber]) VALUES (15, 101, N'14.03.02')
INSERT [dbo].[ApplicationForm] ([Id], [DisciplineCode], [SpecializationNumber]) VALUES (16, 102, N'14.03.02')
INSERT [dbo].[ApplicationForm] ([Id], [DisciplineCode], [SpecializationNumber]) VALUES (17, 103, N'14.03.02')
INSERT [dbo].[ApplicationForm] ([Id], [DisciplineCode], [SpecializationNumber]) VALUES (18, 204, N'14.03.02')
INSERT [dbo].[ApplicationForm] ([Id], [DisciplineCode], [SpecializationNumber]) VALUES (19, 101, N'38.03.05')
INSERT [dbo].[ApplicationForm] ([Id], [DisciplineCode], [SpecializationNumber]) VALUES (20, 103, N'38.03.05')
INSERT [dbo].[ApplicationForm] ([Id], [DisciplineCode], [SpecializationNumber]) VALUES (21, 202, N'38.03.05')
INSERT [dbo].[ApplicationForm] ([Id], [DisciplineCode], [SpecializationNumber]) VALUES (22, 209, N'38.03.05')
GO
INSERT [dbo].[Country] ([Id], [Name], [MainCity], [Square], [Population], [Continent]) VALUES (1, N'Австрия', N'Вена', 83858, 8741753, N'Европа')
INSERT [dbo].[Country] ([Id], [Name], [MainCity], [Square], [Population], [Continent]) VALUES (2, N'Азербайджан', N'Баку', 86600, 9705600, N'Азия')
INSERT [dbo].[Country] ([Id], [Name], [MainCity], [Square], [Population], [Continent]) VALUES (3, N'Албания', N'Тирана', 28748, 2866026, N'Европа')
INSERT [dbo].[Country] ([Id], [Name], [MainCity], [Square], [Population], [Continent]) VALUES (4, N'Алжир', N'Алжир', 2381740, 39813722, N'Африка')
INSERT [dbo].[Country] ([Id], [Name], [MainCity], [Square], [Population], [Continent]) VALUES (5, N'Ангола', N'Луанда', 1246700, 25831000, N'Африка')
INSERT [dbo].[Country] ([Id], [Name], [MainCity], [Square], [Population], [Continent]) VALUES (6, N'Аргентина', N'Буэнос-Айрес', 2766890, 43847000, N'Южная Америка')
INSERT [dbo].[Country] ([Id], [Name], [MainCity], [Square], [Population], [Continent]) VALUES (7, N'Афганистан', N'Кабул', 647500, 29822848, N'Азия')
INSERT [dbo].[Country] ([Id], [Name], [MainCity], [Square], [Population], [Continent]) VALUES (8, N'Бангладеш', N'Дакка', 144000, 160221000, N'Азия')
INSERT [dbo].[Country] ([Id], [Name], [MainCity], [Square], [Population], [Continent]) VALUES (9, N'Бахрейн', N'Манама', 701, 1397000, N'Азия')
INSERT [dbo].[Country] ([Id], [Name], [MainCity], [Square], [Population], [Continent]) VALUES (10, N'Белиз', N'Бельмопан', 22966, 377968, N'Северная Америка')
INSERT [dbo].[Country] ([Id], [Name], [MainCity], [Square], [Population], [Continent]) VALUES (11, N'Белоруссия', N'Минск', 207595, 9498400, N'Европа')
INSERT [dbo].[Country] ([Id], [Name], [MainCity], [Square], [Population], [Continent]) VALUES (12, N'Бельгия', N'Брюссель', 30528, 11250585, N'Европа')
INSERT [dbo].[Country] ([Id], [Name], [MainCity], [Square], [Population], [Continent]) VALUES (13, N'Бенин', N'Порто-Ново', 112620, 11167000, N'Африка')
INSERT [dbo].[Country] ([Id], [Name], [MainCity], [Square], [Population], [Continent]) VALUES (14, N'Болгария', N'София', 110910, 7153784, N'Европа')
INSERT [dbo].[Country] ([Id], [Name], [MainCity], [Square], [Population], [Continent]) VALUES (15, N'Боливия', N'Сукре', 1098580, 10985059, N'Южная Америка')
INSERT [dbo].[Country] ([Id], [Name], [MainCity], [Square], [Population], [Continent]) VALUES (16, N'Ботсвана', N'Габороне', 600370, 2209208, N'Африка')
INSERT [dbo].[Country] ([Id], [Name], [MainCity], [Square], [Population], [Continent]) VALUES (17, N'Бразилия', N'Бразилиа', 8511965, 206081432, N'Южная Америка')
INSERT [dbo].[Country] ([Id], [Name], [MainCity], [Square], [Population], [Continent]) VALUES (18, N'Буркина-Фасо', N'Уагадугу', 274200, 19034397, N'Африка')
INSERT [dbo].[Country] ([Id], [Name], [MainCity], [Square], [Population], [Continent]) VALUES (19, N'Бутан', N'Тхимпху', 47000, 784000, N'Азия')
INSERT [dbo].[Country] ([Id], [Name], [MainCity], [Square], [Population], [Continent]) VALUES (20, N'Великобритания', N'Лондон', 244820, 65341183, N'Европа')
INSERT [dbo].[Country] ([Id], [Name], [MainCity], [Square], [Population], [Continent]) VALUES (21, N'Венгрия', N'Будапешт', 93030, 9830485, N'Европа')
INSERT [dbo].[Country] ([Id], [Name], [MainCity], [Square], [Population], [Continent]) VALUES (22, N'Венесуэла', N'Каракас', 912050, 31028637, N'Южная Америка')
INSERT [dbo].[Country] ([Id], [Name], [MainCity], [Square], [Population], [Continent]) VALUES (23, N'Восточный Тимор', N'Дили', 14874, 1167242, N'Азия')
INSERT [dbo].[Country] ([Id], [Name], [MainCity], [Square], [Population], [Continent]) VALUES (24, N'Вьетнам', N'Ханой', 329560, 91713300, N'Азия')
GO
INSERT [dbo].[Department] ([Shifr], [Name], [FaculcyAbbr]) VALUES (N'вм', N'Высшая математика', N'ен')
INSERT [dbo].[Department] ([Shifr], [Name], [FaculcyAbbr]) VALUES (N'ис', N'Информационные системы', N'ит')
INSERT [dbo].[Department] ([Shifr], [Name], [FaculcyAbbr]) VALUES (N'мм', N'Математическое моделирование', N'фм')
INSERT [dbo].[Department] ([Shifr], [Name], [FaculcyAbbr]) VALUES (N'оф', N'Общая физика', N'ен')
INSERT [dbo].[Department] ([Shifr], [Name], [FaculcyAbbr]) VALUES (N'пи', N'Прикладная информатика', N'ит')
INSERT [dbo].[Department] ([Shifr], [Name], [FaculcyAbbr]) VALUES (N'эф', N'Экспериментальная физика', N'фм')
GO
INSERT [dbo].[Discipline] ([Code], [Amount], [Name], [Implementer]) VALUES (101, 320, N'Математика', N'вм')
INSERT [dbo].[Discipline] ([Code], [Amount], [Name], [Implementer]) VALUES (102, 160, N'Информатика', N'пи')
INSERT [dbo].[Discipline] ([Code], [Amount], [Name], [Implementer]) VALUES (103, 160, N'Физика', N'оф')
INSERT [dbo].[Discipline] ([Code], [Amount], [Name], [Implementer]) VALUES (202, 120, N'Базы данных', N'ис')
INSERT [dbo].[Discipline] ([Code], [Amount], [Name], [Implementer]) VALUES (204, 160, N'Электроника', N'эф')
INSERT [dbo].[Discipline] ([Code], [Amount], [Name], [Implementer]) VALUES (205, 80, N'Программирование', N'пи')
INSERT [dbo].[Discipline] ([Code], [Amount], [Name], [Implementer]) VALUES (209, 80, N'Моделирование', N'мм')
GO
INSERT [dbo].[Employee] ([TabNumber], [DepartmentShifr], [Surname], [Post], [Salary], [Chief]) VALUES (101, N'пи', N'Прохоров П.П.', N'зав. кафедрой', 35000.0000, 101)
INSERT [dbo].[Employee] ([TabNumber], [DepartmentShifr], [Surname], [Post], [Salary], [Chief]) VALUES (102, N'пи', N'Семенов С.С.', N'преподаватель', 25000.0000, 101)
INSERT [dbo].[Employee] ([TabNumber], [DepartmentShifr], [Surname], [Post], [Salary], [Chief]) VALUES (105, N'пи', N'Петров П.П.', N'преподаватель', 25000.0000, 101)
INSERT [dbo].[Employee] ([TabNumber], [DepartmentShifr], [Surname], [Post], [Salary], [Chief]) VALUES (153, N'пи', N'Сидорова С.С.', N'инженер', 15000.0000, 102)
INSERT [dbo].[Employee] ([TabNumber], [DepartmentShifr], [Surname], [Post], [Salary], [Chief]) VALUES (201, N'ис', N'Андреев А.А.', N'зав. кафедрой', 35000.0000, 201)
INSERT [dbo].[Employee] ([TabNumber], [DepartmentShifr], [Surname], [Post], [Salary], [Chief]) VALUES (202, N'ис', N'Борисов Б.Б.', N'преподаватель', 25000.0000, 201)
INSERT [dbo].[Employee] ([TabNumber], [DepartmentShifr], [Surname], [Post], [Salary], [Chief]) VALUES (241, N'ис', N'Глухов Г.Г.', N'инженер', 20000.0000, 201)
INSERT [dbo].[Employee] ([TabNumber], [DepartmentShifr], [Surname], [Post], [Salary], [Chief]) VALUES (242, N'ис', N'Чернов Ч.Ч.', N'инженер', 15000.0000, 202)
INSERT [dbo].[Employee] ([TabNumber], [DepartmentShifr], [Surname], [Post], [Salary], [Chief]) VALUES (301, N'мм', N'Басов Б.Б.', N'зав. кафедрой', 35000.0000, 301)
INSERT [dbo].[Employee] ([TabNumber], [DepartmentShifr], [Surname], [Post], [Salary], [Chief]) VALUES (302, N'мм', N'Сергеева С.С.', N'преподаватель', 25000.0000, 301)
INSERT [dbo].[Employee] ([TabNumber], [DepartmentShifr], [Surname], [Post], [Salary], [Chief]) VALUES (401, N'оф', N'Волков В.В.', N'зав. кафедрой', 35000.0000, 401)
INSERT [dbo].[Employee] ([TabNumber], [DepartmentShifr], [Surname], [Post], [Salary], [Chief]) VALUES (402, N'оф', N'Зайцев З.З.', N'преподаватель', 25000.0000, 401)
INSERT [dbo].[Employee] ([TabNumber], [DepartmentShifr], [Surname], [Post], [Salary], [Chief]) VALUES (403, N'оф', N'Смирнов С.С.', N'преподаватель', 15000.0000, 401)
INSERT [dbo].[Employee] ([TabNumber], [DepartmentShifr], [Surname], [Post], [Salary], [Chief]) VALUES (435, N'оф', N'Лисин Л.Л.', N'инженер', 20000.0000, 402)
INSERT [dbo].[Employee] ([TabNumber], [DepartmentShifr], [Surname], [Post], [Salary], [Chief]) VALUES (501, N'вм', N'Кузнецов К.К.', N'зав. кафедрой', 35000.0000, 501)
INSERT [dbo].[Employee] ([TabNumber], [DepartmentShifr], [Surname], [Post], [Salary], [Chief]) VALUES (502, N'вм', N'Романцев Р.Р.', N'преподаватель', 25000.0000, 501)
INSERT [dbo].[Employee] ([TabNumber], [DepartmentShifr], [Surname], [Post], [Salary], [Chief]) VALUES (503, N'вм', N'Соловьев С.С.', N'преподаватель', 25000.0000, 501)
INSERT [dbo].[Employee] ([TabNumber], [DepartmentShifr], [Surname], [Post], [Salary], [Chief]) VALUES (601, N'эф', N'Зверев З.З.', N'зав. кафедрой', 35000.0000, 601)
INSERT [dbo].[Employee] ([TabNumber], [DepartmentShifr], [Surname], [Post], [Salary], [Chief]) VALUES (602, N'эф', N'Сорокина С.С.', N'преподаватель', 25000.0000, 601)
INSERT [dbo].[Employee] ([TabNumber], [DepartmentShifr], [Surname], [Post], [Salary], [Chief]) VALUES (614, N'эф', N'Григорьев Г.Г.', N'инженер', 20000.0000, 602)
GO
INSERT [dbo].[Engineer] ([TabNumber], [Name]) VALUES (153, N'электроник')
INSERT [dbo].[Engineer] ([TabNumber], [Name]) VALUES (241, N'электроник')
INSERT [dbo].[Engineer] ([TabNumber], [Name]) VALUES (242, N'программист')
INSERT [dbo].[Engineer] ([TabNumber], [Name]) VALUES (435, N'электроник')
INSERT [dbo].[Engineer] ([TabNumber], [Name]) VALUES (614, N'программист')
GO
INSERT [dbo].[Exam] ([Id], [Date], [DisciplineCode], [RegNumber], [TabNumber], [Auditorium], [Mark]) VALUES (1, CAST(N'2015-06-05' AS Date), 102, 10101, 102, N'т505', 4)
INSERT [dbo].[Exam] ([Id], [Date], [DisciplineCode], [RegNumber], [TabNumber], [Auditorium], [Mark]) VALUES (2, CAST(N'2015-06-05' AS Date), 102, 10102, 102, N'т505', 4)
INSERT [dbo].[Exam] ([Id], [Date], [DisciplineCode], [RegNumber], [TabNumber], [Auditorium], [Mark]) VALUES (3, CAST(N'2015-06-05' AS Date), 202, 20101, 202, N'т506', 4)
INSERT [dbo].[Exam] ([Id], [Date], [DisciplineCode], [RegNumber], [TabNumber], [Auditorium], [Mark]) VALUES (4, CAST(N'2015-06-05' AS Date), 202, 20102, 202, N'т506', 3)
INSERT [dbo].[Exam] ([Id], [Date], [DisciplineCode], [RegNumber], [TabNumber], [Auditorium], [Mark]) VALUES (5, CAST(N'2015-06-07' AS Date), 102, 30101, 105, N'ф419', 3)
INSERT [dbo].[Exam] ([Id], [Date], [DisciplineCode], [RegNumber], [TabNumber], [Auditorium], [Mark]) VALUES (6, CAST(N'2015-06-07' AS Date), 102, 30102, 101, N'т506', 4)
INSERT [dbo].[Exam] ([Id], [Date], [DisciplineCode], [RegNumber], [TabNumber], [Auditorium], [Mark]) VALUES (7, CAST(N'2015-06-07' AS Date), 102, 80101, 102, N'м425', 5)
INSERT [dbo].[Exam] ([Id], [Date], [DisciplineCode], [RegNumber], [TabNumber], [Auditorium], [Mark]) VALUES (8, CAST(N'2015-06-09' AS Date), 205, 80102, 402, N'м424', 4)
INSERT [dbo].[Exam] ([Id], [Date], [DisciplineCode], [RegNumber], [TabNumber], [Auditorium], [Mark]) VALUES (9, CAST(N'2015-06-09' AS Date), 209, 20101, 302, N'ф333', 3)
INSERT [dbo].[Exam] ([Id], [Date], [DisciplineCode], [RegNumber], [TabNumber], [Auditorium], [Mark]) VALUES (10, CAST(N'2015-06-10' AS Date), 101, 10101, 501, N'т506', 4)
INSERT [dbo].[Exam] ([Id], [Date], [DisciplineCode], [RegNumber], [TabNumber], [Auditorium], [Mark]) VALUES (11, CAST(N'2015-06-10' AS Date), 101, 10102, 501, N'т506', 4)
INSERT [dbo].[Exam] ([Id], [Date], [DisciplineCode], [RegNumber], [TabNumber], [Auditorium], [Mark]) VALUES (12, CAST(N'2015-06-10' AS Date), 204, 30102, 601, N'ф349', 5)
INSERT [dbo].[Exam] ([Id], [Date], [DisciplineCode], [RegNumber], [TabNumber], [Auditorium], [Mark]) VALUES (13, CAST(N'2015-06-10' AS Date), 209, 80101, 301, N'э105', 5)
INSERT [dbo].[Exam] ([Id], [Date], [DisciplineCode], [RegNumber], [TabNumber], [Auditorium], [Mark]) VALUES (14, CAST(N'2015-06-10' AS Date), 209, 80102, 301, N'э105', 4)
INSERT [dbo].[Exam] ([Id], [Date], [DisciplineCode], [RegNumber], [TabNumber], [Auditorium], [Mark]) VALUES (15, CAST(N'2015-06-12' AS Date), 101, 80101, 502, N'с324', 4)
INSERT [dbo].[Exam] ([Id], [Date], [DisciplineCode], [RegNumber], [TabNumber], [Auditorium], [Mark]) VALUES (16, CAST(N'2015-06-15' AS Date), 101, 30101, 503, N'ф417', 4)
INSERT [dbo].[Exam] ([Id], [Date], [DisciplineCode], [RegNumber], [TabNumber], [Auditorium], [Mark]) VALUES (17, CAST(N'2015-06-15' AS Date), 101, 50101, 501, N'ф201', 5)
INSERT [dbo].[Exam] ([Id], [Date], [DisciplineCode], [RegNumber], [TabNumber], [Auditorium], [Mark]) VALUES (18, CAST(N'2015-06-15' AS Date), 101, 50102, 501, N'ф201', 3)
INSERT [dbo].[Exam] ([Id], [Date], [DisciplineCode], [RegNumber], [TabNumber], [Auditorium], [Mark]) VALUES (19, CAST(N'2015-06-15' AS Date), 103, 10101, 403, N'ф414', 4)
INSERT [dbo].[Exam] ([Id], [Date], [DisciplineCode], [RegNumber], [TabNumber], [Auditorium], [Mark]) VALUES (20, CAST(N'2015-06-17' AS Date), 102, 10101, 102, N'т505', 5)
GO
INSERT [dbo].[Faculcy] ([Abbr], [Name]) VALUES (N'Гн', N'Гуманитарные науки')
INSERT [dbo].[Faculcy] ([Abbr], [Name]) VALUES (N'Ен', N'Естественные науки')
INSERT [dbo].[Faculcy] ([Abbr], [Name]) VALUES (N'Ит', N'Информационные технологии')
INSERT [dbo].[Faculcy] ([Abbr], [Name]) VALUES (N'Фм', N'Физико-математический')
GO
SET IDENTITY_INSERT [dbo].[Learner] ON 

INSERT [dbo].[Learner] ([Id], [Surname], [Specialization], [School], [Scores]) VALUES (1, N'Иванова', N'Математика', N'Лицей', 98.5)
INSERT [dbo].[Learner] ([Id], [Surname], [Specialization], [School], [Scores]) VALUES (2, N'Петров', N'Физика', N'Лицей', 99)
INSERT [dbo].[Learner] ([Id], [Surname], [Specialization], [School], [Scores]) VALUES (3, N'Сидоров', N'Математика', N'Лицей', 88)
INSERT [dbo].[Learner] ([Id], [Surname], [Specialization], [School], [Scores]) VALUES (4, N'Полухина', N'Физика', N'Гимназия', 78)
INSERT [dbo].[Learner] ([Id], [Surname], [Specialization], [School], [Scores]) VALUES (5, N'Матвеева', N'Химия', N'Лицей', 92)
INSERT [dbo].[Learner] ([Id], [Surname], [Specialization], [School], [Scores]) VALUES (6, N'Касимов', N'Химия', N'Гимназия', 68)
INSERT [dbo].[Learner] ([Id], [Surname], [Specialization], [School], [Scores]) VALUES (7, N'Нурулин', N'Математика', N'Гимназия', 81)
INSERT [dbo].[Learner] ([Id], [Surname], [Specialization], [School], [Scores]) VALUES (8, N'Авдеев', N'Физика', N'Лицей', 87)
INSERT [dbo].[Learner] ([Id], [Surname], [Specialization], [School], [Scores]) VALUES (9, N'Никитина', N'Химия', N'Лицей', 94)
INSERT [dbo].[Learner] ([Id], [Surname], [Specialization], [School], [Scores]) VALUES (10, N'Барышева', N'Химия', N'Лицей', 88)
INSERT [dbo].[Learner] ([Id], [Surname], [Specialization], [School], [Scores]) VALUES (12, N'Никитин', N'Химия', N'МБОУ СОШ №2', 55)
INSERT [dbo].[Learner] ([Id], [Surname], [Specialization], [School], [Scores]) VALUES (13, N'Петров', N'Русский язык', N'Школа №20', NULL)
INSERT [dbo].[Learner] ([Id], [Surname], [Specialization], [School], [Scores]) VALUES (14, N'Петрова', N'Мфтематика', N'Школа №18', 90)
SET IDENTITY_INSERT [dbo].[Learner] OFF
GO
INSERT [dbo].[Specialization] ([Number], [Direction], [DepartmentShifr]) VALUES (N'01.03.04', N'Прикладная математика', N'мм')
INSERT [dbo].[Specialization] ([Number], [Direction], [DepartmentShifr]) VALUES (N'09.03.02', N'Информационные системы и технологии', N'ис')
INSERT [dbo].[Specialization] ([Number], [Direction], [DepartmentShifr]) VALUES (N'09.03.03', N'Прикладная информатика', N'пи')
INSERT [dbo].[Specialization] ([Number], [Direction], [DepartmentShifr]) VALUES (N'14.03.02', N'Ядерные физика и технологии', N'эф')
INSERT [dbo].[Specialization] ([Number], [Direction], [DepartmentShifr]) VALUES (N'38.03.05', N'Бизнес-информатика', N'ис')
GO
INSERT [dbo].[Student] ([RegNumber], [SpecializationNumber], [Surname]) VALUES (10101, N'09.03.03', N'Николаева Н. Н.')
INSERT [dbo].[Student] ([RegNumber], [SpecializationNumber], [Surname]) VALUES (10102, N'09.03.03', N'Иванов И. И.')
INSERT [dbo].[Student] ([RegNumber], [SpecializationNumber], [Surname]) VALUES (10103, N'09.03.03', N'Крюков К. К.')
INSERT [dbo].[Student] ([RegNumber], [SpecializationNumber], [Surname]) VALUES (20101, N'09.03.02', N'Андреев А. А.')
INSERT [dbo].[Student] ([RegNumber], [SpecializationNumber], [Surname]) VALUES (20102, N'09.03.02', N'Федоров Ф. Ф.')
INSERT [dbo].[Student] ([RegNumber], [SpecializationNumber], [Surname]) VALUES (30101, N'14.03.02', N'Бондаренко Б. Б.')
INSERT [dbo].[Student] ([RegNumber], [SpecializationNumber], [Surname]) VALUES (30102, N'14.03.02', N'Цветков К. К.')
INSERT [dbo].[Student] ([RegNumber], [SpecializationNumber], [Surname]) VALUES (30103, N'14.03.02', N'Петров П. П.')
INSERT [dbo].[Student] ([RegNumber], [SpecializationNumber], [Surname]) VALUES (50101, N'01.03.04', N'Сергеев С. С.')
INSERT [dbo].[Student] ([RegNumber], [SpecializationNumber], [Surname]) VALUES (50102, N'01.03.04', N'Кудрявцев К. К.')
INSERT [dbo].[Student] ([RegNumber], [SpecializationNumber], [Surname]) VALUES (80101, N'38.03.05', N'Макаров М. М.')
INSERT [dbo].[Student] ([RegNumber], [SpecializationNumber], [Surname]) VALUES (80102, N'38.03.05', N'Яковлев Я. Я.')
GO
INSERT [dbo].[Teacher] ([TabNumber], [Rank], [Degree]) VALUES (101, N'профессор', N'д. т.н.')
INSERT [dbo].[Teacher] ([TabNumber], [Rank], [Degree]) VALUES (102, N'доцент', N'к. ф.-м. н.')
INSERT [dbo].[Teacher] ([TabNumber], [Rank], [Degree]) VALUES (105, N'доцент', N'к. т.н.')
INSERT [dbo].[Teacher] ([TabNumber], [Rank], [Degree]) VALUES (201, N'профессор', N'д. ф.-м. н.')
INSERT [dbo].[Teacher] ([TabNumber], [Rank], [Degree]) VALUES (202, N'доцент', N'к. ф.-м. н.')
INSERT [dbo].[Teacher] ([TabNumber], [Rank], [Degree]) VALUES (301, N'профессор', N'д. т.н.')
INSERT [dbo].[Teacher] ([TabNumber], [Rank], [Degree]) VALUES (302, N'доцент', N'к. т.н.')
INSERT [dbo].[Teacher] ([TabNumber], [Rank], [Degree]) VALUES (401, N'профессор', N'д. т.н.')
INSERT [dbo].[Teacher] ([TabNumber], [Rank], [Degree]) VALUES (402, N'доцент', N'к. т.н.')
INSERT [dbo].[Teacher] ([TabNumber], [Rank], [Degree]) VALUES (501, N'профессор', N'д. ф.-м. н.')
INSERT [dbo].[Teacher] ([TabNumber], [Rank], [Degree]) VALUES (502, N'профессор', N'д. ф.-м. н.')
INSERT [dbo].[Teacher] ([TabNumber], [Rank], [Degree]) VALUES (503, N'доцент', N'к. ф.-м. н.')
INSERT [dbo].[Teacher] ([TabNumber], [Rank], [Degree]) VALUES (601, N'профессор', N'д. ф.-м. н.')
GO
INSERT [dbo].[View_6] ([Номер недели], [Количество экзаменов], [Количество студентов]) VALUES (23, 2, 4)
INSERT [dbo].[View_6] ([Номер недели], [Количество экзаменов], [Количество студентов]) VALUES (24, 5, 7)
INSERT [dbo].[View_6] ([Номер недели], [Количество экзаменов], [Количество студентов]) VALUES (25, 3, 4)
GO
INSERT [dbo].[View_7] ([Continent], [Square], [Square1]) VALUES (N'Азия', 647500, 701)
INSERT [dbo].[View_7] ([Continent], [Square], [Square1]) VALUES (N'Африка', 2381740, 112620)
INSERT [dbo].[View_7] ([Continent], [Square], [Square1]) VALUES (N'Европа', 244820, 28748)
INSERT [dbo].[View_7] ([Continent], [Square], [Square1]) VALUES (N'Северная Америка', 22966, 22966)
INSERT [dbo].[View_7] ([Continent], [Square], [Square1]) VALUES (N'Южная Америка', 8511965, 912050)
GO
INSERT [dbo].[ZavDepartment] ([TabNumber], [WorkExperience]) VALUES (101, 15)
INSERT [dbo].[ZavDepartment] ([TabNumber], [WorkExperience]) VALUES (201, 18)
INSERT [dbo].[ZavDepartment] ([TabNumber], [WorkExperience]) VALUES (301, 20)
INSERT [dbo].[ZavDepartment] ([TabNumber], [WorkExperience]) VALUES (401, 10)
INSERT [dbo].[ZavDepartment] ([TabNumber], [WorkExperience]) VALUES (501, 18)
INSERT [dbo].[ZavDepartment] ([TabNumber], [WorkExperience]) VALUES (601, 8)
GO
ALTER TABLE [dbo].[Animal_Manakov] ADD  CONSTRAINT [DF_Animal_Manakov]  DEFAULT ('Хищные') FOR [Otrad]
GO
ALTER TABLE [dbo].[Control_Manakov] ADD  CONSTRAINT [DF_Control_Manakov]  DEFAULT ('Манаков') FOR [Surname]
GO
ALTER TABLE [dbo].[Flowers_Manakov] ADD  CONSTRAINT [DF_Flowers_Manakov]  DEFAULT ('Двудольные') FOR [Class]
GO
ALTER TABLE [dbo].[ApplicationForm]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationForm_Discipline] FOREIGN KEY([DisciplineCode])
REFERENCES [dbo].[Discipline] ([Code])
GO
ALTER TABLE [dbo].[ApplicationForm] CHECK CONSTRAINT [FK_ApplicationForm_Discipline]
GO
ALTER TABLE [dbo].[ApplicationForm]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationForm_Specialization1] FOREIGN KEY([SpecializationNumber])
REFERENCES [dbo].[Specialization] ([Number])
GO
ALTER TABLE [dbo].[ApplicationForm] CHECK CONSTRAINT [FK_ApplicationForm_Specialization1]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Faculcy] FOREIGN KEY([FaculcyAbbr])
REFERENCES [dbo].[Faculcy] ([Abbr])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Faculcy]
GO
ALTER TABLE [dbo].[Discipline]  WITH CHECK ADD  CONSTRAINT [FK_Discipline_Department1] FOREIGN KEY([Implementer])
REFERENCES [dbo].[Department] ([Shifr])
GO
ALTER TABLE [dbo].[Discipline] CHECK CONSTRAINT [FK_Discipline_Department1]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DepartmentShifr])
REFERENCES [dbo].[Department] ([Shifr])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Employee] FOREIGN KEY([Chief])
REFERENCES [dbo].[Employee] ([TabNumber])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Employee]
GO
ALTER TABLE [dbo].[Engineer]  WITH CHECK ADD  CONSTRAINT [FK_Engineer_Employee] FOREIGN KEY([TabNumber])
REFERENCES [dbo].[Employee] ([TabNumber])
GO
ALTER TABLE [dbo].[Engineer] CHECK CONSTRAINT [FK_Engineer_Employee]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Discipline] FOREIGN KEY([DisciplineCode])
REFERENCES [dbo].[Discipline] ([Code])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Discipline]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Employee1] FOREIGN KEY([TabNumber])
REFERENCES [dbo].[Employee] ([TabNumber])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Employee1]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Student] FOREIGN KEY([RegNumber])
REFERENCES [dbo].[Student] ([RegNumber])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Student]
GO
ALTER TABLE [dbo].[Specialization]  WITH CHECK ADD  CONSTRAINT [FK_Specialization_Department] FOREIGN KEY([DepartmentShifr])
REFERENCES [dbo].[Department] ([Shifr])
GO
ALTER TABLE [dbo].[Specialization] CHECK CONSTRAINT [FK_Specialization_Department]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Specialization] FOREIGN KEY([SpecializationNumber])
REFERENCES [dbo].[Specialization] ([Number])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Specialization]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Employee] FOREIGN KEY([TabNumber])
REFERENCES [dbo].[Employee] ([TabNumber])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Employee]
GO
ALTER TABLE [dbo].[ZavDepartment]  WITH CHECK ADD  CONSTRAINT [FK_ZavDepartment_Employee] FOREIGN KEY([TabNumber])
REFERENCES [dbo].[Employee] ([TabNumber])
GO
ALTER TABLE [dbo].[ZavDepartment] CHECK CONSTRAINT [FK_ZavDepartment_Employee]
GO
ALTER TABLE [dbo].[Countries_Manakov]  WITH CHECK ADD  CONSTRAINT [CK_Countries_ManakovSquare] CHECK  (([Square]>(10000)))
GO
ALTER TABLE [dbo].[Countries_Manakov] CHECK CONSTRAINT [CK_Countries_ManakovSquare]
GO
