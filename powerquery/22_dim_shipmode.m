/*
DimShipMode: shipping mode dimension with surrogate key.
*/
let
    Source = stg_Superstore,
    Keep = Table.SelectColumns(Source, {"Ship Mode"}),
    DistinctRows = Table.Distinct(Keep),
    AddID = Table.AddIndexColumn(DistinctRows, "Ship Mode ID", 1, 1, Int64.Type),
    Reorder = Table.ReorderColumns(AddID, {"Ship Mode ID","Ship Mode"})
in
    Reorder
