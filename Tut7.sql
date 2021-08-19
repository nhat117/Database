-- 1
select e.name, p.income
from employee e, position p
where e.position = p.code 
	and p.income bewtween 200 and 600;
-- 2
select distinct  d.name, count(e.number) as total
from department d, employee e
where d.code = e.department group by d.code;

-- left join
select d.name, count(e.number) as  total
from department d left join employee e
on e.department = d.code 
group by d.code

-- 3
select s.name, count(e.number) as total
from employee e, employee s
where s.number = e.supervisor
group by s.number;

-- join methode
select s.name, count(e.number) as total
from employee s join employee e on e.supervisor= s.number
group by s.number;

-- 4 
select s.name, count(e.number) as total
from employee e, employee s, department d
where s.number = e.supervisor and d.code = e.department and d.location <> 'Hanoi'
group by s.number;

--join methode
select e2.name,count(e.number) 
from employee e inner join employee e2 on e.supervisor=e2.number 
inner join department d on d.code=e.department 
where d.location <> 'Hanoi' 
group by e.supervisor;

-- 5
select e.position, d.name, count(e.number) as total
from employee e, department d 
where d.code = e.department
group by e.position, d.name;

--iner join methode 
select e.position,d.name,COUNT(e.number) 
from department d inner join e.department on d.code 
group by e.position,e.department;

-- 6
select p.code, p.income, count(*) as total
from employee e, position p, department d
where p.code = e.position and e.department = d.code and d.location <> 'Hanoi'
group by e.code; 

-- inner join 
select p.code,p.income,COUNT(e.number)
 from position p inner join employee e on e.position=p.code inner join department d on e.department=d.code
 where d.location <> "Hanoi" group by e.position,e.department;

-- 7 
select e.name, p.income * 12 as annual_income
from position p, employee e
where e.position = p.code  and abs( p.income  - (select avg(p1.income)
						from employee e1, position p1
						where e1.position = p1.code) ) <= 100;
-- Fist find the avg income then do another query for comaprision



