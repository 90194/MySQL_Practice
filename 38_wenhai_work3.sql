-- 1
SELECT CURDATE() AS "系統日期" ;
-- 2
SELECT empno,ename,sal,round(sal*1.15) AS "New Salary"
from emp;
-- 3
SELECT  empno,ename,sal,round(sal*1.15) AS "New Salary",round(sal*1.15 - sal) AS"Increase"
FROM emp;
-- 4
SELECT ename, hiredate, DATE_FORMAT(ADDDATE(hiredate, INTERVAL MOD(7-WEEKDAY(ADDDATE(hiredate, INTERVAL 6 month)), 7) day), "%D , the %W of %M") "REVIEW"
FROM emp ;
-- 5
SELECT ename, timestampdiff(month, HIREDATE , NOW() )  AS "MONTHS_WORKED"
FROM emp;
-- 6
SELECT concat(ename,' earns',sal,' monthly but wants ',round(3 *sal)) AS "Dream Salaries"
FROM emp;
-- 7
SELECT ename,LPAD(sal,15,'$') AS SALARY
FROM emp;
-- 8
SELECT ename,hiredate,weekday(hiredate)+1 AS "Day"
FROM emp
ORDER BY Day;
-- 9
SELECT ename,ifnull(comm,"No Commission.")AS "Comm"
FROM emp;
-- 10
SELECT concat(ename,repeat('*',round(sal/100))) AS "EMPLOYEE_AND_THEIR_SALARIES"
FROM emp
ORDER BY sal DESC;