--drop database SWP391_Project_New

create database SWP391_Project_New
go 
use SWP391_Project_New
go

create table Role (
	role_id int identity(1, 1) primary key,
	role_name nvarchar(20) not null
)

create table Account (
	account_id int identity(1,1) PRIMARY KEY,
	first_name nvarchar(50) NOT NULL,
	last_name nvarchar(50) NOT NULL,
	gender bit not null,
	email nvarchar(max) not null,
	password nvarchar(max) not null,
	dob date not null,
	phone_number nvarchar(12) not null,
	address nvarchar(max) null,
	img nvarchar(max) null,
	role_id int foreign key references Role(role_id)
)

create table Class(
	class_id int identity(1,1) PRIMARY KEY,
	class_name nvarchar(20) not null,
	grade int not null,
	class_description text not null,
	teacher_id int FOREIGN KEY REFERENCES Account(account_id)
)

create table Kindergartner(
	kinder_id int identity(1,1) PRIMARY KEY,
	parent_id int FOREIGN KEY REFERENCES Account(account_id),
	first_name nvarchar(50) NOT NULL,
	last_name nvarchar(50) NOT NULL,
	dob date not null,
	gender bit not null,
	img nvarchar(max) null
)

create table Study_Record (
	study_record_id int identity(1, 1) primary key,
	class_id int foreign key references Class(class_id),
	kinder_id int foreign key references Kindergartner(kinder_id),
	study_year int not null
)

create table Attendance(
	student_id int FOREIGN KEY REFERENCES kindergartner(kinder_id),
	check_date date not null,
	status int not null,
	teacher_id int FOREIGN KEY REFERENCES Account(account_id),
	PRIMARY KEY(student_id, check_date)
)

create table Teacher_achivement(
	achivement_id int identity PRIMARY KEY,
	content text not null,
	teacher_id int FOREIGN KEY REFERENCES Account(account_id)
)

create table Teacher_record(
	record_id int identity(1,1) PRIMARY KEY,
	teacher_id int FOREIGN KEY REFERENCES Account(account_id),
	description text not null
)

create table Criteria(
	criteria_id int identity(1,1) PRIMARY KEY,
	content nvarchar(max)
)

create table Record(
	record_id int identity(1,1) PRIMARY KEY,
	student_id int FOREIGN KEY REFERENCES Kindergartner(kinder_id),
	note text null,
	criteria_id int FOREIGN KEY REFERENCES Criteria(criteria_id),
	semester nvarchar(30) not null,
)

create table Activity(
	activity_id int identity(1,1) PRIMARY KEY,
	act_description text not null,
	act_name nvarchar(50)
)

create table Slot(
	slot_id int identity(1,1) PRIMARY KEY,
	start_hour float not null,
	end_hour float not null
)

create table Schedule(
	schedule_id int identity(1,1),
	class_id int FOREIGN KEY REFERENCES Class(class_id),
	activity_id int FOREIGN KEY REFERENCES Activity(activity_id),
	slot_id int foreign key references Slot(slot_id),
	schedule_date date not null
)

create table Feedback(
	feedback_id int identity(1,1) PRIMARY KEY,
	kid_id int FOREIGN KEY REFERENCES Kindergartner(kinder_id),
	teacher_id int FOREIGN KEY REFERENCES Account(account_id),
	fb_content nvarchar(max) null,
	rating float null,
	fb_date date null
)

create table GoogleAccount (
	account_id int foreign key references Account(account_id),
	google_id varchar(max) not null,
	primary key(account_id)
)

select * from GoogleAccount
---------------------------------------------------------------------------------------------------------

insert into Role values 
('admin'), ('parent'), ('teacher')

insert into Account values
('Admin', 'Admin', 1, 'admin@gmail.com','1234', '1980/12/07', '0387458346', 'New York', null, 1),
('Peter', 'Crouch', 1, 'peter@gmail.com','1234', '1980/12/07', '0387458346', 'New York', null, 2),
('Maria', 'Ozawa', 0, 'maria@gmail.com','1234', '1978/04/23', '0912345678', 'St. Saint German', null, 2),
('Jame', 'Bonds', 1, 'jame@gmail.com','1234', '1988/01/13', '08563490812', 'Brucia Dortmun', null, 2),
('Cristiano', 'Ronaldo', 1, 'ronaldo@gmail.com','1234', '1990/9/12', '0387458346', 'New York', null, 2),
('Lionel', 'Messi', 1, 'messi@gmail.com','1234', '1991/05/25', '0387458346', 'New York', null, 2),
('Captain', 'America', 1, 'civilwar@gmail.com','1234', '1889/12/12', '0387458346', 'Brokelyn', null, 3),
('Black', 'Widow', 0, 'endgame@gmail.com','1234', '1890/01/14', '0123456789', 'Russia', null, 3);

