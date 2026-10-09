# Insights

What the FMCG Analytics dashboard shows, case study by case study. Every number below was validated against the source data (18,240 order lines, Jan 2023 – Dec 2025) with DAX queries before the report pages were built. Margins are profit ÷ net revenue, weighted by revenue.

## Summary

| | |
|---|---|
| Net revenue | **$14,449,920** |
| Profit | **$3,308,965** |
| Profit margin | **22.9%** |
| Marketing spend | **$1,563,932** (10.8% of net revenue) |
| Marketing ROI | **2.12**, i.e. $2.12 of profit per $1 of marketing |
| Order lines | 18,240 across 17 countries, 30 SKUs, 36 sales reps |

**The five things to know**

1. **Beverages is the margin problem, and the cause is cost of goods.** It earns 14.0% against a 22.9% average, because COGS takes 56.7% of its gross sales.
2. **Orders with no promotion are the most profitable.** 25.6% margin and 3.17 ROI, ahead of all six promotion types.
3. **Discounting does not erode margin.** Margin is lowest at 0–5% discount and highest at 10–20%.
4. **B2B carries the business.** Three-quarters of revenue, and 6–7 points more margin than B2C in every category.
5. **Three markets sit below 20% margin:** UAE, New Zealand and Australia.

---

## 1. Profitability Analysis

*Dashboard page 1*
<img width="1917" height="1075" alt="image" src="https://github.com/user-attachments/assets/643d8275-c0d6-4e80-8613-f4ffc46c3bdf" />

**By category**

| Category | Net revenue | Profit | Margin |
|---|---|---|---|
| Personal Care | $2,765,969 | $776,980 | **28.1%** |
| Dairy & Breakfast | $2,268,937 | $620,350 | 27.3% |
| Household | $3,160,720 | $832,222 | 26.3% |
| Snacks | $2,516,605 | $555,212 | 22.1% |
| Beverages | $3,737,689 | $524,202 | **14.0%** |

**By channel**

| Channel | Net revenue | Profit | Margin |
|---|---|---|---|
| Wholesale | $5,208,658 | $1,349,279 | **25.9%** |
| Distributor | $4,451,812 | $1,123,394 | 25.2% |
| Modern Trade | $3,371,020 | $660,266 | 19.6% |
| Online | $1,418,430 | $176,026 | **12.4%** |

**By brand:** margins range from **34.5% (BrightSmile)** to **9.4% (AquaGlow)**. Ten of the 17 brands beat the 22.9% average. Three sit below 15%: ZenLeaf (14.3%), RoastTrail (9.8%) and AquaGlow (9.4%). RoastTrail is the weakest large brand, with $1.17M of revenue at under 10% margin.

**Why Beverages lags.** Beverages is the largest category by revenue but earns the least profit. The cost structure shows why:

| Share of gross sales | Personal Care | Beverages |
|---|---|---|
| Discount | 15.3% | 15.4% |
| COGS | 46.7% | **56.7%** |
| Logistics | 5.4% | 6.3% |
| Marketing | 8.8% | 9.8% |
| Profit | **23.8%** | 11.9% |

Discount depth is the same in every category (about 15.4%), so discounting doesn't explain the gap. The 10-point difference in cost of goods does.

---

## 2. Marketing ROI

*Dashboard page 2*
<img width="1917" height="1012" alt="image" src="https://github.com/user-attachments/assets/b5cea1e9-ba79-41ef-98ce-740c67023040" />

| Promotion | Net revenue | Margin | ROI |
|---|---|---|---|
| No Promo | $5,587,181 | **25.6%** | **3.17** |
| Loyalty Cashback | $1,114,225 | 25.2% | 3.09 |
| Bundle Offer | $2,220,909 | 21.9% | 1.88 |
| Seasonal Campaign | $2,216,238 | 21.5% | 1.79 |
| Introductory Offer | $534,191 | 19.7% | 1.33 |
| Flash Discount | $1,593,444 | 19.2% | 1.29 |
| Festival Campaign | $1,183,732 | **18.5%** | **1.23** |

