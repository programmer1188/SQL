USE sql_sams;

SELECT * FROM customers;

/* Retrieve Single column*/
SELECT prod_name
FROM Products; 

/* Retrieve Multiple columns*/
SELECT prod_id, prod_name, prod_price 
FROM products;

/* Retrieve All columns using Asterisk(*) wild card character*/
SELECT *
FROM products;

/* Retrieve vendors Id from products */
SELECT vend_id
FROM products;

/* Retrieving Distinct(unique) Rows */
/* To get DISTINCT Vendors (Rows) use DISTINCT Keyword */
SELECT DISTINCT(vend_id)
FROM products;

SELECT vend_id, prod_price FROM products;
SELECT DISTINCT vend_id, prod_price FROM products;

/* LIMIT */
SELECT prod_name FROM products LIMIT 5;

/* We can also set where to strat can give 5 rows of data */
/* It strats from 4 and gives upto 8 (4,5,6,7,8)*/
SELECT prod_name FROM products LIMIT 5 OFFSET 3; 

/* We can also use the short hand version by combing limit and offset */
/* here the first number is offset - where to strat from and second number is limit - how many rows to retrive */
SELECT prod_name FROM products LIMIT 3,5; 

#comments  - In line comment

#Challanges in lesson 2

#1
SELECT cust_id FROM customers;

#2
SELECT DISTINCT prod_id FROM orderitems;

#3
/*
SELECT * FROM customers;
*/
SELECT cust_id FROM customers;
