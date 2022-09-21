

create database MyAdventureWorks
 on (Filename = 'E:\AdventureWorks2012_Data.mdf'),
 (Filename = 'E:\AdventureWorks2012_Log.ldf')
 for attach


 use MyAdventureWorks

--Ejemplo 1
select Ord.SalesOrderID, Ord.OrderDate,
  (Select max(OrdDet.UnitPrice)
   From Sales.SalesOrderDetail as OrdDet
   Where Ord.SalesOrderId = OrdDet.SalesOrderDetailID) as MaxUnitPrice
From Sales.SalesOrderHeader As Ord


Create view Ej1 as 
select Ord.SalesOrderID, Ord.OrderDate,
  (Select max(OrdDet.UnitPrice)
   From Sales.SalesOrderDetail as OrdDet
   Where Ord.SalesOrderId = OrdDet.SalesOrderDetailID) as MaxUnitPrice
From Sales.SalesOrderHeader As Ord

select * from Ej1

--Ejemplo 2

Select Name
from  Production.Product
where ListPrice = (Select ListPrice
                   From Production.Product
				   Where Name = 'Chainring Bolts')
				   
create view Ej2 as 
Select Name
from  Production.Product
where ListPrice = (Select ListPrice
                   From Production.Product
				   Where Name = 'Chainring Bolts')

select * from Ej2

--Ejemplo 3

select Name
from Sales.Store
where BusinessEntityID not in
(select CustomerId
from sales.Customer
where TerritoryID = 5)

create view Ej3 as
select Name
from Sales.Store
where BusinessEntityID not in
(select CustomerId
from sales.Customer
where TerritoryID = 5)


select * from Ej3



--Ejemplo 4

select LastName,FirstName
from Person.Person
where BusinessEntityID in
(select BusinessEntityID
from HumanResources.Employee
where BusinessEntityID in(
select BusinessEntityID 
from sales.SalesPerson))


create view Ej4 as
select LastName,FirstName
from Person.Person
where BusinessEntityID in
(select BusinessEntityID
from HumanResources.Employee
where BusinessEntityID in(
select BusinessEntityID 
from sales.SalesPerson))

select * from Ej4

--Ejemplo 5

select DISTINCT c.LastName,c.Firsname,e.BusinessEntityID
from Person.Person as c join HumanResources.Employee as e
on e.BusinessEntityID = c.BusinessEntityID
where 5000.00 in
(select Bonus
from )



