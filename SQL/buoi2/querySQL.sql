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

select substring(NgaySinh, 4, 2) as namsinh, NgaySinh
from SINHVIEN
where right(NgaySinh, 2) between '70' and '75';

select DMKHOA.TenKhoa, TenMH, Diem, KETQUA.MaSV/*-- ,avg(Diem) as diemtrungbinh*/
from DMKHOA,
     SINHVIEN,
     KETQUA,
     MONHOC
where DMKHOA.MaKH = SINHVIEN.MaKH
  and SINHVIEN.MaSV = KETQUA.MaSV
  and MONHOC.MaMH = KETQUA.MaMH
group by DMKHOA.TenKhoa, TenMH;

select DMKHOA.TenKhoa, TenMH, Diem, KETQUA.MaSV/*-- ,avg(Diem) as diemtrungbinh*/
from DMKHOA
         join SINHVIEN
         join KETQUA
         join MONHOC
              on DMKHOA.MaKH = SINHVIEN.MaKH
                  and SINHVIEN.MaSV = KETQUA.MaSV
                  and MONHOC.MaMH = KETQUA.MaMH
group by DMKHOA.TenKhoa, TenMH;

select TenKhoa, MaSV
from DMKHOA
         left join SINHVIEN S on DMKHOA.MaKH = S.MaKH;

select KETQUA.MaSV, avg(Diem) as diemtrung
from SINHVIEN,
     KETQUA
where KETQUA.MaSV = SINHVIEN.MaSV
group by KETQUA.MaSV;


select MaSV, avg(Diem)
from KETQUA
group by MaSV;

update SINHVIEN
set HocBong = ifnull(HocBong, 0) + 10000
where MaSV in (select MaSV
               from (select MaSV, avg(Diem) a
                     from KETQUA
                     group by MaSV
                     order by a desc
                    )
               limit 1);

select MaSV
from KETQUA
group by MaSV
order by avg(Diem) desc
limit 1;

with a as (select MaSV
           from KETQUA
           group by MaSV
           order by avg(Diem) desc
           limit 1)
update SINHVIEN
set HocBong = ifnull(HocBong, 0) + 10000
where MaSV in (select * from a);

use QLSV;

# cap nhat diem cua sv thuoc khoa anh van them 0,5 diem cho nhung ban < 9 diem.

create procedure capnhatdiem()
begin
    update KETQUA
    set Diem = Diem + 1
    where MaSV
        in (select SINHVIEN.MaSV
            from DMKHOA,
                 SINHVIEN
            where TenKhoa = 'Anh văn'
              and DMKHOA.MaKH = SINHVIEN.MaKH)
      and Diem < 9;
end;

call capnhatdiem();

create procedure cursor_capnhatdiem()
begin
    DECLARE bDone INT;
    declare MaSV_DIEM varchar(255);
    declare diem_id cursor for (select distinct SINHVIEN.MaSV as MaSV_DIEM
                                from SINHVIEN,
                                     DMKHOA
                                where DMKHOA.MaKH = SINHVIEN.MaKH
                                  and TenKhoa = 'Anh văn');
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET bDone = 1;
    OPEN diem_id;
    SET bDone = 0;
    REPEAT
        FETCH diem_id INTO MaSV_DIEM;
        update KETQUA set Diem = Diem + 1 where MaSV = MaSV_DIEM;
    UNTIL 2 END REPEAT;
    CLOSE diem_id;
end;

call cursor_capnhatdiem();

