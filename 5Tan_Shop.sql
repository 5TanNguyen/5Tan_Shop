USE [master]
GO
/****** Object:  Database [B1910293]    Script Date: 09/04/2023 3:36:34 PM ******/
CREATE DATABASE [B1910293]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'B1910293', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\B1910293.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'B1910293_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\B1910293_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [B1910293] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [B1910293].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [B1910293] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [B1910293] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [B1910293] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [B1910293] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [B1910293] SET ARITHABORT OFF 
GO
ALTER DATABASE [B1910293] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [B1910293] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [B1910293] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [B1910293] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [B1910293] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [B1910293] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [B1910293] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [B1910293] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [B1910293] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [B1910293] SET  DISABLE_BROKER 
GO
ALTER DATABASE [B1910293] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [B1910293] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [B1910293] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [B1910293] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [B1910293] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [B1910293] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [B1910293] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [B1910293] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [B1910293] SET  MULTI_USER 
GO
ALTER DATABASE [B1910293] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [B1910293] SET DB_CHAINING OFF 
GO
ALTER DATABASE [B1910293] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [B1910293] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [B1910293] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [B1910293] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [B1910293] SET QUERY_STORE = OFF
GO
USE [B1910293]
GO
/****** Object:  Table [dbo].[chitietdondat]    Script Date: 09/04/2023 3:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chitietdondat](
	[ctdd_id] [int] NOT NULL,
	[ctdd_madd] [int] NOT NULL,
	[ctdd_masp] [int] NOT NULL,
	[ctdd_soluong] [int] NOT NULL,
	[ctdd_giatien] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ctdd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chitiethoadon]    Script Date: 09/04/2023 3:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chitiethoadon](
	[cthd_id] [int] NOT NULL,
	[cthd_masp] [int] NOT NULL,
	[cthd_mahd] [int] NOT NULL,
	[cthd_soluong] [int] NOT NULL,
	[cthd_giatien] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cthd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chucvu]    Script Date: 09/04/2023 3:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chucvu](
	[cv_id] [int] NOT NULL,
	[cv_ten] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cv_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dondat]    Script Date: 09/04/2023 3:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dondat](
	[dd_id] [int] NOT NULL,
	[dd_makh] [varchar](50) NOT NULL,
	[dd_matt] [int] NOT NULL,
	[dd_thoigian] [date] NULL,
	[dd_tongtien] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 09/04/2023 3:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadon](
	[hd_id] [int] NOT NULL,
	[hd_manv] [varchar](50) NOT NULL,
	[hd_makh] [varchar](50) NOT NULL,
	[hd_ngaylap] [date] NOT NULL,
	[hd_tongtien] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[hd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khachhang]    Script Date: 09/04/2023 3:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khachhang](
	[kh_id] [varchar](50) NOT NULL,
	[kh_username] [varchar](50) NOT NULL,
	[kh_pwd] [varchar](50) NOT NULL,
	[kh_hoten] [varchar](100) NOT NULL,
	[kh_diachi] [varchar](200) NOT NULL,
	[kh_sdt] [char](10) NOT NULL,
	[kh_anh] [varchar](100) NOT NULL,
	[kh_loai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[kh_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loaikhachhang]    Script Date: 09/04/2023 3:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loaikhachhang](
	[lkh_id] [int] NOT NULL,
	[lkh_tenloai] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[lkh_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loaisanpham]    Script Date: 09/04/2023 3:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loaisanpham](
	[lsp_id] [int] NOT NULL,
	[lsp_tenloai] [varchar](100) NOT NULL,
	[lsp_anhloai] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[lsp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhanvien]    Script Date: 09/04/2023 3:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhanvien](
	[nv_id] [varchar](50) NOT NULL,
	[nv_username] [varchar](50) NOT NULL,
	[nv_pwd] [varchar](50) NOT NULL,
	[nv_hoten] [varchar](100) NOT NULL,
	[nv_diachi] [varchar](200) NOT NULL,
	[nv_sdt] [char](10) NOT NULL,
	[nv_anh] [varchar](100) NOT NULL,
	[nv_chucvu] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[nv_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhasanxuat]    Script Date: 09/04/2023 3:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhasanxuat](
	[nsx_id] [int] NOT NULL,
	[nsx_tennsx] [varchar](100) NOT NULL,
	[nsx_diachi] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nsx_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sanpham]    Script Date: 09/04/2023 3:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sanpham](
	[sp_id] [int] NOT NULL,
	[sp_loai] [int] NOT NULL,
	[sp_nsx] [int] NOT NULL,
	[sp_ten] [varchar](150) NOT NULL,
	[sp_gia] [float] NOT NULL,
	[sp_soluong] [int] NOT NULL,
	[sp_mota] [varchar](500) NOT NULL,
	[sp_anh] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trangthaidondat]    Script Date: 09/04/2023 3:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trangthaidondat](
	[ttdd_id] [int] NOT NULL,
	[ttdd_ten] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ttdd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (0, 0, 2, 1, 150000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (1, 1, 1, 1, 550000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (2, 0, 1, 5, 1250000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (3, 4, 6, 1, 55)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (4, 5, 6, 5, 275)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (5, 5, 1, 1, 250000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (6, 5, 4, 4, 1280000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (7, 6, 6, 5, 275)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (8, 6, 5, 6, 60)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (9, 7, 6, 5, 275)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (10, 7, 8, 5, 250)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (11, 8, 6, 5, 275)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (12, 9, 1, 5, 2000000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (13, 10, 1, 5, 2000000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (14, 11, 2, 1, 150000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (15, 12, 4, 2, 640000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (16, 13, 1, 1, 400000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (17, 14, 7, 1, 1550000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (18, 15, 3, 1, 450000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (19, 15, 5, 1, 100000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (20, 15, 16, 1, 200000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (21, 16, 3, 1, 450000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (22, 16, 22, 1, 95000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (23, 17, 24, 1, 230000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (24, 17, 21, 2, 340000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (25, 18, 1, 1, 405000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (26, 18, 16, 1, 200000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (27, 18, 3, 2, 900000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (28, 19, 4, 1, 32000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (29, 20, 7, 1, 1550000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (30, 20, 12, 1, 250000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (31, 21, 2, 1, 150000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (32, 21, 4, 1, 32000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (33, 21, 5, 1, 100000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (34, 21, 3, 1, 450000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (35, 22, 4, 3, 96000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (36, 23, 2, 1, 150000)
INSERT [dbo].[chitietdondat] ([ctdd_id], [ctdd_madd], [ctdd_masp], [ctdd_soluong], [ctdd_giatien]) VALUES (37, 24, 3, 1, 450000)
GO
INSERT [dbo].[chitiethoadon] ([cthd_id], [cthd_masp], [cthd_mahd], [cthd_soluong], [cthd_giatien]) VALUES (0, 1, 0, 1, 550000)
INSERT [dbo].[chitiethoadon] ([cthd_id], [cthd_masp], [cthd_mahd], [cthd_soluong], [cthd_giatien]) VALUES (1, 1, 1, 3, 1000000)
INSERT [dbo].[chitiethoadon] ([cthd_id], [cthd_masp], [cthd_mahd], [cthd_soluong], [cthd_giatien]) VALUES (2, 2, 1, 2, 300000)
INSERT [dbo].[chitiethoadon] ([cthd_id], [cthd_masp], [cthd_mahd], [cthd_soluong], [cthd_giatien]) VALUES (3, 6, 2, 5, 275)
INSERT [dbo].[chitiethoadon] ([cthd_id], [cthd_masp], [cthd_mahd], [cthd_soluong], [cthd_giatien]) VALUES (4, 6, 3, 5, 275)
INSERT [dbo].[chitiethoadon] ([cthd_id], [cthd_masp], [cthd_mahd], [cthd_soluong], [cthd_giatien]) VALUES (5, 8, 3, 5, 250)
INSERT [dbo].[chitiethoadon] ([cthd_id], [cthd_masp], [cthd_mahd], [cthd_soluong], [cthd_giatien]) VALUES (6, 1, 4, 5, 2000000)
INSERT [dbo].[chitiethoadon] ([cthd_id], [cthd_masp], [cthd_mahd], [cthd_soluong], [cthd_giatien]) VALUES (7, 1, 5, 5, 2000000)
INSERT [dbo].[chitiethoadon] ([cthd_id], [cthd_masp], [cthd_mahd], [cthd_soluong], [cthd_giatien]) VALUES (8, 7, 6, 1, 1550000)
INSERT [dbo].[chitiethoadon] ([cthd_id], [cthd_masp], [cthd_mahd], [cthd_soluong], [cthd_giatien]) VALUES (9, 12, 6, 1, 250000)
INSERT [dbo].[chitiethoadon] ([cthd_id], [cthd_masp], [cthd_mahd], [cthd_soluong], [cthd_giatien]) VALUES (10, 6, 7, 1, 55)
GO
INSERT [dbo].[chucvu] ([cv_id], [cv_ten]) VALUES (1, N'President')
INSERT [dbo].[chucvu] ([cv_id], [cv_ten]) VALUES (2, N'Manager')
INSERT [dbo].[chucvu] ([cv_id], [cv_ten]) VALUES (3, N'Staff')
GO
INSERT [dbo].[dondat] ([dd_id], [dd_makh], [dd_matt], [dd_thoigian], [dd_tongtien]) VALUES (0, N'01', 3, CAST(N'2022-10-05' AS Date), 150000)
INSERT [dbo].[dondat] ([dd_id], [dd_makh], [dd_matt], [dd_thoigian], [dd_tongtien]) VALUES (1, N'01', 3, CAST(N'2022-10-05' AS Date), 50000)
INSERT [dbo].[dondat] ([dd_id], [dd_makh], [dd_matt], [dd_thoigian], [dd_tongtien]) VALUES (4, N'01', 3, CAST(N'2022-10-09' AS Date), 55)
INSERT [dbo].[dondat] ([dd_id], [dd_makh], [dd_matt], [dd_thoigian], [dd_tongtien]) VALUES (5, N'01', 1, CAST(N'2022-10-09' AS Date), 1530275)
INSERT [dbo].[dondat] ([dd_id], [dd_makh], [dd_matt], [dd_thoigian], [dd_tongtien]) VALUES (6, N'01', 1, CAST(N'2022-10-09' AS Date), 335)
INSERT [dbo].[dondat] ([dd_id], [dd_makh], [dd_matt], [dd_thoigian], [dd_tongtien]) VALUES (7, N'01', 3, CAST(N'2022-10-09' AS Date), 525)
INSERT [dbo].[dondat] ([dd_id], [dd_makh], [dd_matt], [dd_thoigian], [dd_tongtien]) VALUES (8, N'01', 3, CAST(N'2022-10-10' AS Date), 275)
INSERT [dbo].[dondat] ([dd_id], [dd_makh], [dd_matt], [dd_thoigian], [dd_tongtien]) VALUES (9, N'01', 3, CAST(N'2022-10-11' AS Date), 2000000)
INSERT [dbo].[dondat] ([dd_id], [dd_makh], [dd_matt], [dd_thoigian], [dd_tongtien]) VALUES (10, N'01', 3, CAST(N'2022-10-11' AS Date), 2000000)
INSERT [dbo].[dondat] ([dd_id], [dd_makh], [dd_matt], [dd_thoigian], [dd_tongtien]) VALUES (11, N'01', 1, CAST(N'2022-10-22' AS Date), 150000)
INSERT [dbo].[dondat] ([dd_id], [dd_makh], [dd_matt], [dd_thoigian], [dd_tongtien]) VALUES (12, N'01', 1, CAST(N'2022-10-23' AS Date), 640000)
INSERT [dbo].[dondat] ([dd_id], [dd_makh], [dd_matt], [dd_thoigian], [dd_tongtien]) VALUES (13, N'55', 1, CAST(N'2022-11-08' AS Date), 400000)
INSERT [dbo].[dondat] ([dd_id], [dd_makh], [dd_matt], [dd_thoigian], [dd_tongtien]) VALUES (14, N'66', 1, CAST(N'2022-11-15' AS Date), 1550000)
INSERT [dbo].[dondat] ([dd_id], [dd_makh], [dd_matt], [dd_thoigian], [dd_tongtien]) VALUES (15, N'8', 1, CAST(N'2022-11-16' AS Date), 750000)
INSERT [dbo].[dondat] ([dd_id], [dd_makh], [dd_matt], [dd_thoigian], [dd_tongtien]) VALUES (16, N'5', 1, CAST(N'2022-11-16' AS Date), 545000)
INSERT [dbo].[dondat] ([dd_id], [dd_makh], [dd_matt], [dd_thoigian], [dd_tongtien]) VALUES (17, N'5', 1, CAST(N'2022-11-17' AS Date), 570000)
INSERT [dbo].[dondat] ([dd_id], [dd_makh], [dd_matt], [dd_thoigian], [dd_tongtien]) VALUES (18, N'5', 1, CAST(N'2022-11-18' AS Date), 1505000)
INSERT [dbo].[dondat] ([dd_id], [dd_makh], [dd_matt], [dd_thoigian], [dd_tongtien]) VALUES (19, N'5', 1, CAST(N'2022-11-18' AS Date), 32000)
INSERT [dbo].[dondat] ([dd_id], [dd_makh], [dd_matt], [dd_thoigian], [dd_tongtien]) VALUES (20, N'14', 3, CAST(N'2022-11-18' AS Date), 1800000)
INSERT [dbo].[dondat] ([dd_id], [dd_makh], [dd_matt], [dd_thoigian], [dd_tongtien]) VALUES (21, N'14', 1, CAST(N'2022-11-19' AS Date), 732000)
INSERT [dbo].[dondat] ([dd_id], [dd_makh], [dd_matt], [dd_thoigian], [dd_tongtien]) VALUES (22, N'01', 1, CAST(N'2022-11-19' AS Date), 96000)
INSERT [dbo].[dondat] ([dd_id], [dd_makh], [dd_matt], [dd_thoigian], [dd_tongtien]) VALUES (23, N'01', 1, CAST(N'2022-12-08' AS Date), 150000)
INSERT [dbo].[dondat] ([dd_id], [dd_makh], [dd_matt], [dd_thoigian], [dd_tongtien]) VALUES (24, N'01', 1, CAST(N'2022-12-14' AS Date), 450000)
GO
INSERT [dbo].[hoadon] ([hd_id], [hd_manv], [hd_makh], [hd_ngaylap], [hd_tongtien]) VALUES (0, N'11', N'01', CAST(N'2022-10-10' AS Date), 50000)
INSERT [dbo].[hoadon] ([hd_id], [hd_manv], [hd_makh], [hd_ngaylap], [hd_tongtien]) VALUES (1, N'11', N'01', CAST(N'2022-10-02' AS Date), 1050000)
INSERT [dbo].[hoadon] ([hd_id], [hd_manv], [hd_makh], [hd_ngaylap], [hd_tongtien]) VALUES (2, N'11', N'01', CAST(N'2022-10-10' AS Date), 275)
INSERT [dbo].[hoadon] ([hd_id], [hd_manv], [hd_makh], [hd_ngaylap], [hd_tongtien]) VALUES (3, N'11', N'01', CAST(N'2022-10-10' AS Date), 525)
INSERT [dbo].[hoadon] ([hd_id], [hd_manv], [hd_makh], [hd_ngaylap], [hd_tongtien]) VALUES (4, N'111', N'01', CAST(N'2022-10-11' AS Date), 2000000)
INSERT [dbo].[hoadon] ([hd_id], [hd_manv], [hd_makh], [hd_ngaylap], [hd_tongtien]) VALUES (5, N'111', N'01', CAST(N'2022-10-11' AS Date), 2000000)
INSERT [dbo].[hoadon] ([hd_id], [hd_manv], [hd_makh], [hd_ngaylap], [hd_tongtien]) VALUES (6, N'1', N'14', CAST(N'2022-11-19' AS Date), 1800000)
INSERT [dbo].[hoadon] ([hd_id], [hd_manv], [hd_makh], [hd_ngaylap], [hd_tongtien]) VALUES (7, N'1', N'01', CAST(N'2022-11-19' AS Date), 55)
GO
INSERT [dbo].[khachhang] ([kh_id], [kh_username], [kh_pwd], [kh_hoten], [kh_diachi], [kh_sdt], [kh_anh], [kh_loai]) VALUES (N'01', N'kh01', N'kh01', N'Hàng', N'Tân Ðông', N'123456789 ', N'maxresdefault.jpg', 1)
INSERT [dbo].[khachhang] ([kh_id], [kh_username], [kh_pwd], [kh_hoten], [kh_diachi], [kh_sdt], [kh_anh], [kh_loai]) VALUES (N'10', N'kh10', N'kh10', N'Lê Giang', N'Kiên Giang', N'123456789 ', N'avata-3.jpg', 2)
INSERT [dbo].[khachhang] ([kh_id], [kh_username], [kh_pwd], [kh_hoten], [kh_diachi], [kh_sdt], [kh_anh], [kh_loai]) VALUES (N'11', N'kh11', N'kh11', N'Van Lâm', N'Ben Tre', N'1234567898', N'bang-phien-am-tieng-anh-day-du-cach-phat-am-chuan-quoc-te-1.jpg', 3)
INSERT [dbo].[khachhang] ([kh_id], [kh_username], [kh_pwd], [kh_hoten], [kh_diachi], [kh_sdt], [kh_anh], [kh_loai]) VALUES (N'12', N'kh12', N'kh12', N'Tuan Thuyen', N'Can Tho', N'123456789 ', N'1665129082-1.jpg', 3)
INSERT [dbo].[khachhang] ([kh_id], [kh_username], [kh_pwd], [kh_hoten], [kh_diachi], [kh_sdt], [kh_anh], [kh_loai]) VALUES (N'13', N'kh13', N'kh13', N'Thi Tâm', N'Cà Mau', N'123456789 ', N'hinh-anh-chill-tuyet-dep.jpg', 3)
INSERT [dbo].[khachhang] ([kh_id], [kh_username], [kh_pwd], [kh_hoten], [kh_diachi], [kh_sdt], [kh_anh], [kh_loai]) VALUES (N'14', N'kh14', N'kh14', N'Tu Khangg', N'Thái Nguyênnn', N'1234567899', N'1-hinh-anh-dep-thac-Haifoss-Reddit-1024x1280.jpg', 3)
INSERT [dbo].[khachhang] ([kh_id], [kh_username], [kh_pwd], [kh_hoten], [kh_diachi], [kh_sdt], [kh_anh], [kh_loai]) VALUES (N'5', N'kh05', N'kh05', N'Tan', N'Can Tho', N'123456789 ', N'Overwatch-2-Best-Strategies-to-Counter-Hanzo-aPclT2W-2-1200x900.jpg', 1)
INSERT [dbo].[khachhang] ([kh_id], [kh_username], [kh_pwd], [kh_hoten], [kh_diachi], [kh_sdt], [kh_anh], [kh_loai]) VALUES (N'55', N'kh02', N'kh02', N'Hu Tiu', N'Tân Ðông', N'12345678  ', N'foody-upload-api-foody-mobile-yyy-190909091552.jpg', 1)
INSERT [dbo].[khachhang] ([kh_id], [kh_username], [kh_pwd], [kh_hoten], [kh_diachi], [kh_sdt], [kh_anh], [kh_loai]) VALUES (N'6', N'kh03', N'kh03', N'Lôc', N'CanTho', N'123456789 ', N'ViDu_CDM.png', 1)
INSERT [dbo].[khachhang] ([kh_id], [kh_username], [kh_pwd], [kh_hoten], [kh_diachi], [kh_sdt], [kh_anh], [kh_loai]) VALUES (N'66', N'kh06', N'kh06', N'Hoàng Luong', N'Sóc Trang', N'123456789 ', N'bat-ngo-truoc-nhung-khoanh-khac-anh-ngau-nhien.png', 3)
INSERT [dbo].[khachhang] ([kh_id], [kh_username], [kh_pwd], [kh_hoten], [kh_diachi], [kh_sdt], [kh_anh], [kh_loai]) VALUES (N'7', N'kh04', N'kh04', N'Tân', N'CanTho', N'12345678  ', N'Capture1.PNG', 1)
INSERT [dbo].[khachhang] ([kh_id], [kh_username], [kh_pwd], [kh_hoten], [kh_diachi], [kh_sdt], [kh_anh], [kh_loai]) VALUES (N'77', N'kh07', N'kh07', N'Duy Khang', N'An Giang', N'987654321 ', N'khoanh-khac-anh-ngau-nhien-1-25315-1427271342486.jpg', 3)
INSERT [dbo].[khachhang] ([kh_id], [kh_username], [kh_pwd], [kh_hoten], [kh_diachi], [kh_sdt], [kh_anh], [kh_loai]) VALUES (N'8', N'kh08', N'kh08', N'Ðình Tân', N'TP HCM', N'234567890 ', N'3-palm-trees-spencer-carlos-baez.jpg', 3)
INSERT [dbo].[khachhang] ([kh_id], [kh_username], [kh_pwd], [kh_hoten], [kh_diachi], [kh_sdt], [kh_anh], [kh_loai]) VALUES (N'9', N'kh09', N'kh09', N'Hoàng Ngân', N'Dong Thap', N'1234567890', N'Anh-chup-khoanh-khac-tinh-co-3.jpg', 2)
GO
INSERT [dbo].[loaikhachhang] ([lkh_id], [lkh_tenloai]) VALUES (1, N'Khách Hàng VIP')
INSERT [dbo].[loaikhachhang] ([lkh_id], [lkh_tenloai]) VALUES (2, N'Khách Hàng Thân Thiê''t')
INSERT [dbo].[loaikhachhang] ([lkh_id], [lkh_tenloai]) VALUES (3, N'Khách Hàng Thuo`ng')
GO
INSERT [dbo].[loaisanpham] ([lsp_id], [lsp_tenloai], [lsp_anhloai]) VALUES (1, N'Áo Hoodie', N'aohoodie')
INSERT [dbo].[loaisanpham] ([lsp_id], [lsp_tenloai], [lsp_anhloai]) VALUES (2, N'Áo Thun', N'aothun')
INSERT [dbo].[loaisanpham] ([lsp_id], [lsp_tenloai], [lsp_anhloai]) VALUES (3, N'Giày', N'giay')
INSERT [dbo].[loaisanpham] ([lsp_id], [lsp_tenloai], [lsp_anhloai]) VALUES (4, N'Áo Khoác', N'aokhoac')
INSERT [dbo].[loaisanpham] ([lsp_id], [lsp_tenloai], [lsp_anhloai]) VALUES (5, N'Croptop', N'croptop')
INSERT [dbo].[loaisanpham] ([lsp_id], [lsp_tenloai], [lsp_anhloai]) VALUES (6, N'Dép', N'dep')
INSERT [dbo].[loaisanpham] ([lsp_id], [lsp_tenloai], [lsp_anhloai]) VALUES (7, N'Chân váy', N'chanvay')
INSERT [dbo].[loaisanpham] ([lsp_id], [lsp_tenloai], [lsp_anhloai]) VALUES (8, N'Balo', N'balo')
INSERT [dbo].[loaisanpham] ([lsp_id], [lsp_tenloai], [lsp_anhloai]) VALUES (9, N'Túi xách', N'tuixach')
INSERT [dbo].[loaisanpham] ([lsp_id], [lsp_tenloai], [lsp_anhloai]) VALUES (10, N'Quâ`n', N'quan')
GO
INSERT [dbo].[nhanvien] ([nv_id], [nv_username], [nv_pwd], [nv_hoten], [nv_diachi], [nv_sdt], [nv_anh], [nv_chucvu]) VALUES (N'1', N'ct270', N'ct270', N'Nguyen Tan', N'Can Tho', N'123456789 ', N'Overwatch-2-Best-Strategies-to-Counter-Hanzo-aPclT2W-2-1200x900.jpg', 1)
INSERT [dbo].[nhanvien] ([nv_id], [nv_username], [nv_pwd], [nv_hoten], [nv_diachi], [nv_sdt], [nv_anh], [nv_chucvu]) VALUES (N'11', N'5thao', N'12345', N'Thao', N'Ðông Bình', N'1234567890', N'Px7UmakHQ0jHxLsHE8desXtc4DSZopPzt4ak6g3T.jpg', 1)
INSERT [dbo].[nhanvien] ([nv_id], [nv_username], [nv_pwd], [nv_hoten], [nv_diachi], [nv_sdt], [nv_anh], [nv_chucvu]) VALUES (N'111', N'5tan', N'12345', N'Tan', N'1234567', N'123456    ', N'nhan-vien-van-phong-hay-bi-phu-lanh-tay-chan.jpg', 2)
INSERT [dbo].[nhanvien] ([nv_id], [nv_username], [nv_pwd], [nv_hoten], [nv_diachi], [nv_sdt], [nv_anh], [nv_chucvu]) VALUES (N'666666', N'6loc', N'6loc', N'Loc', N'Tân Ðông', N'123456789 ', N'1585645705.png', 3)
GO
INSERT [dbo].[nhasanxuat] ([nsx_id], [nsx_tennsx], [nsx_diachi]) VALUES (1, N'TL', N'AnGiang')
INSERT [dbo].[nhasanxuat] ([nsx_id], [nsx_tennsx], [nsx_diachi]) VALUES (2, N'5Tan', N'CanTho')
INSERT [dbo].[nhasanxuat] ([nsx_id], [nsx_tennsx], [nsx_diachi]) VALUES (3, N'6Loc', N'CanTho')
INSERT [dbo].[nhasanxuat] ([nsx_id], [nsx_tennsx], [nsx_diachi]) VALUES (4, N'Kha Hy', N'HauGiang')
GO
INSERT [dbo].[sanpham] ([sp_id], [sp_loai], [sp_nsx], [sp_ten], [sp_gia], [sp_soluong], [sp_mota], [sp_anh]) VALUES (1, 1, 1, N'Hoodie Nam tan', 405000, 245, N'Thoáng mát, cá tính.', N'hoodie nam.png')
INSERT [dbo].[sanpham] ([sp_id], [sp_loai], [sp_nsx], [sp_ten], [sp_gia], [sp_soluong], [sp_mota], [sp_anh]) VALUES (2, 2, 1, N'Polo Nam Ellyy', 150000, 200, N'L?ch s?, trang tr?ng', N'polo nam Elly.jpg')
INSERT [dbo].[sanpham] ([sp_id], [sp_loai], [sp_nsx], [sp_ten], [sp_gia], [sp_soluong], [sp_mota], [sp_anh]) VALUES (3, 3, 2, N'Vans Shoes nam', 450000, 100, N'Thanh l?ch, nam tính', N'top-5-giay-sneaker-nam-duoc-ua-chuong-hien-nay-2.jpg')
INSERT [dbo].[sanpham] ([sp_id], [sp_loai], [sp_nsx], [sp_ten], [sp_gia], [sp_soluong], [sp_mota], [sp_anh]) VALUES (4, 4, 3, N'Khác Jean Trang', 32000, 100, N'Phù h?p túi ti?n c?a b?n', N'Khác jean Nam.jpg')
INSERT [dbo].[sanpham] ([sp_id], [sp_loai], [sp_nsx], [sp_ten], [sp_gia], [sp_soluong], [sp_mota], [sp_anh]) VALUES (5, 2, 4, N'Áo thun 12', 100000, 11, N'hehe', N'125.jpg')
INSERT [dbo].[sanpham] ([sp_id], [sp_loai], [sp_nsx], [sp_ten], [sp_gia], [sp_soluong], [sp_mota], [sp_anh]) VALUES (6, 10, 4, N'Thun dài', 250000, 44, N'55', N'XYN8On_simg_de2fe0_500x500_maxb.jpg')
INSERT [dbo].[sanpham] ([sp_id], [sp_loai], [sp_nsx], [sp_ten], [sp_gia], [sp_soluong], [sp_mota], [sp_anh]) VALUES (7, 4, 3, N'Khoác lông nhun', 1550000, 21, N'Bao dep a  !!!', N'ao-khoac-long-cuu-cho-cac-nang-mua-dong-vua-am-vua-xinh-61837d.jpg')
INSERT [dbo].[sanpham] ([sp_id], [sp_loai], [sp_nsx], [sp_ten], [sp_gia], [sp_soluong], [sp_mota], [sp_anh]) VALUES (8, 1, 2, N'Ác khoác có nón', 340000, 45, N'50', N'7fc9d85bb813bf1873f6136a65011ed3.jfif')
INSERT [dbo].[sanpham] ([sp_id], [sp_loai], [sp_nsx], [sp_ten], [sp_gia], [sp_soluong], [sp_mota], [sp_anh]) VALUES (9, 2, 1, N'Áo thun nam 100% Cotton', 500, 50, N'Thanh l?ch, nam tính', N'2f310645e76c73573892c75a7eda5ba6.jpg')
INSERT [dbo].[sanpham] ([sp_id], [sp_loai], [sp_nsx], [sp_ten], [sp_gia], [sp_soluong], [sp_mota], [sp_anh]) VALUES (10, 2, 3, N'Áo sát nách gym nam', 200000, 100, N'Nam tính', N'd728dd6a6d8e194ba561c0b2f62ad493.jpg')
INSERT [dbo].[sanpham] ([sp_id], [sp_loai], [sp_nsx], [sp_ten], [sp_gia], [sp_soluong], [sp_mota], [sp_anh]) VALUES (11, 10, 3, N'Pants Unisex', 200000, 100, N'Cá tính', N'quan-ong-rong-nam-nu-mau-trang-yinxx-8.jpeg')
INSERT [dbo].[sanpham] ([sp_id], [sp_loai], [sp_nsx], [sp_ten], [sp_gia], [sp_soluong], [sp_mota], [sp_anh]) VALUES (12, 3, 4, N'Sneaker Canvas', 250000, 14, N'Bao d?p a  !', N'22d144e3bd94f1e5498703d28c63e4bb.png')
INSERT [dbo].[sanpham] ([sp_id], [sp_loai], [sp_nsx], [sp_ten], [sp_gia], [sp_soluong], [sp_mota], [sp_anh]) VALUES (13, 6, 3, N'Dép Bánh Mì Ðen', 90000, 90, N'Cuteeeeeeee', N'3be896dd1ddf0653ae986f78d000ceaf.jpg')
INSERT [dbo].[sanpham] ([sp_id], [sp_loai], [sp_nsx], [sp_ten], [sp_gia], [sp_soluong], [sp_mota], [sp_anh]) VALUES (14, 6, 2, N'Dép Bánh Mì Thao', 79000, 79, N'Cuteeeeeeee', N'c8417e205eadc7ca8385a5aef400a2d1adba1279.jpeg')
INSERT [dbo].[sanpham] ([sp_id], [sp_loai], [sp_nsx], [sp_ten], [sp_gia], [sp_soluong], [sp_mota], [sp_anh]) VALUES (15, 8, 2, N'Balo Ðai Ðen Unisex', 25000, 60, N'R?ng thênh thang', N'O1CN01z9FJCp1gJSw1tG3IV_2915864121-0-cib.jpeg')
INSERT [dbo].[sanpham] ([sp_id], [sp_loai], [sp_nsx], [sp_ten], [sp_gia], [sp_soluong], [sp_mota], [sp_anh]) VALUES (16, 8, 2, N'Balo Ðai Ðen Nam Fortune Mouse', 200000, 100, N'H?p th?ng thình', N'e8b3bf2e1a6c24baf4eed57b9bb6b1a0.jpg')
INSERT [dbo].[sanpham] ([sp_id], [sp_loai], [sp_nsx], [sp_ten], [sp_gia], [sp_soluong], [sp_mota], [sp_anh]) VALUES (17, 4, 2, N'Khoác len Cardigan', 246000, 246, N'?m d? l?m', N'24e466c37ac2e991d96f7587eacd035e.jpg')
INSERT [dbo].[sanpham] ([sp_id], [sp_loai], [sp_nsx], [sp_ten], [sp_gia], [sp_soluong], [sp_mota], [sp_anh]) VALUES (18, 7, 2, N'Chân váy tenis xê''p ly', 15000, 150, N'Xinh', N'6983edacaf284e9e61262a387d4acb86.jfif')
INSERT [dbo].[sanpham] ([sp_id], [sp_loai], [sp_nsx], [sp_ten], [sp_gia], [sp_soluong], [sp_mota], [sp_anh]) VALUES (19, 5, 2, N'Croptop Thao', 90000, 90, N'Tôn dáng', N'Ao-croptop.jpg')
INSERT [dbo].[sanpham] ([sp_id], [sp_loai], [sp_nsx], [sp_ten], [sp_gia], [sp_soluong], [sp_mota], [sp_anh]) VALUES (20, 9, 2, N'Túi xách den', 190000, 90, N'Ðon gi?n', N'Tui-xach-nu-Miorr-MT050-80-02.jfif')
INSERT [dbo].[sanpham] ([sp_id], [sp_loai], [sp_nsx], [sp_ten], [sp_gia], [sp_soluong], [sp_mota], [sp_anh]) VALUES (21, 5, 2, N'Quan ong rong', 170000, 100, N'Sang tr?ng', N'580cd3c03a6cc6f411abfd8c2b2a80c7.jfif')
INSERT [dbo].[sanpham] ([sp_id], [sp_loai], [sp_nsx], [sp_ten], [sp_gia], [sp_soluong], [sp_mota], [sp_anh]) VALUES (22, 2, 2, N'Ao thun polo unisex', 95000, 10, N'R?ng th?ng thình', N'edfc959bda7457a58f3f0284b6302585.jpg')
INSERT [dbo].[sanpham] ([sp_id], [sp_loai], [sp_nsx], [sp_ten], [sp_gia], [sp_soluong], [sp_mota], [sp_anh]) VALUES (23, 3, 2, N'Giay cao got', 260000, 70, N'Cao', N'8RPswp_simg_de2fe0_500x500_maxb.jpg')
INSERT [dbo].[sanpham] ([sp_id], [sp_loai], [sp_nsx], [sp_ten], [sp_gia], [sp_soluong], [sp_mota], [sp_anh]) VALUES (24, 4, 2, N'Ao somi kaki nu', 230000, 89, N'Cá tính', N'Capturethao.PNG')
GO
INSERT [dbo].[trangthaidondat] ([ttdd_id], [ttdd_ten]) VALUES (1, N'Chờ xác nhận')
INSERT [dbo].[trangthaidondat] ([ttdd_id], [ttdd_ten]) VALUES (2, N'Đang vận chuyển')
INSERT [dbo].[trangthaidondat] ([ttdd_id], [ttdd_ten]) VALUES (3, N'Giao thành công')
INSERT [dbo].[trangthaidondat] ([ttdd_id], [ttdd_ten]) VALUES (4, N'Đã hủy')
GO
ALTER TABLE [dbo].[chitietdondat]  WITH CHECK ADD FOREIGN KEY([ctdd_madd])
REFERENCES [dbo].[dondat] ([dd_id])
GO
ALTER TABLE [dbo].[chitietdondat]  WITH CHECK ADD FOREIGN KEY([ctdd_masp])
REFERENCES [dbo].[sanpham] ([sp_id])
GO
ALTER TABLE [dbo].[chitiethoadon]  WITH CHECK ADD FOREIGN KEY([cthd_masp])
REFERENCES [dbo].[sanpham] ([sp_id])
GO
ALTER TABLE [dbo].[chitiethoadon]  WITH CHECK ADD FOREIGN KEY([cthd_mahd])
REFERENCES [dbo].[hoadon] ([hd_id])
GO
ALTER TABLE [dbo].[dondat]  WITH CHECK ADD FOREIGN KEY([dd_makh])
REFERENCES [dbo].[khachhang] ([kh_id])
GO
ALTER TABLE [dbo].[dondat]  WITH CHECK ADD FOREIGN KEY([dd_matt])
REFERENCES [dbo].[trangthaidondat] ([ttdd_id])
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD FOREIGN KEY([hd_makh])
REFERENCES [dbo].[khachhang] ([kh_id])
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD FOREIGN KEY([hd_manv])
REFERENCES [dbo].[nhanvien] ([nv_id])
GO
ALTER TABLE [dbo].[khachhang]  WITH CHECK ADD FOREIGN KEY([kh_loai])
REFERENCES [dbo].[loaikhachhang] ([lkh_id])
GO
ALTER TABLE [dbo].[nhanvien]  WITH NOCHECK ADD FOREIGN KEY([nv_chucvu])
REFERENCES [dbo].[chucvu] ([cv_id])
GO
ALTER TABLE [dbo].[sanpham]  WITH CHECK ADD FOREIGN KEY([sp_loai])
REFERENCES [dbo].[loaisanpham] ([lsp_id])
GO
ALTER TABLE [dbo].[sanpham]  WITH CHECK ADD FOREIGN KEY([sp_nsx])
REFERENCES [dbo].[nhasanxuat] ([nsx_id])
GO
USE [master]
GO
ALTER DATABASE [B1910293] SET  READ_WRITE 
GO