- No Promo and Loyalty Cashback return over $3 of profit per $1 of marketing, about 2.5× the weakest campaigns.
- Festival, Flash Discount and Introductory offers all return under $1.35 per $1 and sit below the 22.9% margin baseline.
- Loyalty Cashback is the only promotion that performs close to No Promo.

**ROI by category:** Personal Care 2.69 · Dairy & Breakfast 2.69 · Household 2.60 · Snacks 1.90 · Beverages **1.21**.

---

## 3. Sales Forecasting

*Dashboard page 3*
<img width="1917" height="1067" alt="image" src="https://github.com/user-attachments/assets/3a9f1230-829a-43d4-b6ca-46543734ce7d" />

| Year | Net revenue | Growth | Order lines |
|---|---|---|---|
| 2023 | $4,593,306 | | 6,069 |
| 2024 | $4,840,332 | +5.4% | 6,073 |
| 2025 | $5,016,278 | +3.6% | 6,098 |

- Revenue grows about **4.5% a year** (compound, 2023–2025).
- **December is the peak month in all three years:** $429.8K (2023), $456.9K (2024), $490.7K (2025).
- Monthly revenue ranged from $352.7K (Nov 2025) to $490.7K (Dec 2025).

**Forecast method:** Power BI's built-in exponential smoothing on 36 months of net revenue, with 12-month seasonality and a 95% confidence interval, projecting Jan–Jun 2026.

**Holdout test:** the model was trained without the last 6 months and compared with what actually happened.

| Month | Jul 25 | Aug 25 | Sep 25 | Oct 25 | Nov 25 | Dec 25 | Total |
|---|---|---|---|---|---|---|---|
| Actual | $373,405 | $454,648 | $413,041 | $388,159 | $352,684 | $490,724 | **$2,472,661** |
| Forecast | [ADD] | [ADD] | [ADD] | [ADD] | [ADD] | [ADD] | [ADD] |

Average monthly error (MAPE): **[ADD FROM FORECAST VISUAL]**

**Limits:** only three years of history, no outside drivers (price changes, competitors, the economy), and the dataset is synthetic. Read the confidence range, not the single line.

---

## 4. Margin Erosion Analysis

*Dashboard page 4*
<img width="1917" height="1063" alt="image" src="https://github.com/user-attachments/assets/d8b10e4f-3a60-4917-851a-ab0e8cdc5ce0" />

**By discount depth**

| Discount band | Order lines | Net revenue | Margin |
|---|---|---|---|
| 0–5% | 1,531 | $516,637 | **18.3%** |
| 5–10% | 4,400 | $2,256,282 | 21.9% |
| 10–20% | 10,111 | $8,899,162 | **23.3%** |
| 20%+ | 2,198 | $2,777,839 | 23.1% |

**A counter-intuitive finding:** margin does not fall as discounts deepen. The smallest discounts earn the lowest margin, and the 10–20% band, which carries 62% of revenue, earns the highest. This is a real result in the data, not an error.

**Over time:** quarterly margin stayed between **22.3% (Q2 2024)** and **23.7% (Q1 2024)** across all 12 quarters, a spread of 1.4 points. Every category is flat too. Personal Care stays around 27–29% and Beverages around 13–15%. There is no erosion over time; the gap between categories is the story.

---

## 5. Country Performance

*Dashboard page 5*
<img width="1917" height="1078" alt="image" src="https://github.com/user-attachments/assets/57725c25-68ea-4afa-9a5a-2a7e4ca3ab6b" />

