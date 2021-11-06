CREATE DATABASE CSDL_QLnhahang
GO
USE CSDL_QLnhahang
GO
--Tạo bảng Nhân viên
create table NHANVIEN
(
MaNV nchar (8) not null primary key,
TenNV nvarchar (30),
Ngaysinh date,
DiaC_NV nvarchar (50),
SDT_NV varchar(12),
ChucV nvarchar (30),
luong int,
)
GO
--Tạo bảng Thực phẩm
create table THUCPHAM
(
MaTP nchar (8) not null primary key,
TenTP nvarchar (30),
KLSD int,
DonVi nvarchar (10),
DonGia int,
NhaCC nvarchar(30),
NgayNhap date,
MaNV nchar(8) not null,
foreign key(MaNV) references NHANVIEN(MaNV)
)
GO
--Tạo bảng Món ăn
create table MONAN
(
MaM nchar (5) not null primary key,
TenM nvarchar (30),
DonGia_M int,
)
GO
--Tạo bảng Khách
create table KHACH
(
MaK nchar (8) not null primary key,
TenK nvarchar (30),
DiaC_K nvarchar (50),
SDT_K varchar(12)
)
GO
--Tạo bảng Hóa đơn
create table HOADON
(
MaHD nchar (5) not null primary key,
Ngay date,
TongTien int,
KhachTra int,
ConDu int,
MaK nchar (8) not null,
MaNV nchar(8) not null,
foreign key (MaK) references KHACH (MaK),
foreign key(MaNV) references NHANVIEN(MaNV)
)
Go
--Tạo bảng phục vụ
create table PHUCVU
(
MaK nchar(8) not null,
MaNV nchar(8) not null,
foreign key (MaK) references KHACH (MaK),
foreign key(MaNV) references NHANVIEN(MaNV)
)
go
--Tạo bảng gọi món
create table GOIMON
(
MaK nchar(8) not null,
MaM nchar(5) not null,
foreign key (MaK) references KHACH (MaK),
foreign key (MaM) references MONAN (MaM),
)
go
insert into KHACH
values
(
	'K01',
	N'Nguyễn Thành Nam',
	N'Thanh Hóa',
	'0348403312'
),
(
	'K02',
	N'Nguyễn Thành Long',
	N'Nam Định',
	'0333903625'
),
(
	'K03',
	N'Đỗ Quang Nam',
	N'Thanh Hóa',
	'0114362652'
),
(
	'K04',
	N'Mai Thị Hằng',
	N'Hà Nội',
	null
),
(
	'K05',
	N'Mai Văn Minh',
	N'Nam Định',
	'0356465562'
)
select*from khach
insert into NHANVIEN
values
(
	'NV01',
	N'Nguyễn Quang Minh',
	'2000/2/12',
	N'Hà Nội',
	'0312546985',
	N'Quản lý',
	20000
),
(
	'NV02',
	N'Nguyễn Văn Hải',
	'2002/2/23',
	N'Nam Định',
	'03568981548',
	N'Nhân viên',
	5000
),
(
	'NV03',
	N'Mai Thị Trang',
	'2002/9/12',
	N'Hà Nội',
	'0145785488',
	N'Nhân viên',
	6000
),
(
	'NV04',
	N'Đặng Thành Nam',
	'2001/9/2',
	N'Thanh Hóa',
	'03457784564',
	N'Bảo vệ',
	2500
),
(
	'NV05',
	N'Nguyễn Thị Hồng',
	'2003/12/12',
	N'Nam Định',
	null,
	N'Nhân Viên',
	6000
)
select*from NHANVIEN
insert into MONAN
values
(
	'M001',
	N'Gà quay',
	200
),
(
	'M002',
	N'Gà hấp',
	150
),
(
	'M003',
	N'Bò xào',
	300
),
(
	'M004',
	N'Cá rán',
	100
),
(
	'M005',
	N'Tôm chiên xù',
	100
)
select*from monan
insert into THUCPHAM
values
(
	'TP01',
	N'Cá thu',
	25,
	'Kg',
	500,
	N'Biển Đông',
	'5/12/2021',
	'NV01'
),
(
	'TP02',
	N'Cá Ba Sa',
	30,
	'Kg',
	600,

	N'Biển Đông',
	'2021/5/13',
	'NV02'
),
(
	'TP03',
	N'Thịt Gà',
	50,
	'Kg',
	1000,
	N'Biển Nam',
	'2021/8/23',
	'NV03'
),
(
	'TP04',
	N'Thịt Bò',
	40,	
	'Kg',
	2000,
	N'Biển Tây',
	'2021/7/7',
	'NV03'
),
(
	'TP05',
	N'Thịt Lợn',
	45,
	'Kg',
	1000,
	N'Biển Tây',
	'2021/8/7',
	'NV04'
)
select *from thucpham
insert into goimon
values
(
	'K01',
	'M001'
),
(
	'K01',
	'M003'
),
(
	'K01',
	'M005'
),
(
	'K02',
	'M003'
),
(
	'K03',
	'M004'
)
select *from goimon
insert into HOADON
values
(
	'HD01',
	'2021/5/12',
	700,
	1000,
	300,
	'K01',
	'NV02'
),
(
	'HD02',
	'2021/5/12',
	500,
	500,
	0,
	'K02',
	'NV02'
),
(
	'HD03',
	'2021/7/9',
	300,
	500,
	200,
	'K04',
	'NV03'
)
select*from hoadon
insert into PHUCVU
values
(	'K01',
	'NV01'
),
(	
	'K02',
	'NV01'
),
(	
	'K01',
	'NV02'
),
(	
	'K03',
	'NV03'
),
(	
	'K04',
	'NV04'
)
select *from phucvu
--Đưa ra tất cả các thông tin của nhân viên có tên họ bắt đầu bằng chữ 'Nguyễn'
select*from NHANVIEN
where TenNV like N'Nguyễn%'

