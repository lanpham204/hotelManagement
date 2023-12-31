USE [KhachSan]
GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 12/7/2023 7:58:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[MaDV] [int] IDENTITY(1,1) NOT NULL,
	[TenDV] [nvarchar](100) NOT NULL,
	[DonGia] [float] NULL,
	[MaLDV] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DichVuPhong]    Script Date: 12/7/2023 7:58:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVuPhong](
	[MaDVP] [int] IDENTITY(1,1) NOT NULL,
	[MaPDPhong] [int] NULL,
	[MaDV] [int] NULL,
	[SoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDVP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/7/2023 7:58:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[CCCD] [varchar](12) NOT NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[GioiTinh] [bit] NULL,
	[SoDienThoai] [nvarchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CCCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiDichVu]    Script Date: 12/7/2023 7:58:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiDichVu](
	[MaLDV] [nvarchar](50) NOT NULL,
	[TenDV] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiPhong]    Script Date: 12/7/2023 7:58:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiPhong](
	[MaLoaiPhong] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiPhong] [nvarchar](100) NOT NULL,
	[GiaTheoGio] [float] NULL,
	[GiaTheoNgay] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/7/2023 7:58:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](100) NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[GioiTinh] [bit] NULL,
	[CCCD] [varchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[SoDienThoai] [nvarchar](11) NOT NULL,
	[VaiTro] [bit] NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuDatPhong]    Script Date: 12/7/2023 7:58:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuDatPhong](
	[MaPDP] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [varchar](12) NULL,
	[MaPhong] [nvarchar](20) NULL,
	[NgayGioNhan] [datetime] NOT NULL,
	[NgayGioTra] [datetime] NULL,
	[HinhThucThue] [bit] NULL,
	[TongTien] [float] NULL,
	[TrangThai] [int] NULL,
	[MaNV] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPDP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phong]    Script Date: 12/7/2023 7:58:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong](
	[MaPhong] [nvarchar](20) NOT NULL,
	[TrangThai] [int] NULL,
	[MaLoaiPhong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DichVu] ON 

INSERT [dbo].[DichVu] ([MaDV], [TenDV], [DonGia], [MaLDV]) VALUES (1, N'Bún bò Huế', 30000, N'ThucAn')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [DonGia], [MaLDV]) VALUES (2, N'Hũ tiếu gõ', 25000, N'ThucAn')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [DonGia], [MaLDV]) VALUES (3, N'Mì 2 trứng', 17000, N'ThucAn')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [DonGia], [MaLDV]) VALUES (12, N'Cơm sườn', 30000, N'ThucAn')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [DonGia], [MaLDV]) VALUES (13, N'Gà rán', 30000, N'ThucAn')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [DonGia], [MaLDV]) VALUES (14, N'Mì xào bò', 25000, N'ThucAn')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [DonGia], [MaLDV]) VALUES (16, N'Mì 2 vắt 1 trứng', 20000, N'ThucAn')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [DonGia], [MaLDV]) VALUES (17, N'Sting', 15000, N'NuocUong')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [DonGia], [MaLDV]) VALUES (18, N'Coca Cola', 15000, N'NuocUong')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [DonGia], [MaLDV]) VALUES (19, N'Pepsi', 15000, N'NuocUong')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [DonGia], [MaLDV]) VALUES (20, N'Bò cụn', 20000, N'NuocUong')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [DonGia], [MaLDV]) VALUES (21, N'Trà ô lông Tea+', 15000, N'NuocUong')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [DonGia], [MaLDV]) VALUES (22, N'Giặt ủi', 150000, N'DVPhong')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [DonGia], [MaLDV]) VALUES (23, N'Đặt xe', 10000, N'DVPhong')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [DonGia], [MaLDV]) VALUES (24, N'Đánh thức', 10000, N'DVPhong')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [DonGia], [MaLDV]) VALUES (25, N'Dịch vụ phòng', 20000, N'DVPhong')
INSERT [dbo].[DichVu] ([MaDV], [TenDV], [DonGia], [MaLDV]) VALUES (26, N'Giữ trẻ', 100000, N'DVPhong')
SET IDENTITY_INSERT [dbo].[DichVu] OFF
GO
SET IDENTITY_INSERT [dbo].[DichVuPhong] ON 

INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (1, 1, 1, 2)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (2, 1, 2, 1)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (3, 1, 3, 1)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (4, 1, 14, 3)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (5, 2, 13, 2)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (6, 2, 25, 1)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (7, 2, 22, 1)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (8, 2, 14, 3)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (9, 3, 1, 2)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (10, 3, 2, 1)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (11, 3, 3, 1)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (12, 3, 14, 3)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (13, 4, 1, 2)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (14, 4, 2, 1)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (15, 4, 3, 1)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (16, 4, 14, 3)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (17, 5, 1, 2)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (18, 5, 2, 1)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (19, 5, 3, 1)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (20, 5, 14, 3)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (21, 6, 1, 2)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (22, 6, 2, 1)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (23, 6, 3, 1)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (24, 6, 14, 3)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (25, 7, 1, 2)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (26, 7, 2, 1)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (27, 7, 3, 1)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (28, 7, 14, 3)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (29, 17, 1, 1)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (30, 12, 1, 3)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (31, 12, 12, 4)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (32, 12, 13, 4)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (33, 12, 14, 6)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (36, 17, 1, 1)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (44, 12, 17, 3)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (51, 17, 14, 1)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (52, 17, 13, 1)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (56, 13, 1, 2)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (57, 13, 2, 3)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (61, 24, 1, 4)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (62, 24, 2, 4)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (64, 24, 18, 4)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (65, 13, 14, 1)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (66, 25, 1, 4)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (76, 25, 2, 4)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (77, 25, 18, 3)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (78, 25, 16, 1)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (83, 29, 1, 4)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (84, 29, 13, 3)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (85, 29, 14, 3)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (87, 35, 1, 3)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (88, 35, 2, 3)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (90, 40, 13, 3)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (91, 40, 12, 4)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (92, 42, 1, 2)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (93, 42, 13, 3)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (94, 45, 2, 1)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (95, 45, 3, 1)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (97, 45, 22, 3)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (98, 37, 2, 4)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (99, 37, 3, 3)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (100, 44, 1, 3)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (101, 44, 13, 4)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (102, 60, 21, 17)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (103, 68, 1, 4)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (104, 68, 12, 1)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (105, 68, 13, 3)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (106, 72, 3, 2)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (107, 72, 13, 4)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (108, 72, 12, 4)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (109, 82, 3, 4)
INSERT [dbo].[DichVuPhong] ([MaDVP], [MaPDPhong], [MaDV], [SoLuong]) VALUES (110, 84, 1, 2)
SET IDENTITY_INSERT [dbo].[DichVuPhong] OFF
GO
INSERT [dbo].[KhachHang] ([CCCD], [HoTen], [NgaySinh], [GioiTinh], [SoDienThoai]) VALUES (N'123456789123', N'Nguyễn Văn Anh', CAST(N'1990-01-15' AS Date), 1, N'0987654321')
INSERT [dbo].[KhachHang] ([CCCD], [HoTen], [NgaySinh], [GioiTinh], [SoDienThoai]) VALUES (N'234567890653', N'Hồ Văn Hậu', CAST(N'1988-12-01' AS Date), 1, N'0965432109')
INSERT [dbo].[KhachHang] ([CCCD], [HoTen], [NgaySinh], [GioiTinh], [SoDienThoai]) VALUES (N'456789123325', N'Lê Văn Cương', CAST(N'2000-08-10' AS Date), 1, N'0978965432')
INSERT [dbo].[KhachHang] ([CCCD], [HoTen], [NgaySinh], [GioiTinh], [SoDienThoai]) VALUES (N'789123456564', N'Phạm Thị Dung', CAST(N'1996-03-25' AS Date), 0, N'0901234567')
INSERT [dbo].[KhachHang] ([CCCD], [HoTen], [NgaySinh], [GioiTinh], [SoDienThoai]) VALUES (N'92348324234', N'Nguyễn Quang Dũng', CAST(N'2003-11-02' AS Date), 0, N'0983283328')
INSERT [dbo].[KhachHang] ([CCCD], [HoTen], [NgaySinh], [GioiTinh], [SoDienThoai]) VALUES (N'987654321321', N'Trần Thị Nghè', CAST(N'1985-05-20' AS Date), 0, N'0912345678')
GO
INSERT [dbo].[LoaiDichVu] ([MaLDV], [TenDV]) VALUES (N'DVPhong', N'Dịch vụ phòng')
INSERT [dbo].[LoaiDichVu] ([MaLDV], [TenDV]) VALUES (N'NuocUong', N'Nước uống')
INSERT [dbo].[LoaiDichVu] ([MaLDV], [TenDV]) VALUES (N'ThucAn', N'Thức ăn')
GO
SET IDENTITY_INSERT [dbo].[LoaiPhong] ON 

