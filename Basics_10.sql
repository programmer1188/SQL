/* Joins */
USE company;
SHOW TABLES;

/* Use 2 tables Students and Courses */
/* To know which course the student enrolled use join and primary -> foriegn key */

/* Students table -> student_fname, seleected_course
   Courses table -> course_id, course_name
*/

/* Nested Query to know selected course by rahul*/ 
SELECT course_name FROM courses WHERE course_id = 
(SELECT selected_course FROM students WHERE student_fname='rahul');

/* JOIN students table -> selected_course and courses table -> course_id */

/* by defualt it is INNER JOIN -> Only matching records are considered */

SELECT students.student_fname, students.student_lname, courses.course_name 
FROM students JOIN courses ON students.selected_course = courses.course_id;

/* Left Outer Join -> All thematching records are considered plus all the 
non matching records from left table are considered */

/* create new students and courses table */
CREATE TABLE students_latest AS SELECT * FROM students;
CREATE TABLE courses_latest AS SELECT * FROM courses;
 
SELECT * FROM courses_latest; 

DELETE FROM courses_latest WHERE course_id=2;

/* Inner Join */
SELECT students_latest.student_fname, students_latest.student_lname, courses_latest.course_name 
FROM students_latest JOIN courses_latest ON students_latest.selected_course = courses_latest.course_id;

/* Left Outer Join -> All the matching records from left and right are considered and 
   all the non matching records in the left table which does not have the match in the right are padded with null */
SELECT students_latest.student_fname, students_latest.student_lname, courses_latest.course_name 
FROM students_latest LEFT JOIN courses_latest ON students_latest.selected_course = courses_latest.course_id;


/* RIGHT OUTER JOIN -> All the matching records from left and right are considered and 
   all the non matching records in the right table which does not have the match in the left are padded with null */
   
SELECT students_latest.student_fname, students_latest.student_lname, courses_latest.course_name 
FROM students_latest RIGHT JOIN courses_latest ON students_latest.selected_course = courses_latest.course_id;

/* Full Outer Join -> All matching records are shown + all the non matching records from left + all the non matching records from right */

SELECT students_latest.student_fname, students_latest.student_lname, courses_latest.course_name 
FROM students_latest LEFT JOIN courses_latest ON students_latest.selected_course = courses_latest.course_id
UNION 
SELECT students_latest.student_fname, students_latest.student_lname, courses_latest.course_name 
FROM students_latest RIGHT JOIN courses_latest ON students_latest.selected_course = courses_latest.course_id; 

/* CROSS JOIN (rows * rows) -> not very usefull */ 
SELECT * FROM students, courses;
SELECT * FROM students JOIN courses;