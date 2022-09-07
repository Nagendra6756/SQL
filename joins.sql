select * from emp_details;
select * from department;
select * from manager;
select * from projects;


--Inner join
Select emp_name,dept_name from emp_details e join department d on e.dept_id=d.dept_id

--left join
select emp_name,dept_name from emp_details e left join department d on e.dept_id=d.dept_id

--Right Join
select emp_name,dept_name from emp_details e right join department d on e.dept_id=d.dept_id

--Multiple join
select emp_name,dept_name,manager_name,project_name from emp_details e left join department d on e.dept_id=d.dept_id
join manager m on e.manager_id=m.manager_id
left join projects p on e.emp_id=p.team_member_id

--Multiple joins
select e.emp_name, m.manager_name
from emp_details e
join manager m on m.manager_id = e.manager_id
where not exists (select 1 from projects p where p.team_member_id = e.emp_id

--Full outer join
select emp_id,emp_name,dept_name from emp_details e full join department d on e.dept_id=d.dept_id

--cross join returns cartesian product (6*4)
select emp_name,dept_name from emp_details e cross join department d

--Natural join allows the sql itself to join tables with same column name 
--if the table not having same column it will return as cross join

--self join
select * from family

select child.name as child_name,child.age as child_age,parent.name as parent_name,parent.age as parent_age 
from family as child 
join family as parent on child.parent_id=parent.member_id