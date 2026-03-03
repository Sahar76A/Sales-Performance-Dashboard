# 📊 Sales Performance Dashboard

**Power BI • Power Query (M) • DAX • Star Schema Modeling**

## Overview

End-to-end Business Intelligence solution built in Power BI.  
The project transforms raw retail transactional data into a structured **Star Schema** model and delivers executive-level insights through interactive reporting.

The implementation follows enterprise BI practices including modular ETL design, surrogate key modeling, and advanced DAX time intelligence.

---

## Architecture

### Data Model
- **FactSales** (Sales, Profit, Quantity, Discount, Dates)
- **DimCustomer**
- **DimProduct**
- **DimShipMode**
- **DimDate**

Structured using a clean Star Schema for scalability and performance.

---

## ETL (Power Query)

Modular transformation pipeline:

- Parameterized data source
- Strict data type enforcement
- Duplicate removal
- Text standardization
- Postal code imputation using (City, State) mode logic
- Surrogate key implementation

Layered design:
`Staging → Dimensions → Fact`

---

## DAX & KPI Framework

Reusable measure library including:

- Total Sales
- Net Profit
- Profit Margin
- Total Orders
- Average Order Value
- Year-over-Year Growth
- Time Intelligence (MTD / QTD / YTD)
- Top Region / Sub-Category logic

---

## Key Insights

- **$2.3M Total Sales**
- **$598K Profit (~26% margin)**
- Strong growth from 2016 → 2017
- West region leads in sales and profitability
- Phones & Chairs are top-performing categories
- Q4 (November peak) drives highest revenue

---

## Technical Stack

- **Power BI Desktop**
- **Power Query (M)**
- **DAX**
- CSV data source

---

## Preview

![Dashboard Overview](images/dashboard-overview.png)
📸 Dashboard Preview

![](dashboard_images/dashboard1.png)

![](dashboard_images/dashboard2.png)



