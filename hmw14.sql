if exists (select*from sys.databases where name = 'College')
drop database College
go

create database College
go

use College
go

create table Students (
ID int identity (1,1) not null 
 CONSTRAINT [PK_Studients] PRIMARY KEY CLUSTERED, 
FName varchar(30) not null,
LName varchar (30) not null,
SSN int not null,
Address varchar (30) not null,
City varchar (10) not null,
State varchar (10) not null,
Zip int not null, 
Phone int not null
);

--ALTER TABLE Students
--ADD LName varchar (30) not null;

create table Classes (
ID int identity (1,1) not null
constraint [pk_Classes] primary key clustered,
StudentID int not null,
   FOREIGN KEY (StudentID) REFERENCES Students(ID),
Title varchar (50) not null,
Number int not null,
Department varchar (15) not null
);

drop table Scores

create table Scores (
ID int identity (1,1) not null
constraint [pk_Scores] primary key clustered, 
ClassesID int not null
   FOREIGN KEY (ClassesID) REFERENCES Classes(ID),
Type varchar (10) not null,
Description varchar (50) not null,
[Date Assigned] datetime not null,
[Date Due] datetime not null,
[Date Submitted] datetime not null,
[Points Earned] int not null,
[Points Possible] int not null
);

use College
go

insert into Students (FName, LName, SSN, [Address], City, [State], Zip, Phone)
values ('Pierce', 'Hawthorne', '991831941', '2180 Rodeo Drive', 'Portland', 'Colorado', '33933', '12923');

insert into Students (FName, LName, SSN, [Address], City, [State], Zip, Phone)
values ('Buster', 'Bluth', '393993011', '1990 Sudden Valley', 'Orange', 'California', '39399', '393939');

insert into Students (FName, LName, SSN, [Address], City, [State], Zip, Phone)
values ('Dean', 'Pelton', '89222689', '891 Greendale', 'Greendale', 'Colorado', '88256', '1234567');



use College 
go

insert into Classes (StudentID, Title, Number, Department)
values (1, '101', 333, 'history');

insert into Classes (StudentId, Title, Number, Department)
values (3, 'Intro to Ladders', 102, 'Funology');

insert into Classes (StudentId, Title, Number, Department)
values (5, 'Computers?', 105, 'IT');

select*from Classes


use College
go

insert into Scores (ClassesID, [Type], [Description], [Date Assigned], [Date Due], [Date Submitted], [Points Earned], [Points Possible])
values (2, 'quiz', 'very good', '06-16-2018', '06-21-2018', '06-17-2018', 89, 90);

insert into Scores (ClassesID, [Type], [Description], [Date Assigned], [Date Due], [Date Submitted], [Points Earned], [Points Possible])
values (6, 'test', 'not so good', '05-16-2018', '08-21-2018', '06-07-2018', 89, 90);

insert into Scores (ClassesID, [Type], [Description], [Date Assigned], [Date Due], [Date Submitted], [Points Earned], [Points Possible])
values (7, 'exam', 'excellent', '01-16-2018', '04-21-2018', '02-07-2018', 78, 90);


use College
go

select *
From Students
INNER JOIN Classes ON Students.ID = Classes.StudentID
INNER JOIN Scores ON Scores.ClassesID = Classes.ID

