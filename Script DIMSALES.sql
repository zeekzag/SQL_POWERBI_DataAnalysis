--Clean and add data to Internet Sales Table
SELECT
	s.[ProductKey],
	p.EnglishProductName AS [Product Name],
	p.ProductLine AS [Product Line],
    s.[OrderDateKey] AS [DateKey],
    --,[DueDateKey]
    --,[ShipDateKey]
    s.[CustomerKey],
    --[PromotionKey],
    --,[CurrencyKey]
    --[SalesTerritoryKey],
    --,[SalesOrderNumber]
    --,[SalesOrderLineNumber]
    --,[RevisionNumber]
    --[OrderQuantity] AS Quantity
    s.[UnitPrice] AS Price,
    --,[ExtendedAmount]
    --,[UnitPriceDiscountPct]
    --,[DiscountAmount]
    --,[ProductStandardCost]
    s.[TotalProductCost] AS Cost,
	CONCAT(((s.UnitPrice - s.TotalProductCost)/s.UnitPrice) * 100, '%') AS [Profit Margin],
    [SalesAmount] AS Sales,
    --,[TaxAmt]
    --,[Freight]
    --,[CarrierTrackingNumber]
    --,[CustomerPONumber]
    [OrderDate] AS Date,
    --,[DueDate]
    --,[ShipDate]
	st.SalesTerritoryCountry AS Country,
	ISNULL (p.Status, 'Outdated') AS [Product Status]
FROM 
	[AdventureWorksDW2022].[dbo].[FactInternetSales] AS s
	LEFT JOIN dbo.DimSalesTerritory AS st
	ON s.SalesTerritoryKey = st.SalesTerritoryKey
	LEFT JOIN dbo.DimProduct as p
	ON s.ProductKey = p.ProductKey
WHERE LEFT(OrderDateKey, 4) >= YEAR(GETDATE()) -2
ORDER BY ProductKey;
