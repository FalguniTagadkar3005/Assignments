alter Procedure SalesByCountry @Country varchar(30)
AS
BEGIN
	SELECT o.OrderID,e.EmployeeID,e.FirstName,e.LastName,(od.unitPrice*od.Quantity-od.Discount) as 'Sales'
	FROM Orders o
	JOIN Employees e ON o.employeeID=e.employeeID
	JOIN [Order Details] od ON o.orderID = od.orderID
	WHERE o.ShipCountry = @Country;
END

SalesByYear 'USA'

Alter Procedure SalesByYear @year datetime
AS
BEGIN
	SELECT o.OrderID,e.EmployeeID,e.FirstName,e.LastName,(od.unitPrice*od.Quantity-od.Discount) as 'Sales'
	FROM Orders o
	JOIN Employees e ON o.employeeID=e.employeeID
	JOIN [Order Details] od ON o.orderID = od.orderID
	WHERE Year(o.OrderDate) = Year(@year);
END;

SalesByYear '1996-7-12';

Alter Procedure SalesByCategory @category_id int
AS
BEGIN
	SELECT p.ProductID,p.ProductName,sum((od.unitPrice*od.Quantity-od.Discount)) as 'Sales'
	FROM Products p
	JOIN Categories c ON p.CategoryID = c.CategoryID
	JOIN [Order Details] od ON p.ProductID = od.ProductID
	WHERE c.CategoryID=@category_id
	GROUP BY p.ProductID,p.ProductName;
END
SalesByCategory 2

Create Procedure TenMostExpensive
As
BEGIN
	SELECT TOP 10 ProductID,ProductName,UnitPrice
	FROM Products
	Order by UnitPrice desc;
END
TenMostExpensive

CREATE PROCEDURE InsertOrderDetails
@CustomerID nchar(5),
@EmployeeID int,
@OrderDate datetime,
@RequiredDate datetime,
@ShippedDate datetime,
@ShipVia int,
@Freight money,
@ShipName nvarchar(40),
@ShipAddress nvarchar(60),
@ShipCity nvarchar(15),
@ShipRegion nvarchar(15),
@ShipPostalCode nvarchar(10),
@ShipCountry nvarchar(15),
@ProductID INT,
@UnitPrice DEC(10,2),
@Quantity INT,
@Discount DEC(10,2)

AS
BEGIN
	insert into Orders
	values(@CustomerID,@EmployeeID,@OrderDate,@RequiredDate,
	@ShippedDate,@ShipVia,@Freight,@ShipName,@ShipAddress,@ShipCity,
	@ShipRegion,@ShipPostalCode,@ShipCountry)

	insert into [Order Details] 
	values((select MAX(OrderID) from Orders),
	@ProductID,@UnitPrice,@Quantity,@Discount)
END

InsertOrderDetails 'VINET',6,'2024-01-24','2024-02-20',
null,null,7.8,null,null,null,null,null,null,11,14.00,12,0

CREATE PROCEDURE UpdateOrderDetails
@OrderID INT,
@ProductID INT,
@UnitPrice DEC(10,2),
@Quantity INT,
@Discount DEC(10,2)

AS
BEGIN
	Update [Order Details] 
	SET UnitPrice = @UnitPrice, Quantity= @Quantity, Discount = @Discount 
	WHERE OrderID=@OrderID AND ProductID=@ProductID
END

UpdateOrderDetails 11078,11,13,11,1