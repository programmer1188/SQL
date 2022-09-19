/* Logical operators, NOT,  LIKE, BETWEEN, IN, CASE END*/
USE company;

SELECT * FROM students;

UPDATE students SET location = 'Seatle' WHERE student_id = 1;
UPDATE students SET location = 'Santa Clara' WHERE student_id = 2;
UPDATE students SET location = 'Austin' WHERE student_id = 4;  
UPDATE students SET location = 'Seatle' WHERE student_id = 8;  
UPDATE students SET location = 'Austin' WHERE student_id = 6;  

/* students from newyork location */
SELECT * FROM students WHERE location = 'Newyork';

/* students from not newyork location     NOT EQUAL TO -> != */ 
SELECT * FROM students WHERE location != 'Newyork';

/* Get all courses which has the word data */
SELECT * FROM courses WHERE course_name LIKE '%data%';

/* Get all courses which do not have the word data */
SELECT * FROM courses WHERE course_name NOT LIKE '%data%';

SELECT * FROM students;

/* All students from seatle who joined through linkin and have greater than 6 years of experince */
SELECT * FROM students WHERE years_of_exp > 6 AND source_of_joining = 'linkedin' AND location = 'Seatle';

/* ALL students who do not have 8-12 years of experince*/
SELECT * FROM students WHERE years_of_exp < 8 or years_of_exp > 12;

/* second way to execute above statement using BETWEEN */
SELECT * FROM students WHERE years_of_exp NOT BETWEEN 8 and 12;

/* Get list of students who are working for apple, microsoft, netflix */
SELECT * FROM students WHERE student_company = 'apple' or student_company =  'walmart' or student_company = 'netflix';

/* second way Using IN */
SELECT * FROM students WHERE student_company IN ('apple','walmart','netflix');

/* Get list of students who are not working for apple, microsoft, netflix */
SELECT * FROM students WHERE student_company NOT IN ('apple','walmart','netflix');

SELECT * from courses;

/* group and get a new column based on course duration column  course > 4 months masters or else diploma */

SELECT course_id, course_name, course_fee,
CASE
WHEN course_duration_months > 4 THEN 'Masters'
ELSE 'Diploma'
END as course_type
FROM courses;

SELECT * FROM courses;

/* Label product based and service based companies */

SELECT student_id, student_fname, student_lname, student_company,
CASE
WHEN student_company in ('apple','facebook','netflix','walmart') THEN 'Product Based'
ELSE 'service based'
END as company_type
FROM students;



