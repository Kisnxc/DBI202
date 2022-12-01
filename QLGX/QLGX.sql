create database [dbQLGX]
 ON  PRIMARY 
( NAME = N'dbQLGX', FILENAME = N'C:\Users\Lenovo\Desktop\Spring2022\DBI\dbQLGX.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbQLGX_log', FILENAME = N'C:\Users\Lenovo\Desktop\Spring2022\DBI\dbQLGX_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

--Create tblXeRas
create table tblXeRas (
maRa nvarchar(10) not null check (maRa like 'O[0-9][0-9][0-9][0-9][0-9][0-9]'),
ngayRa date null,
gioRa time null,
soXe nvarchar(15) not null,
maVe nvarchar(10) not null check (maVe like 'T[0-9][0-9][0-9][0-9][0-9][0-9]')
)

--Create tblXeVaos
create table tblXeVaos(
maVao nvarchar(10) not null check (maVao like 'E[0-9][0-9][0-9][0-9][0-9][0-9]'),
ngayVao date null,
gioVao time(7) null,
ghiChu nvarchar(50) null,
soXe nvarchar(15) not null,
maVe nvarchar(10) not null check (maVe like 'T[0-9][0-9][0-9][0-9][0-9][0-9]')
)

--Create tblVes
create table tblVes(
maVe nvarchar(10) not null check (maVe like 'T[0-9][0-9][0-9][0-9][0-9][0-9]')
)

--Create tblPhieuThanhToans
create table tblPhieuThanhToans(
maPhieu nvarchar(10) not null check (maPhieu like 'P[0-9][0-9][0-9][0-9][0-9][0-9]'),
thoiGianGui int null,
tongTien float null,
maRa nvarchar(10) not null check (maRa like 'O[0-9][0-9][0-9][0-9][0-9][0-9]')
)

--Create tblXes
create table tblXes(
soXe nvarchar(15) not null,
tenLoai nvarchar(20) not null
)

--Create tblLoaiXes
create table tblLoaiXes(
tenLoai nvarchar(20) not null,
donGia float null,
choTrong int null
)

--Tạo khóa chính
use dbQLGX
alter table tblXeRas
add primary key(maRa)

alter table tblXeVaos
add primary key(maVao)

--
alter table tblVes
add primary key(maVe)

alter table tblPhieuThanhToans
add primary key(maPhieu)

alter table tblXes
add primary key(soXe)

alter table tblLoaiXes
add primary key(tenLoai)

--Create foreign key
alter table tblXeVaos
with check add constraint FK_tblXeVaos_tblXes
foreign key (soXe)
references tblXes(soXe)

alter table tblXeRas
with check add constraint FK_tblXeRas_tblXes
foreign key (soXe)
references tblXes(soXe)

alter table tblXeRas
with check add constraint FK_tblXeRas_tblVes
foreign key (maVe)
references tblVes(maVe)

alter table tblPhieuThanhToans
with check add constraint FK_tblPhieuThanhToans_tblXeRas
foreign key (maRa)
references tblXeRas(maRa)

alter table tblXeVaos
with check add constraint FK_tblXeVaos_tblVes
foreign key (maVe)
references tblVes(maVe)

alter table tblXes
with check add constraint FK_tblLoaiXes_tblXes
foreign key (tenLoai)
references tblLoaiXes(tenLoai)

--Insert into tblLoaiXes
insert into tblLoaiXes(tenLoai, donGia, choTrong)
values
(N'Xe máy', 1000, 500),
(N'Xe tải', 10000, 50),
(N'Xe buýt', 10000, 50),
(N'Xe container',15000, 20)

--Insert to tblXes
insert into tblXes (soXe, tenLoai)
values 
('59S3-884.25', N'Xe máy'),
('53E1-180.69', N'Xe máy'),
('61A3-839.54', N'Xe máy'),
('79S3-754.43', N'Xe máy'),
('59N7-664.54', N'Xe máy'),
('93H1-209.67', N'Xe máy'),
('91Y2-609.13', N'Xe máy'),
('90E4-298.96', N'Xe máy'),
('93R9-398.30', N'Xe máy'),
('72H6-611.66', N'Xe máy'),
('66P6-666.38', N'Xe máy'),
('93Z4-429.71', N'Xe máy'),
('73C8-121.87', N'Xe máy'),
('63L2-316.40', N'Xe máy'),
('53H-602.57', N'Xe tải'),
('93H-382.91', N'Xe tải'),
('86F-602.93', N'Xe tải'),
('63A-437.63', N'Xe tải'),
('93K-867.98', N'Xe tải'),
('77H-696.28', N'Xe tải'),
('61T-942.76', N'Xe buýt'),
('61B-769.42', N'Xe buýt'),
('53F-665.83', N'Xe buýt'),
('51A-908.97', N'Xe buýt'),
('80A-239.17', N'Xe container'),
('79A-384.85', N'Xe container'),
('66A-684.22', N'Xe container'),
('21A-569.42', N'Xe container'),
('72A-539.64', N'Xe container')

--Insert into tblVes
insert into tblVes(maVe) 
values 
('T123450'),
('T123451'),
('T123452'),
('T123453'),
('T123454'),
('T123455'),
('T123456'),
('T123457'),
('T123458'),
('T123459'),
('T123460'),
('T123461'),
('T123462'),
('T123463'),
('T123464'),
('T123465'),
('T123466'),
('T123467'),
('T123468'),
('T123469'),
('T123470'),
('T123471'),
('T123472'),
('T123473'),
('T123474'),
('T123475'),
('T123476'),
('T123477'),
('T123478'),
('T123479'),
('T123480'),
('T123481'),
('T123482'),
('T123483'),
('T123484'),
('T123485'),
('T123486'),
('T123487'),
('T123488'),
('T123489'),
('T123490'),
('T123491'),
('T123492'),
('T123493'),
('T123494'),
('T123495'),
('T123496'),
('T123497'),
('T123498'),
('T123499'),
('T123500'),
('T123501'),
('T123502'),
('T123503'),
('T123504'),
('T123505'),
('T123506')

--Insert into tblXeVaos
insert into tblXeVaos (maVao,ngayVao,gioVao,ghiChu,maVe,soXe)
values
('E123450','2022-02-19','5:30','','T123450','59S3-884.25'),
('E123451','2022-02-19','6:30','','T123451','53H-602.57'),
('E123452','2022-02-19','6:40','','T123452','53E1-180.69'),
('E123453','2022-02-19','9:00','','T123453','77H-696.28'),
('E123454','2022-02-19','12:10','','T123454','61B-769.42'),
('E123455','2022-02-19','15:30','','T123455','93Z4-429.71'),
('E123456','2022-02-19','17:00','','T123456','59N7-664.54'),
('E123457','2022-02-19','18:00','','T123457','66P6-666.38'),
('E123458','2022-02-19','18:30','','T123458','80A-239.17'),
('E123459','2022-02-19','19:00','','T123459','63L2-316.40'),
('E123460','2022-02-19','20:00','','T123460','91Y2-609.13'),
('E123461','2022-02-19','22:30','','T123461','86F-602.93'),
('E123462','2022-02-19','23:40','','T123462','61T-942.76'),
('E123463','2022-02-20','5:00','','T123463','79S3-754.43'),
('E123464','2022-02-20','6:30','','T123464','93K-867.98'),
('E123465','2022-02-20','8:50','','T123465','66P6-666.38'),
('E123466','2022-02-20','11:30','','T123466','66A-684.22'),
('E123467','2022-02-20','12:30','','T123467','61T-942.76'),
('E123468','2022-02-20','12:30','','T123468','21A-569.42'),
('E123469','2022-02-20','14:00','','T123469','86F-602.93'),
('E123470','2022-02-20','14:30','','T123470','61A3-839.54'),
('E123471','2022-02-20','17:00','','T123471','51A-908.97'),
('E123472','2022-02-20','19:30','','T123472','72A-539.64'),
('E123473','2022-02-20','20:00','','T123473','53H-602.57'),
('E123474','2022-02-20','22:20','','T123474','93H-382.91'),
('E123475','2022-02-20','22:30','','T123475','66A-684.22'),
('E123476','2022-02-20','23:30','','T123476','53E1-180.69'),
('E123477','2022-02-21','6:30','','T123477','90E4-298.96'),
('E123478','2022-02-21','7:00','','T123478','59S3-884.25'),
('E123479','2022-02-21','9:20','','T123479','93Z4-429.71'),
('E123480','2022-02-21','10:20','','T123480','86F-602.93'),
('E123481','2022-02-21','15:30','','T123481','51A-908.97'),
('E123482','2022-02-21','16:00','','T123482','77H-696.28'),
('E123483','2022-02-21','18:30','','T123483','63A-437.63'),
('E123484','2022-02-21','20:00','','T123484','53F-665.83'),
('E123485','2022-02-21','21:30','','T123485','91Y2-609.13'),
('E123486','2022-02-21','22:00','','T123486','93H1-209.67'),
('E123487','2022-02-21','23:10','','T123487','90E4-298.96'),
('E123488','2022-02-22','6:00','','T123488','72A-539.64'),
('E123489','2022-02-22','8:30','','T123489','73C8-121.87'),
('E123490','2022-02-22','12:30','','T123490','59S3-884.25'),
('E123491','2022-02-22','15:40','','T123491','93Z4-429.71'),
('E123492','2022-02-22','20:30','','T123492','79S3-754.43'),
('E123493','2022-02-23','5:30','','T123493','61T-942.76'),
('E123494','2022-02-23','6:30','','T123494','91Y2-609.13'),
('E123495','2022-02-23','7:10','','T123495','93K-867.98'),
('E123496','2022-02-23','11:30','','T123496','79A-384.85'),
('E123497','2022-02-23','17:40','','T123497','66A-684.22'),
('E123498','2022-02-23','19:00','','T123498','72H6-611.66'),
('E123499','2022-02-23','19:10','','T123499','59S3-884.25'),
('E123500','2022-02-23','22:30','','T123500','79S3-754.43'),
('E123501','2022-02-24','8:10','','T123501','59S3-884.25'),
('E123502','2022-02-24','12:30','','T123502','93R9-398.30'),
('E123503','2022-02-24','19:30','','T123503','61T-942.76'),
('E123504','2022-02-24','23:30','','T123504','79A-384.85'),
('E123505','2022-02-25','10:10','','T123505','90E4-298.96'),
('E123506','2022-02-26','22:00','','T123506','93H1-209.67')


--Insert into tblXeRas
insert into tblXeRas(maRa,ngayRa,gioRa,maVe,soXe)
values
('O123450','2022-02-19','9:30','T123452','53E1-180.69'),
('O123451','2022-02-19','11:00','T123450','59S3-884.25'),
('O123452','2022-02-19','18:00','T123456','59N7-664.54'),
('O123453','2022-02-19','18:30','T123455','93Z4-429.71'),
('O123454','2022-02-19','19:00','T123451','53H-602.57'),
('O123455','2022-02-19','19:20','T123454','61B-769.42'),
('O123456','2022-02-20','6:00','T123453','77H-696.28'),
('O123457','2022-02-20','7:30','T123457','66P6-666.38'),
('O123458','2022-02-20','7:30','T123459','63L2-316.40'),
('O123459','2022-02-20','8:00','T123458','80A-239.17'),
('O123460','2022-02-20','8:30','T123460','91Y2-609.13'),
('O123461','2022-02-20','12:00','T123461','86F-602.93'),
('O123462','2022-02-20','13:00','T123463','79S3-754.43'),
('O123463','2022-02-20','14:00','T123465','66P6-666.38'),
('O123464','2022-02-20','17:00','T123462','61T-942.76'),
('O123465','2022-02-20','20:00','T123464','93K-867.98'),
('O123466','2022-02-20','21:00','T123466','66A-684.22'),
('O123467','2022-02-21','2:00','T123468','21A-569.42'),
('O123468','2022-02-21','3:00','T123469','86F-602.93'),
('O123469','2022-02-21','6:00','T123467','61T-942.76'),
('O123470','2022-02-21','6:00','T123470','61A3-839.54'),
('O123471','2022-02-21','6:30','T123471','51A-908.97'),
('O123472','2022-02-21','7:00','T123474','93H-382.91'),
('O123473','2022-02-21','8:00','T123475','66A-684.22'),
('O123474','2022-02-21','8:10','T123472','72A-539.64'),
('O123475','2022-02-21','9:00','T123473','53H-602.57'),
('O123476','2022-02-21','12:00','T123476','53E1-180.69'),
('O123477','2022-02-21','12:40','T123477','90E4-298.96'),
('O123478','2022-02-21','13:10','T123480','86F-602.93'),
('O123479','2022-02-21','15:00','T123478','59S3-884.25'),
('O123480','2022-02-21','17:30','T123479','93Z4-429.71'),
('O123481','2022-02-21','20:00','T123483','63A-437.63'),
('O123482','2022-02-21','21:00','T123482','77H-696.28'),
('O123483','2022-02-22','2:00','T123481','51A-908.97'),
('O123484','2022-02-22','4:30','T123484','53F-665.83'),
('O123485','2022-02-22','6:00','T123485','91Y2-609.13'),
('O123486','2022-02-22','8:00','T123487','90E4-298.96'),
('O123487','2022-02-22','10:20','T123488','72A-539.64'),
('O123488','2022-02-22','12:00','T123489','73C8-121.87'),
('O123489','2022-02-22','18:00','T123491','93Z4-429.71'),
('O123490','2022-02-22','20:10','T123490','59S3-884.25'),
('O123491','2022-02-23','6:00','T123492','79S3-754.43'),
('O123492','2022-02-23','8:30','T123493','61T-942.76'),
('O123493','2022-02-23','12:00','T123494','91Y2-609.13'),
('O123494','2022-02-23','13:00','T123496','79A-384.85'),
('O123495','2022-02-23','14:00','T123495','93K-867.98'),
('O123496','2022-02-24','5:10','T123498','72H6-611.66'),
('O123497','2022-02-24','6:00','T123497','66A-684.22'),
('O123498','2022-02-24','11:40','T123486','93H1-209.67'),
('O123499','2022-02-24','15:00','T123499','59S3-884.25'),
('O123500','2022-02-24','20:30','T123500','93R9-398.30')

--Insert into tblPhieuThanhToans
insert into tblPhieuThanhToans(maPhieu,maRa)
values 
('P123450','O123450'),
('P123451','O123451'),
('P123452','O123452'),
('P123453','O123453'),
('P123454','O123454'),
('P123455','O123455'),
('P123456','O123456'),
('P123457','O123457'),
('P123458','O123458'),
('P123459','O123459'),
('P123460','O123460'),
('P123461','O123461'),
('P123462','O123462'),
('P123463','O123463'),
('P123464','O123464'),
('P123465','O123465'),
('P123466','O123466'),
('P123467','O123467'),
('P123468','O123468'),
('P123469','O123469'),
('P123470','O123470'),
('P123471','O123471'),
('P123472','O123472'),
('P123473','O123473'),
('P123474','O123474'),
('P123475','O123475'),
('P123476','O123476'),
('P123477','O123477'),
('P123478','O123478'),
('P123479','O123479'),
('P123480','O123480'),
('P123481','O123481'),
('P123482','O123482'),
('P123483','O123483'),
('P123484','O123484'),
('P123485','O123485'),
('P123486','O123486'),
('P123487','O123487'),
('P123488','O123488'),
('P123489','O123489'),
('P123490','O123490'),
('P123491','O123491'),
('P123492','O123492'),
('P123493','O123493'),
('P123494','O123494'),
('P123495','O123495'),
('P123496','O123496'),
('P123497','O123497'),
('P123498','O123498'),
('P123499','O123499'),
('P123500','O123500')


update tblPhieuThanhToans 
set thoiGianGui = 
(select  DATEDIFF(hour, cast(vao.ngayvao as DATETIME) +  cast(vao.gioVao as DATETIME),
						cast(ra.ngayra as DATETIME) +  cast(ra.gioRa as DATETIME)) 
from tblXeVaos vao
join tblXeRas  ra
on vao.maVe = ra.maVe
where tblPhieuThanhToans.maRa = ra.maRa
) 

update  tblPhieuThanhToans 
set tongTien = (select tblPhieuThanhToans.thoiGianGui*loai.donGia
from tblXeRas ra
join tblXes xe
on xe.soXe = ra.soXe
join tblLoaiXes loai
on loai.tenLoai = xe.tenLoai
where tblPhieuThanhToans.maRa = ra.maRa)

--Kiểm tra còn chỗ trống không
go 
create procedure spCheckChoTrong
@tenLoai nvarchar (20)
as
declare @socho int
select @socho = loaixe.choTrong
from tblLoaiXes loaixe
where loaixe.tenLoai like @tenLoai
if ( exists (select*
	from tblLoaiXes loaixe
	where loaixe.tenLoai like @tenLoai))
begin 
	if (@socho >= 1)
		begin
			print N'Còn chỗ cho' print @tenLoai
		end
	else 
		begin
			print N'Hết chỗ cho' print @tenLoai
		end
end
else 
begin
	print N'Loại xe không hợp lệ'
end

exec spCheckChoTrong N'Xe Tải'


-- Kiểm tra xe ra có hợp lệ không
go
create procedure spCheckXeRa
@ve nvarchar(10),
@soXe nvarchar(15)
as 
if (exists (select*
			from tblXeVaos vao
			where(vao.maVe = @ve and vao.soXe = @soXe)))
begin
	print N'Vé và xe hợp lệ'
end
else 
begin
	print N'Vé và xe không hợp lệ'
end 

exec spCheckXeRa 'T123456','59N7-664.54'



--Tính tiền khi xe ra
go 
create procedure spTinhTien
@ve nvarchar(10)
as
if (exists (select *
			from tblXeVaos vao			
 			where vao.maVe = @ve and vao.maVe not in (select tblXeRas.maVe from tblXeRas)))
begin
	print N'Số tiền của vé' 
	select vao.maVe,DATEDIFF(hour, cast(vao.ngayvao as DATETIME) +  cast(vao.gioVao as DATETIME),
						GETDATE()) * loaixe.donGia as N'Thành Tiền'
			from tblXeVaos vao
			inner join tblXes xe
			on vao.soXe = xe.soXe
			inner join tblLoaiXes loaixe
			on loaixe.tenLoai = xe.tenLoai
			where vao.maVe = @ve
end
else
begin
	print N'Mã vé không hợp lệ'
end

exec spTinhTien 'T123506'