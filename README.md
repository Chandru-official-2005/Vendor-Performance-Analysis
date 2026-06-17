# Vendor Sales and Profitability Analysis Report

**Project Title:** Vendor Sales and Profitability Analysis  
**Prepared By:** Chandru P  
**Tools Used:** Python (Pandas), SQLite, MySQL, Power BI, Jupyter Notebook  
**Dataset Size:** Over 15 million records across sales, purchases, inventory, pricing, and vendor transaction tables. 

---

# 1. Executive Summary

This project analyzes vendor performance, product profitability, revenue contribution, and purchasing efficiency using a large-scale retail beverage dataset. Data was extracted from multiple operational tables, transformed into a consolidated analytical model, and visualized through an interactive Power BI dashboard.

The primary objective was to identify high-performing vendors and products, evaluate profitability drivers, and support business decisions related to vendor selection, pricing strategy, and inventory management.

To improve reporting efficiency, a centralized **Vendor Sales Summary** table was created by integrating purchase transactions, sales transactions, freight costs, and product pricing information. This reduced the need for repeated complex joins and enabled faster dashboard performance. 

---

# 2. Business Problem

The organization maintains transactional data across multiple tables, including purchases, sales, inventory, vendor invoices, and product pricing. While the data contains valuable business insights, the fragmented structure makes comprehensive vendor and profitability analysis difficult.

Key business questions addressed:

* Which vendors generate the highest revenue?
* Which vendors contribute the most profit?
* Which products drive revenue and profitability?
* How concentrated is revenue among top vendors?
* Are there vendors generating high sales but low profitability?
* How do freight costs impact vendor profitability?
* Which products should be prioritized for pricing and inventory decisions?

---

# 3. Dataset Overview

The analysis was performed using data from multiple operational tables stored in SQLite.

| Table            | Description                            |
| ---------------- | -------------------------------------- |
| Purchases        | Vendor purchase transactions           |
| Sales            | Product sales transactions             |
| Purchase Prices  | Product purchase and selling prices    |
| Vendor Invoice   | Vendor freight and invoice information |
| Inventory Tables | Beginning and ending inventory records |

The largest transaction tables contained millions of records:

* Purchases: ~2.37 Million records
* Sales: ~12.83 Million records
* Vendor Sales Summary: 10,692 aggregated records 

---

# 4. Data Engineering and Preparation

A data pipeline was developed in Python to automate ingestion, transformation, and storage of raw CSV data into a relational database. The ingestion process was optimized using chunk-based loading to efficiently process large files. 

A consolidated analytical table named **vendor_sales_summary** was created using SQL Common Table Expressions (CTEs) that combined:

* Purchase transactions
* Sales transactions
* Freight costs
* Product pricing data

The resulting table served as the single source of truth for downstream analysis and dashboarding. 

---

# 5. Data Cleaning and Feature Engineering

Several data quality checks and transformations were performed:

### Data Cleaning

* Converted volume field to numeric format.
* Handled missing values by replacing nulls with appropriate defaults.
* Removed leading and trailing spaces from vendor and product names.
* Validated data types across all columns. 

### Feature Engineering

The following business metrics were created:

**Gross Profit**

Gross Profit = Total Sales Revenue − Total Purchase Cost

**Profit Margin (%)**

Profit Margin = Gross Profit / Total Sales Revenue × 100

**Stock Turnover**

Stock Turnover = Total Sales Quantity / Total Purchase Quantity

**Sales-to-Purchase Ratio**

Sales-to-Purchase Ratio = Total Sales Revenue / Total Purchase Cost

These derived metrics enabled more meaningful vendor and product performance analysis. 

---

# 6. Analytical Approach

SQL was used extensively to answer key business questions.

Analysis performed included:

* Top Vendors by Revenue
* Top Vendors by Gross Profit
* Vendor Profitability Ranking
* Vendor Revenue Contribution Analysis
* Top Products by Revenue
* Top Products by Gross Profit
* Vendor Revenue Ranking
* Pareto Analysis (80/20 Rule)
* Freight Cost Impact Analysis
* Product-Level Profitability Analysis
* Revenue vs Profitability Comparison

Window functions, CTEs, ranking functions, and aggregate calculations were utilized to derive insights. 

---

# 7. Dashboard Overview

An interactive Power BI dashboard was developed to enable business users to explore vendor and product performance.  

<img width="1322" height="735" alt="Screenshot 2026-06-17 162654" src="https://github.com/user-attachments/assets/f6a8c7d1-0aef-4232-8d42-8ab49396ae32" />


The dashboard includes:

### KPI Section

* Total Revenue
* Gross Profit
* Average Profit Margin
* Total Sales Quantity
* Active Vendors

### Vendor Analysis

* Top 10 Vendors by Revenue
* Top 10 Vendors by Gross Profit
* Revenue vs Profitability Scatter Analysis

### Product Analysis

* Top 10 Products by Revenue
* Top 10 Products by Gross Profit

### Revenue Concentration Analysis

* Pareto Analysis showing cumulative revenue contribution across vendors

### Interactive Filters

* Vendor Name
* Product
* Brand

The dashboard allows stakeholders to dynamically explore profitability and revenue drivers across the business.

---

# 8. Key Findings

### Vendor Performance

* A small group of vendors contributes a significant share of total revenue and profit.
* DIAGEO North America, Martignetti Companies, Pernod Ricard USA, Bacardi USA, and Brown-Forman emerged among the strongest contributors.
* Revenue leadership does not always translate into higher profitability, highlighting the importance of margin-based evaluation.

### Product Performance

* Jack Daniels No. 7 Black
* Tito's Handmade Vodka
* Absolut 80 Proof
* Captain Morgan Spiced Rum
* Ketel One Vodka

were among the highest-performing products in terms of revenue and profit generation.

### Revenue Concentration

* Pareto analysis indicates that a relatively small percentage of vendors generates the majority of revenue.
* This suggests opportunities for focused vendor relationship management and strategic procurement.

### Profitability Insights

* Several high-revenue products exhibit lower margins, indicating potential pricing optimization opportunities.
* Freight expenses reduce profitability for certain vendors and should be incorporated into vendor evaluation frameworks.

### Inventory Efficiency

* Stock turnover analysis highlights products with strong demand relative to purchase volume.
* These products represent opportunities for inventory optimization and working capital efficiency.

---

# 9. Business Recommendations

### Vendor Management

* Strengthen relationships with top-performing vendors.
* Conduct periodic profitability reviews rather than relying solely on revenue metrics.

### Pricing Optimization

* Reassess pricing strategies for products with strong sales but weaker profit margins.
* Identify opportunities to improve markup without significantly impacting demand.

### Freight Cost Control

* Negotiate transportation and logistics contracts with vendors exhibiting high freight expenses.
* Include freight-adjusted profitability metrics in vendor scorecards.

### Inventory Planning

* Prioritize inventory allocation toward high-turnover products.
* Reduce excess stock for slow-moving products to improve inventory efficiency.

### Performance Monitoring

* Implement regular dashboard reviews to track vendor and product performance.
* Establish KPI thresholds for revenue, profit margin, and stock turnover.

---

# 10. Conclusion

This project successfully transformed large-scale transactional retail data into actionable business insights through data engineering, SQL analytics, and interactive visualization. By consolidating over 15 million transaction records into a vendor-centric analytical model, the solution enables efficient monitoring of revenue, profitability, pricing effectiveness, and vendor performance. 

The resulting dashboard provides decision-makers with a scalable reporting solution that supports data-driven vendor selection, profitability optimization, and strategic business planning.

---


