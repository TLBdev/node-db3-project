-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select Product.ProductName, Category.CategoryName  
from Product
join Category on Category.id = Product.CategoryId;
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select [order].id, [order].OrderDate, Shipper.CompanyName 
from [order]
join Shipper on Shipper.id = [order].ShipVia

where [order].OrderDate < "2012-08-09"
order by [order].OrderDate 
;
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select OrderDetail.Quantity, Product.ProductName
from OrderDetail
join Product on Product.Id = OrderDetail.ProductId
where OrderDetail.OrderId = 10251
order by Product.ProductName;
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select [order].id as OrderId, Customer.CompanyName,  Employee.LastName as EmployeeLastName
from [order]
join Customer on Customer.Id = [order].CustomerId
join Employee on Employee.id = [order].EmployeeId
