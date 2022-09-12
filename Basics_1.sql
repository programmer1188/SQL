/* CRUD Operations */
/* Single Insert vs Multiple Insert */
/* NULL VS NOT NULL */
/* Default and NOT NULL */

/* create a table */
CREATE TABLE Employee(
firstname varchar(30),
lastname varchar(20),
age int,
salary int,
location varchar(30)
);

/* See all tables in db */
show tables;

/* describe a table */
desc employee;

/* View table data */
SELECT * FROM Employee;

/* Insert data in a table preferred way */
INSERT INTO Employee(firstname, lastname, age, salary, location) VALUES('Raj','vikram',24,120000,'Seattle');

SELECT * FROM Employee;

INSERT INTO Employee VALUES('Raju','gopal',14,12000,'Newyork');

INSERT INTO Employee VALUES("Madhu's",'World',27,100000,'Virginia');

/* Usage of escape character \ in a table */
INSERT INTO Employee VALUES("Micheal\'s",'Volume',67,103000,'Denver');

/* Insert multiple rows in a table */
INSERT INTO Employee(firstname, lastname, age, salary, location) VALUES('John','Senai',43,190500,'Memphis'),('Paul','White',51,35000,'Dallas');

/* Drop a table from Database */
DROP TABLE Employee;

Show Tables;

/* create a table with more contraints*/
CREATE TABLE Employee(
firstname varchar(30) NOT NULL,
middlename varchar(20),
lastname varchar(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location varchar(30) NOT NULL
);

DESC Employee;

/* Insert data in a table preferred way */
INSERT INTO Employee(firstname, lastname, age, salary, location) VALUES('Raju','vikram',24,120000,'Seattle');

DROP TABLE Employee;


/* create a table with default values */
CREATE TABLE Employee(
firstname varchar(30) NOT NULL,
middlename varchar(20),
lastname varchar(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location varchar(30) DEFAULT 'United States'
);

DESC Employee;

/* Insert data in a table preferred way */
INSERT INTO Employee(firstname, lastname, age, salary, location) VALUES('Raju','vikram',24,120000,'Seattle');

/* by default lacation is United Stated */
INSERT INTO Employee(firstname, lastname, age, salary) VALUES('John','Smith',43,226000);

/* by default lacation is United Stated but we can also set it to null */
INSERT INTO Employee(firstname, lastname, age, salary, location) VALUES('John','Smith',43,226000, null);

SELECT * FROM Employee;

DROP TABLE Employee;

/* create a table with default values and also NOT NULL*/
CREATE TABLE Employee(
firstname varchar(30) NOT NULL,
middlename varchar(20),
lastname varchar(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location varchar(30) NOT NULL DEFAULT 'United States'
);

DESC Employee;
