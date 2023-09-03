/*********** Create Table ************/
use UniversityDB

create table Lecture
(
	LectureId nvarchar(10) NOT NULL PRIMARY KEY,
	LectureName nvarchar(50),
	InstructorId nvarchar(10),
	DepartmentId nvarchar(10)
	UNIQUE(LectureId)
)

create table Student 
(
	StudentId nvarchar(10) NOT NULL PRIMARY KEY,	
	StudentName nvarchar(50),
	StudentSurname nvarchar(50),
	StudentAddress nvarchar(50),
	BirthDate date,
	DepartmentId nvarchar(10),
	RegisterDate date,
	GraduationDate date,
	UNIQUE(StudentId)
)

create table Department 
(
	DepartmentId nvarchar(10) NOT NULL PRIMARY KEY,
	DepartmentName nvarchar(50)
	UNIQUE(DepartmentId)
)

create table CareerLevel 
(
	CareerLevelId nvarchar(10) NOT NULL PRIMARY KEY,
	CareerLevelName nvarchar(50),
	UNIQUE(CareerLevelId)
)

create table Instructor
(
	InstructorId nvarchar(10) NOT NULL PRIMARY KEY,
	InstructorName nvarchar(50),
	InstructorSurname nvarchar(50),
	CareerLevelId nvarchar(10),
	DepartmentId nvarchar(10),
	HireDate date,
	UNIQUE(InstructorId)
)

create table LectureTakes 
(
	LectureTakesId int IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	LectureId nvarchar(10),
	StudentId nvarchar(10),
	PeriodLevel int,
)

create table StudentSuccess
(
	StudentSuccessId int IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	StudentId nvarchar(10),
	LectureId nvarchar(10),
	MidtermExam int,
	FinalExam int,
	MakeUpExam int,
	Passed tinyint,
)