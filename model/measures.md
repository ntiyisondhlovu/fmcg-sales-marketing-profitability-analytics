# Measures

All measures live in the `_Measures` table of [`FMCG_Analytics.pbix`](../report/FMCG_Analytics.pbix), grouped into four display folders. Values shown are for the whole dataset (no filters).

| Folder | Measure | Format | Whole dataset |
|---|---|---|---|
| Core | [Net Revenue](#net-revenue) | $#,0 | $14,449,920 |
| Core | [Gross Sales](#gross-sales) | $#,0 | $17,080,515 |
| Core | [Profit](#profit) | $#,0 | $3,308,965 |
| Core | [Profit Margin %](#profit-margin-) | 0.0% | 22.9% |
| Core | [Units Sold](#units-sold) | #,0 | 3,883,474 |
| Core | [Order Count](#order-count) | #,0 | 18,240 |
| Marketing | [Marketing Spend](#marketing-spend) | $#,0 | $1,563,932 |
| Marketing | [Marketing ROI](#marketing-roi) | 0.00 | 2.12 |
| Marketing | [Avg Discount %](#avg-discount-) | 0.0% | 12.9% |
| Baseline | [Overall Profit Margin](#overall-profit-margin) | 0.0% | 22.9% |
| Baseline | [Overall Marketing ROI](#overall-marketing-roi) | 0.00 | 2.12 |
| Formatting | [Margin Bar Colour](#margin-bar-colour) | Text | #0E7C86 |
| Formatting | [ROI Bar Colour](#roi-bar-colour) | Text | #0E7C86 |
| Formatting | [Margin Text Colour](#margin-text-colour) | Text | #0A5F67 |

---

## Core

### Net Revenue

```DAX
Net Revenue = SUM ( FactOrders[Net_Revenue_USD] )
```

Revenue after discounts. This is the main revenue figure used throughout the report. **Whole dataset: $14,449,920.**

### Gross Sales

```DAX
Gross Sales = SUM ( FactOrders[Gross_Sales_USD] )
```

Revenue before discounts (units × unit price). The gap between Gross Sales and Net Revenue is the total discount given. **Whole dataset: $17,080,515.**

### Profit

```DAX
Profit = SUM ( FactOrders[Profit_USD] )
```

Net revenue minus cost of goods, logistics and marketing spend. **Whole dataset: $3,308,965.**

### Profit Margin %

```DAX
Profit Margin % = DIVIDE ( [Profit], [Net Revenue] )
```

Profit as a share of net revenue. It is **weighted by revenue**: total profit ÷ total revenue for whatever is filtered. It deliberately does not average the row-level `Profit_Margin_Pct` column, which would give a $10 order the same weight as a $5,000 one. `DIVIDE` returns blank instead of an error when revenue is zero. **Whole dataset: 22.9%.**

### Units Sold

```DAX
Units Sold = SUM ( FactOrders[Units_Sold] )
```

Total units sold. **Whole dataset: 3,883,474.**

### Order Count

```DAX
Order Count = COUNTROWS ( FactOrders )
```

Number of order lines. Each row of FactOrders is one order line with a unique Order_ID. **Whole dataset: 18,240.**

---

## Marketing

### Marketing Spend

```DAX
Marketing Spend = SUM ( FactOrders[Marketing_Spend_USD] )
```

Total marketing spend. **Whole dataset: $1,563,932**, which is 10.8% of net revenue.

### Marketing ROI

```DAX
Marketing ROI = DIVIDE ( [Profit], [Marketing Spend] )
```

Profit earned per $1 of marketing spend. A value of 2.12 means $2.12 of profit for every $1 spent; it is a ratio, not a percentage. **Whole dataset: 2.12.**

### Avg Discount %

```DAX
Avg Discount % = DIVIDE ( AVERAGE ( FactOrders[Discount_Pct] ), 100 )
```

The average discount per order line. `Discount_Pct` is stored as **whole percentages** (12.5 means 12.5%), so the result is divided by 100 to display correctly with a % format. Without the division the card would read 1,294%. **Whole dataset: 12.9%** (B2B 16.1%, B2C 9.7%).

> This is a simple average across order lines. A revenue-weighted discount (total discount ÷ gross sales) gives 15.4%, because larger orders tend to get deeper discounts. Both are valid; this report uses the per-line average throughout.

---

## Baseline

Baselines **ignore every filter**, slicers included, so they always show the whole-dataset figure. They drive the dashed reference lines and the colour rules.

### Overall Profit Margin

```DAX
Overall Profit Margin = CALCULATE ( [Profit Margin %], REMOVEFILTERS () )
```

The margin across all data, fixed at **22.9%**. Used as the reference line on margin charts and as the teal / grey threshold in the colour measures.

### Overall Marketing ROI

```DAX
Overall Marketing ROI = CALCULATE ( [Marketing ROI], REMOVEFILTERS () )
```

The ROI across all data, fixed at **2.12**. Used as the reference line and colour threshold on the ROI charts, and shown as the "Overall ROI (baseline)" card on page 2.

---

## Formatting

These measures return a hex colour code instead of a number. They are applied through **Format › Colors › fx › Field value** (for bars) or **Cell elements › Font color › fx › Field value** (for table text). Keeping the rules in DAX means every chart follows the same thresholds, and a rule can be changed in one place.

| Colour | Hex | Meaning |
|---|---|---|
| Teal | `#0E7C86` | At or above the baseline |
| Grey | `#B4BCC8` | Below the baseline |
| Orange | `#C2571A` | Laggard |
| Dark teal | `#0A5F67` | At or above the baseline (text, for contrast) |
| Dark text | `#1B2433` | Neutral text |

### Margin Bar Colour

```DAX
Margin Bar Colour =
VAR m = [Profit Margin %]
RETURN
    SWITCH ( TRUE (),
        ISBLANK ( m ), BLANK (),
        m >= [Overall Profit Margin], "#0E7C86",
        m < 0.15, "#C2571A",
        "#B4BCC8"
    )
```

Bar colour for every margin chart: **teal** at or above 22.9%, **orange** under 15%, **grey** in between. For example, by category: Personal Care, Dairy & Breakfast and Household are teal, Snacks is grey, and Beverages is orange.

**Used on:** margin by brand, category and channel (page 1); margin by promotion type (pages 2 and 4); margin by category (page 4); the country map (page 5).

### ROI Bar Colour

```DAX
ROI Bar Colour =
VAR r = [Marketing ROI]
RETURN
    SWITCH ( TRUE (),
        ISBLANK ( r ), BLANK (),
        r >= [Overall Marketing ROI], "#0E7C86",
        r < 1.5, "#C2571A",
        "#B4BCC8"
    )
```

Bar colour for ROI charts: **teal** at or above 2.12, **orange** under 1.5, **grey** in between. For example, by promotion: No Promo and Loyalty Cashback are teal; Bundle Offer and Seasonal Campaign are grey; Introductory Offer, Flash Discount and Festival Campaign are orange.

**Used on:** Marketing ROI by promotion type and by category (page 2).

### Margin Text Colour

```DAX
Margin Text Colour =
VAR m = [Profit Margin %]
RETURN
    SWITCH ( TRUE (),
        ISBLANK ( m ), BLANK (),
        m < 0.20, "#C2571A",
        m >= [Overall Profit Margin], "#0A5F67",
        "#1B2433"
    )
```

Font colour for the Profit Margin % column in the country table: **orange** under 20% (UAE, New Zealand, Australia), **dark teal** at or above 22.9%, and dark text otherwise. The darker teal keeps small text readable against white.

**Used on:** countries ranked by net revenue (page 5).

---

## Notes

- **Source columns.** All measures read from `FactOrders`. The text attributes (category, channel, country and so on) come from the dimension tables through relationships, so every measure responds to every slicer.
- **Percentage columns.** `Discount_Pct` and `Profit_Margin_Pct` in FactOrders are whole percentages. Divide by 100 before applying a % format.
- **Placeholder column.** `_Measures` holds one hidden column, `MeasureHolder`, so Power BI shows it as a measure table at the top of the Fields pane.
