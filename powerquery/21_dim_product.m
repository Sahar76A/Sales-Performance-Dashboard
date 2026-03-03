/*
DimProduct: product attributes for category/sub-category analysis.
*/
let
    Source = stg_Superstore,
    Keep = Table.SelectColumns(Source, {"Product ID","Product Name","Category","Sub-Category"}),
    DistinctRows = Table.Distinct(Keep)
in
    DistinctRows
