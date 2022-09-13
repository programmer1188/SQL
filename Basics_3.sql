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
INSERT INTO Employee(id, firstname, lastname, age, salary) VALUES(2,'John','Smith',35,105000);
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
UPDATE employee SET firstname="Andrew" WHERE lastname="tyler";
UPDATE employee SET location="Europe" WHERE firstname="Andrew";

/* change location of all employees */
UPDATE employee SET location="Australia";

/* Increase salary for all employees */
UPDATE employee SET salary = salary+5000;

/* AND condition in WHERE */
UPDATE employee SET location="UnitedStates" WHERE firstname="Andrew" AND lastname="Tyler";


/* DELETE */
/* Before delete always check the row you want to delete with select command */
SELECT * FROM Employee WHERE id=3;
/* After checking the the output of the select statement use delete */
DELETE FROM Employee WHERE id=3;

/* To delete all rows in the table */
DELETE FROM Employee;

DESC employee; 

/* ALTER -> To alter or change the structure of the table */
ALTER TABLE Employee ADD COLUMN Job_Title varchar(50);

/* To drop the column from the table */
ALTER TABLE Employee DROP COLUMN Job_Title;

/* To modify the existing column */
ALTER TABLE Employee MODIFY COLUMN firstname varchar(20) NOT NULL;

/* Drop primary key from table */
ALTER TABLE Employee DROP PRIMARY KEY;

/* ADD primary key to table */
ALTER TABLE Employee ADD PRIMARY KEY(id);


/* DDL -> DATA DEFINITION LANGUAGE -> Used to Alter Table Structure. only deals with structure(schema) of the table
   DDL commands -> Create, Drop, Alter
*/

/* DML - DATA MANIPULATION LANGUAGE -> Used to change data(rows) inside the Table
   DML Commands -> Insert, Update, Delete
*/

/* Truncate -> deletes all the records but it is a DDL command*/
/* Internally drops the table and recreates the table so that it is efficient than Delete where every row should be deleted and not very efficient */
TRUNCATE TABLE Employee;

/*PRefer truncate when there are lot of rows and want to delete all of them */
