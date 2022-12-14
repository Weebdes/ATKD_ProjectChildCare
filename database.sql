USE [master]
GO
/****** Object:  Database [MyOrder]    Script Date: 9/6/2022 12:24:38 AM ******/
CREATE DATABASE [MyOrder]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyOrder', FILENAME = N'D:\Programming\New folder\MSSQL15.MSSQLSERVER\MSSQL\DATA\MyOrder.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyOrder_log', FILENAME = N'D:\Programming\New folder\MSSQL15.MSSQLSERVER\MSSQL\DATA\MyOrder_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MyOrder] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyOrder].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyOrder] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyOrder] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyOrder] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyOrder] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyOrder] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyOrder] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyOrder] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyOrder] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyOrder] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyOrder] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyOrder] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyOrder] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyOrder] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyOrder] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyOrder] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyOrder] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyOrder] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyOrder] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyOrder] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyOrder] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyOrder] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyOrder] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyOrder] SET RECOVERY FULL 
GO
ALTER DATABASE [MyOrder] SET  MULTI_USER 
GO
ALTER DATABASE [MyOrder] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyOrder] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyOrder] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyOrder] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyOrder] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyOrder] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MyOrder', N'ON'
GO
ALTER DATABASE [MyOrder] SET QUERY_STORE = OFF
GO
USE [MyOrder]
GO
/****** Object:  Table [dbo].[tblChiTietHD]    Script Date: 9/6/2022 12:24:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChiTietHD](
	[MaChiTietHD] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[MaHD] [numeric](18, 0) NOT NULL,
	[MaHang] [varchar](10) NOT NULL,
	[Soluong] [int] NOT NULL,
 CONSTRAINT [PK_tblChiTietHD] PRIMARY KEY CLUSTERED 
(
	[MaChiTietHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHoadon]    Script Date: 9/6/2022 12:24:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHoadon](
	[MaHD] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[MaKH] [varchar](10) NOT NULL,
	[NgayHD] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_tblHoadon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblKhachHang]    Script Date: 9/6/2022 12:24:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKhachHang](
	[MaKH] [varchar](10) NOT NULL,
	[TenKH] [nvarchar](50) NOT NULL,
	[GT] [bit] NOT NULL,
	[Diachi] [nvarchar](50) NOT NULL,
	[NgaySinh] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_tblKhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMatHang]    Script Date: 9/6/2022 12:24:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMatHang](
	[MaHang] [varchar](10) NOT NULL,
	[TenHang] [nvarchar](50) NOT NULL,
	[DVT] [nvarchar](50) NOT NULL,
	[Gia] [real] NOT NULL,
 CONSTRAINT [PK_tblMatHang] PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSdt]    Script Date: 9/6/2022 12:24:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSdt](
	[Sdt] [nvarchar](10) NOT NULL,
	[MaKH] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tblSdt] PRIMARY KEY CLUSTERED 
(
	[Sdt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 9/6/2022 12:24:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[Username] [varchar](50) NOT NULL,
	[Pass] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblChiTietHD] ON 

INSERT [dbo].[tblChiTietHD] ([MaChiTietHD], [MaHD], [MaHang], [Soluong]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), N'O02', 1)
INSERT [dbo].[tblChiTietHD] ([MaChiTietHD], [MaHD], [MaHang], [Soluong]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), N'C01', 10)
INSERT [dbo].[tblChiTietHD] ([MaChiTietHD], [MaHD], [MaHang], [Soluong]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), N'M02', 1)
INSERT [dbo].[tblChiTietHD] ([MaChiTietHD], [MaHD], [MaHang], [Soluong]) VALUES (CAST(15 AS Numeric(18, 0)), CAST(8 AS Numeric(18, 0)), N'C01', 1)
INSERT [dbo].[tblChiTietHD] ([MaChiTietHD], [MaHD], [MaHang], [Soluong]) VALUES (CAST(16 AS Numeric(18, 0)), CAST(9 AS Numeric(18, 0)), N'C01', 2)
INSERT [dbo].[tblChiTietHD] ([MaChiTietHD], [MaHD], [MaHang], [Soluong]) VALUES (CAST(22 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'B03', 10)
INSERT [dbo].[tblChiTietHD] ([MaChiTietHD], [MaHD], [MaHang], [Soluong]) VALUES (CAST(23 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), N'B03', 5)
INSERT [dbo].[tblChiTietHD] ([MaChiTietHD], [MaHD], [MaHang], [Soluong]) VALUES (CAST(24 AS Numeric(18, 0)), CAST(11 AS Numeric(18, 0)), N'B03', 1)
INSERT [dbo].[tblChiTietHD] ([MaChiTietHD], [MaHD], [MaHang], [Soluong]) VALUES (CAST(25 AS Numeric(18, 0)), CAST(13 AS Numeric(18, 0)), N'B03', 1)
INSERT [dbo].[tblChiTietHD] ([MaChiTietHD], [MaHD], [MaHang], [Soluong]) VALUES (CAST(26 AS Numeric(18, 0)), CAST(14 AS Numeric(18, 0)), N'B03', 1)
INSERT [dbo].[tblChiTietHD] ([MaChiTietHD], [MaHD], [MaHang], [Soluong]) VALUES (CAST(27 AS Numeric(18, 0)), CAST(18 AS Numeric(18, 0)), N'B03', 1)
INSERT [dbo].[tblChiTietHD] ([MaChiTietHD], [MaHD], [MaHang], [Soluong]) VALUES (CAST(28 AS Numeric(18, 0)), CAST(19 AS Numeric(18, 0)), N'B03', 1)
INSERT [dbo].[tblChiTietHD] ([MaChiTietHD], [MaHD], [MaHang], [Soluong]) VALUES (CAST(36 AS Numeric(18, 0)), CAST(20 AS Numeric(18, 0)), N'B02', 1)
SET IDENTITY_INSERT [dbo].[tblChiTietHD] OFF
GO
SET IDENTITY_INSERT [dbo].[tblHoadon] ON 

INSERT [dbo].[tblHoadon] ([MaHD], [MaKH], [NgayHD]) VALUES (CAST(2 AS Numeric(18, 0)), N'A03', CAST(N'2021-03-07T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblHoadon] ([MaHD], [MaKH], [NgayHD]) VALUES (CAST(3 AS Numeric(18, 0)), N'A04', CAST(N'2022-02-21T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblHoadon] ([MaHD], [MaKH], [NgayHD]) VALUES (CAST(5 AS Numeric(18, 0)), N'C01', CAST(N'2022-05-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblHoadon] ([MaHD], [MaKH], [NgayHD]) VALUES (CAST(6 AS Numeric(18, 0)), N'A01', CAST(N'2022-06-12T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblHoadon] ([MaHD], [MaKH], [NgayHD]) VALUES (CAST(7 AS Numeric(18, 0)), N'B04', CAST(N'2022-07-23T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblHoadon] ([MaHD], [MaKH], [NgayHD]) VALUES (CAST(8 AS Numeric(18, 0)), N'A01', CAST(N'2022-08-25T03:32:00' AS SmallDateTime))
INSERT [dbo].[tblHoadon] ([MaHD], [MaKH], [NgayHD]) VALUES (CAST(9 AS Numeric(18, 0)), N'A01', CAST(N'2022-08-25T03:36:00' AS SmallDateTime))
INSERT [dbo].[tblHoadon] ([MaHD], [MaKH], [NgayHD]) VALUES (CAST(10 AS Numeric(18, 0)), N'A01', CAST(N'2022-08-25T03:39:00' AS SmallDateTime))
INSERT [dbo].[tblHoadon] ([MaHD], [MaKH], [NgayHD]) VALUES (CAST(11 AS Numeric(18, 0)), N'A02', CAST(N'2022-08-25T03:46:00' AS SmallDateTime))
INSERT [dbo].[tblHoadon] ([MaHD], [MaKH], [NgayHD]) VALUES (CAST(13 AS Numeric(18, 0)), N'A01', CAST(N'2022-08-25T03:58:00' AS SmallDateTime))
INSERT [dbo].[tblHoadon] ([MaHD], [MaKH], [NgayHD]) VALUES (CAST(14 AS Numeric(18, 0)), N'A01', CAST(N'2022-08-25T03:58:00' AS SmallDateTime))
INSERT [dbo].[tblHoadon] ([MaHD], [MaKH], [NgayHD]) VALUES (CAST(16 AS Numeric(18, 0)), N'A01', CAST(N'2022-08-25T03:59:00' AS SmallDateTime))
INSERT [dbo].[tblHoadon] ([MaHD], [MaKH], [NgayHD]) VALUES (CAST(17 AS Numeric(18, 0)), N'A01', CAST(N'2022-08-25T03:59:00' AS SmallDateTime))
INSERT [dbo].[tblHoadon] ([MaHD], [MaKH], [NgayHD]) VALUES (CAST(18 AS Numeric(18, 0)), N'A01', CAST(N'2022-08-25T15:15:00' AS SmallDateTime))
INSERT [dbo].[tblHoadon] ([MaHD], [MaKH], [NgayHD]) VALUES (CAST(19 AS Numeric(18, 0)), N'A01', CAST(N'2022-08-25T15:15:00' AS SmallDateTime))
INSERT [dbo].[tblHoadon] ([MaHD], [MaKH], [NgayHD]) VALUES (CAST(20 AS Numeric(18, 0)), N'B01', CAST(N'2022-08-25T16:53:00' AS SmallDateTime))
INSERT [dbo].[tblHoadon] ([MaHD], [MaKH], [NgayHD]) VALUES (CAST(21 AS Numeric(18, 0)), N'B02', CAST(N'2022-08-27T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[tblHoadon] OFF
GO
INSERT [dbo].[tblKhachHang] ([MaKH], [TenKH], [GT], [Diachi], [NgaySinh]) VALUES (N'A01', N'Nguyen Van A', 1, N'Hà Nội', CAST(N'2001-02-20T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblKhachHang] ([MaKH], [TenKH], [GT], [Diachi], [NgaySinh]) VALUES (N'A02', N'Nguyen Van B', 1, N'HCM', CAST(N'2001-01-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblKhachHang] ([MaKH], [TenKH], [GT], [Diachi], [NgaySinh]) VALUES (N'A03', N'Nguyen Van C', 1, N'Da Nang', CAST(N'1999-03-20T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblKhachHang] ([MaKH], [TenKH], [GT], [Diachi], [NgaySinh]) VALUES (N'A04', N'Nguyen Van D', 0, N'Da Nang', CAST(N'2000-06-30T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblKhachHang] ([MaKH], [TenKH], [GT], [Diachi], [NgaySinh]) VALUES (N'B01', N'Nguyễn Văn An', 1, N'HCM', CAST(N'2002-11-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblKhachHang] ([MaKH], [TenKH], [GT], [Diachi], [NgaySinh]) VALUES (N'B02', N'Nguyễn Thị Hoa', 0, N'Đà Nẵng', CAST(N'1999-07-07T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblKhachHang] ([MaKH], [TenKH], [GT], [Diachi], [NgaySinh]) VALUES (N'B03', N'Nguyễn Bảo Nam', 1, N'Hà Nội', CAST(N'2000-03-03T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblKhachHang] ([MaKH], [TenKH], [GT], [Diachi], [NgaySinh]) VALUES (N'B04', N'Lê Thị Huyền', 0, N'Huế', CAST(N'1999-04-16T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblKhachHang] ([MaKH], [TenKH], [GT], [Diachi], [NgaySinh]) VALUES (N'B05', N'Nguyễn Thu Phương', 0, N'HCM', CAST(N'1999-05-20T00:00:00' AS SmallDateTime))
INSERT [dbo].[tblKhachHang] ([MaKH], [TenKH], [GT], [Diachi], [NgaySinh]) VALUES (N'C01', N'Lê Quốc Đạt', 1, N'Hà Nội', CAST(N'2002-10-22T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[tblMatHang] ([MaHang], [TenHang], [DVT], [Gia]) VALUES (N'B01', N'Bàn phím thường', N'Chiếc', 100000)
INSERT [dbo].[tblMatHang] ([MaHang], [TenHang], [DVT], [Gia]) VALUES (N'B02', N'Bàn phím cơ', N'Chiếc', 400000)
INSERT [dbo].[tblMatHang] ([MaHang], [TenHang], [DVT], [Gia]) VALUES (N'B03', N'Bàn phím không dây', N'Chiếc', 900000)
INSERT [dbo].[tblMatHang] ([MaHang], [TenHang], [DVT], [Gia]) VALUES (N'C01', N'Chuột thường', N'Con', 80000)
INSERT [dbo].[tblMatHang] ([MaHang], [TenHang], [DVT], [Gia]) VALUES (N'C02', N'Chuột không dây', N'Con', 600000)
INSERT [dbo].[tblMatHang] ([MaHang], [TenHang], [DVT], [Gia]) VALUES (N'L01', N'Laptop Acer', N'Cai', 9900000)
INSERT [dbo].[tblMatHang] ([MaHang], [TenHang], [DVT], [Gia]) VALUES (N'L02', N'Laptop Lenovo', N'Cai', 8000000)
INSERT [dbo].[tblMatHang] ([MaHang], [TenHang], [DVT], [Gia]) VALUES (N'L03', N'Laptop HP', N'Cai', 7500000)
INSERT [dbo].[tblMatHang] ([MaHang], [TenHang], [DVT], [Gia]) VALUES (N'L04', N'MacBook', N'Cai', 2.1E+07)
INSERT [dbo].[tblMatHang] ([MaHang], [TenHang], [DVT], [Gia]) VALUES (N'M01', N'Màn hình 24inch', N'Cái', 1900000)
INSERT [dbo].[tblMatHang] ([MaHang], [TenHang], [DVT], [Gia]) VALUES (N'M02', N'Màn hình 20inch', N'Cái', 1200000)
INSERT [dbo].[tblMatHang] ([MaHang], [TenHang], [DVT], [Gia]) VALUES (N'O01', N'Ổ cứng SSD 250GB', N'Thanh', 750000)
INSERT [dbo].[tblMatHang] ([MaHang], [TenHang], [DVT], [Gia]) VALUES (N'O02', N'Ổ cứng SSD 500GB', N'Thanh', 1290000)
INSERT [dbo].[tblMatHang] ([MaHang], [TenHang], [DVT], [Gia]) VALUES (N'O03', N'Ổ cứng SSD 1TB', N'Thanh', 2090000)
INSERT [dbo].[tblMatHang] ([MaHang], [TenHang], [DVT], [Gia]) VALUES (N'R01', N'Ram Kingston 4GB', N'Thanh', 300000)
INSERT [dbo].[tblMatHang] ([MaHang], [TenHang], [DVT], [Gia]) VALUES (N'R02', N'Ram Kingston 8GB', N'Thanh', 800000)
INSERT [dbo].[tblMatHang] ([MaHang], [TenHang], [DVT], [Gia]) VALUES (N'R03', N'Ram Kingston 16GB', N'Thanh', 2000000)
GO
INSERT [dbo].[tblSdt] ([Sdt], [MaKH]) VALUES (N'0123456789', N'A01')
INSERT [dbo].[tblSdt] ([Sdt], [MaKH]) VALUES (N'0234567891', N'A02')
INSERT [dbo].[tblSdt] ([Sdt], [MaKH]) VALUES (N'0871827391', N'B01')
INSERT [dbo].[tblSdt] ([Sdt], [MaKH]) VALUES (N'0876868768', N'B05')
INSERT [dbo].[tblSdt] ([Sdt], [MaKH]) VALUES (N'0897873791', N'B03')
INSERT [dbo].[tblSdt] ([Sdt], [MaKH]) VALUES (N'0917637861', N'B04')
INSERT [dbo].[tblSdt] ([Sdt], [MaKH]) VALUES (N'0917987399', N'B02')
INSERT [dbo].[tblSdt] ([Sdt], [MaKH]) VALUES (N'0979791233', N'A04')
INSERT [dbo].[tblSdt] ([Sdt], [MaKH]) VALUES (N'0987192739', N'A03')
INSERT [dbo].[tblSdt] ([Sdt], [MaKH]) VALUES (N'0998797123', N'C01')
GO
INSERT [dbo].[tblUser] ([Username], [Pass]) VALUES (N'admin', 12345)
INSERT [dbo].[tblUser] ([Username], [Pass]) VALUES (N'user', 12345)
GO
ALTER TABLE [dbo].[tblChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_tblChiTietHD_tblHoadon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[tblHoadon] ([MaHD])
GO
ALTER TABLE [dbo].[tblChiTietHD] CHECK CONSTRAINT [FK_tblChiTietHD_tblHoadon]
GO
ALTER TABLE [dbo].[tblChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_tblChiTietHD_tblMatHang] FOREIGN KEY([MaHang])
REFERENCES [dbo].[tblMatHang] ([MaHang])
GO
ALTER TABLE [dbo].[tblChiTietHD] CHECK CONSTRAINT [FK_tblChiTietHD_tblMatHang]
GO
ALTER TABLE [dbo].[tblHoadon]  WITH CHECK ADD  CONSTRAINT [FK_tblHoadon_tblKhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[tblKhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[tblHoadon] CHECK CONSTRAINT [FK_tblHoadon_tblKhachHang]
GO
ALTER TABLE [dbo].[tblSdt]  WITH CHECK ADD  CONSTRAINT [FK_tblSdt_tblKhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[tblKhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[tblSdt] CHECK CONSTRAINT [FK_tblSdt_tblKhachHang]
GO
USE [master]
GO
ALTER DATABASE [MyOrder] SET  READ_WRITE 
GO
