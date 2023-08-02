--Clean Customer Table 
SELECT 
	c.[CustomerKey],
    --,[GeographyKey]
    --,[CustomerAlternateKey]
    --,[Title]
    c.[FirstName] AS [First Name],
    --,[MiddleName]
    c.[LastName] AS [Last Name],
    --,[NameStyle]
    c.[BirthDate] AS [DOB],
    --,[MaritalStatus]
    --,[Suffix]
    CASE
		c.[Gender] WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female'
	END AS Gender,
    --,[EmailAddress]
    c.[YearlyIncome] AS Income,
    --,[TotalChildren]
    --,[NumberChildrenAtHome]
    --,[EnglishEducation]
    --,[SpanishEducation]
    --,[FrenchEducation]
    --,[EnglishOccupation]
    --,[SpanishOccupation]
    --,[FrenchOccupation]
    --,[HouseOwnerFlag]
    --,[NumberCarsOwned]
    --,[AddressLine1]
    --,[AddressLine2]
    --,[Phone]
    c.[DateFirstPurchase],
    --,[CommuteDistance]
	g.city AS [Customer City]
  FROM 
	[AdventureWorksDW2022].[dbo].[DimCustomer] AS c
	LEFT JOIN dbo.DimGeography AS g
	ON g.GeographyKey = c.GeographyKey;
