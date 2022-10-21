USE sql_sams;

#Lesson 11 -> Sub queries -> queries that are embedded into other queries

#List of all customers who ordered item RGAN01
#Step1 -> Retrieve the order numbers of all orders containing item RGAN01
#Step2 -> Retrieve the customer ID of all the customers who have orders listed in the order numbers returned in the previous step
#step3 -> Retrieve the customer information for all customer IDs returned in the previous step.

SELECT order_num FROM orderitems WHERE prod_id = 'RGAN01'; 

SELECT cust_id FROM orders WHERE order_num IN(20007,20008);

SELECT cust_name, cust_contact FROM customers WHERE cust_id IN (1000000004, 1000000005);

#Combine the above queries
SELECT cust_name, cust_contact
FROM customers
WHERE cust_id IN ( SELECT cust_id 
				   FROM orders 
				   WHERE order_num IN ( SELECT order_num 
										FROM orderitems 
										WHERE prod_id = 'RGAN01' ));

#Subqueries always process the inner most queries first and work outward
#Always breakup the subqueries into multiple lines and indenting the lines can simplify working with subqueries


#Using Subqueries as Calculated Fields

#Display total number of orders placed by every customer in your customers table.
#step1 -> Retrieve list of customers from the customers table.
#step2 -> for each customer retrieved count the number of associated orders in the orders table.

#Count for 1 customer
SELECT COUNT(*) AS orders FROM orders WHERE cust_id = 1000000001;

SELECT cust_name, cust_state, ( SELECT COUNT(*)
								FROM orders
                                WHERE orders.cust_id = customers.cust_id) AS orders
FROM customers
ORDER BY cust_name;                                


#Challenges lesson 11

#1 Using a subquery, return a list of customers who bought items priced 10 or more. You’ll want to use the OrderItems table to find the matching order numbers (order_num), and then the Orders table to retrieve the customer id (cust_id) for those matched orders.
SELECT cust_id 
FROM orders 
WHERE order_num IN (SELECT order_num 
					FROM orderitems 
                    WHERE item_price >= 10);

#2 You need to know the dates when product BR01 was ordered. Write a SQL statement that uses a subquery to determine which orders (in OrderItems) purchased prod_id BR01, and then returns customer id (cust_id) and order date (order_date) for each from the Orders table. Sort the results by order date.
SELECT cust_id, order_date 
FROM orders 
WHERE order_num IN ( SELECT order_num 
					 FROM orderitems 
                     WHERE prod_id='BR01') 
ORDER BY order_date;


#3  Now let’s make it a bit more challenging. Update the previous challenge to return the customer email (cust_email in the Customers table) for any customers who purchased item with a prod_id of BR01. Hint, this involves the SELECT statement, the innermost one returning order_num from OrderItems, and the middle one returning cust_id from Orders.
SELECT cust_email 
FROM customers 
WHERE cust_id IN (SELECT cust_id
				  FROM orders 
                  WHERE order_num IN ( SELECT order_num 
									   FROM orderitems 
                                       WHERE prod_id='BR01'));
                                       

#4 We need a list of customer ids with the total amount they have ordered. Write a SQL statement to return customer id (cust_id in Orders table) and total_ordered using a subquery to return the total of orders for each customer. Sort the results by amount spent from greatest to the least. Hint, you’ve used the SUM() to calculate order totals previously.
SELECT cust_id,( SELECT SUM(item_price*quantity)  
					FROM orderitems
                    WHERE orders.order_num = orderitems.order_num) AS total_ordered
FROM orders 
ORDER BY total_ordered DESC;
                    

#5 One more. Write a SQL statement that retrieves all product names (prod_name) from the Products table, along with a calculated named quant_sold containing the total number of this item sold (retrieved using a subquery and a SUM(quantity) on the OrderItems table).
SELECT prod_name, (SELECT SUM(quantity) 
				   FROM orderitems 
                   WHERE orderitems.prod_id = products.prod_id ) AS quant_sold 
FROM products;
										