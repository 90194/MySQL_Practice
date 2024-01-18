-- 1
SELECT max(sal) AS "Maximum", min(sal) AS "Minimum", sum(sal) AS "Sum", round(avg(sal)) AS "Average"
FROM emp;
-- 2
SELECT job,MAX(sal),MIN(sal),SUM(sal),AVG(sal)
FROM emp
GROUP BY job;
-- 3
SELECT job,count(*)
FROM emp
GROUP BY job;
-- 4
SELECT count(distinct mgr) AS "Nnmber Natural Join"
FROM emp;
-- 5
SELECT  max(sal)-min(sal) AS "DIFFERENCE"
FROM emp;
-- 6
SELECT distinct mgr, min(sal)
FROM emp
GROUP BY mgr
HAVING min(sal)>1000 AND mgr is not Null
ORDER BY min(sal) DESC;
-- 7
SELECT YEAR(hiredate) AS "HYEAR",count(*) AS "Number of People"
FROM emp
GROUP BY YEAR(hiredate)
HAVING HYear Between 2010 AND 2013;#因為所有年份於2010-2013,所以HAVING可略 
