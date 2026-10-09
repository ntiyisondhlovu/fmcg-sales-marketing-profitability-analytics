# Report

`FMCG_Analytics.pbix` is a six-page Power BI report built on the star-schema model in [`../model`](../model). Open it in Power BI Desktop (free). The data is embedded, so no connection is needed.

## How to use it

- **Navigation:** use the navy sidebar on the left of every page. The current page is highlighted with a lighter fill and a white bar. In Power BI Desktop, hold **Ctrl** while clicking a button; in the Power BI Service a normal click works.
- **Slicers:** Year, Category and Channel sit top right on every page and are **synced**. A selection on one page carries to all six.
- **Colours** follow one rule everywhere:
  - **Teal** (#0E7C86): at or above the overall margin (22.9%) or overall ROI (2.12)
  - **Grey** (#B4BCC8): below the baseline
  - **Orange** (#C2571A): laggards, meaning margin under 15%, ROI under 1.5, or (in the country table) margin under 20%

  The colours are driven by the `Margin Bar Colour`, `ROI Bar Colour` and `Margin Text Colour` measures, so they update with the slicers.
- **Page size:** 1920 × 1080 (16:9), with Fit to page.

## Pages

### 1. Profitability Analysis
**Title:** Personal Care and Wholesale lead; Beverages lags on margin

| Visual | Fields |
|---|---|
| 5 cards | Net Revenue · Profit · Profit Margin % · Units Sold · Order Count |
| Line chart: net revenue and profit by month | DimDate[Month_Start] × Net Revenue, Profit |
| Bar: profit margin by brand | Brand × Profit Margin %, rule colours |
| Bar: profit margin by category | Product_Category × Profit Margin %, rule colours |
| Bar: profit margin by channel | Sales_Channel × Profit Margin %, rule colours |

**Answers:** which categories, brands and channels make the margin. Personal Care (28.1%) and Wholesale (25.9%) lead; Beverages (14.0%) and Online (12.4%) lag.

### 2. Marketing ROI
**Title:** Orders with no promotion return the most

| Visual | Fields |
|---|---|
| 4 cards | Marketing Spend · Marketing ROI · Overall ROI (baseline) · Profit |
| Bar: profit margin by promotion type | Promotion_Type × Profit Margin %, rule colours |
| Bar: Marketing ROI by promotion type | Promotion_Type × Marketing ROI, ROI colours |
| Column: Marketing ROI by category | Product_Category × Marketing ROI, ROI colours |
| Text: What the numbers say | Three findings |

**Answers:** which promotions pay back their marketing spend. No Promo (ROI 3.17) and Loyalty Cashback (3.09) lead; Festival Campaign (1.23) is weakest.

### 3. Sales Forecasting
**Title:** Revenue grows every year, with a December peak

| Visual | Fields |
|---|---|
| 4 cards | Net Revenue · Units Sold · Order Count · Profit Margin % |
| Line chart: monthly net revenue with 6-month forecast | DimDate[Month_Start] × Net Revenue |
| Text: Method and limitations | Exponential smoothing, 36 months, 12-month seasonality, 95% CI |
| Column: net revenue by year | Year × Net Revenue |

**Answers:** where revenue is heading. Revenue went from $4.59M (2023) to $4.84M (2024) to $5.02M (2025), about 4.5% a year, with December the peak month every year.

### 4. Margin Erosion Analysis
**Title:** Margin holds steady; deeper discounts don't erode it

| Visual | Fields |
|---|---|
| 4 cards | Overall Profit Margin · Profit Margin % (filtered) · Avg Discount % · Gross Sales |
| Column: profit margin by promotion type | Promotion_Type × Profit Margin %, rule colours |
| Line chart: quarterly profit margin by category | Quarter × Profit Margin %, legend Product_Category |
| Bar: profit margin by category | Product_Category × Profit Margin %, rule colours |
| Text: Key finding | Beverages' problem is cost of goods, not discounting |

**Answers:** whether discounting or time erodes margin. Quarterly margin stays between 22.3% and 23.7%, and margin is highest in the 10–20% discount band.

### 5. Country Performance
**Title:** USA leads revenue; three markets fall below 20% margin

| Visual | Fields |
|---|---|
| 4 cards | Net Revenue · Profit · Profit Margin % · Order Count |
| Filled map: profit margin by country | Country, coloured by margin rule; tooltips Net Revenue, Profit Margin % |
| Table: countries ranked by net revenue | Country, Net Revenue, Profit, Profit Margin % (coloured text), Order Count |

**Answers:** which markets lead and lag. The USA leads revenue ($1.73M); UAE (18.8%), New Zealand (19.4%) and Australia (19.7%) are below 20% margin.

### 6. B2B vs B2C Analysis
**Title:** B2B brings three-quarters of revenue at a higher margin

| Visual | Fields |
|---|---|
| Multi-row card: B2B and B2C at a glance | Customer_Type, Net Revenue, Profit Margin %, Avg Discount %, Order Count |
| Donut: share of net revenue | Customer_Type × Net Revenue |
| Column: orders by channel and customer type | Sales_Channel × Order Count, legend Customer_Type |
| Bar: profit margin by category and customer type | Product_Category × Profit Margin %, legend Customer_Type |

**Answers:** how the two customer types differ. B2B brings 75.5% of revenue at 24.5% margin vs 18.0% for B2C, and earns more in every category.

## Status

| Item | State |
|---|---|
| Six pages with takeaway titles | Done |
| Sidebar navigation with active-page highlight | Done |
| Synced Year / Category / Channel slicers | Done |
| Rule-based bar and text colours | Done on all margin and ROI charts and the country table |
| Forecast on the Sales Forecasting line chart | **To do:** Analytics pane › Forecast, 6 months, seasonality 12, 95% |
| Dashed 22.9% / 2.12 baseline lines on bar charts | **To do:** Analytics pane › constant line set to Overall Profit Margin / Overall Marketing ROI |
| Discount-band chart and cost-structure chart (page 4) | **Not built:** need a Discount Band column and cost-share measures in the model first |
| Page screenshots | **To do:** add to `screenshots/` |

## Screenshots

Save one image per page in [`screenshots/`](screenshots) using these names:

| File | Page |
|---|---|
| `01_profitability.png` | Profitability Analysis |
| `02_marketing_roi.png` | Marketing ROI |
| `03_sales_forecasting.png` | Sales Forecasting |
| `04_margin_erosion.png` | Margin Erosion Analysis |
| `05_country_performance.png` | Country Performance |
| `06_b2b_vs_b2c.png` | B2B vs B2C Analysis |

Once they're added, they can be shown here, for example `![Profitability](screenshots/01_profitability.png)`.

## Related

- [`../insights/README.md`](../insights/README.md): the full findings behind each page
- [`../model/README.md`](../model/README.md): the data model and measures
- [`../docs`](../docs): BRD, life cycle, user stories and the build guide

