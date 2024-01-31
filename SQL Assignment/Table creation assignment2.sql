--CREATE TABLE  OrdersSelf
--(
--	order_no INT primary key,
--	purchase_amt INT,
--	order_date Datetime,
--	customer_id INT,
--	salesman_id INT,
--	foreign key (customer_id) references Customer(customer_id),
--	foreign key (salesman_id) references Salesman(salesman_id)
--);


--INSERT INTO salesman VALUES
--(1,'Jack','Ahmedabad',10),
--(2,'Prayag','Surat',15),
--(3,'Mohit','Rajkot',12),
--(4,'Dev','Ahmedabad',15),
--(5,'Mitali','Baroda',17),
--(6,'Anuj','Jamnagar',20),
--(7,'Pritam','Baroda',15),
--(8,'Niyati','Surat',20),
--(9,'Devanshi','Ahmedabad',17),
--(10,'Anuj','Junagadh',18);

--INSERT INTO customer VALUES
--(1,'Parth','Ahmedabad',1,1),
--(2,'Mayur','Surat',3,5),
--(3,'Devam','Rajkot',2,3),
--(4,'Het','Solapur',2,7),
--(5,'Shrey','Baroda',1,2),
--(6,'Neel','Jamnagar',2,6),
--(7,'Priyansh','Baroda',2,10),
--(8,'Nitya','Surat',2,9),
--(9,'Manish','Ahmedabad',3,1),
--(10,'Dhaval','Junagadh',3,2);

--INSERT INTO OrdersSelf VALUES
--(1,2000,convert(datetime,'27-12-23',5),1,1);
--(2,1000,convert(datetime,'7-1-24',5),1,5),
--(3,1500,convert(datetime,'15-1-24',5),3,7),
--(4,500,convert(datetime,'27-12-23',5),4,8),
--(5,2500,convert(datetime,'11-1-24',5),6,6),
--(6,500,convert(datetime,'11-12-23',5),5,3),
--(7,1500,convert(datetime,'20-1-24',5),8,2),
--(8,3000,convert(datetime,'7-1-24',5),2,9),
--(9,500,convert(datetime,'2-11-23',5),9,2),
--(10,300,convert(datetime,'22-1-24',5),10,5);