--select account_id, first_name, role_name from Account a, Role b where a.role_id = b.role_id

insert into class values('SE1608',2,'It was great',7)
insert into class values('SE1609',3,'It was great',8)

insert into Kindergartner(parent_id, first_name, last_name, dob,  gender, img) values
(6, 'Peteer', 'Senior', '2020-04-12', 0, null);

insert into kindergartner values(1, 'Peter', 'Senior',  '2020/04/12',0,null);
insert into kindergartner values(2, 'Maria', 'Boob',  '2020/01/13',0,null);
insert into kindergartner values(3, 'Jame', 'Bonds Jr',  '2020/05/24',1,null);
insert into kindergartner values(3, 'Jame', 'Oliver',  '2020/02/15',1,null);
insert into kindergartner values(4, 'Cristiano', 'Junior',  '2020/12/08',1,null);
insert into kindergartner values(4, 'Cristiano', 'MotherLike',  '2020/11/01',0,null);
insert into kindergartner values(5, 'Lionel', 'Babe',  '2002/04/12',1,null);
insert into kindergartner values(5, 'Lionel', 'Bonhjua', '2002/03/27',0,null);

insert into slot(start_hour, end_hour) values
(7, 8), (8, 9), (9, 10), (10, 11), (11, 12), (12, 13), (13, 14), (14, 15), (15, 16), (16, 17);


insert into Schedule values
(1, 1, 1, '2022-06-22'),
(1, 2, 2, '2022-06-22'),
(1, 3, 3, '2022-06-22'),
(1, 4, 4, '2022-06-22'),
(1, 4, 5, '2022-06-22'),
(1, 5, 6, '2022-06-22'),
(1, 6, 7, '2022-06-22'),

(1, 1, 1, '2022-06-23'),
(1, 2, 2, '2022-06-23'),
(1, 3, 3, '2022-06-23'),
(1, 4, 4, '2022-06-23'),
(1, 4, 5, '2022-06-23'),
(1, 5, 6, '2022-06-23'),
(1, 6, 7, '2022-06-23'),

(1, 1, 1, '2022-06-24'),
(1, 2, 2, '2022-06-24'),
(1, 3, 3, '2022-06-24'),
(1, 4, 4, '2022-06-24'),
(1, 4, 5, '2022-06-24'),
(1, 5, 6, '2022-06-24'),
(1, 6, 7, '2022-06-24'),

(1, 1, 1, '2022-06-25'),
(1, 2, 2, '2022-06-25'),
(1, 3, 3, '2022-06-25'),
(1, 4, 4, '2022-06-25'),
(1, 4, 5, '2022-06-25'),
(1, 5, 6, '2022-06-25'),
(1, 6, 7, '2022-06-25'),

(1, 1, 1, '2022-06-26'),
(1, 2, 2, '2022-06-26'),
(1, 3, 3, '2022-06-26'),
(1, 4, 4, '2022-06-26'),
(1, 4, 5, '2022-06-26'),
(1, 5, 6, '2022-06-26'),
(1, 6, 7, '2022-06-26'),

(2, 1, 1, '2022-06-22'),
(2, 2, 2, '2022-06-22'),
(2, 3, 3, '2022-06-22'),
(2, 4, 4, '2022-06-22'),
(2, 4, 5, '2022-06-22'),
(2, 5, 6, '2022-06-22'),
(2, 6, 7, '2022-06-22'),

(2, 1, 1, '2022-06-23'),
(2, 2, 2, '2022-06-23'),
(2, 3, 3, '2022-06-23'),
(2, 4, 4, '2022-06-23'),
(2, 4, 5, '2022-06-23'),
(2, 5, 6, '2022-06-23'),
(2, 6, 7, '2022-06-23'),

(2, 1, 1, '2022-06-24'),
(2, 2, 2, '2022-06-24'),
(2, 3, 3, '2022-06-24'),
(2, 4, 4, '2022-06-24'),
(2, 4, 5, '2022-06-24'),
(2, 5, 6, '2022-06-24'),
(2, 6, 7, '2022-06-24'),

(2, 1, 1, '2022-06-25'),
(2, 2, 2, '2022-06-25'),
(2, 3, 3, '2022-06-25'),
(2, 4, 4, '2022-06-25'),
(2, 4, 5, '2022-06-25'),
(2, 5, 6, '2022-06-25'),
(2, 6, 7, '2022-06-25'),

