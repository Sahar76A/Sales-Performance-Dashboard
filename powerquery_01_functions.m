/*
---------------------------------------------------------
Project: Sales Performance Dashboard
Layer: Functions
File: 01_functions.m
Purpose:
  Reusable helper functions:
  - Trim text safely across columns
  - Enforce types using a type map
  - Create (City, State) → Mode Postal Code mapping
Author: Sahar Heidariasl
Last Updated: 2026-03
---------------------------------------------------------
*/

let
    fnTrimTextColumns = (t as table) as table =>
        Table.TransformColumns(
            t,
            List.Transform(
                Table.ColumnNames(t),
                (c) => { c, (v) => if v is text then Text.Trim(v) else v, type any }
            )
        ),

    fnEnforceTypes = (t as table, typeMap as list) as table =>
        Table.TransformColumnTypes(t, typeMap, "en-US"),

    fnPostalMap = (t as table) as table =>
        let
            base = Table.SelectRows(t, each [Postal Code] <> null),
            grouped = Table.Group(
                base,
                {"City","State"},
                {{"PostalCandidates", each _, type table}}
            ),
            addMode =
                Table.AddColumn(
                    grouped,
                    "Postal Code Mode",
                    each
                        let
                            pc = Table.Column([PostalCandidates], "Postal Code"),
                            freq =
                                Table.Group(
                                    Table.FromList(pc, Splitter.SplitByNothing(), {"PC"}),
                                    {"PC"},
                                    {{"n", each Table.RowCount(_), Int64.Type}}
                                ),
                            sorted = Table.Sort(freq, {{"n", Order.Descending}}),
                            mode = try sorted{0}[PC] otherwise null
                        in
                            mode,
                    Int64.Type
                ),
            keep = Table.SelectColumns(addMode, {"City","State","Postal Code Mode"})
        in
            keep
in
    [
        fnTrimTextColumns = fnTrimTextColumns,
        fnEnforceTypes = fnEnforceTypes,
        fnPostalMap = fnPostalMap
    ]
