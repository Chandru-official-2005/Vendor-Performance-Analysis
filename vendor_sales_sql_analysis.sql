use vendor_sales_db;
SELECT * FROM vendor_sales_db.vendor_sales;

-- Top 10 vendors by Total Sales Revenue

select 
	VendorNumber,
	VendorName, 
	round(sum(TotalSalesDollars),2) Total_sales_revenue
from vendor_sales
group by VendorNumber, VendorName
order by TotalSalesDollars desc
limit 10;

-- Top 10 Products by Gross Profit

select 
Description,
round(sum(GrossProfit),2) gross_profit
from vendor_sales
group by Description
order by GrossProfit desc
limit 10;

-- Which vendors are the most profitable on average?

select
VendorNumber,
VendorName, 
Round(avg(ProfitMargin),2) profit_margin
from vendor_sales
group by VendorNumber,VendorName 
order by ProfitMargin desc
limit 10;

-- What percentage of total revenue does each vendor contribute?

with cte1 as (select 
VendorNumber,
VendorName,
round(sum(TotalSalesDollars),2) total_revenue
from vendor_sales
group by VendorNumber, VendorName)

select 
*,
round((total_revenue / sum(total_revenue) over())*100 ,2)as ptr_revenue
from cte1
order by total_revenue desc;

-- Top Selling Product for Each Vendor

with cte1 as (
select 
	VendorNumber, 
	VendorName, 
	Description, 
	sum(TotalSalesQuantity) totalqty
from vendor_sales
group by Description
order by VendorNumber, totalqty desc),

cte2 as(
select 
*,
rank() over(partition by VendorNumber order by totalqty desc) as rnk
from cte1 )

select 
	VendorNumber, 
	VendorName, 
	Description, 
	totalqty
from cte2 
where rnk = 1
order by totalqty desc;

-- Most Profitable Product for Each Vendor

with cte1 as (
select 
	VendorNumber, 
	VendorName, 
	Description, 
	sum(GrossProfit) totalprofit
from vendor_sales
group by Description
order by VendorNumber, totalprofit desc),

cte2 as(
select 
*,
rank() over(partition by VendorNumber order by totalprofit desc) as rnk
from cte1 )

select 
	VendorNumber, 
	VendorName, 
	Description, 
	round(totalprofit,2) total_profit
from cte2 
where rnk = 1
order by total_profit desc;

-- Vendors with Above-Average Profit Margin

select 
	VendorNumber, 
	VendorName,
    round(ProfitMargin,2) profit_margin
from vendor_sales 
where ProfitMargin > (select avg(ProfitMargin) from vendor_sales)
order by profit_margin desc;


-- Rank Vendors by Revenue
select 
	VendorNumber, 
	VendorName,
    round(sum(TotalSalesDollars),2) total_revenue,
    rank() over(order by sum(TotalSalesDollars) desc) rnk
from vendor_sales 
group by VendorNumber,VendorName;

-- Top 3 Products by Revenue Within Each Vendor

with cte1 as (
select 
	VendorNumber, 
	VendorName, 
	Description, 
	sum(TotalSalesDollars) totalrevenue
from vendor_sales
group by Description
order by VendorNumber, totalrevenue desc),

cte2 as(
select 
*,
rank() over(partition by VendorNumber order by totalrevenue desc) as rnk
from cte1 )

select 
	VendorNumber, 
	VendorName, 
	Description, 
	round(totalrevenue,2) total_revenue,
    rnk
from cte2 
where rnk in ( 1,2,3)
order by VendorNumber desc;


-- Pareto Analysis (80/20 Rule)

with cte1 as (
select 
VendorNumber,
VendorName, 
round(sum(TotalSalesDollars),2) as revenue
from vendor_sales
group by VendorNumber,VendorName
)

select 
*,
round((revenue / sum(revenue) over())*100 ,2)as pct_revenue,
round(100*sum(revenue) over(order by revenue desc)
/ sum(revenue) over(),2 ) as cumulative_rev_pct
from cte1
order by revenue desc;


-- Products with High Revenue but Low Profit Margin

with cte1 as (
select 
Description, 
round(sum(TotalSalesDollars),2) as total_revenue,
round(avg(ProfitMargin),2) as avg_profit_margin
from vendor_sales
group by Description)

select * 
from cte1
where total_revenue > (select avg(total_revenue) from cte1)
and  avg_profit_margin > (select avg(avg_profit_margin) from cte1)
order by total_revenue desc;


-- Find vendors where freight cost consumes a large portion of profit.

select 
VendorNumber,
VendorName,
round((GrossProfit - FreightCost),2) as freight_in_profit
from vendor_sales
order by freight_in_profit desc;



