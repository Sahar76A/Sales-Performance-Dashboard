# Build Instructions (Power BI Desktop)

## 1) Load data
Power BI Desktop → **Get Data → Text/CSV** → select:
`data/Sample - Superstore.csv` → click **Transform Data**.

## 2) Create a parameter (required)
In Power Query:
- Manage Parameters → New Parameter
- Name: `pDataPath`
- Type: Text
- Value: your local CSV path, e.g.  
  `C:\Users\<you>\Downloads\Sales-Performance-Dashboard\data\Sample - Superstore.csv`

## 3) Create function library query
Create a **Blank Query** named `fx` → Advanced Editor → paste `powerquery/01_functions.m`.

## 4) Create staging table
Create a **Blank Query** named `stg_Superstore` → paste `powerquery/10_staging_superstore.m`.

## 5) Create dimension tables
Create these queries (New Source → Blank Query, then paste each file):

- `DimCustomer` from `powerquery/20_dim_customer.m`
- `DimProduct` from `powerquery/21_dim_product.m`
- `DimShipMode` from `powerquery/22_dim_shipmode.m`

## 6) Create fact table
Create a **Blank Query** named `FactSales` → paste `powerquery/30_fact_sales.m`.

## 7) Load the model + relationships
Model view:
- FactSales[Customer ID] → DimCustomer[Customer ID]
- FactSales[Product ID] → DimProduct[Product ID]
- FactSales[Ship Mode ID] → DimShipMode[Ship Mode ID]

Then create DimDate (DAX table) and relate:
- FactSales[Order Date] → DimDate[Date] (Active)

Mark DimDate as the Date table.

## 8) Add DAX measures
Modeling → New table / New measure:
- Create `DimDate` from `dax/00_dim_date.dax`
- Add measures from `dax/10_base_measures.dax`, `dax/20_time_intelligence.dax`, `dax/30_rank_kpis.dax`

## 9) Build visuals
Recommended visuals:
- KPI cards: Sales, Profit, Margin, Orders
- Trend line: Sales by Month-Year
- Region bar chart: Sales and Profit by Region
- Top Sub-Category chart (Top N)
- Seasonality: Sales by Month / Quarter (Q4 focus)
