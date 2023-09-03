/*********** Update Table ************/
-- Add FOREIGN KEY for tables.

ALTER TABLE StudentSuccess ADD CONSTRAINT FKStuSuc
	FOREIGN KEY(StudentId) REFERENCES Student(StudentId)

ALTER TABLE StudentSuccess ADD CONSTRAINT FKLecSuc
	FOREIGN KEY(LectureId) REFERENCES Lecture(LectureId)
--
ALTER TABLE Student ADD CONSTRAINT FKDepStu
	FOREIGN KEY(DepartmentId) REFERENCES Department(DepartmentId)
--
ALTER TABLE LectureTakes ADD CONSTRAINT FKLecTake
	FOREIGN KEY(LectureId) REFERENCES Lecture(LectureId)

ALTER TABLE LectureTakes ADD CONSTRAINT FKStuTake
	FOREIGN KEY(StudentId) REFERENCES Student(StudentId)
--
ALTER TABLE Lecture ADD CONSTRAINT FKInsLec
	FOREIGN KEY(InstructorId) REFERENCES Instructor(InstructorId)

ALTER TABLE Lecture ADD CONSTRAINT FKDepLec
	FOREIGN KEY(DepartmentId) REFERENCES Department(DepartmentId)
--
ALTER TABLE Instructor ADD CONSTRAINT FKCarIns
	FOREIGN KEY(CareerLevelId) REFERENCES CareerLevel(CareerLevelId)

ALTER TABLE Instructor ADD CONSTRAINT FKDepIns
	FOREIGN KEY(DepartmentId) REFERENCES Department(DepartmentId)