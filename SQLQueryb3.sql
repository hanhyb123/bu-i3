
CREATE TABLE PHONGBAN(
	MaPhg varchar(2) PRIMARY KEY  ,
	TenPhg nvarchar(20)
)
CREATE TABLE NHANVIEN(
	MaNV varchar(9) PRIMARY KEY  ,
	HoNV nvarchar(15),
	TenLot nvarchar(30),
	TenNV nvarchar(30),
	NgSinh smalldatetime,
	Diachi nvarchar(150),
	Phai nvarchar(3),
	Luong numeric(18,0),
	Phong varchar(2) FOREIGN KEY REFERENCES PHONGBAN(MaPhg)
)
CREATE TABLE DEAN(
	MaDA varchar(2) PRIMARY KEY  ,
	TenDA nvarchar(50),
	DDiemDA varchar(20)
)
CREATE TABLE PHANCONG(
	MaNV varchar(9) FOREIGN KEY REFERENCES NHANVIEN(MaNV)  ,
	MaDA varchar(2) FOREIGN KEY REFERENCES DEAN(MaDA)  ,
	ThoiGian numeric(18,0)
	PRIMARY KEY(MaNV, MaDA)
)
CREATE TABLE THANNHAN(
	MaNV varchar(9) FOREIGN KEY REFERENCES NHANVIEN(MaNV)  ,
	TenTN varchar(20),
	NgaySinh smalldatetime,
	Phai nvarchar(3),
	QuanHe varchar(15)
	PRIMARY KEY(MaNV, TenTN)
)

ALTER TABLE PHONGBAN
ALTER COLUMN TenPhg nvarchar(30)

ALTER TABLE DEAN
ALTER COLUMN DDiemDA nvarchar(20)

ALTER TABLE THANNHAN
ALTER COLUMN TenTN nvarchar(20)

ALTER TABLE THANNHAN
ALTER COLUMN Phai nvarchar(3)

ALTER TABLE THANNHAN
ALTER COLUMN QuanHe nvarchar(15)

ALTER TABLE NHANVIEN
ADD SoDienThoai varchar(15)

ALTER TABLE NHANVIEN
DROP COLUMN SoDienThoai

INSERT INTO PHONGBAN VALUES ('1' ,N'Quản lý'), ('4' ,N'Điều hành'), ('5' ,N'Nghiên cứu')

INSERT INTO NHANVIEN
VALUES('123', N'Đinh', N'Bá', N'Tiến', '1982-2-27', N'Mộ Đức', N'Nam', NULL, '4'),
('234', N'Nguyễn', N'Thanh', N'Tùng', '1956-8-12', N'Sơn Tịnh', N'Nam', NULL, '5'),
('345', N'Bùi', N'Thúy', N'Vũ', NULL, N'Tư Nghĩa', N'Nữ', NULL, '5'),
('456', N'Lê', N'Thị', N'Nhàn', '1962-7-12', N'Mộ Đức', N'Nữ', NULL, '4'),
('567', N'Nguyễn', N'Mạnh', N'Hùng', '1985-3-25', N'Sơn Tịnh', N'Nam', NULL, '5'),
('678', N'Trần', N'Hồng', N'Quang', NULL, N'Bình Sơn', N'Nam', NULL, '5'),
('789', N'Trần', N'Thanh', N'Tâm', '1972-6-17', N'Tp Quãng Ngãi', N'Nam', NULL, '5'),
('890', N'Cao', N'Thanh', N'Huyền', NULL, N'Tư Nghĩa', N'Nữ', NULL, '1'),
('901', N'Vương', N'Ngọc', N'Quyền', '1987-12-12', N'Mộ Đức', N'Nam', NULL, '1')

INSERT INTO DEAN
VALUES ('1', N'Nâng cao chất lượng muối', N'Sa Huỳnh'),
('10', N'Xây dựng nhà máy chế biến thủy sản', N'Dung Quất'),
('2', N'Phát triển hạ tầng mạng', N'Tp Quảng Ngãi'),
('20', N'Truyền tải cáp quang', N'Tp Quảng Ngãi'),
('3', N'Tin học hóa trường học', N'Ba Tơ'),
('30', N'Đào tạo nhân lực', N'Tịnh Phong')

