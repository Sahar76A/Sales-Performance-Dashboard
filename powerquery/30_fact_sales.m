/*
FactSales: transactional fact table with surrogate key for Ship Mode.
*/
let
    Source = stg_Superstore,
    MergeShip = Table.NestedJoin(Source, {"Ship Mode"}, DimShipMode, {"Ship Mode"}, "Ship", JoinKind.LeftOuter),
    ExpandShip = Table.ExpandTableColumn(MergeShip, "Ship", {"Ship Mode ID"}, {"Ship Mode ID"}),

    Keep =
        Table.SelectColumns(
            ExpandShip,
            {
                "Row ID","Order ID","Order Date","Ship Date",
                "Customer ID","Product ID","Ship Mode ID",
                "Country","City","State","Postal Code","Region",
                "Sales","Quantity","Discount","Profit"
            }
        )
in
    Keep
