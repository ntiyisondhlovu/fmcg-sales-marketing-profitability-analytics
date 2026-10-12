// =====================================================================
// Staging_Orders
// FMCG Sales, Marketing & Profitability Analytics (Power BI)
//
// Loads the raw CSV (18,240 order lines, 27 columns) and converts the
// nine money and percent columns to numbers WITHOUT relying on Power BI's
// regional settings. Every other table in the model (FactOrders and the
// seven dimensions) is built from this query. It is hidden in report view.
//
// HOW TO USE
//   Power BI Desktop > Home > Transform data > New Source > Blank Query >
//   Advanced Editor. Paste this file, change FilePath below, name the
//   query "Staging_Orders" and click Close & Apply.
//
// WHY THE CUSTOM PARSER
//   The CSV writes decimals with a period (12.74). On a computer whose
//   regional settings use a comma as the decimal separator:
//     - a plain "type number" step read 12.74 as 1274 (about 100x too big),
//       with no error message;
//     - Number.FromText(x, "en-US") was ignored on refresh in this build;
//     - AddColumn steps with no type loaded as text, so SUM failed.
//   ParseDot splits each value on the period and rebuilds the number from
//   its digits, so no regional setting can change the result.
//
// EXPECTED RESULT
//   18,240 rows | Net_Revenue_USD total 14,449,920 | Profit_USD total
//   3,308,965 | Unit_Price_USD from 1.45 to 12.74
//
// NOTE
//   Discount_Pct and Profit_Margin_Pct are WHOLE percentages (12.5 = 12.5%).
//   Divide by 100 in DAX before applying a % format.
// =====================================================================

let
    // ---- 1. Source ---------------------------------------------------
    // Change this path to where the CSV is saved on your computer.
    FilePath = "C:\Data\fmcg_sales_marketing_profitability_2023_2025.csv",

    Source = Csv.Document(
        File.Contents(FilePath),
        [Delimiter = ",", Columns = 27, Encoding = 1252, QuoteStyle = QuoteStyle.None]
    ),

    #"Promoted Headers" = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),

    // ---- 2. Types ----------------------------------------------------
    // The nine money and percent columns stay as TEXT here on purpose:
    // ParseDot (below) converts them safely.
    #"Changed Type" = Table.TransformColumnTypes(
        #"Promoted Headers",
        {
            {"Order_ID", type text},
            {"Order_Date", type date},
            {"Year", Int64.Type},
            {"Quarter", type text},
            {"Month", Int64.Type},
            {"Month_Name", type text},
            {"Region", type text},
            {"Country", type text},
            {"City", type text},
            {"Sales_Person", type text},
            {"Customer_Type", type text},
            {"Sales_Channel", type text},
            {"Promotion_Type", type text},
            {"Product_Category", type text},
            {"Brand", type text},
            {"Product_Name", type text},
            {"SKU", type text},
            {"Units_Sold", Int64.Type},
            {"Unit_Price_USD", type text},
            {"Discount_Pct", type text},
            {"Gross_Sales_USD", type text},
            {"Marketing_Spend_USD", type text},
            {"COGS_USD", type text},
            {"Logistics_Cost_USD", type text},
            {"Net_Revenue_USD", type text},
            {"Profit_USD", type text},
            {"Profit_Margin_Pct", type text}
        }
    ),

    // ---- 3. Culture-independent number parser ------------------------
    // "12.74" -> 12.74 | "-637.50" -> -637.5 | "18" -> 18 | "" -> null
    ParseDot = (v as nullable text) as nullable number =>
        let
            t        = if v = null then "" else Text.Trim(v),
            neg      = Text.StartsWith(t, "-"),
            body     = Text.Remove(t, {"-", "+"}),
            parts    = Text.Split(body, "."),
            intPart  = if parts{0} = "" then 0 else Number.From(parts{0}),
            fracText = if List.Count(parts) > 1 then parts{1} else "",
            fracPart = if fracText = "" then 0
                       else Number.From(fracText) / Number.Power(10, Text.Length(fracText)),
            result   = if t = "" then null else (if neg then -1 else 1) * (intPart + fracPart)
        in
            result,

    // ---- 4. Convert each numeric column ------------------------------
    // One typed AddColumn per column. Keep "type number" on every step,
    // or the new column loads as text.
    Add1 = Table.AddColumn(#"Changed Type", "UnitPriceNum",      each ParseDot([Unit_Price_USD]),      type number),
    Add2 = Table.AddColumn(Add1,            "DiscountPctNum",    each ParseDot([Discount_Pct]),        type number),
    Add3 = Table.AddColumn(Add2,            "GrossSalesNum",     each ParseDot([Gross_Sales_USD]),     type number),
    Add4 = Table.AddColumn(Add3,            "MarketingSpendNum", each ParseDot([Marketing_Spend_USD]), type number),
    Add5 = Table.AddColumn(Add4,            "COGSNum",           each ParseDot([COGS_USD]),            type number),
    Add6 = Table.AddColumn(Add5,            "LogisticsCostNum",  each ParseDot([Logistics_Cost_USD]),  type number),
    Add7 = Table.AddColumn(Add6,            "NetRevenueNum",     each ParseDot([Net_Revenue_USD]),     type number),
    Add8 = Table.AddColumn(Add7,            "ProfitNum",         each ParseDot([Profit_USD]),          type number),
    Add9 = Table.AddColumn(Add8,            "ProfitMarginNum",   each ParseDot([Profit_Margin_Pct]),   type number),

    // ---- 5. Swap the text columns for the numeric ones ---------------
    RemovedOld = Table.RemoveColumns(
        Add9,
        {"Unit_Price_USD", "Discount_Pct", "Gross_Sales_USD", "Marketing_Spend_USD",
         "COGS_USD", "Logistics_Cost_USD", "Net_Revenue_USD", "Profit_USD", "Profit_Margin_Pct"}
    ),

    Renamed = Table.RenameColumns(
        RemovedOld,
        {
            {"UnitPriceNum",      "Unit_Price_USD"},
            {"DiscountPctNum",    "Discount_Pct"},
            {"GrossSalesNum",     "Gross_Sales_USD"},
            {"MarketingSpendNum", "Marketing_Spend_USD"},
            {"COGSNum",           "COGS_USD"},
            {"LogisticsCostNum",  "Logistics_Cost_USD"},
            {"NetRevenueNum",     "Net_Revenue_USD"},
            {"ProfitNum",         "Profit_USD"},
            {"ProfitMarginNum",   "Profit_Margin_Pct"}
        }
    )
in
    Renamed
