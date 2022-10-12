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


#Order Data

ORDER BY - CLAUSE - Takes one or columns by which to sort the output data.

#Sorting Retrieved Data
SELECT prod_name FROM Products ORDER BY prod_name;

#Sorting multiple columns
SELECT prod_id, prod_price, prod_name 
FROM products 
ORDER BY prod_price, prod_name;

#sort using column position
#Here the ORDER BY uses the 2 and 3 column names from the select 
SELECT prod_id, prod_price, prod_name
FROM products
ORDER BY 2,3;

#Specify Sort Direction -> DESC - Descending order ASC -> ASCENDING ORDER
SELECT prod_id, prod_price, prod_name 
FROM products 
ORDER BY prod_price DESC;

#MOST EXPENSIVE PRODUCTS ARE SORTED FIRST then Product Name
SELECT prod_id, prod_price, prod_name 
FROM products 
ORDER BY prod_price DESC, prod_name;

#Challenges Lesson 3
#1 Write a SQL statement to retrieve all customer names (cust_name) from the Customers table, and display the results sorted from Z to A.
SELECT cust_name FROM customers ORDER BY cust_name DESC;

#2 Write a SQL statement to retrieve customer id (cust_id) and order number (order_num) from the Orders table, and sort the results first by customer id, and then by order date in reverse chronological order.
SELECT cust_id, order_num FROM orders
ORDER BY cust_id, order_date DESC;

#3 Our fictitious store obviously prefers to sell more expensive items, and lots of them. Write a SQL statement to display the quantity and price (item_price) from the OrderItems table, sorted with the highest quantity and highest price first.
SELECT quantity, item_price FROM orderitems 
ORDER BY quantity DESC, item_price DESC;