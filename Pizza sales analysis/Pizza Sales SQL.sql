use Pizza_DB;
select * from pizza_sales;

-- A. KPI’s
-- 1. Total Revenue:
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

-- 2. Average Order Value
SELECT (SUM(total_price)/count(DISTINCT order_id)) AS Average_Order_Value FROM pizza_sales;

-- 3. Total Pizzas Sold
SELECT SUM(quantity) AS Total_Pizzas_Sold FROM pizza_sales;

-- 4. Total Orders
SELECT count(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

-- 5. Average Pizzas Per Order
SELECT (CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/
	CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)))
	AS Average_Pizzas_Per_Order from pizza_sales;

-- B. Daily Trend for Total Orders
SELECT DATENAME(DW,order_date) AS Order_Date, 
	COUNT(DISTINCT order_id) AS Total_Orders 
	FROM pizza_sales GROUP BY DATENAME(DW,order_date);

-- C. Hourly Trend for Orders
SELECT DATEPART(HH,order_time) AS Order_Date, 
	COUNT(DISTINCT order_id) AS Total_Orders 
	FROM pizza_sales GROUP BY DATEPART(HH,order_time) ORDER BY DATEPART(HH,order_time);

-- D. % of Sales by Pizza Category
SELECT pizza_category, 
	CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Revenue, 
	(CAST(SUM(total_price)*100/
	(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2))) AS PCT 
	FROM pizza_sales 
	GROUP BY pizza_category;

-- E. % of Sales by Pizza Size
SELECT pizza_size, 
	CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Revenue, 
	(CAST(SUM(total_price)*100/
	(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2))) AS PCT 
	FROM pizza_sales 
	GROUP BY pizza_size
	ORDER BY pizza_size;

-- F. Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) AS Total_Pizzas_Sold 
	FROM pizza_sales 
	GROUP BY pizza_category 
	ORDER BY Total_Pizzas_Sold DESC;

-- G. Top 5 Best Sellers by Total Pizzas Sold
SELECT TOP 5 pizza_name, sum(quantity) AS Total_Pizzas_Sold
	FROM pizza_sales
	GROUP BY pizza_name
	ORDER BY Total_Pizzas_Sold DESC;

-- Top 5 Best Sellers by Total Pizzas Sold
SELECT TOP 5 pizza_name, sum(quantity) AS Total_Pizzas_Sold
	FROM pizza_sales
	GROUP BY pizza_name
	ORDER BY Total_Pizzas_Sold ASC;