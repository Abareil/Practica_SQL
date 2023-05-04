--Ranking de Productos Vendidos por Reseller.

SELECT r.ResellerName
,RANK() OVER (ORDER BY SUM(rs.OrderQuantity) DESC) AS Ranking
,SUM(rs.OrderQuantity) AS unidades_vendidas
FROM [AdventureWorksDW2019].[dbo].FactResellerSales AS rs
JOIN [AdventureWorksDW2019].[dbo].DimReseller AS r
ON rs.ResellerKey = r.ResellerKey
GROUP BY r.ResellerKey, r.ResellerName

-- Venta más alta y Reseller que la realizó, para el producto: “Mountain-100 Black, 42”

SELECT TOP(1) r.ResellerName, p.EnglishProductName AS producto, MAX(rs.SalesAmount) AS venta_max
FROM [AdventureWorksDW2019].[dbo].FactResellerSales AS rs
JOIN [AdventureWorksDW2019].[dbo].DimReseller AS r
ON rs.ResellerKey = r.ResellerKey
JOIN [AdventureWorksDW2019].[dbo].DimProduct as p
ON p.ProductKey = rs.ProductKey
WHERE P.EnglishProductName = 'Mountain-100 Black, 42'
GROUP BY r.ResellerKey, r.ResellerName, p.EnglishProductName
order by MAX(rs.SalesAmount) desc