--Cho biết nhân viên có lương cao nhất
select TenNV ,luong from NHANVIEN
where luong=(select max(luong) from nhanvien)

--liệt kê những nhân viên có chức vụ là 'Nhân viên'
select *from nhanvien
where chucv = N'Nhân viên'

--Cho biết tuổi của các nhân viên 
select MaNV,TenNV,2021-year(ngaysinh) as Tuoi,DiaC_NV from nhanvien

--Đưa ra những chức vụ có trong nhà hàng
select chucv as ChucVu from nhanvien
group by chucv

--Đưa ra người có lương thấp nhất có chức vụ là 'nhân viên'
select tenNV,luong,ChucV from nhanvien
where luong=(select min(luong) from nhanvien where chucv=N'Nhân viên' group by chucv )

--Đưa ra lương trung bình của các nhân viên trong từng chức vụ
select ChucV,avg(luong) as LuongTb from nhanvien group by chucv

--Cho biết lương cao nhất của nhân viên trong tường chức vụ
select ChucV,max(Luong) as LuongCaoNhat from nhanvien group by chucv

--Đưa ra những nhân viên có lương lớn hơn 5000
select MaNV,TenNV,Luong,ChucV from nhanvien
where luong >5000

--Đưa ra các nhân viên có địa chỉ là 'Hà Nội' mà là quản lý
select tenNV,Diac_NV as DiaChi from nhanvien
where diac_nv = N'Hà Nội' and chucv =N'Quản lý'

--Đưa ra mã, tên, địa chỉ, Chức vụ và số điện thoại của nhân viên có số điện thoại bắt đầu bằng '03'
select MaNV,TenNV,DiaC_NV,SDT_NV from nhanvien
where SDT_NV like '03%'

--Đưa ra tất cả các thông tin của nhân viên sinh vào 2/9/2001
select *from nhanvien
where ngaysinh = '2001/9/2'

--Đưa ra các món ăn có đơn giá nằm trong khoảng từ 150 đến 500
select *from MONAN
where DonGia_M between 150 and 500

