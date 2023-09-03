/*********** Insert Data ************/
use UniversityDB

-- Lectures
insert into dbo.Lecture values ('BIL-107', 'Algoritma ve Programlama', 'A001', 'M001')
insert into dbo.Lecture values ('BIL-109', 'Bilgisayar Mühendisliðine Giriþ', 'C003', 'M001')
insert into dbo.Lecture values ('BIL-104', 'Programlama Dilleri I', 'B003', 'M001')
insert into dbo.Lecture values ('BIL-106', 'Grafik ve Animasyon', 'C003', 'M001')
insert into dbo.Lecture values ('FIZ-145', 'Fizik I', 'B015', 'FE01')
insert into dbo.Lecture values ('FIZ-146', 'Fizik II', 'B015', 'FE01')
insert into dbo.Lecture values ('BIL-214', 'Programlama Dilleri II', 'B003', 'M001')
select * from Lecture

-- Students
insert into dbo.Student values ('2014', 'Atakan', 'Turgut', 'DENÝZLÝ', '2001-12-12', 'M001', '2020-09-01', NULL)
insert into dbo.Student values ('2201', 'Muzaffer Furkan', 'Üvenç', 'KAYSERÝ', '2003-01-24', 'M001', '2022-09-01', NULL)
insert into dbo.Student values ('2002', 'Yaðmur', 'Soydan', 'AYDIN', '2002-07-18', 'FE01', '2020-09-01', NULL)
insert into dbo.Student values ('1811', 'Fatih', 'Demirci', 'ISPARTA', '1997-09-17', 'FE01', '2018-08-15', '2023-06-24')
insert into dbo.Student values ('1608', 'Hasan', 'Neceali', 'IRAK', '1994-11-06', 'M001', '2016-08-28', '2020-06-15')
insert into dbo.Student values ('1905', 'Ali', 'Gülmez', 'ANKARA', '1999-03-12', 'M002', '2019-09-20', '2023-06-24')
select * from Student

-- Departments
insert into dbo.Department values ('M001', 'Bilgisayar Mühendisliði')
insert into dbo.Department values ('M003', 'Endüstri Mühendisliði')
insert into dbo.Department values ('M002', 'Elektrik Elektronik Mühendisliði')
insert into dbo.Department values ('FE01', 'Fizik')
select * from Department

-- CareerLevels
insert into dbo.CareerLevel values ('A000', 'Prof. Dr.')
insert into dbo.CareerLevel values ('B000', 'Doç. Dr.')
insert into dbo.CareerLevel values ('C000', 'Yrd. Dr.')
select * from CareerLevel

-- Instructors
insert into dbo.Instructor values ('A001', 'Ýsmail', 'Eryýlmaz', 'A000', 'M001', '2005-09-09')
insert into dbo.Instructor values ('A007', 'Ýlhan', 'Öcal', 'A000', 'M002', '2007-10-10')
insert into dbo.Instructor values ('B003', 'Burcu', 'Akkaleli', 'C000', 'M003', '2020-06-06')
insert into dbo.Instructor values ('C003', 'Bilge', 'Üvenç', 'C000', 'FE01', '2019-02-02')
insert into dbo.Instructor values ('B015', 'Yunus Ali', 'Yýldýrým', 'B000', 'FE01', '2022-05-05')
select * from Instructor


