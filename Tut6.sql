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
select distinct e.name, p.title, p.income
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

-- 7
select DISTINCT e.name, d.name, p.title 
from department d, employee e, position p
where d.director = e.number and e.supervisor = e.number and e.position = p.code;

--9 
select p.code, p.title , d.name
from position p, department d
where p.code is not null and d.code is not null;
-- Ex2
-- 10
select DISTINCT e.name
from employee e
where exists ( select d.director
		from department d
		where d.director = e.number and e.number = e.supervisor);

--11
select e.number 
from employee e, department d
where e.number = director
union 
select distinct e.number
from employee e , employee e1
where e.number = e1.supervisor and e.number > e1.number;

-- 12
select  d.code
from department d
where d.location = 'Hanoi' 
union
select d.code
from department d, employee e
where d.director = e.number and e.name like 'P%'; 
-- 14
select e.name from employee e, position p WHERE e.position = p.code and p.income = (SELECT max(p.income));
-- 15
SELECT e.name, e.number
from employee e
WHERE e.number in  (SELECT e1.supervisor
                 FROM employee e1
                 WHERE e1.supervisor is not null);
--16
select DISTINCT e.name FROM employee e, position p where  e.position = p.code and p.income > (SELECT MAX(p1.income) 	from employee e1, position p1																															from position p1, employee e1
                                                            									where e1.department = 'DP1' and e1.position = p1.code);
-- 17
SELECT e.name, e.number
from employee e
WHERE e.number not in  (SELECT e1.supervisor
                 FROM employee e1
                 WHERE e1.supervisor is not null);--18
SELECT DISTINCT e.name from employee e where e.number in (SELECT e1.supervisor from employee e1, department d where e1.department = d.code and d.location = 'HCMC' and e1.supervisor is not null);












