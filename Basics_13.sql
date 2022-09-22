/* Row number  RANK AND DENSE RANK*/
USE company;

SELECT * FROM employee; 

/* order based on highest salary and give row numbers*/
SELECT firstname, lastname, salary, row_number() 
OVER (ORDER BY SALARY desc) FROM employee; 

/* get details of employee with 5th highest salary */
SELECT * FROM (SELECT firstname, lastname, salary, row_number() 
OVER (ORDER BY SALARY desc) AS rownum FROM employee) 
TEMPTABLE WHERE rownum = 5; 

/* Assign row numbers based on partition of each location */
SELECT firstname, lastname, salary, location, row_number() 
OVER (PARTITION BY location ORDER BY salary desc) FROM employee; 

/* get higest salary employees from each location */
SELECT * FROM (SELECT firstname, lastname, salary, location, row_number() 
OVER (PARTITION BY location ORDER BY salary desc) AS rownum FROM employee)
TEMPTABLE WHERE rownum =1; 
/*
rohit	sharma	30000	austin	1
shane	warne	20000	newyork	1
saurabh	ganguly	15000	seattle	1

*/

/* When to use row_number -> we should use ORDER BY - mandatory to get the row number order
                             we can also use PARTITION BY - optional
                             row numbers start again with 1 for every partition
                             use only when there are no duplicates like having same amount of salary
*/

/* Rank and Dense Rank -> Use when there are duplicates*/ 

/* row_number vs Rank vs Dense Rank */

SELECT firstname, lastname, salary, 
row_number() OVER (ORDER BY SALARY desc) FROM employee; 
/*
rohit	sharma	30000	1
shikhar	dhawan	25000	2
shane	warne	20000	3
rahul	dravid	20000	4
saurabh	ganguly	15000	5
sachin	sharma	10000	6
kapil	dev	    10000	7
*/

SELECT firstname, lastname, salary, 
RANK() OVER (ORDER BY SALARY desc) FROM employee; 
/*
rohit	sharma	30000	1
shikhar	dhawan	25000	2
shane	warne	20000	3
rahul	dravid	20000	3
saurabh	ganguly	15000	5
sachin	sharma	10000	6
kapil	dev	    10000	6
*/

SELECT firstname, lastname, salary, 
DENSE_RANK() OVER (ORDER BY SALARY desc) FROM employee; 
/*
rohit	sharma	30000	1
shikhar	dhawan	25000	2
shane	warne	20000	3
rahul	dravid	20000	3
saurabh	ganguly	15000	4
sachin	sharma	10000	5
kapil	dev	    10000	5
*/

/* if there are no duplicates ROW_NUMBER, RANK AND DENSE RANK GIVES SIMILAR RESULTS.
when there are duplicates there is chnage 

RANK- for duplicates same rank is assigned and for the next entry it skips the rank 

Dense Rank - It does not skip any ranks in between when there are duplicates.

Use row_number to find the top 3 candidates who scored the highest rank -> 100,100,98,97,97,96 

 
*/               