| # | Country | Net revenue | Profit | Margin | Order lines |
|---|---|---|---|---|---|
| 1 | USA | $1,730,771 | $407,127 | 23.5% | 1,978 |
| 2 | UK | $1,158,946 | $278,117 | 24.0% | 1,278 |
| 3 | Germany | $1,152,285 | $272,568 | 23.7% | 1,250 |
| 4 | India | $1,115,620 | $266,549 | 23.9% | 1,757 |
| 5 | Australia | $1,085,487 | $214,154 | **19.7%** | 1,243 |
| 6 | France | $1,012,974 | $236,759 | 23.4% | 1,176 |
| 7 | Brazil | $837,826 | $204,000 | **24.3%** | 1,131 |
| 8 | Canada | $828,474 | $188,860 | 22.8% | 1,057 |
| 9 | Italy | $788,548 | $185,716 | 23.6% | 952 |
| 10 | Mexico | $778,533 | $184,182 | 23.7% | 1,115 |
| 11 | Spain | $698,744 | $162,259 | 23.2% | 876 |
| 12 | Indonesia | $691,210 | $164,474 | 23.8% | 1,189 |
| 13 | UAE | $608,791 | $114,450 | **18.8%** | 675 |
| 14 | New Zealand | $540,137 | $104,674 | **19.4%** | 592 |
| 15 | Thailand | $530,885 | $124,848 | 23.5% | 799 |
| 16 | Colombia | $476,341 | $107,347 | 22.5% | 654 |
| 17 | Chile | $414,347 | $92,880 | 22.4% | 518 |

- The **USA** leads revenue with 12.0% of the total.
- **Brazil** has the highest margin at 24.3%.
- **UAE, New Zealand and Australia** are the only markets below 20%. Australia matters most: it is the 5th-largest market, so its 3-point gap to the average costs the most profit in dollars.

---

## 6. B2B vs B2C Analysis

*Dashboard page 6*
<img width="1917" height="1041" alt="image" src="https://github.com/user-attachments/assets/dd8720e5-a48c-40f9-b0ae-8d5214b5771c" />

| | B2B | B2C |
|---|---|---|
| Net revenue | $10,912,271 (75.5%) | $3,537,649 (24.5%) |
| Profit margin | **24.5%** | 18.0% |
| Avg discount per order line | 16.1% | 9.7% |
| Order lines | 9,163 | 9,077 |

**Margin by category**

| Category | B2B | B2C | Gap |
|---|---|---|---|
| Personal Care | 29.8% | 23.4% | 6.4 pts |
| Dairy & Breakfast | 29.0% | 22.4% | 6.6 pts |
| Household | 28.0% | 20.7% | 7.3 pts |
| Snacks | 23.6% | 17.4% | 6.2 pts |
| Beverages | 15.6% | 8.9% | 6.7 pts |

**Channel mix (order lines)**

| Channel | B2B | B2C |
|---|---|---|
| Distributor | 3,189 | 440 |
| Modern Trade | 3,371 | 2,848 |
| Online | 0 | 5,544 |
| Wholesale | 2,603 | 245 |

- B2B takes deeper discounts and still earns 6.5 points more margin overall, and more in every category.
- Online is entirely B2C. Wholesale and Distributor are about 90% B2B.
- The two groups place almost the same number of order lines, but B2B orders are about three times larger by revenue.

---

## Where to look next

These are questions the data raises. They aren't answered here.

- **Beverages cost of goods.** Is the 56.7% COGS share a sourcing cost, a pricing problem, or a product-mix effect (RoastTrail and AquaGlow)?
- **Promotion spend.** Festival, Flash Discount and Introductory offers return under $1.35 per $1. Would moving that budget towards loyalty-style offers lift ROI?
- **Online channel.** At 12.4% margin, is the cost to serve online customers sustainable at current prices?
- **Australia.** As a top-5 market below 20% margin, what drives its gap: category mix, channel mix or cost?

## How these numbers were checked

All figures come from the star-schema model in [`../model`](../model) and were reconciled to the source CSV:

- 18,240 rows, all Order_IDs unique, zero blank keys
- Gross = Units × Price, Net = Gross × (1 − Discount), and Profit = Net − COGS − Logistics − Marketing hold on every row
- Totals by customer type, year and every dimension add back to the overall figures

The data is a synthetic FMCG dataset, so treat the findings as a demonstration of the analysis, not as real market facts.

