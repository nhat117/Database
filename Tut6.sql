-- Tutorial 2
-- Intro to database solution

-- Exercise 1
-- 1
Select e.name, d.name
from employee e, department d
where e.department = d.code;

-- 2
select e1.name, e2.name, d.name 
from employee e1, employee e2, department d 
where e1.department = e2.department and d.code = e1.department and e1.number > e2.number;

-- inner join methode
select e.name, e2.name from employee e
inner join employee e2 on e.department = e2.department
where e.number > e2.number;

-- 3
SELECT DISTINCT e.name, p.income + 50 as new_income 
from history h, employee e, position p
where e.position = p.code and e.number = h.employee and h.start_date <'2012-01-01';

-- inner join method
select distinct e.name, p.income + 50 as new_income
from history h
inner join employee e on e.number = h.employee
inner join position p on e.position = p.code
where h.start_date <'2012-01-01';

-- 4
select distinct e1.name, p1.title , p1.income
from employee e1, position p1,
     employee e2, position p2	
where e1.position = p1.code and e2.position = p2.code and p1.income >= 2 * p2.income;

-- 5
select e.name, p.title, p.income
from employee e, position p
where e.position = p.code and e.name like 'L%' and LENGTH(e.name) >= 3;

-- 6
select e.number, e.name, p.title
from employee e, position p
where e.department = 'DP1' and e.position = p.code
union
select e.number, e.name, p.title
from employee e, position p
where e.department = 'DP2' and e.position = p.code;