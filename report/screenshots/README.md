# Screenshots

One image per report page from [`FMCG_Analytics.pbix`](../FMCG_Analytics.pbix), plus the data model diagram.

## Files

| File | Page | What it should show |
|---|---|---|
| `01_profitability.png` | Profitability Analysis | 5 KPI cards, monthly revenue and profit trend, margin by brand, category and channel |
| `02_marketing_roi.png` | Marketing ROI | Spend and ROI cards, margin and ROI by promotion type, ROI by category, insights box |
| `03_sales_forecasting.png` | Sales Forecasting | Monthly net revenue with the 6-month forecast band, method note, revenue by year |
| `04_margin_erosion.png` | Margin Erosion Analysis | Margin cards, margin by promotion type, quarterly margin by category, key finding |
| `05_country_performance.png` | Country Performance | Filled map coloured by margin, countries ranked by net revenue |
| `06_b2b_vs_b2c.png` | B2B vs B2C Analysis | B2B / B2C summary, revenue share, orders by channel, margin by category |
| `star_schema.png` | Model view | FactOrders in the middle with the seven dimension tables around it |

## Preview

### 1. Profitability Analysis
![Profitability Analysis](01_profitability.png)

### 2. Marketing ROI
![Marketing ROI](02_marketing_roi.png)

### 3. Sales Forecasting
![Sales Forecasting](03_sales_forecasting.png)

### 4. Margin Erosion Analysis
![Margin Erosion Analysis](04_margin_erosion.png)

### 5. Country Performance
![Country Performance](05_country_performance.png)

### 6. B2B vs B2C Analysis
![B2B vs B2C Analysis](06_b2b_vs_b2c.png)

### Data model
![Star schema](star_schema.png)

## How to capture them

1. Open the report in Power BI Desktop and clear all slicers (Year, Category and Channel set to All), so every page shows the full 2023–2025 data.
2. Click on an empty part of the page so no visual is selected and no borders or headers show.
3. Use **View › Fit to page**, then capture just the report canvas with **Windows + Shift + S** (Snipping Tool, rectangle mode).
4. Save as PNG using the file names above, all lowercase.
5. For `star_schema.png`, open **Model view**, arrange the tables neatly, hide Staging_Orders and the auto date tables if they show, and capture the diagram.

**Alternative for all pages at once:** File › Export › Export to PDF, then save each page of the PDF as an image.

## Checklist

- [ ] Slicers cleared on every capture
- [ ] Headline numbers visible on page 1: Net Revenue $14.45M, Profit $3.31M, Margin 22.9%
- [ ] Forecast band visible on page 3
- [ ] No selected visuals, tooltips or Power BI toolbars in the image
- [ ] Files named exactly as listed, so the previews above load