--Đưa ra giá tiền trung bình của các món ăn
select avg(dongia_m) as GiaTienTB from monan

select *from THUCPHAM
--Đưa ra các nhà cung cấp thực phẩm cho nhà hàng
select nhaCC from thucpham
group by NhaCC

--Đưa ra các thông tin của thực phẩm mà có nhà cung cấp là 'Biển Đông' và 'Biển Nam'
select *from THUCPHAM
where NhaCC = N'Biển Đông' or NhaCC= N'Biển Nam'

--Đưa ra các thực phẩm không được nhập và tháng 5
select TenTP,KLSD,NhaCC,NgayNhap from THUCPHAM
where MONTH(ngaynhap) not like 5

--Sắp xếp các monan theo thứ tự giảm dần của đơn giá món ăn
select *from monan
order by DonGia_M desc

--Cho biết  tên nhân viên, tên thực phẩm, có mã nhân viên NV01
select nhanvien.MaNV,TenNV, TenTp from thucpham, nhanvien
where nhanvien.MaNV=thucpham.MaNV and nhanvien.MaNV='NV01'

--Cho biết tên thực phẩm, khối lượng sử dụng, đơn giá mà có nhà cung cấp là Biển Tây và có ngày nhập là 7/7/2021
select TenTP,KLSD,DonGia,NhaCC,NgayNhap from thucpham
where nhacc=N'Biển Tây' and NgayNhap='7/7/2021'

--Tăng lương gấp 3 cho tất cả các nhân viên từ nhân viên có chức vụ quản lý
select MaNV,TenNV,ChucV,Luong*3 as LuongTang from nhanvien
where Chucv not like N'Quản Lý'

--Đưa ra các khách đã ăn và thanh toán ngày 12/5/2021
select Khach.MaK,MaHD,TenK,Ngay,TongTien from khach,hoadon
where KHACH.MaK=HOADON.MaK and ngay='2021/5/12'

select*from MONAN
--Cho biết thông tin của nhân viên 'NV03' và thực phẩm mà nhân viên đó đã nhập
select nhanvien.MaNV,TenNV,NgaySinh,TenTP,KLSD,NgayNhap from nhanvien,thucpham
where nhanvien.MaNV=thucpham.MaNV and nhanvien.MaNV='NV03'

--Cho biết tổng tiền mà nhà hàng thu đc từ khi mở cửa hàng
select sum(tongtien) as TongTien from hoadon

--Cho biết tổng tiền mà nhà hàng thu được trong tháng 5/2021
select sum(tongtien) as TongTienTrongThang5 from hoadon
where  MONTH(ngay)like 5

--Cho biết khách hàng 'K01' đã gọi những món ăn gì
select khach.MaK,TenK,TenM,DonGia_M from khach,monan,goimon
where khach.MaK=GOIMON.MaK and GOIMON.MaM=MONAN.MaM and khach.MaK='K01'

--Cho biết món ăn có mã món M003 và M004 được những khách hàng nào gọi
select monan.MaM,TenM,TenK from MONAN,khach,goimon
where (khach.MaK=GOIMON.MaK) and (GOIMON.MaM=MONAN.MaM) and (monan.MaM='M003' or monan.MaM='M004')

--Cho biết số lần các món ăn được gọi
select MaM,count(goimon.mam) as SoLanMonDuocGoi from goimon 
group by goimon.MaM

--Cho biết những nhân viên nào phục vụ cho khách hàng có mã khách là K01
select NV.MaNV,TenNV,K.MaK,TenK from khach K,nhanvien NV,PHUCVU
where K.MaK=PHUCVU.MaK and NV.MaNV=PHUCVU.MaNV and K.MaK='K01'

--Cho biết tên nhân viên,chúc vụ, lương của nhân viên có lương lớn hơn lương trung bình của cả nhân viên
select TenNV ,ChucV,luong from nhanvien
where luong>(select avg(luong) from nhanvien)






