USE company;
show tables;
select * from students;

SELECT location FROM Students;

SELECT DISTINCT location FROM Students; /* all duplicates are not shown */

SELECT DISTINCT student_company FROM Students;

SELECT DISTINCT source_of_joining FROM Students;

/* ORDERBY */

SELECT * FROM Students order by years_of_exp;

SELECT * FROM Students order by Student_lname;

SELECT student_fname FROM students ORDER BY years_of_exp;

SELECT student_fname, years_of_exp FROM students ORDER BY years_of_exp DESC; /* descending order */
 
/* first order by years of exp then who have sam eyesr of exp gets order by fname */
SELECT student_fname, years_of_exp FROM students ORDER BY years_of_exp, student_fname;  

/* LIMIT */
SELECT * FROM students LIMIT 3;

SELECT * FROM students ORDER BY years_of_exp LIMIT 3;

SELECT * FROM students ORDER BY years_of_exp DESC LIMIT 3;

/* not work as per order of evaluation */
SELECT DISTINCT source_of_joining FROM students order by enrollment_date DESC LIMIT 5;

SELECT * from Students ORDER BY enrollment_date DESC limit 1;

/* GIVES first 3 candidate who are enrolled */
SELECT * from Students ORDER BY enrollment_date limit 0,3;

/* Gives out 4 and 5 candidates who are enrolled */
SELECT * from Students ORDER BY enrollment_date limit 3,2;


/* Like */

/* ra can be anywhere in the fname */  /*  % is wildcard character */   
SELECT * FROM Students WHERE student_fname LIKE '%ra%';

/* fname should start with ra */
SELECT * FROM Students WHERE student_fname LIKE 'ra%';

/*  fname end with l */    
SELECT * FROM Students WHERE student_fname LIKE '%l';

/* fname with 5 characters or letters */   
SELECT * FROM Students WHERE student_fname LIKE '_____';

/* can use \ as a escape character  %_at% here _ is also considered as letter to check*/