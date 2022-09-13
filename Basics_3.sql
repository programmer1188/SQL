/* SQL is case insensitive*/
USE company;

CREATE TABLE Employee(
id int PRIMARY KEY,
firstname varchar(30) NOT NULL,
middlename varchar(20),
lastname varchar(20) NOT NULL,
age int NOT NULL,
salary int NOT NULL,
location varchar(30) NOT NULL DEFAULT 'United States'
);

/* Create */
INSERT INTO Employee(id, firstname, lastname, age, salary) VALUES(1,'Bala','Karumuru',23,125000); 
INSERT INTO Employee(id, firstname, lastname, age, salary) VALUE0S(2,'John','Smith',35,105000);
INSERT INTO Employee(id, firstname, lastname, age, salary) VALUES(3,'Peter','Parker',29,395000);

/* Read all data from table*/
SELECT * FROM EMPLOYEE;

/* Read selected columns */
SELECT firstname, lastname FROM Employee;

/* Read condition filter data*/
SELECT * FROM Employee WHERE age>25;

SELECT * FROM Employee WHERE firstname="bala";

/* TO search for case sensitive information use Binary */
SELECT * FROM Employee WHERE binary firstname="Bala";

/* AS keyword for ALIAS another name for column */
SELECT firstname AS name, lastname AS surname FROM employee;

/* UPDATE */
UPDATE employee SET lastname="Tyler" WHERE firstname="bala";