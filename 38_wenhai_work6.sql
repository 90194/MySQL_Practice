-- 1
SELECT ename,hiredate
FROM emp
WHERE deptno = (SELECT deptno FROM emp WHERE ename ="Blake" );
-- 2
SELECT ename,hiredate
FROM emp
WHERE hiredate > (SELECT hiredate FROM emp WHERE ename = "Blake" );
-- 3
SELECT empno, ename, sal
FROM emp
WHERE sal > (SELECT AVG(sal)  FROM emp  )
ORDER BY sal DESC ;
-- 4
SELECT empno, ename
FROM emp
WHERE deptno IN (SELECT deptno FROM emp WHERE ename LIKE '%T%');
-- 5
SELECT e.ename, d.deptno, e.job
FROM emp e JOIN dept d ON (e.deptno = d.deptno)
WHERE loc = "Dallas" ;
# WHERE loc = (SELECT loc FROM dept WHERE loc = "Dallas");
# WHERE e.deptno = (SELECT d.deptno FROM dept WHERE d.loc="Dallas");標準
-- 6
SELECT ename, sal
FROM emp
WHERE mgr IN (SELECT empno FROM emp WHERE ename = "KING");
-- 7
SELECT d.deptno, e.ename, e.job
FROM emp e JOIN dept d ON (e.deptno = d.deptno)
WHERE e.deptno IN (SELECT d.deptno FROM dept WHERE d.dname="Sales");
-- 8
SELECT  empno, ename, sal
FROM emp 
WHERE sal > (SELECT AVG(sal) FROM emp WHERE ename LIKE '%T%' )
	  AND deptno IN (SELECT deptno FROM emp WHERE ename LIKE '%T%');
-- 9
SELECT e1.ename, e1.deptno, e1.sal
FROM emp e1 JOIN emp e2
ON e2.comm> 0 AND  e1.deptno = e2.deptno AND e1.sal = e2.sal AND e1.empno <> e2.empno;
-- 10
SELECT e1.ename, e1.deptno, e1.sal
FROM emp e1 JOIN emp e2 JOIN dept d
ON e1.sal = e2.sal AND ifnull(e1.comm,0)=ifnull(e2.comm,0) AND d.loc ="Dallas" AND e1.empno <> e2.empno;
-- 11
SELECT e1.ename, e1.hiredate, e1.sal
FROM emp e1 JOIN emp e2 
ON e1.sal = e2.sal AND ifnull(e1.comm,0)=ifnull(e2.comm,0) AND e2.ename ="Scott" AND  e1.ename <> e2.ename ;
-- 12
SELECT ename, hiredate, sal
FROM emp
WHERE  sal > ALL(SELECT sal FROM emp WHERE job = 'Clerk')
ORDER BY sal DESC ;
