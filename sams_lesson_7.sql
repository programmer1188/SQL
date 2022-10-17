USE sql_sams;

#Lesson 7 Calculated Fields

#Calculated field is created to retrieve converted, calculated or reformatted data from database using SELECT statement.

#Create a field title that is made up of two columns and use Alias (AS) to name the calculate field
SELECT CONCAT(vend_name,'( ', vend_country,' )') AS Title FROM vendors ORDER BY vend_name;

#To remove extra padded spaces within each field use RTRIM
SELECT CONCAT(RTRIM(vend_name), ' ( ' , RTRIM(vend_country), ' )' ) AS Title FROM vendors ORDER BY vend_name;

#RTRIM -> trims all space from the right of a value.
#LTRIM -> trims all the space to the left side of a string
#TRIM -> trims both left and right of a string

#Mathematical Calculations on retrived data
SELECT prod_id, quantity, item_price FROM orderitems WHERE order_num = 20008;

#Now create a new calculated field based on the retrived data for expanded price = quantity * item_price
SELECT prod_id, quantity, item_price, quantity*item_price AS expanded_price FROM orderitems WHERE order_num = 20008;

# We can use any operator to create a calculated field +, -, *, /

#Challenges Lesson 7

#1 A common use for aliases is to rename table column fields in retrieved results (perhaps to match specific reporting or client needs). Write a SQL statement that retrieves vend_id, vend_name, vend_address, and vend_city from Vendors, renaming vend_name to vname, vend_city to vcity, and vend_address to vaddress. Sort the results by vendor name (you can use the original name or the renamed name).
SELECT vend_id, vend_name AS vname, vend_address AS vaddress, vend_city AS vcity FROM vendors ORDER BY vname;

#2 Our example store is running a sale and all products are 10% off. Write a SQL statement that returns prod_id, prod_price, and sale_price from the Products table. sale_price is a calculated field that contains, well, the sale price. Here’s a hint, you can multiply by 0.9 to get 90% of the original value (and thus the 10% off price).
SELECT prod_id, prod_price, prod_price*0.9 AS sale_price FROM products; 