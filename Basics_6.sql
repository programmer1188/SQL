/* Order of Execution */
/* FROM -> Table 
   SELECT -> Columns
   
   
*/
USE company;

/* First FROM will execute and takes the whole table and SELECT the columns from table */
SELECT source_of_joining FROM students; 

/* First FROM and SELECT columns 2 columns */
SELECT source_of_joining, years_of_exp FROM students; 

/* FROM (Loading the table)
   SELECT (Projecting student_fname and years_of_exp)
   ORDER BY (Based on years_of_Exp)
*/
SELECT student_fname, years_of_exp FROM students ORDER BY years_of_exp; 


/* FROM (Loading the table)
   SELECT (Projecting student_fname,)  here even tough you did not select years of experience it will check the dependency below and 
									   project the years of experience to order by and after that it will discard 
   ORDER BY (Based on years_of_Exp)
*/
SELECT student_fname FROM students ORDER BY years_of_exp; 

/* Distinct */
/* FROM (Loading the table)
   SELECT (Projecting student_fname,)  here even tough you did not select years of experience it will check the dependency below and 
									   project the years of experience to order by and after that it will discard
   DISTICT (Select DISTINCT student_fname, years_of_exp) which is not we want. we want only DISTICT student_fname 
   ORDER BY (Based on years_of_Exp)
*/

SELECT DISTINCT student_fname FROM students ORDER BY years_of_exp; 
/* we will get the output but not the result we want. It will apply distict on both student_fname and years_of_exp */
