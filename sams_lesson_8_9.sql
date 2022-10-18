USE sql_sams;

#Lesson 8 -> Data Manipulation functions

#Text Manipulation functions -> Trimming or padding strings of text | Converting values to Upper or Lower case.
# RTRIM() -> Trim white space to the right of a column value, 
# LTRIM() -> Trim white space to the left of a column value, 
# TRIM() -> Trim white space to the right and left of a column value.

# Upper() UPPER() upper() -> converts string to uppercase
SELECT vend_name, UPPER(vend_name) AS vend_name_upcase FROM vendors ORDER BY vend_name;

# Lower() LOWER() lower() -> converts string to lowercase
# substring() SUBSTRING() -> extracts part of a string  
# left() LEFT() -> returns characters from left of string
# right() RIGHT() -> returns characters from right of string 
# length() LENGTH() -> returns length of a string
 
 
# Data and Time Manipulation functions
#Year() -> To filter order numbers from year 2020
SELECT order_num FROM orders WHERE YEAR(order_date) = 2020; 
#or
SELECT order_num FROM orders WHERE DATE_FORMAT(order_date, "%Y") = 2020; 

#Many other functions are present for Mysql date and time functions
# https://www.w3schools.com/sql/sql_ref_mysql.asp

# Numeric Functions -> manipulate numeric data
# ABS() -> Returns a number's Absolute value
# MAX()
# MIN()


# Lesson 8 challenges

#1 Write a SQL statement that returns customer id (cust_id), customer name (cust_name) and user_login which is all upper case and comprised of the first two characters of the customer contact (cust_contact) and the first three characters of the customer city (cust_city). So, for example, my login (Ben Forta living in Oak Park) would be BEOAK. Hint, for this one you’ll use functions, concatenation, and an alias.
SELECT cust_id, cust_name, CONCAT(UPPER(LEFT(cust_contact,2)), UPPER(LEFT(cust_city,3))) AS user_login FROM customers;

#2 Write a SQL statement to return the order number (order_num) and order date (order_date) for all orders placed in January 2020, sorted by order date. You should be able to figure this out based on what you have learned thus far, but feel free to consult your DBMS documentation as needed.
SELECT order_num, order_date FROM orders WHERE YEAR(order_date) = 2020 AND MONTH(order_date) = 1 ORDER BY order_date;


#Lesson 9 - Aggregate Functions -> Summarize data -> Operate on set of rows to calculate and return a single value.

# AVG() -> Returns a column average value -> Count number of rows in column and sum of their values
SELECT AVG(prod_price) AS avg_price FROM products;

#Avg price of products offered by specific vendor
SELECT AVG(prod_price) AS avg_price FROM products WHERE vend_id='DLL01';

# COUNT() -> number of rows in table or specific criterion
# COUNT(*) -> To Count the number of rows in a table
# COUNT(column name) -> to count the number of rows that the values in specific column, ignoring NULL values

#Counts all rows, regardless of values
SELECT COUNT(*) AS num_cust FROM customers;
 
#Counts only with values in cust_email
SELECT COUNT(cust_email) AS num_cust FROM customers; 

#Columns with NULL values are ignored by COUNT() by counted if COUNT(*) is used

# MAX() -> Returns the highest value in the specified column
SELECT MAX(prod_price) AS max_price FROM products;  #Returns most expensive item in the products table

# MIN() -> Returns the lowest value in the specified column
SELECT MIN(prod_price) AS min_price FROM products;  #Returns least expensive item in the products table


# SUM() -> Return the sum of values in the specified column

#Total numbe rof items ordered
SELECT SUM(quantity) AS items_ordered FROM orderitems WHERE order_num = 20005;

#Sum() can also be used to total calculated values
SELECT SUM(item_price*quantity) AS total_price FROM orderitems WHERE order_num = 20005;


#These Five functions can also be used for DISTINCT values
SELECT AVG(DISTINCT prod_price) AS avg_price FROM products WHERE vend_id = 'DLL01'; 

#Combining Aggregate functions
SELECT COUNT(*) AS num_items, MIN(prod_price)  AS price_min, MAX(prod_price) AS price_max, AVG(prod_price) AS price_avg FROM products;


#Challenges Lesson 9

#1 Write a SQL statement to determine the total number of items sold (using the quantity column in OrderItems).
SELECT SUM(quantity) as total_items_sold FROM orderitems; 

#2 Modify the statement you just created to determine the total number of products with an id (prod_id) BR01 sold.
SELECT SUM(quantity) as total_product_sold FROM orderitems WHERE prod_id = 'BR01'; 

#3 Write a SQL statement to determine the price (prod_price) of the most expensive item in the Products table which costs no more than 10, name the calculated field max_price.
SELECT MAX(prod_price) AS max_price FROM products WHERE prod_price<=10;

