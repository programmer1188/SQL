/* Aggregate Functions */

USE company;

SELECT COUNT(*) FROM Students;

SELECT student_company FROM Students;

/*Count number of companies in students tables with duplicates */
SELECT COUNT(student_company) FROM Students;

/*Count Distinct number of companies in students tables */
SELECT COUNT(DISTINCT student_company) FROM Students;

SELECT COUNT(DISTINCT student_company) AS num_of_companies FROM Students;


SELECT location FROM Students;
/* Count Distinct no of locations from studnets table */
SELECT COUNT(DISTINCT location) FROM Students;

SELECT DISTINCT source_of_joining FROM Students;
SELECT COUNT(DISTINCT source_of_joining) FROM Students;

 
SELECT batch_date FROM Students;
/* to get batch of september */
SELECT * FROM students WHERE batch_date LIKE '%-09-%';
SELECT COUNT(*) FROM students WHERE batch_date LIKE '%-09-%';

/*******************************************************************/
/* GROUP BY */
/* HOW MANY HAVE JOINED THE COURSE THROUGH LINKEDIN */

SELECT source_of_joining FROM students; 

SELECT source_of_joining, COUNT(source_of_joining) FROM students 
GROUP BY source_of_joining;

SELECT location, COUNT(source_of_joining) FROM students 
GROUP BY location;

SELECT source_of_joining,location, COUNT(*) FROM students 
GROUP BY source_of_joining;

SELECT selected_course, COUNT(*) FROM students GROUP BY selected_course;

/***********************************************/
/*  MIN and MAX */

SELECT MIN(years_of_exp) FROM students;
SELECT MAX(years_of_exp) FROM students;

/* student with minimum years of experince */
/* below query gives you wrong answer */
SELECT student_fname, MIN(years_of_exp) FROM students;

SELECT student_fname, years_of_exp FROM students ORDER BY years_of_exp;
SELECT student_fname, years_of_exp FROM students ORDER BY years_of_exp LIMIT 1;

/* below query gives you wrong answer */
SELECT student_fname, MAX(years_of_exp) FROM students;

SELECT student_fname, years_of_exp FROM students ORDER BY years_of_exp DESC LIMIT 1;

/* Source of joining with MAX years of experience */
SELECT source_of_joining, MAX(years_of_exp) FROM students 
GROUP BY source_of_joining;

/*************************************************************/
/* SUM */
/* find sum of years of exp from source of joining */
SELECT source_of_joining, SUM(years_of_exp) FROM students
GROUP BY source_of_joining;

/*************************************************/
/* AVG */

/* avg exp form source of joining */
SELECT source_of_joining, AVG(years_of_exp) FROM students
GROUP BY source_of_joining;

SELECT location, AVG(years_of_exp) FROM students
GROUP BY location;

SELECT student_company, AVG(years_of_exp) FROM students
GROUP BY student_company;