# 1.Hiển thị danh sách sinh viên gồm các thông tin sau: Masv, HoSV, TenSV, NgaySinh,
# GioiTinh
use QLSV;

select *
from SINHVIEN;

update SINHVIEN
set GioiTinh = 1
where GioiTinh = 'Nam'
;

update SINHVIEN
set GioiTinh = 2
where GioiTinh = 'Nữ'
;

select TenSV,
       GioiTinh,
       case
           when GioiTinh = 1 then 'Nam'
           when GioiTinh = 2 then 'Nu'
           end
           as gioitinh
from SINHVIEN
;

select MaSV, HoSV, TenSV, NgaySinh, GioiTinh, MaKH, HocBong
from SINHVIEN
order by MaKH asc, MaSV desc;

select KETQUA.MaSV, HoSV, TenSV, MaMH, Diem
from KETQUA,
     SINHVIEN
where KETQUA.MaSV = SINHVIEN.MaSV;



update SINHVIEN
set HocBong = HocBong + 5000
where MaKH = 'TH';

select *
from SINHVIEN
         left join DMKHOA on SINHVIEN.MaKH = DMKHOA.MaKH
where SINHVIEN.HoSV like 'Trần%'
  and DMKHOA.TenKhoa = 'Anh văn';

select *
from SINHVIEN
         join (select * from DMKHOA where TenKhoa = 'Anh văn') as k
              on k.MaKH = SINHVIEN.MaKH
where SINHVIEN.HoSV like 'Trần%';

update SINHVIEN
set HocBong = 5000
where HocBong is null;

update SINHVIEN
set HocBong = ifnull(HocBong, 0) + 500
where MaKH in (select MaKH from DMKHOA where TenKhoa = 'Tin Học');

select substring(NgaySinh,4,2) as namsinh,NgaySinh from SINHVIEN
where right(NgaySinh,2) between '70' and '75';

