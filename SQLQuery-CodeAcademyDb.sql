CREATE DATABASE CodeAcademyDb

USE CodeAcademyDb

CREATE TABLE Groups
(
Id INT PRIMARY KEY IDENTITY,
GroupNo NVARCHAR(10) NOT NULL,
)

SELECT * FROM Groups

INSERT INTO Groups
VALUES('P132'),
('P303'),
('P102'),
('P201')

CREATE TABLE Students
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(20) NOT NULL,
Surname NVARCHAR(30) NOT NULL,
GroupId INT FOREIGN KEY REFERENCES Groups(Id)
)

SELECT * FROM Students

INSERT INTO Students
VALUES('Yusif','Huseynzade',1),
('Hesen','Hemidov',2),
('Nazim','Hebibli',3),
('Niyazi','Musayev',4),
('Ilqar','Tehmazov',1),
('Senan','Ibrahimov',2),
('Changir','Cahangirli',3),
('Hemide','Eliyeva',4),
('Abbas','Abbasov',1),
('Murad','Muradov',2),
('Nurlan','Esgerli',3),
('Gulnar','Seydayev',4)

SELECT Id, CONCAT(Name,' ',Surname) AS 'FullName' From Students

SELECT Students.Id, CONCAT(Name,' ',Surname) AS 'FullName',
GroupNo FROM Students
JOIN Groups ON Students.GroupId=Groups.Id

SELECT Students.Id, Students.Name, Students.Surname,
GroupNo FROM Students
JOIN Groups ON Students.GroupId=Groups.Id

SELECT * FROM Students
JOIN Groups ON Students.GroupId=Groups.Id

CREATE TABLE Subjects
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(20) NOT NULL,
)

SELECT * FROM Subjects

INSERT INTO Subjects
VALUES('Front-End'),
('Marketing'),
('Back-End'),
('Qrafik Design'),
('Interyer Design')

CREATE TABLE Exams
(
Id INT PRIMARY KEY IDENTITY,
Date DATETIME2 NOT NULL,
SubjectId INT FOREIGN KEY REFERENCES Subjects(Id)
)

SELECT * FROM Exams

INSERT INTO Exams
VALUES(DATEADD(DAY,-1,GETDATE()),1),
('2022.11.17',2),
('2022.11.19',3)

SELECT * FROM Exams
JOIN Subjects ON Exams.SubjectId=Subjects.Id

CREATE TABLE StudentExams
(
Id INT PRIMARY KEY IDENTITY,
Result TINYINT NOT NULL,
ExamId INT FOREIGN KEY REFERENCES Exams(Id),
StudentId INT FOREIGN KEY REFERENCES Students(Id)
)

SELECT * FROM StudentExams

INSERT INTO StudentExams
VALUES(55,1,1),
(85,2,2),
(95,3,3),
(45,1,2),
(80,2,5),
(70,1,6),
(65,3,7),
(50,2,8),
(35,1,9),
(25,2,10),
(40,1,11),
(75,3,12),
(86,1,4),
(74,2,7),
(60,3,8),
(51,3,9),
(30,1,12),
(42,2,11),
(40,1,5),
(77,2,4),
(63,1,3),
(90,3,1),
(100,1,8),
(88,2,6)

SELECT CONCAT(Name,' ',Surname) AS 'FullName', (SELECT COUNT(Id) FROM StudentExams WHERE StudentId=S.Id) AS 'ExamsCount' FROM Students AS S
SELECT Name, Surname, (SELECT COUNT(Id) FROM StudentExams WHERE StudentId=S.Id) AS 'ExamsCount' FROM Students AS S
SELECT *, (SELECT COUNT(Id) FROM StudentExams WHERE StudentId=S.Id) AS 'ExamsCount' FROM Students AS S


SELECT * FROM Subjects WHERE (SELECT COUNT(Id) FROM Exams WHERE SubjectId=Subjects.Id)=0


SELECT * FROM Exams WHERE DAY(Exams.Date) = DAY(DATEADD(DAY,-2,GETDATE())) 


SELECT SE.Id, CONCAT(Name, ' ', Surname) AS 'FullName',SE.Result,GroupNo FROM StudentExams AS SE
JOIN Students AS S ON S.Id = StudentId
JOIN Groups AS G ON GroupId = G.Id



SELECT *, (SELECT AVG(Result) FROM StudentExams WHERE StudentId = Students.Id) AS 'Avg Result All Exams' FROM Students
SELECT CONCAT(Name,' ',Surname) AS 'FullName', (SELECT AVG(Result) FROM StudentExams WHERE StudentId = Students.Id) AS 'Avg Result All Exams' FROM Students

