select * from EMP

--with CLAUSE


with average_salary(avg_sal) as
(select CAST(AVG(salary) as int) from EMP)
select * from EMP e, average_salary av where e.Salary>av.avg_sal

--find stores whose sales where better than the average sales across all stores
--1.find total sales for each store
--2.find avg(sales) for all stores
--3.find the stores where total sales> avg_sales of all stores

select * from sales
--1.find total sales for each store
select store_id,SUM(price) as total_sales_per_Store from sales s group by store_id
--2.find avg(sales) for all stores
select CAST(AVG(total_Sales_per_Store) as int) as avg_Sales_for_all_Stores 
from
(select store_id,SUM(price) as total_sales_per_Store from sales s group by store_id) x 

--3.find the stores where total sales> avg_sales of all stores

select * 
from	(select store_id,SUM(price) as total_sales_per_Store from sales s group by store_id) total_Sales
join	(select CAST(AVG(total_Sales_per_Store) as int) as avg_Sales_for_all_Stores 
		from
		(select store_id,SUM(price) as total_sales_per_Store from sales s group by store_id) x) avg_Sales
		on total_Sales.total_sales_per_Store > avg_Sales.avg_Sales_for_all_Stores


--with clause or CTE
with  Total_Sales(store_id,total_Sales_per_Store) as 
	    (select store_id,SUM(price) as total_sales_per_Store from sales s group by store_id),
		avg_sales(avg_sales_for_all_stores) as 
		(select CAST(AVG(total_Sales_per_Store) as int) as avg_Sales_for_all_Stores 
		from Total_Sales)
SELECT * from Total_Sales ts join avg_sales av on ts.total_Sales_per_Store>av.avg_sales_for_all_stores