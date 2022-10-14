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

# Filtering Data
# Using WHERE Clause

SELECT prod_name, prod_price FROM products WHERE prod_price = 3.49;

# ORDER BY COMES AFTER WHERE 

#WHERE Can use =, <>, !=, <, <=, !<, >, >=, !>, BETWEEN, IS NULL 

#List products cost less than 10
SELECT prod_name, prod_price FROM Products WHERE prod_price < 10;

#List all products not made by vendor DLL01
SELECT vend_id, prod_name FROM products WHERE vend_id <> 'DLL01';

SELECT vend_id, prod_name FROM products WHERE vend_id != 'DLL01';

#Check for range of values - BETWEEN
SELECT prod_name, prod_price FROM products WHERE prod_price BETWEEN 5 AND 10;

# Check for Null value - IS NULL
SELECT cust_name FROM customers WHERE cust_email IS NULL; 
 
#Challenges Lesson 4

#1 Write a SQL statement to retrieve the product id (prod_id) and name (prod_name) from the Products table, returning only products with a price of 9.49.
SELECT prod_id, prod_name FROM products WHERE prod_price = 9.49; 

#2 Write a SQL statement to retrieve the product id (prod_id) and name (prod_name) from the Products table, returning only products with a price of 9 or more.
SELECT prod_id, prod_name FROM products WHERE prod_price >=9; 

#3 Now let’s combine Lessons 3 and 4. Write a SQL statement that retrieves the unique list of order numbers (order_num) from the OrderItems table which contain 100 or more of any item.
SELECT DISTINCT order_num FROM orderitems WHERE quantity >=100;

#4 One more. Write a SQL statement which returns the product name (prod_name) and price (prod_price) from Products for all products priced between 3 and 6. Oh, and sort the results by price. 
# (There are multiple solutions to this one and we’ll revisit it in the next lesson, but you can solve it using what you’ve learned thus far).
SELECT prod_name, prod_price FROM products WHERE prod_price BETWEEN 3 AND 6 ORDER BY prod_price;

# Lesson 5

# Advanced Data Filtering - Combining WHERE clauses - AND clauses OR clauses IN Operator NOT Operator

# Using the AND Operator - To filter by more than one column
SELECT prod_id, prod_price, prod_name FROM products WHERE vend_id = 'DLL01' AND prod_price<=4;
  
# Using the OR Operator - To filter by more than one column either of the conditions
SELECT prod_id, prod_price, prod_name FROM products WHERE vend_id= 'DLL01' OR vend_id= 'BRS01';

#ORDER OF EVALUATION - COMBINING BOTH AND and OR (AND IS HIGH RANK THAN OR - So ANd is executed first)
#So use brackets(parentheses) when ever both are required in the query. Parentheses has higher rank than AND or OR
SELECT prod_name, prod_price FROM products WHERE (vend_id='DLL01' OR vend_id='BRS01') AND prod_price >=10;

#Using the IN operator for Range of values
SELECT prod_name, prod_price FROM products WHERE vend_id IN ('DLL01','BRS01');
#or Both Or and IN  gives you same result
SELECT prod_name, prod_price FROM products WHERE vend_id = 'DLL01' OR vend_id = 'BRS01';

SELECT prod_name, prod_price FROM products WHERE vend_id IN ('DLL01','BRS01') ORDER BY prod_price;

SELECT prod_name, prod_price FROM products WHERE vend_id IN ('DLL01','BRS01') ORDER BY prod_name;

#Uses of IN Operator
#1 When we are working with long list of valid options, the IN operator syntax is far cleaner and easier to read
#2 The order of evaluation is easier to manage when IN is used in conjunction with other AND and IN Opeartors
#3 IN Operator almost always execute more quickly than lists of OR operators.
#4 Biggest advantage in IN operator is IN operator can contain SELECT Statement enabling you to build higly dynamic WHERE Clauses.


# NOT Operator - Used in a WHERE clause to negate a condition
# List of products made by all vendors except 'DLL01'
SELECT prod_name FROM products WHERE NOT vend_id = 'DLL01'; 
#or
SELECT prod_name FROM products WHERE vend_id <> 'DLL01'; 

SELECT prod_name FROM products WHERE NOT vend_id = 'DLL01' ORDER BY prod_name; 

#Challenges Lesson 5

#1 Write a SQL statement to retrieve the vendor name (vend_name) from the Vendors table, returning only vendors in California (this requires filtering by both country (USA) and state (CA), after all, there could be a California outside of the USA). Here’s a hint, the filter requires matching strings.
SELECT vend_name FROM vendors WHERE vend_country='USA' AND vend_state='CA';

#2 Write a SQL statement to find all orders where at least 100 of items BR01, BR02, or BR03 were ordered. You’ll want to return order number (order_num), product id (prod_id), and quantity for the OrderItems table, filtering by both the product id and quantity. Here’s a hint, depending on how you write your filter, you may need to pay special attention to order of evaluation.
SELECT order_num, prod_id, quantity FROM orderitems WHERE quantity >= 100 AND prod_id IN ('BR01','BR02','BR03');
#OR
SELECT order_num, prod_id, quantity FROM orderitems WHERE quantity >= 100 AND (prod_id = 'BR01' OR prod_id ='BR02' OR prod_id ='BR03');

#3 Now let’s revisit a challenge from the previous lesson. Write a SQL statement which returns the product name (prod_name) and price (prod_price) from Products for all products priced between 3 and 6. Use an AND, and sort the results by price.
SELECT prod_name, prod_price FROM products WHERE prod_price >= 3 AND prod_price <= 6 ORDER BY prod_price;     
