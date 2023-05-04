--Nombres y Apellidos de los clientes que NO hayan realizado una compra en Enero 2011.

SELECT DISTINCT c.LastName, c.MiddleName, c.FirstName  --18326
FROM [AdventureWorksDW2019].[dbo].DimCustomer AS c
JOIN [AdventureWorksDW2019].[dbo].FactInternetSales AS s
ON c.CustomerKey = s.CustomerKey
WHERE c.CustomerKey NOT IN (
SELECT c.CustomerKey
FROM [AdventureWorksDW2019].[dbo].DimCustomer AS c
JOIN [AdventureWorksDW2019].[dbo].FactInternetSales AS s
ON c.CustomerKey = s.CustomerKey
WHERE s.OrderDate BETWEEN '2011-01-01' and '2011-01-31') 
ORDER BY c.LastName, c.FirstName

--Todos los empleados que se encuentren en el departamento de manufactura (Manufacturing) y de Aseguramiento de Calidad (Quality Assurance)
--que además sean Hombres (M) y se encuentren Solteros (S).

SELECT E.EmployeeKey AS ID,  e.LastName, e.FirstName
FROM [AdventureWorksDW2019].[dbo].[DimEmployee] AS e
WHERE (e.DepartmentName = 'Manufacturing' OR DepartmentName = 'Quality Assurance')
AND (e.Gender = 'M') AND (e.MaritalStatus = 'S')
ORDER BY e.LastName, e.FirstName;

--Todos los empleados cuyo apellido empiece con S o su Nombre termine con A.

SELECT e.LastName, e.FirstName
FROM [AdventureWorksDW2019].[dbo].[DimEmployee] AS e
WHERE e.LastName LIKE 'S%'
OR e.FirstName LIKE '%A'
ORDER BY e.LastName, e.FirstName; 

-- Todos los empleados cuya edad es mayor que 40. Listar Nombre, Apellido, Sexo, Fecha de Nacimiento, Edad.

SELECT e.FirstName AS nombre, e.LastName AS Apellido, e.Gender AS sexo, e.BirthDate AS Fecha_Nacimiento, DATEDIFF( year, e.BirthDate, GETDATE()) AS Edad
FROM [AdventureWorksDW2019].[dbo].[DimEmployee] AS e
WHERE DATEDIFF( year, e.BirthDate, GETDATE()) > 40
ORDER BY e.LastName, e.FirstName;