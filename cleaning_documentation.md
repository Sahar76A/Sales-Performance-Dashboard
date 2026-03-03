Data Cleaning Process

The following data preparation steps were performed:

1️⃣ Handling Negative Values

Corrected negative values in the Profit column.

Ensured consistency so profit values reflect accurate business performance.

2️⃣ Data Type Validation

Reviewed and validated all column data types.

Ensured:

Dates are stored as Date type.

Numeric fields (Sales, Profit, Quantity, etc.) are stored as numeric types.

Categorical columns are formatted properly.

3️⃣ Missing Values Check

Identified and reviewed missing values.

Cleaned or handled them appropriately to maintain data integrity.

4️⃣ Removing Unnecessary Columns

Removed irrelevant or redundant columns from the Fact table.

Reduced data noise and improved model performance.

Data Modeling (Star Schema Design)

To optimize the dataset for analytics and reporting, a Star Schema model was created.

⭐ Fact Table

The main transactional table was structured as the Fact Table, containing:

Sales metrics

Profit

Quantity

Foreign keys linking to dimension tables

Unnecessary descriptive attributes were removed to maintain normalization.
Dimension Tables

The original table was duplicated and transformed to create separate dimension tables:

🔹 DimCustomer

Contains customer-related attributes.

Used to analyze customer behavior and segmentation.

🔹 DimProduct

Contains product-related information.

Enables product-level performance analysis.

🔹 DimShipMode

Contains shipping mode details.

A conditional column was created to assign a unique Ship Mode ID.

This ID connects the Ship Mode dimension to the Fact table.

🔹 DimDate

Created to support time-based analysis.

Enables:

Yearly trends

Monthly performance

Time intelligence calculations
