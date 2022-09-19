select * from dbo.Groceries

select Member_number  from dbo.Groceries where Member_number is NULL

select Date from dbo.Groceries where Date is NULL

select itemDescription  from dbo.Groceries where itemDescription is NULL

select count(DISTINCT Member_number) from dbo.Groceries ---3898 unique customers

select count(DISTINCT itemDescription) from dbo.Groceries --167 unique items


select min(date) from dbo.Groceries --2014-01-01
select max(Date) from dbo.Groceries --2015-12-30


-- Find out the most popular items sold
select itemDescription, count(itemDescription) as Total_count from dbo.Groceries group by itemDescription order by Total_count Desc 

--Create year,month,day,dow colums
alter table dbo.Groceries add Year int
alter table dbo.Groceries add Month int
alter table dbo.Groceries add day int
alter table dbo.Groceries add day_of_week nvarchar(255)

select * from dbo.Groceries

--update  new columns with date relaetd data
update Groceries set Year=Year(Date)
update Groceries set Month=MONTH(Date)
update Groceries set Day=DAY(Date)
update Groceries set day_of_week=DATENAME(weekday,Date)

--Most popular products by year --2014
select itemDescription,count(itemDescription) as total_count from dbo.Groceries where YEAR=2014 group by itemDescription order by total_count DESC

--Most popular products by year --2014
select itemDescription,count(itemDescription) as total_count from dbo.Groceries where YEAR=2015 group by itemDescription order by total_count DESC

--sales by year
select Year, count(itemDescription) as total_sold from dbo.Groceries group by Year order by total_sold desc

--sales by month
select Month,count(itemDescription) as total_sold_by_month FROM dbo.Groceries where Year=2014 group by Month order by Month 

select Month,count(itemDescription) as total_sold_by_month FROM dbo.Groceries where Year=2015 group by Month order by Month