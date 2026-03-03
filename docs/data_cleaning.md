# Data Cleaning & Transformation (Power Query)

## Controls implemented
- Strict data type enforcement (dates, numeric, text)
- Full-row duplicate removal
- Text standardization (trim)
- Explicit date parsing with locale handling
- Automated Postal Code imputation:
  - For missing postal codes, the pipeline creates a (City, State) → **most frequent** Postal Code lookup
  - Uses the lookup to fill null postal codes

## Modeling outcomes
- Staging layer: `stg_Superstore`
- Dimension layer: `DimCustomer`, `DimProduct`, `DimShipMode`
- Fact layer: `FactSales` (uses surrogate Ship Mode ID)
