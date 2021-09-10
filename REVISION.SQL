--Excercise 5--
SELECT sum(e.sal) FROM EMP e, DEPT d WHERE e.deptno = d.deptno and d.dname = 'RESEARCH'

--Excercise 6---
SELECT avg(e.sal) FROM EMP e

--Excercise 7--
SELECT M.ename AS MNGR, E1.ENAME AS employee, E1.job
FROM EMP E1, EMP M
WHERE M.eMPNO = E1.mgr 
ORDER BY M.ename ASC