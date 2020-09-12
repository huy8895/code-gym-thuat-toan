create database QLSV;

use QLSV;

create table DMKHOA
(
    MaKH    varchar(6) primary key,
    TenKhoa varchar(30)
);

create table SINHVIEN
(
    MaSV     Varchar(6),
    HoSV     Varchar(30),
    TenSV    Varchar(15),
    GioiTinh Char(1),
    NgaySinh DateTime,
    NoiSinh  Varchar(50),
    DiaChi   Varchar(50),
    MaKH     Varchar(6),
    HocBong  Int
);

create table MONHOC
(
    MaMH varchar(6) primary key ,
    TenMH Text(50),
    SoTiet Int
);

create table KETQUA(
    MaSV varchar(6) ,
    MaMH varchar(6) ,
    Diem Int,
    constraint primary key (MaSV,MaMH)
);

