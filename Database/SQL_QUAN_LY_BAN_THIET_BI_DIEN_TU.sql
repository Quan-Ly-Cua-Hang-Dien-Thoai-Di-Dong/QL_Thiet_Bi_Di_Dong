USE [master]
GO
/****** Object:  Database [QLTHIETBIDIDONG]    Script Date: 04/06/2020 10:20:45 AM ******/
CREATE DATABASE [QLTHIETBIDIDONG]
go
use QLTHIETBIDIDONG
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET RECOVERY FULL 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET  MULTI_USER 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [QLTHIETBIDIDONG]
GO
/****** Object:  StoredProcedure [dbo].[CapNhatDanhMuc]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CapNhatDanhMuc]
(
	@MaDM int,
	@TenDM nvarchar(250)
)
as
begin
	update DanhMuc
	set TenDM=@TenDM where MaDM=@MaDM
end


GO
/****** Object:  StoredProcedure [dbo].[CapNhatLoaiSanPham]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CapNhatLoaiSanPham]
(
	@MaLoai int,
	@MaDM int,
	@TenLoaiSP nvarchar(250)
)
as
begin
	update LoaiSP
	set MaDM = @MaDM,TenLoaiSP=@TenLoaiSP where MaLoai=@MaLoai
end


GO
/****** Object:  StoredProcedure [dbo].[CapNhatSP]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CapNhatSP]
(
	@MaSP nchar(20),
	@MaThuongHieu int,
	@MaLoai int,
	@TenSP nvarchar(300),
	@Hinh nvarchar(700),
	@GiaBan int,
	@NhaSanXuat nvarchar(250),
	@XuatXu nvarchar(250),
	@DungTich nvarchar(250),
	@ChatLieu nvarchar(250),
	@DoiTuong nvarchar(250),
	@Description nvarchar(Max)

)
as
begin
update SanPham
set MaThuongHieu = @MaThuongHieu,MaLoai=@MaLoai,Hinh=@Hinh,GiaBan=@GiaBan,NhaSanXuat=@NhaSanXuat,XuatXu=@XuatXu,DungTich=@DungTich,ChatLieu=@ChatLieu,DoiTuong=@DoiTuong,TenSP=@TenSP,Description=@Description where MaSP=@MaSP
end


GO
/****** Object:  StoredProcedure [dbo].[CapNhatThuongHieu]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CapNhatThuongHieu]
(
	@MaThuongHieu int,
	@TenThuongHieu nvarchar(250)
)
as
begin
	update ThuongHieu
	set TenThuongHieu=@TenThuongHieu where MaThuongHieu=@MaThuongHieu
end


GO
/****** Object:  StoredProcedure [dbo].[CategoryDM]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CategoryDM]
as
begin
select DanhMuc.MaDM,DanhMuc.TenDM,LoaiSP.MaLoai,LoaiSP.TenLoaiSP  from DanhMuc,LoaiSP where DanhMuc.MaDM = LoaiSP.MaDM
end


GO
/****** Object:  StoredProcedure [dbo].[CategoryLoaiSP]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CategoryLoaiSP]
as
begin
select LoaiSP.MaLoai,LoaiSP.TenLoaiSP,SanPham.MaSP,SanPham.TenSP,ThuongHieu.MaThuongHieu,ThuongHieu.TenThuongHieu  from LoaiSP,SanPham,ThuongHieu where LoaiSP.MaLoai = SanPham.MaLoai and SanPham.MaThuongHieu = ThuongHieu.MaThuongHieu
end


GO
/****** Object:  StoredProcedure [dbo].[ChangeStatus_KhachHang]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ChangeStatus_KhachHang]
(
	@MaKH int,
	@Status bit
)
as
begin
update KhachHang
set Status = @Status where MaKH = @MaKH
end


GO
/****** Object:  StoredProcedure [dbo].[ChangeTinhTrangGiao]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ChangeTinhTrangGiao]
(
	@MaDH int,
	@TinhTrangGiaoHang bit,
		@DaThanhToan bit
)
as
begin
update DonHang
set TinhTrangGiaoHang = @TinhTrangGiaoHang,DaThanhToan = @DaThanhToan where MaDH = @MaDH
end


GO
/****** Object:  StoredProcedure [dbo].[ChiTietSanPham]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ChiTietSanPham]
(
	@MaSP nchar(20)
)
as
begin
	select * from SanPham where MaSP=@MaSP
end


GO
/****** Object:  StoredProcedure [dbo].[LayChiTietHoaDon]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LayChiTietHoaDon]
(
	@MaDH int
)
as
begin
	select   CTDonHang.MaDH,TenSP,SoLuong,DonGia  from CTDonHang,SanPham where SanPham.MaSP = CTDonHang.MaSP and CTDonHang.MaDH = @MaDH
end


GO
/****** Object:  StoredProcedure [dbo].[LayHoaDon]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[LayHoaDon]
as
begin
	select DISTINCT DonHang.MaDH,KhachHang.HoTen,NgayGiao,NgayDat,DaThanhToan,TinhTrangGiaoHang    from KhachHang,CTDonHang,DonHang where KhachHang.MaKH = DonHang.MaKH and CTDonHang.MaDH = CTDonHang.MaDH
end


GO
/****** Object:  StoredProcedure [dbo].[LayLoaiSanPhamTheoDM]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------------------- Loai San Pham------------------------------------------------------------------------------------------------------------
create proc [dbo].[LayLoaiSanPhamTheoDM]
(
	@MaDM int
)
as
begin
	select * from LoaiSP where MaDM = @MaDM
end


GO
/****** Object:  StoredProcedure [dbo].[LaySanPhamTheoLoaiSP]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LaySanPhamTheoLoaiSP]
(
	@MaLoai int,
	@MaThuongHieu int
) 
as
begin
select * from SanPham where MaLoai = @MaLoai or MaThuongHieu = @MaThuongHieu
end


GO
/****** Object:  StoredProcedure [dbo].[ThemDanhMuc]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------- Danh Muc --------------------------------------------------------------------
create proc [dbo].[ThemDanhMuc]
(
	@TenDM nvarchar(250)
)
as
begin
	Insert into DanhMuc(TenDM) values(@TenDM)
end


GO
/****** Object:  StoredProcedure [dbo].[ThemLoaiSanPham]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ThemLoaiSanPham]
(
	@MaDM int,
	@TenLoaiSP nvarchar(250)
)
as
begin
	insert into LoaiSP(MaDM,TenLoaiSP) values(@MaDM,@TenLoaiSP)
end


GO
/****** Object:  StoredProcedure [dbo].[ThemSanPham]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ThemSanPham]
(
	@MaSP nchar(20),
	@MaThuongHieu int,
	@MaLoai int,
	@Hinh nvarchar(700),
	@GiaBan int,
	@NhaSanXuat nvarchar(250),
	@XuatXu nvarchar(250),
	@DungTich nvarchar(250),
	@ChatLieu nvarchar(250),
	@DoiTuong nvarchar(250),
	@TenSP nvarchar(300),
	@CreatedDate date,
	@Description nvarchar(max)
)
as
begin
	insert into SanPham(MaSP,MaThuongHieu,MaLoai,TenSP,Hinh,GiaBan,NhaSanXuat,XuatXu,DungTich,ChatLieu,DoiTuong,CreatedDate,Description) values(@MaSP,@MaThuongHieu,@MaLoai,@TenSP,@Hinh,@GiaBan,@NhaSanXuat,@XuatXu,@DungTich,@ChatLieu,@DoiTuong,@CreatedDate,@Description)	
end


GO
/****** Object:  StoredProcedure [dbo].[ThemThuongHieu]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------- Thuong Hieu ---------------------------------------------------
create proc [dbo].[ThemThuongHieu]
(
	@TenThuongHieu nvarchar(250)
)
as
begin
	Insert into ThuongHieu(TenThuongHieu) values(@TenThuongHieu)
end


GO
/****** Object:  StoredProcedure [dbo].[TimKiemSanPham]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TimKiemSanPham]
(
	@MaSP char(20),
	@TenSP nvarchar(300)
)
as
begin
	select * from SanPham where MaSP = @MaSP or TenSP like @TenSP + '%'
end


GO
/****** Object:  StoredProcedure [dbo].[XoaDanhMuc]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[XoaDanhMuc]
(
	@MaDM int
)
as
begin
	delete from DanhMuc where MaDM=@MaDM
end


GO
/****** Object:  StoredProcedure [dbo].[XoaHoaDon]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[XoaHoaDon]
(
	@MaDH int
)
as
begin
delete from DonHang where MaDH=@MaDH
end


GO
/****** Object:  StoredProcedure [dbo].[XoaLoaiSanPham]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[XoaLoaiSanPham]
(
	@MaLoai int
)
as
begin
	delete from LoaiSP where MaLoai=@MaLoai
end


GO
/****** Object:  StoredProcedure [dbo].[XoaSanPham]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[XoaSanPham]
(
	@MaSP nchar(20)
)
as
begin
delete from SanPham where MaSP = @MaSP
end


GO
/****** Object:  StoredProcedure [dbo].[XoaThuongHieu]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[XoaThuongHieu]
(
	@MaThuongHieu int
)
as
begin
	delete from ThuongHieu where MaThuongHieu=@MaThuongHieu
end


GO
/****** Object:  Table [dbo].[CT_PHIEU_NHAP]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PHIEU_NHAP](
	[MAPN] [int] NOT NULL,
	[MASP] [nchar](20) NOT NULL,
	[SL_NHAP] [int] NULL,
	[GIANHAP] [money] NULL,
 CONSTRAINT [PK_CT_PHIEU_NHAP] PRIMARY KEY CLUSTERED 
(
	[MAPN] ASC,
	[MASP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTDonHang]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDonHang](
	[MaDH] [int] NOT NULL,
	[MaSP] [nchar](20) NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](24, 0) NULL,
 CONSTRAINT [PK_CTDonHang] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDM] [int] IDENTITY(1,1) NOT NULL,
	[TenDM] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDH] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[NgayGiao] [date] NULL,
	[NgayDat] [date] NOT NULL,
	[DaThanhToan] [bit] NOT NULL,
	[TinhTrangGiaoHang] [bit] NOT NULL,
 CONSTRAINT [PK__DonHang__27258661FE3F4F63] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [varchar](250) NULL,
	[MatKhau] [varchar](250) NULL,
	[HoTen] [nvarchar](250) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nchar](30) NULL,
	[DienThoai] [nchar](15) NULL,
	[Email] [varchar](250) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK__KhachHan__2725CF1E976E20B9] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[MaDM] [int] NULL,
	[TenLoaiSP] [nvarchar](250) NULL,
 CONSTRAINT [PK__LoaiSP__730A5759B9991D12] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Manager]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Manager](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](150) NULL,
	[Password] [nvarchar](250) NULL,
	[Name] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
	[Phone] [nvarchar](250) NULL,
	[GroupID] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManagerGroup]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManagerGroup](
	[ID_Group] [varchar](20) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Permission](
	[ID_Group] [varchar](20) NOT NULL,
	[ID_Role] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Group] ASC,
	[ID_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PHIEU_NHAP]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEU_NHAP](
	[MAPN] [int] IDENTITY(1,1) NOT NULL,
	[NGAYNHAP] [date] NULL,
	[TONGTIEN] [money] NULL,
 CONSTRAINT [PK_PHIEU_NHAP] PRIMARY KEY CLUSTERED 
(
	[MAPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[ID_Role] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 04/06/2020 10:20:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [nchar](20) NOT NULL,
	[MaThuongHieu] [int] NULL,
	[MaLoai] [int] NULL,
	[TenSP] [nvarchar](300) NULL,
	[Hinh] [nvarchar](700) NULL,
	[GiaBan] [int] NULL,
	[NhaSanXuat] [nvarchar](250) NULL,
	[XuatXu] [nvarchar](250) NULL,
	[DungTich] [nvarchar](250) NULL,
	[ChatLieu] [nvarchar](250) NULL,
	[DoiTuong] [nvarchar](250) NULL,
	[CreatedDate] [date] NULL,
	[Description] [nvarchar](max) NULL,
	[SL_TON] [int] NULL,
 CONSTRAINT [PK__SanPham__2725081CCF802F76] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[CT_PHIEU_NHAP] ([MAPN], [MASP], [SL_NHAP], [GIANHAP]) VALUES (1, N'SP1                 ', 2, 10000.0000)
INSERT [dbo].[CT_PHIEU_NHAP] ([MAPN], [MASP], [SL_NHAP], [GIANHAP]) VALUES (1, N'SP12                ', 2, 20000.0000)
INSERT [dbo].[CT_PHIEU_NHAP] ([MAPN], [MASP], [SL_NHAP], [GIANHAP]) VALUES (2, N'SP1                 ', 1, 10000.0000)
INSERT [dbo].[CT_PHIEU_NHAP] ([MAPN], [MASP], [SL_NHAP], [GIANHAP]) VALUES (2, N'SP10                ', 5, 10000.0000)
INSERT [dbo].[CT_PHIEU_NHAP] ([MAPN], [MASP], [SL_NHAP], [GIANHAP]) VALUES (2, N'SP12                ', 5, 10000.0000)
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (9, N'SP22                ', 3, CAST(1125000 AS Decimal(24, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (9, N'SP25                ', 10, CAST(150000 AS Decimal(24, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (9, N'SP27                ', 6, CAST(510000 AS Decimal(24, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (9, N'SP3                 ', 5, CAST(2645000 AS Decimal(24, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (9, N'SP37                ', 2, CAST(104000 AS Decimal(24, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (1056, N'SP24                ', 1, CAST(245000 AS Decimal(24, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (1056, N'SP25                ', 2, CAST(150000 AS Decimal(24, 0)))
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (2, N'Bỉm tã & vệ sinh')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (7, N'Đồ chơi TOYCITY')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (4, N'Mẹ bầu & Sau sinh')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (8, N'Phiếu & Quà tặng')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (3, N'Sơ sinh & Trẻ nhỏ')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (1, N'Sữa & Thực phẩm')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (5, N'Thời trang bé gái')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (6, N'Thời trang bé trai')
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang]) VALUES (9, 1, CAST(0x55400B00 AS Date), CAST(0x55400B00 AS Date), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang]) VALUES (10, 1, CAST(0x76400B00 AS Date), CAST(0x55400B00 AS Date), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang]) VALUES (28, 1, CAST(0x76400B00 AS Date), CAST(0x55400B00 AS Date), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang]) VALUES (56, 1, CAST(0x55400B00 AS Date), CAST(0x55400B00 AS Date), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang]) VALUES (57, 1, CAST(0x76400B00 AS Date), CAST(0x55400B00 AS Date), 0, 0)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang]) VALUES (1056, 1, CAST(0x63400B00 AS Date), CAST(0x63400B00 AS Date), 0, 0)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [Status]) VALUES (1, N'User1', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', CAST(0xD0230B00 AS Date), N'Nam                           ', N'0938877660     ', N'lockhanhlong007@gmail.com', N'TP.HCM', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [Status]) VALUES (23, N'User2', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', CAST(0xD0230B00 AS Date), N'Nam                           ', N'0938477660     ', N'lockhanhlong007@gmail.com', N'TP.HCM', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [Status]) VALUES (24, N'User3', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', CAST(0xD0230B00 AS Date), N'Nam                           ', N'0938577660     ', N'lockhanhlong007@gmail.com', N'TP.HCM', 0)
INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [Status]) VALUES (25, N'User4', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', CAST(0xD0230B00 AS Date), N'Nam                           ', N'0938677660     ', N'lockhanhlong007@gmail.com', N'TP.HCM', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [Status]) VALUES (27, N'User6', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', CAST(0xD0230B00 AS Date), N'Nam                           ', N'0938777660     ', N'lockhanhlong007@gmail.com', N'TP.HCM', 0)
INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [Status]) VALUES (28, N'User7', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', CAST(0xD0230B00 AS Date), N'Nam                           ', N'0948877660     ', N'lockhanhlong007@gmail.com', N'TP.HCM', 0)
INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [Status]) VALUES (29, N'User8', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', CAST(0xD0230B00 AS Date), N'Nam                           ', N'0958877660     ', N'lockhanhlong007@gmail.com', N'TP.HCM', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [Status]) VALUES (30, N'User9', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', CAST(0xD0230B00 AS Date), N'Nam                           ', N'0968877660     ', N'lockhanhlong007@gmail.com', N'TP.HCM', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [Status]) VALUES (31, N'User10', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', CAST(0xD0230B00 AS Date), N'Nam                           ', N'0978877660     ', N'lockhanhlong007@gmail.com', N'TP.HCM', 0)
INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [Status]) VALUES (32, N'User11', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', CAST(0xD0230B00 AS Date), N'Nam                           ', N'0934877660     ', N'lockhanhlong007@gmail.com', N'TP.HCM', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [Status]) VALUES (33, N'User12', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', CAST(0xD0230B00 AS Date), N'Nam                           ', N'0938877860     ', N'lockhanhlong007@gmail.com', N'TP.HCM', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [Status]) VALUES (34, N'User13', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', CAST(0xD0230B00 AS Date), N'Nam                           ', N'0938877910     ', N'lockhanhlong007@gmail.com', N'TP.HCM', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [Status]) VALUES (35, N'User14', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', CAST(0xD0230B00 AS Date), N'Nam                           ', N'0938877310     ', N'lockhanhlong007@gmail.com', N'TP.HCM', 0)
INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [Status]) VALUES (36, N'User15', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', CAST(0xD0230B00 AS Date), N'Nam                           ', N'0938877330     ', N'lockhanhlong007@gmail.com', N'TP.HCM', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [Status]) VALUES (37, N'User16', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', CAST(0xD0230B00 AS Date), N'Nam                           ', N'0938877666     ', N'lockhanhlong007@gmail.com', N'TP.HCM', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [Status]) VALUES (38, N'User17', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', CAST(0xD0230B00 AS Date), N'Nam                           ', N'0938877664     ', N'lockhanhlong007@gmail.com', N'TP.HCM', 0)
INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [Status]) VALUES (39, N'User18', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', CAST(0xD0230B00 AS Date), N'Nam                           ', N'0938877663     ', N'lockhanhlong007@gmail.com', N'TP.HCM', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [Status]) VALUES (40, N'User19', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', CAST(0xD0230B00 AS Date), N'Nam                           ', N'0938877662     ', N'lockhanhlong007@gmail.com', N'TP.HCM', 0)
INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [Status]) VALUES (41, N'User20', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', CAST(0xD0230B00 AS Date), N'Nam                           ', N'0938877665     ', N'lockhanhlong007@gmail.com', N'TP.HCM', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [Status]) VALUES (42, N'User21', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', CAST(0xE3230B00 AS Date), N'Nam                           ', N'0938877667     ', N'lockhanhlong007@gmail.com', N'TP.HCM', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [Status]) VALUES (43, N'User5', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', CAST(0xD0230B00 AS Date), N'Nam                           ', N'0938877990     ', N'lockhanhlong007@gmail.com', N'TP.HCM', 1)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[LoaiSP] ON 

INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (1, 1, N'Sữa bột cho bé')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (2, 1, N'Sữa nước các loại')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (3, 1, N'Bột ăn dặm')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (4, 1, N'Bánh & Kẹo cho bé')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (5, 1, N'Cháo & mì cho bé')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (6, 1, N'Dinh dưỡng đóng lọ')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (7, 1, N'Thực phẩm chế biến')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (8, 1, N'Dinh dưỡng cho mẹ')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (9, 2, N'Thế giới Bỉm Tã')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (10, 2, N'Tắm & Gội toàn thân')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (11, 2, N'Nước rửa bình sữa')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (12, 2, N'Dưỡng da & Phấn thơm')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (13, 2, N'Giặt xả quần áo')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (14, 2, N'Thế giới khăn ướt')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (15, 2, N'Khăn khô & Khăn giấy')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (16, 2, N'Nước hoa & quà tặng')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (17, 3, N'Thời trang sơ sinh')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (18, 3, N'Đồ chơi sơ sinh')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (19, 3, N'Đồ dùng bé bú')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (20, 3, N'Đồ dùng bé ngủ')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (21, 3, N'Các loại xe & Đai, Địu')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (22, 3, N'Dụng cụ vệ sinh')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (23, 3, N'Sức khỏe & An toàn')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (24, 3, N'Dụng cụ bé ăn')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (25, 4, N'Sữa cho mẹ')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (26, 4, N'Thực phẩm cho mẹ')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (27, 4, N'Mỹ phẩm cho mẹ')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (28, 4, N'Mẹ chăm bé')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (29, 4, N'Tắm & Gọi các loại')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (30, 4, N'Máy hút sữa')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (31, 4, N'Đầm bầu & Đồ lót')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (32, 4, N'Vệ sinh & Condom')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (33, 5, N'Đầm & Chân váy')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (34, 5, N'Bộ, Quần & Áo')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (35, 5, N'Đồ chơi cho bé')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (36, 5, N'Đồ ngủ & Đồ lót')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (37, 5, N'Quần Jean & Kaki')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (38, 5, N'Phụ kiện thời trang')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (39, 5, N'Ba lô & Túi xách')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (40, 5, N'Giày dép & Sandal')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (41, 6, N'Sơ mi bé trai')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (42, 6, N'Bộ, Quần & Áo 1')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (43, 6, N'Đồ chơi cho bé 1')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (44, 6, N'Đồ ngủ & Đồ lót 1')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (45, 6, N'Quần Jean & Kaki 1')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (46, 6, N'Phụ kiện thời trang 1')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (47, 6, N'Giày dép & Sandal 1')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (48, 6, N'Ba lô & Túi xách 1')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (49, 7, N'Đồ chơi sơ sinh 1')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (50, 7, N'Đồ chơi bé gái')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (51, 7, N'Đồ chơi bé trai')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (52, 7, N'Đồ chơi cát & Nước')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (53, 7, N'Bóng, Banh & Nhá banh')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (54, 7, N'Xe lắc & Chòi chân')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (55, 7, N'Scooter & Vận Động')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (56, 7, N'Xe đạp & Xe 3 bánh')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (57, 8, N'Tổ chức tiệc')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (58, 8, N'Gói quà')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (59, 8, N'Phiếu quà tặng')
SET IDENTITY_INSERT [dbo].[LoaiSP] OFF
SET IDENTITY_INSERT [dbo].[Manager] ON 

INSERT [dbo].[Manager] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [GroupID]) VALUES (1, N'longAdmin', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', N'TPHCM1', N'lockhanhlong007@gmail.com', N'0123456776', N'ADMIN')
INSERT [dbo].[Manager] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [GroupID]) VALUES (9, N'amin', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', N'TPHCM', N'lockhanhlong007@gmail.com', N'0123456789', N'MOD')
INSERT [dbo].[Manager] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [GroupID]) VALUES (10, N'amin1', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', N'TPHCM', N'lockhanhlong007@gmail.com', N'0123456789', N'MOD')
INSERT [dbo].[Manager] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [GroupID]) VALUES (11, N'amin2', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', N'TPHCM', N'lockhanhlong007@gmail.com', N'0123456789', N'MOD')
INSERT [dbo].[Manager] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [GroupID]) VALUES (14, N'amin5', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', N'TPHCM', N'lockhanhlong007@gmail.com', N'0123456789', N'MOD')
INSERT [dbo].[Manager] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [GroupID]) VALUES (15, N'amin6', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', N'TPHCM', N'lockhanhlong007@gmail.com', N'0123456789', N'MOD')
INSERT [dbo].[Manager] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [GroupID]) VALUES (16, N'amin7', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', N'TPHCM', N'lockhanhlong007@gmail.com', N'0123456789', N'MOD')
INSERT [dbo].[Manager] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [GroupID]) VALUES (17, N'amin8', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', N'TPHCM', N'lockhanhlong007@gmail.com', N'0123456789', N'MOD')
INSERT [dbo].[Manager] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [GroupID]) VALUES (18, N'amin9', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', N'TPHCM', N'lockhanhlong007@gmail.com', N'0123456789', N'MOD')
INSERT [dbo].[Manager] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [GroupID]) VALUES (19, N'amin10', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', N'TPHCM', N'lockhanhlong007@gmail.com', N'0123456789', N'MOD')
INSERT [dbo].[Manager] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [GroupID]) VALUES (20, N'amin11', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', N'TPHCM', N'lockhanhlong007@gmail.com', N'0123456789', N'MOD')
INSERT [dbo].[Manager] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [GroupID]) VALUES (21, N'amin12', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', N'TPHCM', N'lockhanhlong007@gmail.com', N'0123456789', N'MOD')
INSERT [dbo].[Manager] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [GroupID]) VALUES (22, N'amin13', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', N'TPHCM', N'lockhanhlong007@gmail.com', N'0123456789', N'MOD')
INSERT [dbo].[Manager] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [GroupID]) VALUES (23, N'amin14', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', N'TPHCM', N'lockhanhlong007@gmail.com', N'0123456789', N'MOD')
INSERT [dbo].[Manager] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [GroupID]) VALUES (24, N'amin15', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', N'TPHCM', N'lockhanhlong007@gmail.com', N'0123456789', N'MOD')
INSERT [dbo].[Manager] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [GroupID]) VALUES (25, N'amin16', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', N'TPHCM', N'lockhanhlong007@gmail.com', N'0123456789', N'MOD')
INSERT [dbo].[Manager] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [GroupID]) VALUES (26, N'amin17', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', N'TPHCM', N'lockhanhlong007@gmail.com', N'0123456789', N'MOD')
INSERT [dbo].[Manager] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [GroupID]) VALUES (27, N'amin18', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', N'TPHCM', N'lockhanhlong007@gmail.com', N'0123456789', N'MOD')
INSERT [dbo].[Manager] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [GroupID]) VALUES (29, N'amin20', N'202cb962ac59075b964b07152d234b70', N'Trần Bảo Long', N'TPHCM', N'lockhanhlong007@gmail.com', N'0123456789', N'MOD')
INSERT [dbo].[Manager] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [GroupID]) VALUES (31, N'admin123', N'202cb962ac59075b964b07152d234b70', N'Long', N'TPHCM', N'lockhanhlong007@gmail.com', N'0123456788', N'MOD')
INSERT [dbo].[Manager] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [GroupID]) VALUES (34, N'longAdmin1234', N'202cb962ac59075b964b07152d234b70', N'sdfa', N'afas', N'lockhanhlong007@gmail.com', N'0123456788', N'MOD')
INSERT [dbo].[Manager] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [GroupID]) VALUES (37, N'longAdmin7', N'202cb962ac59075b964b07152d234b70', N'Long', N'kjljkl', N'lockhanhlong007@gmail.com', N'0123456788', N'MOD')
INSERT [dbo].[Manager] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [GroupID]) VALUES (41, N'longAdmin13124', N'202cb962ac59075b964b07152d234b70', N'Long', N'gsdf', N'lockhanhlong007@gmail.com', N'0123456788', N'MOD')
INSERT [dbo].[Manager] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [GroupID]) VALUES (44, N'longAdmin121', N'c8ffe9a587b126f152ed3d89a146b445', N'Long', N'hcm', N'lockhanhlong007@gmail.com', N'0123456788', N'MOD')
SET IDENTITY_INSERT [dbo].[Manager] OFF
INSERT [dbo].[ManagerGroup] ([ID_Group], [Name]) VALUES (N'ADMIN', N'Admin')
INSERT [dbo].[ManagerGroup] ([ID_Group], [Name]) VALUES (N'MOD', N'Moderatior')
SET IDENTITY_INSERT [dbo].[PHIEU_NHAP] ON 

INSERT [dbo].[PHIEU_NHAP] ([MAPN], [NGAYNHAP], [TONGTIEN]) VALUES (1, CAST(0x2B410B00 AS Date), 60000.0000)
INSERT [dbo].[PHIEU_NHAP] ([MAPN], [NGAYNHAP], [TONGTIEN]) VALUES (2, CAST(0x2B410B00 AS Date), 110000.0000)
SET IDENTITY_INSERT [dbo].[PHIEU_NHAP] OFF
INSERT [dbo].[Role] ([ID_Role], [Name]) VALUES (N'ADD_MANAGER', N'Thêm Manager')
INSERT [dbo].[Role] ([ID_Role], [Name]) VALUES (N'DELETE_MANAGER', N'Delete Manager')
INSERT [dbo].[Role] ([ID_Role], [Name]) VALUES (N'EDIT_MANAGER', N'Edit Manager')
INSERT [dbo].[Role] ([ID_Role], [Name]) VALUES (N'VIEW_MANAGER', N'View Manager')
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP1                 ', 50, 1, N'Nestle NAN Optipro 2', N'h1.png', 359000, N'Nestlé Thụy Sỹ', N'Thụy Sỹ', N'0.8kg', N'Sữa bột', N'Cho trẻ từ 6-12 tháng tuổi', CAST(0x66400B00 AS Date), NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP10                ', 2, 2, N'Thức uống lúa mạch uống liền Nestle Milo', N'h10.png', 250000, N'Việt Nam', N'Việt Nam', N'180ml', N'Sữa lỏng', N'Dành cho bé từ 6 tuổi trở lên', CAST(0x66400B00 AS Date), NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP11                ', 45, 3, N'Bột ăn dặm Ridielac Gold 4 Vị Mặn', N'h11.png', 58000, N'Việt Nam', N'Việt Nam', N'200g', N'Bột Ngũ Cốc', N'Dành cho bé từ 7- 24 tháng tuổi', CAST(0x66400B00 AS Date), NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP12                ', 5, 3, N'Bột sữa DD HiPP bổ sung Praebiotik', N'h12.png', 127000, N'Hipp Austria GmbH', N'Áo', N'250g', N'Bột Ngũ Cốc', N'Dành cho bé từ 4 tháng trở lên', CAST(0x66400B00 AS Date), NULL, 7)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP13                ', 6, 4, N'Bánh Ăn Dặm Gerber vị Chuối', N'h13.png', 68000, N'Mỹ', N'Mỹ', N'42g', N'Bánh', N' cho bé từ 8 tháng trở lên', CAST(0x66400B00 AS Date), NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP14                ', 6, 4, N' Bánh Ăn Dặm Gerber vị Táo Dâu', N'h14.png', 68000, N'Mỹ', N'Mỹ', N'42g', N'Bánh', N' cho bé từ 8 tháng trở lên', CAST(0x66400B00 AS Date), NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP15                ', 4, 5, N'Cháo tươi Baby bò đậu hà lan cà rốt', N'h15.png', 24000, N'Việt Nam', N'Việt Nam', N'240g', N'Cháo', N'Dành cho bé từ 10 tháng trở lên', CAST(0x66400B00 AS Date), NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP16                ', 4, 5, N'Cháo tươi Baby Tôm Rau Ngót Nhật', N'h16.png', 24000, N'Việt Nam', N'Việt Nam', N'240g', N'Cháo', N'Dành cho bé từ 10 tháng trở lên', CAST(0x66400B00 AS Date), NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP17                ', 7, 6, N'Yến Thiên Việt', N'h17.png', 295000, N'Việt Nam', N'Việt Nam', N'420ml', N'Yến sào', N'cho trẻ trên 06 tháng tuổi', CAST(0x66400B00 AS Date), NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP18                ', 7, 6, N'Yến Babi Bird ', N'h18.png', 65000, N'Việt Nam', N'Việt Nam', N'42g', N'Yến', N'cho trẻ trên 06 tháng tuổi', CAST(0x66400B00 AS Date), NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP19                ', 9, 7, N'Bột cá hồi US Food', N'h19.png', 130000, N'Việt Nam ', N'Việt Nam ', N'80g', N'Cá Hồi', N'cho bé từ 10 tháng tuổi trở lên', CAST(0x66400B00 AS Date), NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP20                ', 1, 8, N'Ensure Gold HMB Hương Vani', N'h20.png', 729000, N'Singapore', N'Singapore', N'850g', N'Sữa bột', N'Người lớn', CAST(0x66400B00 AS Date), NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP21                ', 46, 8, N'Friso Mum Gold hương Cam', N'h21.png', 449000, N'Việt Nam', N'Việt Nam', N'900g', N'Sữa bột', N'Dành cho mẹ mang thại và cho con bú', CAST(0x66400B00 AS Date), NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP22                ', 8, 9, N'Tã dán Nhật cao cấp Genki', N'h22.png', 375000, N'Nhật Bản', N'Nhật Bản', N'44 miếng', N' Vải không dệt', N'Dành cho bé từ 12-17kg', CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP23                ', 8, 9, N'Tã quần Nhật cao cấp Genki', N'h23.png', 255000, N'Nhật Bản', N'Nhật Bản', N'26 miếng', N'Vải không dệt', N'Dành cho bé từ 12-17kg', CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP24                ', 31, 10, N'Tắm gội hạnh nhân cho sơ sinh và trẻ nhỏ Cadum', N'h24.png', 245000, N'Pháp', N'Pháp', N'750ml', N'Xà phòng', N'Tắm gội êm dịu cho sơ sinh và trẻ nhỏ', CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP25                ', 43, 11, N'Nước rửa bình sữa & rau quả D-nee', N'h25.png', 75000, N'Thái Lan', N'Thái Lan', N'500ml', N'chất tẩy', N'Dung dịch tẩy rửa bình sữa, núm ty cho bé', CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP26                ', 31, 12, N'Phấn rôm sơ sinh ngừa hăm Cadum', N'h26.png', 148000, N'Pháp', N'Pháp', N'300g', N'Phấn', N'Dùng để thoa toàn thân cho bé mỗi ngày', CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP27                ', 10, 12, N'Dầu Massage và dưỡng ẩm Johnson Baby', N'h27.png', 85000, N'Thái Lan', N'Thái Lan', N'200ml', N'Dầu', N'Cho bé từ 10 tháng tuổi', CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP28                ', 11, 13, N'Nước giặt Enfant xanh dương', N'h28.png', 179000, N'Thái Lan', N'Thái Lan', N'3000ml ', N'Xà phòng', N'Phù hợp giặt đồ cho bé từ sơ sinh trở lên', CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP29                ', 12, 14, N'Khăn ướt chiết xuất tự nhiên Aga-ae', N'h29.png', 43000, N'Hàn Quốc', N'Hàn Quốc', N'100 tờ', N'Giấy ướt', N'cho mọi người', CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP3                 ', 3, 1, N'Meiji Infant Formula', N'h3.png|h33.png|h4.png', 529000, N'Nhật Bản', N'Nhật Bản', N'0.8kg', N'Sữa bột', N'Cho trẻ từ 0-12 tháng', CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP30                ', 14, 17, N'Mũ Bảo Vệ Đầu Cho Bé Mumguard Hình Bọ Cánh Cam', N'h30.png', 249000, N'Việt Nam', N'Việt Nam', N'1 Cái', N'Nhựa', N'Dành cho bé từ 7 - 60 tháng tuổi', CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP31                ', 35, 17, N'Bộ thun bé trai ngắn CF', N'h31.png', 159000, N'Việt Nam', N'Việt Nam', N'1 bộ', N'cotton mềm mại', N'Dành cho bé từ 9-24 tháng', CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP32                ', 16, 18, N' Xe bus âm nhạc', N'h32.png', 185000, N'Trung Quốc', N'Trung Quốc', N'0.6kg', N'nhựa ABS', N'Dành cho bé từ 18 tháng trở lên', CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP33                ', 16, 18, N' Lật đật con gà vàng', N'h33.png', 85000, N'Trung Quốc', N'Trung Quốc', N'0.38kg', N'Nhựa ABS', N'Từ sơ sinh trở lên', CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP34                ', 18, 19, N'Bình sữa cổ rộng nhựa PPSU Pigeon', N'h34.png', 335000, N'Thái Lan', N'Thái Lan', N'160ml', N'nhựa PPSU', N'dành cho bé từ 0 tháng tuổi', CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP35                ', 20, 20, N'Nôi Mềm 2 Tầng 3 Sao', N'h35.png', 2090000, N'Việt Nam', N'Việt Nam', N'18kg', N'Kim loại', N'Dành cho bé sơ sinh đến 3 tuổi', CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP36                ', 15, 21, N'Xe tập đi Tobby bập bênh, có nhạc', N'h36.png', 845000, N'Trung Quốc', N'Trung Quốc', N'5.2kg', N'Nhựa', N'cho bé từ 6-15 tháng tuổi', CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP37                ', 19, 22, N'Khăn vải khô đa năng Mama', N'h37.png', 52000, N'Việt Nam', N'Việt Nam', N'240 tờ', N'Khăn vải', N'Trẻ sơ sinh', CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP38                ', 22, 23, N'Nhiệt kế hồng ngoại đo trán', N'h38.png', 850000, N'Thụy Sỹ', N'Trung Quốc', N'1 cái', N'kim loại', N'trẻ em', CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP39                ', 20, 24, N'Ghế gỗ cao cấp cho bé ', N'h39.png', 1150000, N'Việt Nam', N'Việt Nam', N'1 cái', N'Gỗ', N'trẻ em', CAST(0x3A400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP4                 ', 3, 1, N'Meiji Growing up Formula', N'h4.png|h3.png|h33.png', 459000, N'Nhật Bản', N'Nhật Bản', N'0.8kg', N'Sữa bột', N'Cho trẻ từ 12-36 tháng', CAST(0x42400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP40                ', 35, 33, N'Đầm vải bé gái CF', N'h40.png', 149000, N'Việt Nam', N'Việt Nam', N'1 cái', N'Vải', N'Dành cho bé từ 9-24 tháng tuổi', CAST(0x4C400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP41                ', 35, 41, N'Áo vải bé trai tay dài CF', N'h41.png', 189000, N'Việt Nam', N'Việt Nam', N'1 cái', N'Vải cotton', N'Dành cho bé từ 7-12 tuổi', CAST(0x50400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP42                ', 35, 34, N'Bộ thun bé gái ngắn CF', N'h42.png', 139000, N'Việt Nam', N'Việt Nam', N'1 bộ', N'Vải cotton', N'Dành cho bé từ 2-6 tuổi', CAST(0x53400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP43                ', 35, 42, N'Bộ thun bé trai ngắn CF', N'h43.png', 149000, N'Việt Nam', N'Việt Nam', N'1 bộ', N'Vải cotton', N'Dành cho bé từ 2-6 tuổi', CAST(0x51400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP5                 ', 46, 1, N'Frisolac Gold số 2 Sunrise', N'h5.png|h7.png|h4.png', 469000, N'Công ty TNHH FrieslandCampina Hà Nam', N'Việt Nam', N'0.9kg', N'Sữa bột', N'Cho trẻ từ 6-12 tháng tuổi', CAST(0x52400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP6                 ', 1, 2, N'Pediasure dạng lỏng hương vani ', N'h6.png|h33.png|h37.png', 215000, N'Hoa Kỳ', N'Hoa Kỳ', N'237ml', N'Sữa lỏng', N'Cho trẻ từ 1-10 tuổi', CAST(0x54400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP7                 ', 1, 2, N'Ensure Gold Vigor', N'h7.png|h4.png|h3.png', 259000, N'Hoa Kỳ', N'Hoa Kỳ', N'237ml', N'Sữa lỏng', N'Người lớn hoặc người bệnh', CAST(0x55400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP8                 ', 1, 2, N'Abbott Grow Gold hương vani', N'h8.png', 58000, N'Malaysia', N'Malaysia', N'180ml', N'Sữa lỏng', N'Cho trẻ từ 2 tuổi trở lên', CAST(0x56400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
INSERT [dbo].[SanPham] ([MaSP], [MaThuongHieu], [MaLoai], [TenSP], [Hinh], [GiaBan], [NhaSanXuat], [XuatXu], [DungTich], [ChatLieu], [DoiTuong], [CreatedDate], [Description], [SL_TON]) VALUES (N'SP9                 ', 45, 2, N'Sữa uống dinh dưỡng Optimum Gold', N'h9.png', 49000, N'Việt Nam', N'Việt Nam', N'180ml', N'Sữa lỏng', N'1 tuổi trở lên', CAST(0x57400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0)
SET ANSI_PADDING ON

GO
/****** Object:  Index [Uni_TenDM]    Script Date: 04/06/2020 10:20:45 AM ******/
ALTER TABLE [dbo].[DanhMuc] ADD  CONSTRAINT [Uni_TenDM] UNIQUE NONCLUSTERED 
(
	[TenDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Uni_DienThoai]    Script Date: 04/06/2020 10:20:45 AM ******/
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [Uni_DienThoai] UNIQUE NONCLUSTERED 
(
	[DienThoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Uni_TaiKhoan]    Script Date: 04/06/2020 10:20:45 AM ******/
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [Uni_TaiKhoan] UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Uni_TenLoaiSP]    Script Date: 04/06/2020 10:20:45 AM ******/
ALTER TABLE [dbo].[LoaiSP] ADD  CONSTRAINT [Uni_TenLoaiSP] UNIQUE NONCLUSTERED 
(
	[TenLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UNI_UserName]    Script Date: 04/06/2020 10:20:45 AM ******/
ALTER TABLE [dbo].[Manager] ADD  CONSTRAINT [UNI_UserName] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DonHang] ADD  CONSTRAINT [DF_DonHang_NgayDat]  DEFAULT (getdate()) FOR [NgayDat]
GO
ALTER TABLE [dbo].[DonHang] ADD  CONSTRAINT [DF_DonHang_DaThanhToan]  DEFAULT ((0)) FOR [DaThanhToan]
GO
ALTER TABLE [dbo].[DonHang] ADD  CONSTRAINT [DF_DonHang_TinhTrangGiaoHang]  DEFAULT ((0)) FOR [TinhTrangGiaoHang]
GO
ALTER TABLE [dbo].[Manager] ADD  CONSTRAINT [DF_Manager_GroupID]  DEFAULT ('Moderatior') FOR [GroupID]
GO
ALTER TABLE [dbo].[PHIEU_NHAP] ADD  CONSTRAINT [DF_TONG_TIEN]  DEFAULT ((0)) FOR [TONGTIEN]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SLTON]  DEFAULT ((0)) FOR [SL_TON]
GO
ALTER TABLE [dbo].[CT_PHIEU_NHAP]  WITH CHECK ADD  CONSTRAINT [FK_CT_PHIEU_NHAP_PHIEU_NHAP] FOREIGN KEY([MAPN])
REFERENCES [dbo].[PHIEU_NHAP] ([MAPN])
GO
ALTER TABLE [dbo].[CT_PHIEU_NHAP] CHECK CONSTRAINT [FK_CT_PHIEU_NHAP_PHIEU_NHAP]
GO
ALTER TABLE [dbo].[CT_PHIEU_NHAP]  WITH CHECK ADD  CONSTRAINT [FK_CT_PHIEU_NHAP_SANPHAM] FOREIGN KEY([MASP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CT_PHIEU_NHAP] CHECK CONSTRAINT [FK_CT_PHIEU_NHAP_SANPHAM]
GO
ALTER TABLE [dbo].[CTDonHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDonHang_DH] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([MaDH])
GO
ALTER TABLE [dbo].[CTDonHang] CHECK CONSTRAINT [FK_CTDonHang_DH]
GO
ALTER TABLE [dbo].[CTDonHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDonHang_SP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CTDonHang] CHECK CONSTRAINT [FK_CTDonHang_SP]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DH_KH] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DH_KH]
GO
ALTER TABLE [dbo].[LoaiSP]  WITH CHECK ADD  CONSTRAINT [FK_LoaiSP_DM] FOREIGN KEY([MaDM])
REFERENCES [dbo].[DanhMuc] ([MaDM])
GO
ALTER TABLE [dbo].[LoaiSP] CHECK CONSTRAINT [FK_LoaiSP_DM]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [FK_Manager_ManagerGroup] FOREIGN KEY([GroupID])
REFERENCES [dbo].[ManagerGroup] ([ID_Group])
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [FK_Manager_ManagerGroup]
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_Premission_Group] FOREIGN KEY([ID_Group])
REFERENCES [dbo].[ManagerGroup] ([ID_Group])
GO
ALTER TABLE [dbo].[Permission] CHECK CONSTRAINT [FK_Premission_Group]
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_Premission_Role] FOREIGN KEY([ID_Role])
REFERENCES [dbo].[Role] ([ID_Role])
GO
ALTER TABLE [dbo].[Permission] CHECK CONSTRAINT [FK_Premission_Role]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SP_LoaiSP] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiSP] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SP_LoaiSP]
GO
ALTER TABLE [dbo].[CTDonHang]  WITH CHECK ADD  CONSTRAINT [CHK_DonGia] CHECK  ((len([DonGia])>(3)))
GO
ALTER TABLE [dbo].[CTDonHang] CHECK CONSTRAINT [CHK_DonGia]
GO
ALTER TABLE [dbo].[CTDonHang]  WITH CHECK ADD  CONSTRAINT [CHK_SoLuong] CHECK  (([SoLuong]>(0)))
GO
ALTER TABLE [dbo].[CTDonHang] CHECK CONSTRAINT [CHK_SoLuong]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [CHK_NgayDat_NgayGiao] CHECK  ((datediff(day,[NgayDat],[NgayGiao])>=(0)))
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [CHK_NgayDat_NgayGiao]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [CHK_DienThoai] CHECK  ((len([DienThoai])>=(8) AND len([DienThoai])<=(12)))
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [CHK_DienThoai]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [CHK_GioiTinh] CHECK  (([GioiTinh]='Nam' OR [GioiTinh]=N'Nữ'))
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [CHK_GioiTinh]
GO
USE [master]
GO
ALTER DATABASE [QLTHIETBIDIDONG] SET  READ_WRITE 
GO