(2, 1, 1, '2022-06-26'),
(2, 2, 2, '2022-06-26'),
(2, 3, 3, '2022-06-26'),
(2, 4, 4, '2022-06-26'),
(2, 4, 5, '2022-06-26'),
(2, 5, 6, '2022-06-26'),
(2, 6, 7, '2022-06-26');

(1, 1, 1, '2022-07-04'),
(1, 2, 2, '2022-07-04'),
(1, 3, 3, '2022-07-04'),
(1, 4, 4, '2022-07-04'),
(1, 4, 5, '2022-07-04'),
(1, 5, 6, '2022-07-04'),
(1, 6, 7, '2022-07-04'),

(1, 1, 1, '2022-07-05'),
(1, 2, 2, '2022-07-05'),
(1, 3, 3, '2022-07-05'),
(1, 4, 4, '2022-07-05'),
(1, 4, 5, '2022-07-05'),
(1, 5, 6, '2022-07-05'),
(1, 6, 7, '2022-07-05'),

(1, 1, 1, '2022-07-06'),
(1, 2, 2, '2022-07-06'),
(1, 3, 3, '2022-07-06'),
(1, 4, 4, '2022-07-06'),
(1, 4, 5, '2022-07-06'),
(1, 5, 6, '2022-07-06'),
(1, 6, 7, '2022-07-06'),

(1, 1, 1, '2022-07-07'),
(1, 2, 2, '2022-07-07'),
(1, 3, 3, '2022-07-07'),
(1, 4, 4, '2022-07-07'),
(1, 4, 5, '2022-07-07'),
(1, 5, 6, '2022-07-07'),
(1, 6, 7, '2022-07-07'),

(1, 1, 1, '2022-07-08'),
(1, 2, 2, '2022-07-08'),
(1, 3, 3, '2022-07-08'),
(1, 4, 4, '2022-07-08'),
(1, 4, 5, '2022-07-08'),
(1, 5, 6, '2022-07-08'),
(1, 6, 7, '2022-07-08'),

(2, 1, 1, '2022-07-04'),
(2, 2, 2, '2022-07-04'),
(2, 3, 3, '2022-07-04'),
(2, 4, 4, '2022-07-04'),
(2, 4, 5, '2022-07-04'),
(2, 5, 6, '2022-07-04'),
(2, 6, 7, '2022-07-04'),

(2, 1, 1, '2022-07-05'),
(2, 2, 2, '2022-07-05'),
(2, 3, 3, '2022-07-05'),
(2, 4, 4, '2022-07-05'),
(2, 4, 5, '2022-07-05'),
(2, 5, 6, '2022-07-05'),
(2, 6, 7, '2022-07-05'),

(2, 1, 1, '2022-07-06'),
(2, 2, 2, '2022-07-06'),
(2, 3, 3, '2022-07-06'),
(2, 4, 4, '2022-07-06'),
(2, 4, 5, '2022-07-06'),
(2, 5, 6, '2022-07-06'),
(2, 6, 7, '2022-07-06'),

(2, 1, 1, '2022-07-07'),
(2, 2, 2, '2022-07-07'),
(2, 3, 3, '2022-07-07'),
(2, 4, 4, '2022-07-07'),
(2, 4, 5, '2022-07-07'),
(2, 5, 6, '2022-07-07'),
(2, 6, 7, '2022-07-07'),

(2, 1, 1, '2022-07-08'),
(2, 2, 2, '2022-07-08'),
(2, 3, 3, '2022-07-08'),
(2, 4, 4, '2022-07-08'),
(2, 4, 5, '2022-07-08'),
(2, 5, 6, '2022-07-08'),
(2, 6, 7, '2022-07-08');



insert into Study_Record values (1,1,2022)
insert into Study_Record values (1,2,2022)
insert into Study_Record values (1,3,2022)
insert into Study_Record values (1,4,2022)
insert into Study_Record values (1,5,2022)
insert into Study_Record values (1,6,2022)
insert into Study_Record values (1,7,2022)
insert into Study_Record values (1,8,2022)
insert into Study_Record values (1,9,2022)

insert into Study_Record values (2,10,2022)
insert into Study_Record values (2,11,2022)
insert into Study_Record values (2,12,2022)

--SELECT FORMAT (getdate(), 'dd/MM/yyyy ') as date;

--select * from Schedule
--where class_id = 3 and schedule_date = '2022-06-23'

insert into Activity values
('Have breakfast', 'Breakfast'), ('Do workout', 'Physical Education'), ('Study', 'Study'), ('Lunch', 'Lunch'),
('Drawing', 'Drawing'), ('Singing', 'Singing')

select * from Class

select * from GoogleAccount where google_id = '123'
insert into GoogleAccount values
(1, '12345')