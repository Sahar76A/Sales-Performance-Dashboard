# Star Schema Model

## Fact Table — FactSales
Contains transactional metrics and keys:
- Sales, Profit, Quantity, Discount
- Order Date, Ship Date
- Customer ID, Product ID, Ship Mode ID
- Geography: Country, City, State, Region, Postal Code

## Dimensions
- **DimCustomer**: Customer ID, Customer Name, Segment
- **DimProduct**: Product ID, Product Name, Category, Sub-Category
- **DimShipMode**: Ship Mode ID (surrogate), Ship Mode
- **DimDate**: Date, Year, Quarter, Month, Month-Year

## Relationships (single-direction)
- FactSales[Customer ID] → DimCustomer[Customer ID]
- FactSales[Product ID] → DimProduct[Product ID]
- FactSales[Ship Mode ID] → DimShipMode[Ship Mode ID]
- FactSales[Order Date] → DimDate[Date] (Active)
