CREATE DATABASE PizzaSalesDB;
USE PizzaSalesDB;

CREATE TABLE PizzaSales (
    Sale_ID INT PRIMARY KEY AUTO_INCREMENT,
    Pizza_Type VARCHAR(50),
    Quantity_Sold INT,
    Sale_Date DATE,
    Total_Amount DECIMAL(10, 2)
);

select * from pizza_sales;

#Q.1 TOTAL REVENUE

SELECT SUM(total_price) AS TotalRevenue
FROM pizza_sales;

# 	Q.2 Average revenue per ORDER 

SELECT ROUND(SUM(total_price) / COUNT(DISTINCT order_id), 2) AS AvgRevenuePerOrder
FROM pizza_sales;


#Q.3 TOTAL ORDERS
SELECT count(distinct ORDER_ID) AS TOTAL_ORDERS
FROM pizza_sales;

#Q.4 PEAK ORDER HOUR

SELECT HOUR(order_time) AS OrderHour, COUNT(order_id) AS OrderCount, SUM(total_price) AS TotalRevenue
FROM pizza_sales
GROUP BY OrderHour
ORDER BY OrderCount DESC
LIMIT 1;


#Q.5 TOTAL PIZZAS SOLD

SELECT	sum(QUANTITY) AS TOTAL_PIZZAS_SOLD
FROM pizza_sales;

#Q.6  AVG PIZZA PER ORDER

SELECT cast(cast(sum(QUANTITY)AS DECIMAL(10,2))/
CAST(count(distinct ORDER_ID) AS DECIMAL(10,2)) as decimal(10,2))
AS avg_pizzas_per_order
from pizza_sales;

#Q.7 Daily Trends for total orders

SELECT	DATENAME(DW,ORDER_DATE) AS ORDER_DAY, count(distinct ORDER_ID)AS TOTAL_ORDERS
FROM pizza_sales
group by DATENAME(DW, ORDER_DATE)
ORDER  BY TOTAL_ORDERS;


#Q.8 TOTAL PIZZAS SOLD BY PIZZA CATEGORY

SELECT PIZZA_CATEGORY, sum(QUANTITY) AS TOTAL_QUANTITY_SOLD
FROM pizza_sales
GROUP BY pizza_category
ORDER BY total_QUANTITY_SOLD DESC;

#Q.9 TOP 10 PIZZAS BY REVENUE

SELECT  pizza_name,sum(quantity) AS TOTAL_price
from pizza_sales
group by pizza_name
order by total_price desc
limit 10;



#Q.10 BOTTOM 10 PIZZAS BY REVENUE

select pizza_name, sum(quantity) as total_price
from pizza_sales
group by pizza_name
order by total_price desc
limit 10;

#Q.11 Revenue by Day of the Week

SELECT DAYNAME(order_date) AS DayOfWeek, SUM(total_price) AS Revenue
FROM pizza_sales
GROUP BY DayOfWeek
ORDER BY Revenue DESC;

#	Q.12 Sales by Pizza Size

SELECT pizza_size, SUM(total_price) AS SalesBySize
FROM pizza_sales
GROUP BY pizza_size
ORDER BY SalesBySize DESC;





