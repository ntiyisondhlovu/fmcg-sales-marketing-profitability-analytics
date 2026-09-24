
# Data

## Source
FMCG Sales, Marketing & Profitability dataset.
- Link: kagglehub.dataset_download("atharvasoundankar/fmcg-sales-marketing-and-profit-data")
- Size: 18,240 order lines, 27 columns, no missing values
- Covers 2023–2025 across 5 regions, 17 countries, 48 cities, 5 product categories, 17 brands, 4 sales channels, 7 promotion types, and 36 sales reps
- The dataset is synthetic, so findings demonstrate method, not real-world business conclusions.

## Fields
Order details (ID, date, sales rep, customer type, channel, promotion), product details (category, brand, product, SKU), and full cost and profitability figures (units sold, unit price, discount %, gross sales, marketing spend, COGS, logistics cost, net revenue, profit, profit margin).

## Licence note
The raw CSV is not stored in this repository unless the source's licence confirms redistribution is allowed. Download it from the link above.

## Preparation
1. Confirmed no missing values and a unique Order_ID.
2. Confirmed gross sales, costs, and profit reconcile arithmetically.
3. Split into a fact table (FactOrders) and dimension tables (product, geography, sales rep, promotion, customer type, channel, date).

## Known limitations
- No unique customer identifier, so analysis is transaction-level, not customer-level.
- Some countries and cities have low order counts; figures are shown alongside their order count.
