USE sql_sams;

#Lesson 6 WILDCARD Filtering - Using LIKE operator
#Used for search of less known values like all the products that has text beanbag

#Percent sign (%) Wild card

#Find all products that start with word Fish.
SELECT prod_id, prod_name FROM products WHERE prod_name LIKE 'Fish%';

#Find all products that contains 'bean bag' in the prod_name .
SELECT prod_id, prod_name FROM products WHERE prod_name LIKE '%bean bag%'; 

#find all the products that begin with letter F and end with letter y.
SELECT prod_name FROM  products WHERE prod_name LIKE 'F%y';

#If there are trailing spaces apended to the column then use % after y.
SELECT prod_name FROM  products WHERE prod_name LIKE 'F%y%';

#Middle search pattern can be useful when looking for email adresses LIKE 'b%forta.com'


# Underscore(_) WILDCARD - matches single character

#We are using 2 __ to match the 12 and 18 inch teddy bears but the 8 inch is missing 
SELECT prod_id, prod_name FROM products WHERE prod_name LIKE '__ inch teddy bear';

# % can match zero, one or more characters where as _ can only match one character
SELECT prod_id, prod_name FROM products WHERE prod_name LIKE '% inch teddy bear';

# Brackets [] Wildcard - Used to specify a set of characters

#All  contacts whose names begin with letter J or the letter M
# SELECT cust_contact FROM customers WHERE cust_contact LIKE '[JM]%';

#Negate the above statement  - All contacts that does not start with J AMD M
#SELECT cust_contact FROM customers WHERE cust_contact LIKE '[^JM]%';

#Same can be achieved by using NOT operator
#SELECT cust_contact FROM customers WHERE NOT cust_contact LIKE '[JM]%';

## Tips
# Dont overuse WILDCARDS if another search operator will do the same.
# Try not to use wildcards at the begining of the search pattern unless absolutely necessary.
# Search pattern that begin with wildcards are the slowest to process.
# Pay careful attention to the placement of the wildcard symbols. 

 #challenges lesson 6
 
 #1 Write a SQL statement to retrieve the product name (prod_name) and description (prod_desc) from the Products table, returning only products where the word toy is in the description.
 SELECT prod_name, prod_desc FROM products WHERE prod_desc LIKE '%toy%';
 
 #2 Now let’s flip things around. Write a SQL statement to retrieve the product name (prod_name) and description (prod_desc) from the Products table, returning only products where the word toy doesn’t appear in the description. And this time, sort the results by product name.
 SELECT prod_name, prod_desc FROM products WHERE NOT prod_desc LIKE '%toy%' ORDER BY prod_name;
 
 #3 Write a SQL statement to retrieve the product name (prod_name) and description (prod_desc) from the Products table, returning only products where both the words toy and carrots appear in the description. There are a couple of ways to do this, but for this challenge use AND and two LIKE comparisons.
 SELECT prod_name, prod_desc FROM products WHERE prod_desc LIKE '%toy%' AND prod_desc LIKE '%carrots%';
 
 #4 Write a SQL statement to retrieve the product name (prod_name) and description (prod_desc) from the Products table, returning only products where both the words toy and carrots appear in the description in that order (the word toy before the word carrots). Here’s a hint, you’ll only need one LIKE with 3 % symbols to do this.
 SELECT prod_name, prod_desc FROM products WHERE prod_desc LIKE '%toy%carrots%';