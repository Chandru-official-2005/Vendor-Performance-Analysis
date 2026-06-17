# Vendor Sales and Profitability Analysis

## Overview

This project focuses on analyzing vendor performance, product profitability, and revenue contribution using a large-scale retail beverage dataset. The objective was to transform raw transactional data into meaningful business insights through data engineering, SQL analysis, and interactive dashboarding.

The project integrates purchase transactions, sales records, vendor invoices, and product pricing information to create a centralized analytical dataset that supports vendor selection, profitability analysis, pricing optimization, and business decision-making.

---

## Business Problem

Organizations often store operational data across multiple tables, making it difficult to perform comprehensive vendor and profitability analysis. This project addresses the following key business questions:

* Which vendors generate the highest revenue?
* Which vendors contribute the most profit?
* Which products drive sales and profitability?
* How concentrated is revenue among vendors?
* Which vendors have strong sales but weak margins?
* How do freight costs affect profitability?
* Which products should be prioritized for inventory and pricing decisions?

---

## Dataset

The analysis was performed using multiple datasets stored in SQLite:

| Table               | Description                         |
| ------------------- | ----------------------------------- |
| Purchases           | Vendor purchase transactions        |
| Sales               | Product sales transactions          |
| Purchase Prices     | Product purchase and selling prices |
| Vendor Invoice      | Vendor freight and invoice details  |
| Beginning Inventory | Opening inventory records           |
| Ending Inventory    | Closing inventory records           |

### Dataset Scale

* Purchases: 2.37 Million+ records
* Sales: 12.8 Million+ records
* Vendor Sales Summary: 10,692 aggregated records

---

## Tools & Technologies

### Programming & Analysis

* Python
* Pandas
* Jupyter Notebook

### Database

* SQLite
* MySQL

### Data Visualization

* Power BI

### Libraries

* SQLAlchemy
* SQLite3
* Logging

---

## Project Workflow

### 1. Data Ingestion

* Loaded multiple CSV files into SQLite database.
* Implemented chunk-based ingestion for handling large datasets efficiently.
* Automated ingestion using Python and SQLAlchemy.

### 2. Exploratory Data Analysis (EDA)

* Examined dataset structure and record counts.
* Validated relationships between purchases, sales, pricing, and vendor tables.
* Identified data quality issues and missing values.

### 3. Data Engineering

Created a consolidated analytical table named **vendor_sales_summary** by combining:

* Purchase transactions
* Sales transactions
* Freight costs
* Product pricing information

This reduced repeated joins and improved reporting performance.

### 4. Data Cleaning

* Removed missing values
* Standardized vendor names
* Converted data types
* Cleaned categorical fields
* Validated aggregated metrics

### 5. Feature Engineering

Created business metrics including:

* Gross Profit
* Profit Margin (%)
* Stock Turnover
* Sales-to-Purchase Ratio

---

## SQL Analysis

Performed business-focused SQL analysis using:

* Aggregations
* CTEs
* Window Functions
* Ranking Functions

### Key Analyses

* Top 10 Vendors by Revenue
* Top 10 Vendors by Gross Profit
* Vendor Revenue Contribution
* Vendor Profitability Ranking
* Top Products by Revenue
* Top Products by Gross Profit
* Pareto Analysis (80/20 Rule)
* Freight Cost Impact Analysis
* Revenue vs Profitability Analysis
* Product-Level Profitability Analysis

---

## Power BI Dashboard

The dashboard provides an interactive view of vendor and product performance.

### KPI Cards

* Total Revenue
* Gross Profit
* Average Profit Margin
* Total Sales Quantity
* Active Vendors

### Vendor Analysis

* Top 10 Vendors by Revenue
* Top 10 Vendors by Gross Profit
* Revenue vs Profitability Scatter Plot

### Product Analysis

* Top 10 Products by Revenue
* Top 10 Products by Gross Profit

### Revenue Contribution Analysis

* Pareto Analysis (80/20 Rule)
* Cumulative Revenue Contribution by Vendor

### Filters

* Vendor Name
* Product
* Brand

---

## Key Insights

* Revenue generation is concentrated among a small group of vendors.
* Top revenue-generating vendors are not always the most profitable.
* A few products contribute significantly to overall revenue and profit.
* Freight costs have a measurable impact on vendor profitability.
* Several high-revenue products exhibit relatively lower profit margins.
* Pareto analysis confirms that a limited number of vendors drive the majority of revenue.

---

## Business Recommendations

* Strengthen relationships with high-performing vendors.
* Monitor profit margins alongside revenue metrics.
* Optimize pricing for low-margin, high-volume products.
* Track freight-adjusted profitability.
* Focus inventory planning on high-turnover products.
* Use vendor performance scorecards for procurement decisions.

---

## Dashboard Preview

<img width="1322" height="735" alt="Screenshot 2026-06-17 162654" src="https://github.com/user-attachments/assets/d37dc5ba-d6be-4b0b-b251-b08c2928e8ab" />


---

## Project Structure

```text
Vendor-Sales-Profitability-Analysis/
│
├── data/
├── notebooks/
│   ├── EDA.ipynb
│   └── Analysis.ipynb
│
├── scripts/
│   ├── ingestion_db.py
│   └── get_vendor_summary.py
│
├── sql/
│   └── business_queries.sql
│
├── dashboard/
│   └── Vendor_Sales_Dashboard.pbix
│
├── reports/
│   └── Project_Report.pdf
│
├── README.md
└── requirements.txt
```

---

## Results

| KPI                  |    Value |
| -------------------- | -------: |
| Total Revenue        | $451.62M |
| Gross Profit         | $129.72M |
| Total Sales Quantity |   32.90M |
| Active Vendors       |      128 |

The project demonstrates an end-to-end analytics workflow, covering data ingestion, data engineering, SQL analysis, business intelligence, and dashboard development to support data-driven decision-making.

---

## Author

**Chandru P**  
B.Tech – Metallurgical & Materials Engineering, NIT Trichy  
Aspiring Data Analyst | SQL | Python | Power BI | Data Visualization
