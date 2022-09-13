/* Foreign Key -> It is used to prevent actions that would destroy links b/w 2 tables */
/* A foreign key is a field in one table that refers to the primary key in another table*/
USE Company;

CREATE TABLE Students(
student_id int AUTO_INCREMENT,
student_fname varchar(30) NOT NULL,
student_mname varchar(30),
student_lname varchar(30) NOT NULL,
student_email varchar(30) NOT NULL,
student_phone varchar(15) NOT NULL,
student_alternate_phone varchar(15),
enrollment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
selected_course int NOT NULL DEFAULT 1,
years_of_exp int NOT NULL,
student_company varchar(30),
batch_date varchar(30) NOT NULL,
source_of_joining varchar(30) NOT NULL,
location varchar(30) NOT NULL,
PRIMARY KEY(student_id),
UNIQUE KEY(student_email),
FOREIGN KEY(selected_course) REFERENCES courses(course_id)
);


DESC students;

INSERT INTO students(student_fname, student_lname, student_email, student_phone, selected_course ,years_of_exp, student_company, batch_date, source_of_joining, location) 
VALUES('rahul','dravid','rahul@gmail.com','9016782312',1,8,'apple','15-09-2022','LinkedIN','Newyork'),
('vinod','shah','vinod@gmail.com','9016482452',2,5,'netflix','11-10-2022','LinkedIN','Newyork'),
('virat','kohli','virat@gmail.com','8016782312',3,10,'walmart','12-19-2022','quora','Newyork'),
('jaspreet','bumrah','jaspreet@gmail.com','9016782812',4,7,'facebook','01-19-2022','quora','Newyork');

INSERT INTO students(student_fname, student_lname, student_email, student_phone, years_of_exp, student_company, batch_date, source_of_joining, location) 
VALUES('mena','kumar','mena@gmail.com','9916782312',11,'kaggle','10-09-2022','LinkedIN','Newyork'),
('naveed','shah','naveed@gmail.com','9016482452',5,'netflix','11-08-2022','LinkedIN','Newyork'),
('tanmay','bhat','tanmay@gmail.com','8016782312',10,'walmart','9-04-2022','quora','Newyork'),
('kenny','sebastian','kenny@gmail.com','9016782812',7,'facebook','01-22-2022','quora','Newyork');

/* added foreign key  to restrict enrty of selected course as 5 which does not exist 
INSERT INTO students(student_fname, student_lname, student_email, student_phone, selected_course ,years_of_exp, student_company, batch_date, source_of_joining, location) 
VALUES('pradeep','sharma','pradeep@gmail.com','9826782312',5,9,'intel','09-19-2022','LinkedIN','Newyork');

this above insert gives you error as you inserted a selected course as 5 which doest not exist
*/
SELECT * FROM students;

CREATE TABLE courses(
course_id int NOT NULL,
course_name varchar(30) NOT NULL,
course_duration_months  int NOT NULL,
course_fee int NOT NULL,
PRIMARY KEY(course_id)
);

desc courses;

INSERT INTO courses VALUES(1,'Big Data',6,50000),
(2,'Web Development',3,29000),
(3,'Data Science',6,10000),
(4,'DevOPS',2,10000);

