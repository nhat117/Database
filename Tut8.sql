-- 1
   select e.position, count(e.number) as total
from employee e, position p where (e.position = p.code) P.INCOME >   
avg(income) 
from position p1, employee e1
where e1.position = p1.code) GROUP BY p.code;

-- 2
select p1.code, d1.name, p1.title, h1.start_date, e1.name
from employee e1, department d1, position p1, history h1
where e1.department = d1.code 
and h1.employee = e1.number 
and h1.position = p1.code 
and (p.code, h1.startdate in
						select h.position, h.startdate 
						from history h, employee e 
						where e.number = h.employee
						group by h.position);  

-- 3
select d1.name, e1.name
from department d1, employee e1, position p1
where e1.position = p1.code and e1.department = d1.code and (d1.code, p1.income) in
                                                                                    (select d.code, max(income)
                                                                                    from position p, employem e, department d
                                                                                    where e.position = p.code and d.code = e.department
                                                                                    group by d.code);
-- 4
select d1.name, e1.name, count(h1.position) as count
from employee e1, history h1, department d1
where  d1.code = e1.department
group by d1.name, e1.name
having count(h1.position) > 3;


--6

select d.name, avg(p.income) as average
from employee e, position p, department d
where e.position = p.code and e.department = d.code
group by e.department 
having avg(p.income) < (select avg(p1.income)
                            from employee e1, department d1, position p1, employee dir
                            where e1.position = p1.code
                            and d1.code = e1.department
                            and e1.name = dir.name 
                            and dir.name like 'P%');

--7
select d.name
from department d, employee e
where d.code = e.department
group by e.department
having count(distinct e.position) = (select count(*) from position);
