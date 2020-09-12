use ThucTap;

#7. Đưa ra tên khoa, số lượng sinh viên của mỗi khoa

select Tenkhoa,count(*) from TBLKhoa
join TBLSinhVien on TBLKhoa.Makhoa = TBLSinhVien.Makhoa
group by TBLSinhVien.Makhoa;

# 8.Cho biết thông tin về các sinh viên thực tập tại quê nhà

select Hotensv,Quequan,Noithuctap from TBLSinhVien
left join TBLDeTai on TBLSinhVien.Quequan = TBLDeTai.Noithuctap;

# 9.Hãy cho biết thông tin về những sinh viên chưa có điểm thực tập

select Hotensv,KetQua from TBLSinhVien
left join TBLHuongDan on TBLHuongDan.Masv = TBLSinhVien.Masv
where KetQua is null;

# 10.Đưa ra danh sách gồm mã số, họ tên các sinh viên có điểm thực tập bằng 0

select TBLHuongDan.Masv,Hotensv,KetQua from TBLSinhVien
left join TBLHuongDan on TBLHuongDan.Masv = TBLSinhVien.Masv
where KetQua = 0;