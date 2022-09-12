/* Primary Key */
/* Each table can have only one Primary Key */
/* Primary key cannot be NULL */
/* Primary key is used to uniquely identify each reccord */
/* Auto Increment is best suitable for primary keys */
DROP TABLE Employee;

/* create a table with default values and also NOT NULL*/
CREATE TABLE Employee(
id int PRIMARY KEY,
firstname varchar(30) NOT NULL,
middlename varchar(20),
lastname varchar(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location varchar(30) NOT NULL DEFAULT 'United States'
);

DESC Employee;

/* Insert data in a table preferred way */
INSERT INTO Employee(id, firstname, lastname, age, salary, location) VALUES(1, 'Raju','vikram',28,15000,'Sanfransisco');

DROP TABLE Employee;

/* Another way to declare PRIMARY KEY */
/* create a table with default values and also NOT NULL*/
CREATE TABLE Employee(
id int,
firstname varchar(30) NOT NULL,
middlename varchar(20),
lastname varchar(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location varchar(30) NOT NULL DEFAULT 'United States',
PRIMARY KEY(id)
);

DESC Employee;

/* Insert data in a table preferred way */
INSERT INTO Employee(id, firstname, lastname, age, salary) VALUES(1, 'Raju','vikram',28,15000);

INSERT INTO Employee(id, firstname, lastname, age, salary) VALUES(2, 'Singh','karan',38,109000);

SELECT * FROM employee;

DROP TABLE employee;

/* Another way to declare PRIMARY KEY with Auto Increment */
/* create a table with default values and also NOT NULL*/
CREATE TABLE Employee(
id int AUTO_INCREMENT,
firstname varchar(30) NOT NULL,
middlename varchar(20),
lastname varchar(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location varchar(30) NOT NULL DEFAULT 'United States',
PRIMARY KEY(id)
);

DESC Employee;

/* Insert data in a table preferred way */
INSERT INTO Employee(firstname, lastname, age, salary) VALUES('Raju','vikram',28,15000);

INSERT INTO Employee(firstname, lastname, age, salary) VALUES('karan','Singh',38,109000);

SELECT * FROM employee;




/* Composite Primary key  */
/* create a table with default values and also NOT NULL*/
CREATE TABLE Employee(
firstname varchar(30) NOT NULL,
middlename varchar(20),
lastname varchar(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location varchar(30) NOT NULL DEFAULT 'United States',
PRIMARY KEY(firstname, lastname)
);

DESC Employee;

/* Insert data in a table preferred way */
INSERT INTO Employee(firstname, lastname, age, salary) VALUES('Raju','vikram',28,15000);

INSERT INTO Employee(firstname, lastname, age, salary) VALUES('karan','Singh',38,109000);

SELECT * FROM employee;
#############################################################################################333
/* Unique Key */
/* Main purpose is to not get duplicate values */
/* Unique Key can hold NULL values also dpends on type of database application */
/* Example: Email ID -> only email id can be given to only one person */
/* Table can have multiple Unique keys */ 
/* Example: Employee id -> Primary Employee email -> unique key */

/* Unique key  */
/* create a table with default values and also NOT NULL*/
CREATE TABLE Employee(
id int UNIQUE KEY,
firstname varchar(30) NOT NULL,
middlename varchar(20),
lastname varchar(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location varchar(30) NOT NULL DEFAULT 'United States',
PRIMARY KEY(firstname, lastname)
);

DESC Employee;

/* Insert data in a table preferred way */
INSERT INTO Employee(id, firstname, lastname, age, salary) VALUES(1, 'Raju','vikram',28,15000);

INSERT INTO Employee(id, firstname, lastname, age, salary) VALUES(2, 'karan','Singh',38,109000);

INSERT INTO Employee(firstname, lastname, age, salary) VALUES('John','Sam',78,129800);

SELECT * FROM employee;