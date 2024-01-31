--Assignment 2
--Query 1
--write a SQL query to find the salesperson and customer who reside in the same city. 
--Return Salesman, cust_name and city
SELECT s.salesman_name, c.customer_name , c.city
FROM salesman s
JOIN customer c ON s.city=c.city; 


--Query 2
--. write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city
SELECT o.order_no , o.purchase_amt , c.customer_name , c.city
FROM OrdersSelf o
JOIN Customer c on o.customer_id = c.customer_id
WHERE o.purchase_amt BETWEEN 500 AND 2000;


--Query 3
-- write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission
SELECT c.customer_name , c.city , s.salesman_name , s.commision
FROM Salesman s
JOIN Customer c ON s.salesman_id = c.salesman_id;


--Query 4
-- write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission
SELECT salesman_name FROM Salesman WHERE commision >= 12;

--SELECT * from salesman;


--Query 5
-- write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the 
--company. Return Customer Name, customer city, Salesman, salesman city, commission
SELECT c.customer_name , c.city , s.salesman_name ,s.city , s.commision
FROM Salesman s
JOIN Customer c ON c.salesman_id = s.salesman_id
WHERE c.city != s.city AND s.commision > 12;


--Query 6
--write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission
SELECT o.order_no, o .order_date, o.purchase_amt,
	   c.customer_name , c.grade,
	   s.salesman_name , s.commision
from OrdersSelf o
JOIN Customer c ON o.customer_id = c.customer_id
JOIN Salesman s ON o.salesman_id = s.salesman_id


--Query 7
--. Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned
SELECT * from OrdersSelf o 
JOIN Customer c ON o.customer_id = c.customer_id
JOIN Salesman s ON o.salesman_id = s.salesman_id;


--Query 8
--write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.
SELECT c.customer_name,c.city as customer_city, c.grade,
		s.salesman_name,s.city as salesman_city
FROM customer c
JOIN salesman s ON c.salesman_id = s.salesman_id
ORDER BY customer_id desc;

--Query 9
--. write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity. The result should be 
--ordered by ascending customer_id
SELECT c.customer_name,c.city as customer_city, c.grade,
		s.salesman_name,s.city as salesman_city
FROM customer c
JOIN salesman s ON c.salesman_id = s.salesman_id
WHERE c.grade<3
ORDER BY customer_id;

--Query 10 
-- Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to 
--determine whether any of the existing customers have placed an order or not
SELECT c.customer_name , c.city ,
	   o.order_no ,o.order_date , o.purchase_amt as Order_amt
FROM Customer c 
LEFT JOIN OrdersSelf o on c.customer_id = o.customer_id
ORDER BY o.order_date;


--Query 11
-- Write a SQL statement to generate a report with customer name, city, order number, order date, order amount, salesperson name, and commission to determine if any of 
--the existing customers have not placed orders or if they have placed orders through their salesman or by themselves
SELECT c.customer_name ,c.city as customer_city ,
		o.order_no,o.order_date,o.purchase_amt,
		s.salesman_name,s.commision
FROM Customer c
LEFT JOIN OrdersSelf o ON c.customer_id=o.customer_id
LEFT JOIN Salesman s ON o.salesman_id = s.salesman_id;


--Query 12
--. Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers
SELECT s.salesman_id, s.salesman_name,count(customer_id) as 'Count of Customers'FROM Salesman sLEFT JOIN Customer c ON s.salesman_id=c.salesman_idGROUP BY s.salesman_id ,s.salesman_nameORDER BY s.salesman_name;--Query 13--write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount.--second left join performed to get all salespersonSELECT s.salesman_id,s.salesman_name ,	   c.customer_name,c.city as 'Customer city' ,c.grade,	   o.order_no,o.order_date,o.purchase_amtFROM Salesman sLEFT JOIN Customer c ON s.salesman_id = c.salesman_idLEFT JOIN OrdersSelf o  ON c.customer_id = o.customer_idORDER BY s.salesman_name;--Query 14--. Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customers. The customer may have placed, 
--either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.SELECT s.salesman_id,s.salesman_name,c.customer_id,c.customer_name,o.purchase_amtFROM Salesman sLeft JOIN Customer c ON s.salesman_id = c.salesman_idLEFT JOIN OrdersSelf o ON c.customer_id = o.customer_idWHERE o.purchase_amt>2000 OR o.customer_id IS NULL;--Query 15 --Same as 14th Query--Query 16SELECT c.customer_id,c.customer_name,c.city,	o.order_no,o.order_date,o.purchase_amtFROM Customer cJOIN OrdersSelf o ON c.customer_id=o.customer_id;--Query 17SELECT * FROMSalesman CROSS JOIN Customer;--Query 18SELECT * FROM Salesman s CROSS JOIN Customer cWHERE s.city=c.city;--Query 19SELECT * FROM Salesman s CROSS JOIN Customer cWHERE s.city=c.city AND c.grade=3;--Query 20SELECT * FROM Salesman s CROSS JOIN Customer cWHERE s.city!=c.city AND c.grade=1;