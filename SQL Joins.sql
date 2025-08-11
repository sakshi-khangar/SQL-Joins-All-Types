CREATE DATABASE salesdb;
USE salesdb;
CREATE TABLE Customers(Customer_id INT PRIMARY KEY,	Customer_name varchar(50),City varchar(50));
INSERT INTO Customers VALUES(1,'Sakshi','Nagpur'),(2,'Riya','Mumbai'),(3,'Sneha','Pune');

CREATE TABLE Orders (Order_id INT PRIMARY KEY , Customer_id INT,Product VARCHAR(50),foreign key(Customer_id) references Customers(Customer_id));
INSERT INTO Orders VALUES (101,1,'Laptop'),(102,2,'Mobile'),(103,4,'Tablet'); #customer_id 4 doesn't exist in Customers
SET FOREIGN_KEY_CHECKS = 0;
SET FOREIGN_KEY_CHECKS = 1;
SELECT * FROM Customers;
SELECT * FROM Orders;
#INNER JOIN
SELECT Customers.Customer_id,Customer_name,Product FROM Customers 
INNER JOIN Orders ON Customers.Customer_id = Orders.Customer_id;
#LEFT JOIN
SELECT Customers.Customer_id,Customer_name,Product FROM Customers 
LEFT JOIN Orders ON Customers.Customer_id = Orders.Customer_id;
#RIGHT JOIN
SELECT Customers.Customer_id,Customer_name,Product FROM Customers 
RIGHT JOIN Orders ON Customers.Customer_id=Orders.Customer_id;
#FULL JOIN
SELECT Customers.Customer_id,Customer_name,Product FROM Customers 
LEFT JOIN Orders ON Customers.Customer_id=Orders.Customer_id UNION 
SELECT Customers.Customer_id,Customer_name,Product FROM Customers
RIGHT JOIN Orders ON Customers.Customer_id=Orders.Customer_id;
#CROSS JOIN
SELECT Customers.Customer_name,Orders.Product FROM Customers 
CROSS JOIN Orders;
#SELF JOIN
SELECT A.Customer_name AS Customer1,B.Customer_name AS Customer2, A.City FROM Customers A 
JOIN Customers B ON A.City=B.City AND A.Customer_id <> B.Customer_id;