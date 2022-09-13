select * from ds_salaries

select * from ds_salaries where work_year IS NULL

select COUNT(*) from ds_salaries

--Top 5 popular jobs
select Top 5 job_title,COUNT(Job_title) as count from ds_salaries group by job_title order by count desc

--most of the people are seniors
select experience_level, COUNT(experience_level) as count from ds_salaries group by experience_level 

--find the avg salary for each experience level
select experience_level,AVG(salary_in_usd) as sal_in_usd_avg from ds_salaries group by experience_level

--find the count of people working remotly (Most of the peoply woring are remote)
select remote_ratio,COUNT(remote_ratio) as count from ds_salaries group by remote_ratio order by count desc

--find the salary with different work_years
select work_year,AVG(salary_in_usd) as avg_sal_in_usd from ds_salaries group by work_year

--fing the count of people by employement type --part time, contract,free lancer, full time
select employment_type,count(employment_type) as count  from ds_salaries group by employment_type order by count desc

--find the avg salary based on employemnt type (the avg salary of professionals working by contract is higher)
select employment_type,AVG(salary_in_usd) as avg_sal_in_usd from ds_salaries group by employment_type


