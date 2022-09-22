/* OVER AND PARTITION BY */
USE company;
/* DROP TABLE employee; */ 

CREATE TABLE employee(
firstname varchar(30),
lastname varchar(20),
age int,
salary int,
location varchar(20)
);

INSERT INTO employee VALUES('sachin','sharma',28,10000,'newyork'),('shane','warne',30,20000,'newyork'),
('rohit','sharma',32,30000,'austin'),('shikhar','dhawan',32,25000,'austin'),('rahul','dravid',31,20000,'newyork'),
('saurabh','ganguly',32,15000,'seattle'),('kapil','dev',34,10000,'seattle');

SELECT * FROM employee;

/* how many people are from each location and average salary at each location */

SELECT COUNT(*) AS number_of_employees, location, AVG(salary) FROM employee GROUP BY location; 


/* get first name and last name along with above aggregated columns */
SELECT firstname, lastname, employee.location, total_count, avg_salary FROM employee JOIN
(SELECT COUNT(*) AS total_count, location, AVG(salary) AS avg_salary FROM employee GROUP BY location) temptable 
ON employee.location = temptable.location; 

/* OVER PARTITION BY */
SELECT firstname, lastname, location, COUNT(location) OVER (PARTITION BY location) AS total, 
AVG(salary) OVER (PARTITION BY location) AS average FROM employee;