INSERT INTO THANNHAN
VALUES ('123' ,N'Châu' ,'2005-10-30', N'Nữ' ,N'Con gái'),
('123',N'Duy','2001-10-25',N'Nam',N'Con trai'),
('123' ,N'Phương','1985-10-30',N' Nữ',N'Vợ chồng'),
('234',N'Thanh ','1980-04-05',N'Nữ',N'Con gái'),
('345',N'Dương ','1956-10-30',N'Nam',N'Vợ chồng'),
('345' ,N'Khang ','1982-10-25',N'Nam',N'Con trai'),
('456',N'Hùng','1987-01-01', N'Nam',N'Con trai'),
('901',N'Thương','1989-04-05', N' Nữ ',N'Vợ chồng')

INSERT INTO PHANCONG
VALUES ('123', '1', '33'),
	('123', '2', '8'),
	('345', '10', '10'),
	('345', '20', '10'),
	('345', '3', '10'),
	('456', '1', '20'),
	('456', '2', '20'),
	('678', '3', '40'),
	('789', '10', '35'),
	('789', '20', '30'),
	('789', '30', '5')

1.
select HoNV,TenLot,TenNV
from NHANVIEN
2.
select HoNV,TenLot,TenNV,Phong
from NHANVIEN
where Phong = 5
3.
select HoNV,TenLot,TenNV,Phong,Luong
from NHANVIEN
where Luong > 6000000
4.
select HoNV,TenLot,TenNV,Phong,Luong
from NHANVIEN
where Luong > 6500000 and Phong = 1 or Luong > 5000000 and Phong = 4
5.
select  HoNV,TenLot,TenNV
from NHANVIEN
where DiaChi = 'Tp Quảng Ngãi'
6.
select HoNV,TenLot,TenNV
from NHANVIEN
where HoNV like 'N%'
7.
select NgSinh,DiaChi
from NHANVIEN
where HoNV = 'Cao' and TenLot = 'Thanh' and TenNV = 'Huyền'
8.
select HoNV,TenLot,TenNV,NgSinh
from NHANVIEN
where year (NgSinh) between 1955 and 1975 
9.
select HoNV,TenLot,TenNV,NgSinh as'ho ten', YEAR (NgSinh) as 'Năm Sinh'
from NHANVIEN
10.
select HoNV,TenLot,TenNV,NgSinh
from NHANVIEN
where (2023 - YEAR(NgSinh)) as 'tuổi'
11.
select  HoNV,TenLot,TenNV,TenPhg
from PHONGBAN, NHANVIEN
where TenPhg = 'Trưởng Phòng Ban'
12.
select  HoNV,TenLot,TenNV,Diachi
from NHANVIEN
where TenPhg = 'Điều Hành'
13.
select TENDA, TENPHG, HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ và tên', 'Ngày Nhận Chức'	 
from NHANVIEN inner join PHONGBAN 
ON NHANVIEN.Phong = PHONGBAN.MaPhg 
inner join DEAN ON DEAN.TenDA = PHONGBAN.MAPHG
where PHONGBAN.MaPhg = NHANVIEN.MANV and Diachi like '%Tp Quảng Ngãi'
14.
select HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ và tên', TENTN as 'Tên người thân' 
from NHANVIEN inner join THANNHAN ON NHANVIEN.MANV = THANNHAN.MA_NVIEN
where NHANVIEN.PHAI = N'Nữ'
15.
select NV.HONV + ' ' + NV.TENLOT + ' ' + NV.TENNV as 'Họ và tên nhân viên', QL.HONV+ ' ' + QL.TENLOT + ' ' + QL.TENNV as 'Họ và tên quản lí'
from NHANVIEN NV,NHANVIEN QL
where NV.MA_NQL = QL.MANV
16.
select HONV+ ' ' + TENLOT + ' ' + TENNV as 'Họ và tên' 
from NHANVIEN inner join DEAN ON NHANVIEN.PHG = DEAN.PHONG
where DEAN.TENDA= 'Xây dựng nhà máy chế biến thủy sản'
17.
select TENDA as 'Tên đề án'
from NHANVIEN inner join DEAN ON NHANVIEN.PHG = DEAN.PHONG
where NHANVIEN.HONV = N'Trần' and NHANVIEN.TENLOT = N'Thanh' and NHANVIEN.TENNV = N'Tâm'