INSERT [dbo].[LoaiPhong] ([MaLoaiPhong], [TenLoaiPhong], [GiaTheoGio], [GiaTheoNgay]) VALUES (1, N'Đơn', 40000, 400000)
INSERT [dbo].[LoaiPhong] ([MaLoaiPhong], [TenLoaiPhong], [GiaTheoGio], [GiaTheoNgay]) VALUES (2, N'Đôi', 50000, 500000)
SET IDENTITY_INSERT [dbo].[LoaiPhong] OFF
GO
INSERT [dbo].[NhanVien] ([MaNV], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [CCCD], [Email], [SoDienThoai], [VaiTro]) VALUES (N'AnhNN', N'$2a$10$KUMVdqxHxmciD2ReAsi72.0APdnAn6O.vKdwE2vCyQijxoAj5Eouq', N'Nguyễn Ngọc Anh', CAST(N'2003-04-25' AS Date), 0, N'092203394384', N'anhnn123@gmail.com', N'0938417233', 0)
INSERT [dbo].[NhanVien] ([MaNV], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [CCCD], [Email], [SoDienThoai], [VaiTro]) VALUES (N'LanPN', N'$2a$10$0w4Rmp9.2qRZNkPZqGCZseJIzDPoPyxvE5Fiyb7IWmJHuzF7mk8vi', N'Phạm Ngọc Lân', CAST(N'2004-06-04' AS Date), 1, N'094204302099', N'lanpnps35575@fpt.edu.vn', N'0826515237', 1)
INSERT [dbo].[NhanVien] ([MaNV], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [CCCD], [Email], [SoDienThoai], [VaiTro]) VALUES (N'MinhTN', N'$2a$10$qYyJpIVgA751mUgnvnlze.f.J5LITFDKe.1hmXQJurL.FVB9qWu3K', N'Trần Ngọc Minh', CAST(N'2004-02-23' AS Date), 1, N'048204238472', N'minhtnps38272@fpt.edu.vn', N'0938231273', 1)
GO
SET IDENTITY_INSERT [dbo].[PhieuDatPhong] ON 

INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (1, N'123456789123', N'P101', CAST(N'2022-11-12T18:20:20.000' AS DateTime), CAST(N'2022-11-13T12:00:00.000' AS DateTime), 1, 500000, 0, N'MinhTN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (2, N'123456789123', N'P101', CAST(N'2022-11-17T21:25:25.120' AS DateTime), CAST(N'2022-11-18T21:25:25.120' AS DateTime), 1, 850000, 0, N'MinhTN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (3, N'123456789123', N'P102', CAST(N'2022-05-17T21:25:25.120' AS DateTime), CAST(N'2022-05-17T21:25:25.120' AS DateTime), 1, 750000, 0, N'MinhTN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (4, N'234567890653', N'P103', CAST(N'2022-05-17T21:25:25.120' AS DateTime), CAST(N'2022-05-17T21:25:25.120' AS DateTime), 1, 650000, 0, N'MinhTN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (5, N'234567890653', N'P104', CAST(N'2022-05-17T21:25:25.120' AS DateTime), CAST(N'2022-05-17T21:25:25.120' AS DateTime), 1, 800000, 0, N'MinhTN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (6, N'234567890653', N'P105', CAST(N'2022-12-05T21:25:25.120' AS DateTime), CAST(N'2022-12-06T21:25:25.120' AS DateTime), 1, 900000, 0, N'MinhTN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (7, N'456789123325', N'P106', CAST(N'2022-12-05T21:25:25.120' AS DateTime), CAST(N'2022-12-06T21:25:25.120' AS DateTime), 1, 1000000, 0, N'MinhTN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (8, N'456789123325', N'P107', CAST(N'2022-12-05T21:25:25.120' AS DateTime), CAST(N'2022-12-06T21:25:25.120' AS DateTime), 0, 1200000, 0, N'MinhTN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (9, N'456789123325', N'P108', CAST(N'2023-11-17T21:25:25.120' AS DateTime), CAST(N'2023-11-19T21:25:25.120' AS DateTime), 0, 540000, 0, N'MinhTN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (10, N'456789123325', N'P109', CAST(N'2023-11-17T21:25:25.120' AS DateTime), CAST(N'2023-11-19T21:25:25.120' AS DateTime), 0, 670000, 0, N'MinhTN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (11, N'789123456564', N'P201', CAST(N'2023-11-17T21:25:25.120' AS DateTime), CAST(N'2023-11-19T21:25:25.120' AS DateTime), 0, 894000, 0, N'MinhTN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (12, N'789123456564', N'P101', CAST(N'2023-05-24T21:28:04.960' AS DateTime), CAST(N'2023-05-25T21:28:04.960' AS DateTime), 0, 7104992, 0, N'LanPN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (13, N'789123456564', N'P102', CAST(N'2023-11-16T21:28:04.960' AS DateTime), CAST(N'2023-05-25T21:28:04.960' AS DateTime), 0, 1720000, 0, N'LanPN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (14, N'789123456564', N'P103', CAST(N'2023-05-24T21:28:04.960' AS DateTime), CAST(N'2023-05-25T21:28:04.960' AS DateTime), 1, 958000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (15, N'987654321321', N'P104', CAST(N'2023-11-20T21:28:04.960' AS DateTime), CAST(N'2023-11-23T21:28:04.960' AS DateTime), 1, 350000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (16, N'987654321321', N'P105', CAST(N'2023-11-20T21:28:04.960' AS DateTime), CAST(N'2023-11-23T21:28:04.960' AS DateTime), 1, 540000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (17, N'987654321321', N'P106', CAST(N'2023-11-13T21:28:04.960' AS DateTime), CAST(N'2023-11-15T21:28:04.960' AS DateTime), 1, 2615000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (18, N'456789123325', N'P107', CAST(N'2023-11-13T21:28:04.960' AS DateTime), CAST(N'2023-11-15T21:28:04.960' AS DateTime), 1, 650000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (19, N'987654321321', N'P108', CAST(N'2023-11-20T21:28:04.960' AS DateTime), CAST(N'2023-11-23T21:28:04.960' AS DateTime), 1, 345400, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (20, N'456789123325', N'P109', CAST(N'2023-11-20T21:28:04.960' AS DateTime), CAST(N'2023-11-23T21:28:04.960' AS DateTime), 1, 495000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (21, N'456789123325', N'P201', CAST(N'2023-11-20T21:28:04.960' AS DateTime), CAST(N'2023-11-23T21:28:04.960' AS DateTime), 1, 984000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (24, N'92348324234', N'P106', CAST(N'2023-11-16T11:03:22.000' AS DateTime), CAST(N'2023-11-18T11:03:52.643' AS DateTime), 0, 2730000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (25, N'456789123325', N'P102', CAST(N'2023-11-18T10:15:18.000' AS DateTime), CAST(N'2023-11-19T13:15:51.333' AS DateTime), 1, 1485000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (29, N'123456789123', N'P101', CAST(N'2023-11-21T11:28:46.000' AS DateTime), CAST(N'2023-11-21T12:28:51.343' AS DateTime), 0, 365000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (30, N'123456789123', N'P102', CAST(N'2023-11-21T13:22:17.997' AS DateTime), CAST(N'2023-11-21T13:22:32.680' AS DateTime), 1, 400000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (31, N'123456789123', N'P102', CAST(N'2023-11-11T13:23:07.240' AS DateTime), CAST(N'2023-11-21T13:23:15.000' AS DateTime), 1, 4000000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (32, N'123456789123', N'P107', CAST(N'2023-11-21T13:29:47.063' AS DateTime), CAST(N'2023-11-22T13:29:54.243' AS DateTime), 1, 500000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (33, N'123456789123', N'P107', CAST(N'2023-11-21T13:36:53.437' AS DateTime), CAST(N'2023-11-22T13:37:03.720' AS DateTime), 1, 500000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (34, N'123456789123', N'P102', CAST(N'2023-11-21T21:11:14.800' AS DateTime), CAST(N'2023-11-23T21:11:31.263' AS DateTime), 1, 1600000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (35, N'92348324234', N'P107', CAST(N'2023-11-21T21:11:41.017' AS DateTime), CAST(N'2023-11-22T21:11:47.317' AS DateTime), 0, 2165000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (36, N'987654321321', N'P103', CAST(N'2023-11-23T09:59:43.000' AS DateTime), CAST(N'2023-11-23T12:59:59.687' AS DateTime), 0, 160000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (37, N'789123456564', N'P101', CAST(N'2023-11-24T20:58:31.030' AS DateTime), CAST(N'2023-11-29T19:59:41.470' AS DateTime), 1, 1751000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (40, N'92348324234', N'P101', CAST(N'2023-11-24T20:16:18.163' AS DateTime), CAST(N'2023-11-26T20:16:24.500' AS DateTime), 1, 610000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (41, N'92348324234', N'P107', CAST(N'2023-11-24T21:53:37.247' AS DateTime), CAST(N'2023-11-26T21:53:52.737' AS DateTime), 1, 500000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (42, N'456789123325', N'P107', CAST(N'2023-11-24T21:54:34.433' AS DateTime), CAST(N'2023-11-24T21:54:48.000' AS DateTime), 0, 200000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (43, N'987654321321', N'P106', CAST(N'2023-11-26T21:58:48.900' AS DateTime), CAST(N'2023-11-26T21:58:56.037' AS DateTime), 1, 500000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (44, N'234567890653', N'P109', CAST(N'2023-11-24T21:59:25.163' AS DateTime), CAST(N'2023-11-24T21:59:31.680' AS DateTime), 1, 2210000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (45, N'123456789123', N'P103', CAST(N'2023-11-25T11:41:00.830' AS DateTime), CAST(N'2023-11-29T11:41:05.777' AS DateTime), 1, 892000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (46, N'123456789123', N'P103', CAST(N'2023-11-18T11:41:18.310' AS DateTime), CAST(N'2023-11-27T11:41:30.377' AS DateTime), 1, 2800000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (47, N'123456789123', N'P102', CAST(N'2023-11-26T12:17:58.663' AS DateTime), CAST(N'2023-11-27T12:18:07.193' AS DateTime), 0, 1320000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (48, N'789123456564', N'P202', CAST(N'2023-11-27T13:19:23.483' AS DateTime), CAST(N'2023-11-26T13:19:32.383' AS DateTime), 1, 800000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (49, N'123456789123', N'P104', CAST(N'2023-11-25T13:24:21.147' AS DateTime), CAST(N'2023-11-27T13:24:25.000' AS DateTime), 1, 1200000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (50, N'123456789123', N'P104', CAST(N'2023-11-25T13:24:21.147' AS DateTime), CAST(N'2023-11-27T13:24:25.000' AS DateTime), 1, 400000, 1, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (51, N'92348324234', N'P108', CAST(N'2023-11-26T13:26:07.513' AS DateTime), CAST(N'2023-11-29T13:26:11.640' AS DateTime), 1, 1000000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (52, N'456789123325', N'P102', CAST(N'2023-11-25T13:27:21.493' AS DateTime), CAST(N'2023-11-14T13:27:24.490' AS DateTime), 1, 400000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (53, N'456789123325', N'P107', CAST(N'2023-11-25T13:27:33.563' AS DateTime), CAST(N'2023-11-15T13:27:35.877' AS DateTime), 1, 500000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (54, N'234567890653', N'P201', CAST(N'2023-11-28T20:37:44.440' AS DateTime), CAST(N'2023-11-30T20:37:52.690' AS DateTime), 1, 400000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (55, N'234567890653', N'P107', CAST(N'2023-11-28T20:39:41.757' AS DateTime), CAST(N'2023-11-27T20:39:44.287' AS DateTime), 1, 500000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (56, N'123456789123', N'P105', CAST(N'2023-11-28T21:14:55.450' AS DateTime), CAST(N'2023-11-30T21:14:57.257' AS DateTime), 1, 400000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (57, N'123456789123', N'P101', CAST(N'2023-11-27T21:16:51.580' AS DateTime), CAST(N'2023-11-29T21:16:55.953' AS DateTime), 1, 400000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (58, N'123456789123', N'P101', CAST(N'2023-11-28T21:19:41.957' AS DateTime), CAST(N'2023-11-30T21:19:44.367' AS DateTime), 1, 400000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (59, N'123456789123', N'P101', CAST(N'2023-11-28T21:21:39.837' AS DateTime), CAST(N'2023-11-30T21:21:42.000' AS DateTime), 1, 400000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (60, N'234567890653', N'P106', CAST(N'2023-11-28T21:23:30.467' AS DateTime), CAST(N'2023-11-29T21:23:32.377' AS DateTime), 1, 1255000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (61, N'234567890653', N'P106', CAST(N'2023-01-28T21:23:30.467' AS DateTime), CAST(N'2023-01-29T21:23:32.377' AS DateTime), 1, 500000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (62, N'234567890653', N'P106', CAST(N'2023-02-28T21:23:30.467' AS DateTime), CAST(N'2023-08-29T21:23:32.377' AS DateTime), 1, 500000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (63, N'234567890653', N'P106', CAST(N'2023-03-28T21:23:30.467' AS DateTime), CAST(N'2023-03-29T21:23:32.377' AS DateTime), 1, 500000, 0, N'AnhNN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (64, N'234567890653', N'P106', CAST(N'2023-04-28T21:23:30.467' AS DateTime), CAST(N'2023-05-29T21:23:32.377' AS DateTime), 1, 500000, 0, N'MinhTN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (65, N'234567890653', N'P106', CAST(N'2023-06-28T21:23:30.467' AS DateTime), CAST(N'2023-06-29T21:23:32.377' AS DateTime), 1, 500000, 0, N'MinhTN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (66, N'234567890653', N'P106', CAST(N'2023-07-28T21:23:30.467' AS DateTime), CAST(N'2023-07-29T21:23:32.377' AS DateTime), 1, 500000, 0, N'MinhTN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (67, N'789123456564', N'P107', CAST(N'2023-11-29T19:39:03.813' AS DateTime), CAST(N'2023-11-30T19:39:06.047' AS DateTime), 1, 500000, 0, N'MinhTN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (68, N'789123456564', N'P105', CAST(N'2023-11-29T19:39:10.380' AS DateTime), CAST(N'2023-11-23T19:39:14.873' AS DateTime), 1, 1040000, 0, N'MinhTN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (69, N'987654321321', N'P201', CAST(N'2023-11-29T19:39:31.267' AS DateTime), CAST(N'2023-11-30T19:39:34.213' AS DateTime), 1, 400000, 0, N'MinhTN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (70, N'987654321321', N'P106', CAST(N'2023-11-29T19:45:31.890' AS DateTime), CAST(N'2023-11-30T19:45:33.843' AS DateTime), 1, 4000000, 0, N'MinhTN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (71, N'456789123325', N'P102', CAST(N'2023-12-02T15:54:17.303' AS DateTime), CAST(N'2023-12-04T15:54:23.490' AS DateTime), 1, 400000, 0, N'MinhTN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (72, N'234567890653', N'P107', CAST(N'2023-12-01T11:54:47.000' AS DateTime), CAST(N'2023-12-01T15:54:53.333' AS DateTime), 0, 524000, 0, N'LanPN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (73, N'123456789123', N'P103', CAST(N'2023-12-02T16:02:01.967' AS DateTime), CAST(N'2023-12-03T16:02:06.513' AS DateTime), 1, 400000, 0, N'LanPN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (74, N'789123456564', N'P103', CAST(N'2023-12-01T16:02:21.743' AS DateTime), CAST(N'2023-12-01T16:02:25.303' AS DateTime), 0, 40000, 0, N'LanPN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (75, N'234567890653', N'P103', CAST(N'2023-12-01T16:05:54.253' AS DateTime), CAST(N'2023-12-01T16:05:56.587' AS DateTime), 1, 400000, 0, N'LanPN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (76, N'789123456564', N'P103', CAST(N'2023-12-01T16:09:11.573' AS DateTime), CAST(N'2023-12-01T16:09:14.317' AS DateTime), 0, 40000, 0, N'LanPN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (77, N'234567890653', N'P103', CAST(N'2023-12-01T16:17:57.647' AS DateTime), CAST(N'2023-12-01T16:18:00.363' AS DateTime), 1, 400000, 0, N'LanPN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (78, N'789123456564', N'P103', CAST(N'2023-12-01T16:18:35.907' AS DateTime), CAST(N'2023-12-01T16:18:38.210' AS DateTime), 1, 400000, 0, N'LanPN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (79, N'92348324234', N'P101', CAST(N'2023-12-01T16:24:13.603' AS DateTime), CAST(N'2023-12-13T16:24:17.000' AS DateTime), 1, 400000, 0, N'LanPN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (80, N'123456789123', N'P102', CAST(N'2023-12-02T12:17:17.187' AS DateTime), CAST(N'2023-12-02T12:17:19.397' AS DateTime), 1, 400000, 0, N'LanPN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (81, N'123456789123', N'P202', CAST(N'2023-12-05T12:22:41.907' AS DateTime), CAST(N'2023-12-05T12:23:03.720' AS DateTime), 1, 800000, 0, N'LanPN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (82, N'123456789123', N'P106', CAST(N'2023-12-05T12:23:29.463' AS DateTime), CAST(N'2023-12-05T12:23:35.447' AS DateTime), 0, 40000, 1, N'LanPN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (83, N'123456789123', N'P102', CAST(N'2023-12-09T12:43:25.863' AS DateTime), CAST(N'2023-12-10T12:43:43.437' AS DateTime), 1, 400000, 2, N'LanPN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (84, N'123456789123', N'P108', CAST(N'2023-12-07T12:43:59.210' AS DateTime), CAST(N'2023-12-08T12:44:05.000' AS DateTime), 1, 560000, 0, N'LanPN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (85, N'789123456564', N'P107', CAST(N'2023-12-07T19:36:47.417' AS DateTime), CAST(N'2023-12-08T19:36:50.053' AS DateTime), 1, 500000, 0, N'LanPN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (86, N'456789123325', N'P103', CAST(N'2023-12-07T19:37:47.647' AS DateTime), CAST(N'2023-12-08T19:37:49.543' AS DateTime), 1, 400000, 0, N'LanPN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (87, N'234567890653', N'P107', CAST(N'2023-12-07T19:44:56.703' AS DateTime), CAST(N'2023-12-08T19:44:58.500' AS DateTime), 1, 500000, 1, N'LanPN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (89, N'123456789123', N'P105', CAST(N'2023-12-07T19:49:18.340' AS DateTime), CAST(N'2023-12-08T19:49:22.793' AS DateTime), 1, 400000, 0, N'LanPN')
INSERT [dbo].[PhieuDatPhong] ([MaPDP], [MaKH], [MaPhong], [NgayGioNhan], [NgayGioTra], [HinhThucThue], [TongTien], [TrangThai], [MaNV]) VALUES (90, N'789123456564', N'P105', CAST(N'2023-12-07T19:53:36.463' AS DateTime), CAST(N'2023-12-09T19:53:38.597' AS DateTime), 0, 40000, 1, N'LanPN')
SET IDENTITY_INSERT [dbo].[PhieuDatPhong] OFF
GO
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P101', 0, 1)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P102', 0, 1)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P103', 0, 1)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P104', 3, 1)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P105', 1, 1)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P106', 2, 2)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P107', 2, 2)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P108', 0, 2)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P109', 0, 2)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P201', 0, 1)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P202', 0, 1)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P203', 0, 1)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P204', 0, 1)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P205', 0, 1)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P206', 0, 2)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P207', 0, 2)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P208', 0, 2)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P209', 0, 2)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P210', 0, 2)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P211', 0, 2)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P301', 0, 2)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P302', 0, 1)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P303', 0, 1)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P304', 0, 2)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P305', 0, 2)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P306', 0, 2)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P307', 0, 2)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P308', 0, 1)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P309', 0, 1)
INSERT [dbo].[Phong] ([MaPhong], [TrangThai], [MaLoaiPhong]) VALUES (N'P401', 0, 2)
GO
ALTER TABLE [dbo].[DichVu] ADD  DEFAULT ((0)) FOR [DonGia]
GO
ALTER TABLE [dbo].[DichVuPhong] ADD  DEFAULT ((1)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[LoaiPhong] ADD  DEFAULT ((0)) FOR [GiaTheoGio]
GO
ALTER TABLE [dbo].[LoaiPhong] ADD  DEFAULT ((0)) FOR [GiaTheoNgay]
GO
ALTER TABLE [dbo].[PhieuDatPhong] ADD  DEFAULT (getdate()) FOR [NgayGioNhan]
GO
ALTER TABLE [dbo].[Phong] ADD  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[DichVu]  WITH CHECK ADD FOREIGN KEY([MaLDV])
REFERENCES [dbo].[LoaiDichVu] ([MaLDV])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DichVuPhong]  WITH CHECK ADD FOREIGN KEY([MaPDPhong])
REFERENCES [dbo].[PhieuDatPhong] ([MaPDP])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DichVuPhong]  WITH CHECK ADD FOREIGN KEY([MaDV])
REFERENCES [dbo].[DichVu] ([MaDV])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhieuDatPhong]  WITH CHECK ADD FOREIGN KEY([MaPhong])
REFERENCES [dbo].[Phong] ([MaPhong])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhieuDatPhong]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([CCCD])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhieuDatPhong]  WITH CHECK ADD  CONSTRAINT [PK_MaNV] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuDatPhong] CHECK CONSTRAINT [PK_MaNV]
GO
ALTER TABLE [dbo].[Phong]  WITH CHECK ADD FOREIGN KEY([MaLoaiPhong])
REFERENCES [dbo].[LoaiPhong] ([MaLoaiPhong])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[DichVu]  WITH CHECK ADD CHECK  (([DonGia]>=(0)))
GO
ALTER TABLE [dbo].[DichVuPhong]  WITH CHECK ADD CHECK  (([Soluong]>=(1)))
GO
ALTER TABLE [dbo].[LoaiPhong]  WITH CHECK ADD CHECK  (([GiaTheoGio]>=(0)))
GO
ALTER TABLE [dbo].[LoaiPhong]  WITH CHECK ADD CHECK  (([GiaTheoNgay]>=(0)))
GO
/****** Object:  StoredProcedure [dbo].[sp_SearchTotalRevenueByDate]    Script Date: 12/7/2023 7:58:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_SearchTotalRevenueByDate]
		@Date NVARCHAR(20)
AS
BEGIN
	   SELECT  CONVERT(DATE, NgayGioTra, 23) Ngay,
		 count(pd.MaKH) SoKH,
		 SUM(TongTien) DoanhThu
	FROM PhieuDatPhong pd
		JOIN KhachHang kh ON kh.CCCD = pd.MaKH
		WHERE CONVERT(DATE, NgayGioTra, 23) like '%%'
	GROUP BY CONVERT(DATE, NgayGioTra, 23)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SearchTotalRevenueByFromToDate]    Script Date: 12/7/2023 7:58:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[sp_SearchTotalRevenueByFromToDate]
		@from NVARCHAR(20),@to NVARCHAR(20)
AS
BEGIN
	   SELECT  CONVERT(DATE, NgayGioTra, 23) Ngay,
		 count(pd.MaKH) SoKH,
		 SUM(TongTien) DoanhThu
	FROM PhieuDatPhong pd
		JOIN KhachHang kh ON kh.CCCD = pd.MaKH
		WHERE CONVERT(DATE, NgayGioTra, 23) between  @from and @to
	GROUP BY CONVERT(DATE, NgayGioTra, 23)
END
GO
