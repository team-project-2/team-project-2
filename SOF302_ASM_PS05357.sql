USE [SOF302_ASM_PS05357]
GO
/****** Object:  Table [dbo].[Departs]    Script Date: 4/25/2018 8:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departs](
	[Id] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Records]    Script Date: 4/25/2018 8:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Records](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [bit] NULL,
	[Reason] [nvarchar](500) NULL,
	[Date] [date] NULL,
	[StaffId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 4/25/2018 8:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staffs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[Birthday] [date] NULL,
	[Photo] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Salary] [float] NULL,
	[Notes] [nvarchar](500) NULL,
	[DepartId] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/25/2018 8:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[Fullname] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Departs] ([Id], [Name]) VALUES (N'BH', N'Bán Hàng')
INSERT [dbo].[Departs] ([Id], [Name]) VALUES (N'DV', N'Dịch Vụ')
INSERT [dbo].[Departs] ([Id], [Name]) VALUES (N'IT', N'Kỹ Thuật')
INSERT [dbo].[Departs] ([Id], [Name]) VALUES (N'KT', N'Kế Toán')
INSERT [dbo].[Departs] ([Id], [Name]) VALUES (N'LC', N'Lao Công')
INSERT [dbo].[Departs] ([Id], [Name]) VALUES (N'SX', N'Sản Xuất')
SET IDENTITY_INSERT [dbo].[Records] ON 

INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (2, 1, N'Có thành tích tốt trong công việc', CAST(N'2018-03-18' AS Date), 21)
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (3, 0, N'Đi trễ', CAST(N'2018-03-18' AS Date), 21)
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (4, 0, N'Chơi game trong giờ làm việc', CAST(N'2018-03-18' AS Date), 20)
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (5, 1, N'Có thành tích tốt trong công việc', CAST(N'2018-03-18' AS Date), 21)
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (6, 1, N'Có thành tích tốt trong công việc', CAST(N'2018-03-18' AS Date), 20)
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (35, 1, N'Lam viec tot', CAST(N'2018-04-22' AS Date), 20)
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (38, 0, N'lam guong xau', CAST(N'2018-04-22' AS Date), 20)
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (42, 0, N'huhu', CAST(N'2018-04-22' AS Date), 20)
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (48, 1, N'Làm việc tốt', CAST(N'2018-04-24' AS Date), 23)
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (49, 0, N'hoc te qua', CAST(N'2018-04-24' AS Date), 23)
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (50, 1, N'hoc gioi qua', CAST(N'2018-04-24' AS Date), 20)
INSERT [dbo].[Records] ([Id], [Type], [Reason], [Date], [StaffId]) VALUES (51, 0, N'Ăn trong giờ làm việc', CAST(N'2018-04-24' AS Date), 24)
SET IDENTITY_INSERT [dbo].[Records] OFF
SET IDENTITY_INSERT [dbo].[Staffs] ON 

INSERT [dbo].[Staffs] ([Id], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Notes], [DepartId]) VALUES (20, N'Võ Thạch Khôi', 1, CAST(N'1997-04-18' AS Date), N'anhchandung.jpg', N'vothachkhoi98@gmail.com', N'01262462248', 8000000, N'Nhân viên chăm chỉ, có tinh thần làm việc cao.', N'BH')
INSERT [dbo].[Staffs] ([Id], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Notes], [DepartId]) VALUES (21, N'Võ Văn Kiệt', 1, CAST(N'1998-09-18' AS Date), N'anhchandung.jpg', N'vothachkhoi1271998@gmail.com', N'01262462249', 8000000, N'Nhân viên chăm chỉ, có tinh thần làm việc cao.', N'DV')
INSERT [dbo].[Staffs] ([Id], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Notes], [DepartId]) VALUES (23, N'Hoàng Thịnh', 1, CAST(N'2018-04-08' AS Date), N'23905764_932612266904088_545687447536528264_n.jpg', N'thinhdthps05243@fpt.edu.vn', N'0912345678', 5000, N'cục tạ của team', N'IT')
INSERT [dbo].[Staffs] ([Id], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Notes], [DepartId]) VALUES (24, N'aaaaaa', 1, CAST(N'2018-04-08' AS Date), N'23905764_932612266904088_545687447536528264_n.jpg', N'tamdvps05265@fpt.edu.vn', N'0123456789', 5000, N'Nhân viên tích cực', N'BH')
SET IDENTITY_INSERT [dbo].[Staffs] OFF
INSERT [dbo].[Users] ([Username], [Password], [Fullname]) VALUES (N'khoi', N'123', N'Võ Thạch Khôi')
ALTER TABLE [dbo].[Records]  WITH CHECK ADD  CONSTRAINT [FK_Records_Staffs] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staffs] ([Id])
GO
ALTER TABLE [dbo].[Records] CHECK CONSTRAINT [FK_Records_Staffs]
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD  CONSTRAINT [FK_Staffs_Departs] FOREIGN KEY([DepartId])
REFERENCES [dbo].[Departs] ([Id])
GO
ALTER TABLE [dbo].[Staffs] CHECK CONSTRAINT [FK_Staffs_Departs]
GO
