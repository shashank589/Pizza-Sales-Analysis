   #Problem statement with Answers   
-- 1.Total Revenue
 -- Ans: 
       select  sum(total_price) as Total_Revenue from  pizza;

-- 2.Average Order Values
 -- Ans: 
        select sum(total_price)/count(distinct order_id) as Avg_order_value from pizza;
 
-- 3.Total Pizza Sold
 -- Ans:
		select sum(quantity) as Total_pizza_sold from pizza;
 
-- 4.Total Orders
 -- Ans:
        select count(distinct order_id) as Total_Orders from pizza;
  
-- 5.Average Pizza per Order
 -- Ans:
        select cast(sum(quantity)/count(distinct order_id) as decimal(10,2)) as Avg_pizza_order
	    from pizza;
	  
-- 6.Daily Trend for Total Orders
 -- Ans: 
        select  dayname(order_date)  as order_day , count(distinct order_id) as total_orders
        from pizza
        group by order_day
	
   
-- 7.Hourly Trend for Total Orders 
 -- Ans: 
        select extract(hour from order_time) as order_hour , count(distinct order_id) as total_orders
        from pizza
        group by order_hour
      
-- 8.Percentage of Sales per Category 
 -- Ans: 
        select pizza_category,cast(sum(total_price)*100 as decimal(10,2)) as total_revenue,
	    cast(sum(total_price)*100 / (select sum(total_price) from pizza) as decimal(10,2)) as ppc
	    from pizza
	    group by pizza_category
	    order by ppc desc
-- 9.Percentage of Sales by Pizza Size
 -- Ans: 
		select pizza_size, cast(sum(total_price)*100 as decimal(10,2)) as total_revenue,
	    cast(sum(total_price)*100 / (select sum(total_price) from pizza ) as decimal(10,2)) as ppc
	    from pizza
		where month(order_date)=3
	    group by pizza_size
	    order by ppc desc
-- 10.Total Pizza sold per Category
 -- Ans: 
        select pizza_category ,sum(quantity) as total_quantity_sold
        from pizza
        where month(order_date)=2
        group by pizza_category
        order by total_quantity_sold desc
   
-- 11.Top 5 best sellers by Total Pizza Sold
 -- Ans: 
        select * from pizza
	    select pizza_name,sum(quantity) as total_sales
		from pizza
	    group by pizza_name
	    order by total_sales desc
	    limit 5
   
-- 12.Bottom 5 worst sellers by Total Pizza Sold:
 -- Ans: 
        select top 5 pizza_name,sum(quantity) as total_sales
        from pizza
        group by pizza_name
        order by total_sales asc

