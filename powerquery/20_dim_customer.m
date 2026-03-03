/*
DimCustomer: customer attributes for segmentation.
*/
let
    Source = stg_Superstore,
    Keep = Table.SelectColumns(Source, {"Customer ID","Customer Name","Segment"}),
    DistinctRows = Table.Distinct(Keep)
in
    DistinctRows
