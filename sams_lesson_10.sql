USE sql_sams;

#Lesson 10 - Grouping Data - Summarize subsets of data - GROUP BY | HAVING 
#Grouping lets you divide data into logical sets so that you can perform aggregate calculations on each set
 
#Return number of products offered by each vendor
SELECT vend_id, COUNT(*) AS num_products FROM products GROUP BY vend_id;

# HAVING() -> filters by groups
SELECT cust_id, COUNT(*) AS orders FROM orders GROUP BY cust_id HAVING COUNT(*) >=2;

# WHERE VS HAVING -> WHERE filters data before data is grouped. HAVING filters data after data is grouped

#List all vendors who have 2 or more products priced at 4 or more
SELECT vend_id, COUNT(*) AS num_products FROM products WHERE prod_price >= 4 GROUP BY vend_id HAVING COUNT(*) >= 2;  

# ORDER BY -> Sorts the generated Data | GROUP BY -> Groups rows

SELECT order_num, COUNT(*) AS items FROM orderitems GROUP BY order_num HAVING COUNT(*) >= 3;

SELECT order_num, COUNT(*) AS items FROM orderitems GROUP BY order_num HAVING COUNT(*) >= 3 ORDER BY items, order_num;

#Here the GROUP BY clause is used to group the data by order number so that the COUNT(*) can return the numbe rof items in each order 
# HAVING clause filters data so that only orders with 3 or more items are returned. Finally the output is sorte dusing ORDER BY clause.
 
#Select clause ordering
# 1 SELECT -> Columns or expressions to be returned
# 2 FROM -> Table to retrieve data from
# 3 WHERE -> Row level filtering
# 4 GROUP BY -> Group specification
# 5 HAVING -> Group level filtering
# 6 ORDER BY -> Sort the output

#Challenges Lesson 10
#1 The OrderItems table contains the individual items for each order. Write a SQL statement that returns the number of lines (as order_lines) for each order number (order_num) and sort the results buy order_lines.
SELECT order_num, COUNT(*) AS order_lines FROM orderitems GROUP BY order_num ORDER BY order_lines;

#2 Write a SQL statement that returns a field named cheapest_item which contains the lowest cost item for each vendor (using prod_price in the Products table), and sort the results from lowest to highest cost.
SELECT vend_id, MIN(prod_price) AS cheapest_item FROM products GROUP BY vend_id ORDER BY cheapest_item; 

#3 It’s important to identify the best customers, so write a SQL statement to return the order number (order_num in OrderItems table) for all orders of at least 100 items.
SELECT order_num FROM orderitems GROUP BY order_num HAVING SUM(quantity) >=100 ORDER BY order_num; 

#4 Another way to determine the best customers is by how much they have spent. Write a SQL statement to return the order number (order_num in OrderItems table) for all orders with a total price of at least 1000. Hint, for this one you’ll need to calculate and sum the total (item_price multiplied by quantity). Sort the results by order number.
SELECT order_num, SUM(item_price*quantity) AS total_price FROM orderitems GROUP BY order_num HAVING total_price >= 1000 ORDER BY order_num; 

 