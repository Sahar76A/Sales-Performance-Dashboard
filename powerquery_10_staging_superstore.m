/*
---------------------------------------------------------
Project: Sales Performance Dashboard
Layer: Staging
File: 10_staging_superstore.m
Purpose:
  Loads CSV using parameter pDataPath, cleans data, enforces types,
  removes duplicates, and imputes missing Postal Codes using (City, State) mode.
Author: Sahar Heidariasl
Last Updated: 2026-03
---------------------------------------------------------
*/

let
    Source =
        Csv.Document(
            File.Contents(pDataPath),
            [Delimiter=",", Encoding=1252, QuoteStyle=QuoteStyle.Csv]
        ),

    Promoted = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    Trimmed = fx[fnTrimTextColumns](Promoted),

    ParseDates =
        Table.TransformColumns(
            Trimmed,
            {
                {"Order Date", each try Date.FromText(_, "en-US") otherwise null, type date},
                {"Ship Date", each try Date.FromText(_, "en-US") otherwise null, type date}
            }
        ),

    TypeMap =
        {
            {"Row ID", Int64.Type},
            {"Order ID", type text},
            {"Order Date", type date},
            {"Ship Date", type date},
            {"Ship Mode", type text},
            {"Customer ID", type text},
            {"Customer Name", type text},
            {"Segment", type text},
            {"Country", type text},
            {"City", type text},
            {"State", type text},
            {"Postal Code", Int64.Type},
            {"Region", type text},
            {"Product ID", type text},
            {"Category", type text},
            {"Sub-Category", type text},
            {"Product Name", type text},
            {"Sales", type number},
            {"Quantity", Int64.Type},
            {"Discount", type number},
            {"Profit", type number}
        },

    Typed = fx[fnEnforceTypes](ParseDates, TypeMap),

    // full-row duplicates
    Deduped = Table.Distinct(Typed),

    // Postal Code imputation
    PostalMap = fx[fnPostalMap](Deduped),
    MergeMap = Table.NestedJoin(Deduped, {"City","State"}, PostalMap, {"City","State"}, "PostalMap", JoinKind.LeftOuter),
    ExpandMap = Table.ExpandTableColumn(MergeMap, "PostalMap", {"Postal Code Mode"}, {"Postal Code Mode"}),

    FilledPostal =
        Table.AddColumn(
            ExpandMap,
            "Postal Code Clean",
            each if [Postal Code] = null then [Postal Code Mode] else [Postal Code],
            Int64.Type
        ),

    DropOldPostal = Table.RemoveColumns(FilledPostal, {"Postal Code", "Postal Code Mode"}),
    RenamePostal = Table.RenameColumns(DropOldPostal, {{"Postal Code Clean","Postal Code"}})
in
    RenamePostal
