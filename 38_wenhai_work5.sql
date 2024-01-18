-- 1.顯示所有員工之姓名、所屬部門編號、部門名稱及部門所在地點。
SELECT e.ename,e.deptno,d.dname,d.loc
FROM emp e JOIN dept d ON (e.deptno = d.deptno);
-- 2.顯示所有有賺取佣金的員工之姓名、佣金金額、部門名稱及部門所在地點。
SELECT e.ename,e.comm,d.dname,d.loc
FROM emp e JOIN dept d ON (e.deptno = d.deptno)
WHERE comm;
-- 3.顯示姓名中包含有”A”的員工之姓名及部門名稱。
SELECT e.ename,d.dname
FROM emp e JOIN dept d ON (e.deptno = d.deptno)
WHERE e.ename LIKE '%A%' ;
-- 4.顯示所有在”DALLAS”工作的員工之姓名、職稱、部門編號及部門名稱
SELECT e.ename , e.job , d.deptno , d.dname
FROM emp e JOIN dept d ON (e.deptno = d.deptno)
WHERE d.loc = 'DALLAS' ;
-- 5.顯示出表頭名為:Employee, Emp#, Manager, Mgr#，分別表示所有員工之姓名、員工編號、主管姓名、主管的員工編號。
-- (自身連結)
SELECT e.ename AS "Employee", e.empno AS "Emp#", d.ename AS "Manager", d.empno AS "Mgr#"
FROM emp e JOIN emp d ON e.mgr = d.empno ;
-- 6.顯示出SALGRADE資料表的結構，並建立一查詢顯示所有員工之姓名、職稱、部門名稱、薪資及薪資等級。
-- (不對等)
SELECT e.ename, e.job, d.dname, e.sal, s.grade
FROM emp e JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
           JOIN dept d ON (e.deptno = d.deptno);
-- 7.顯示出表頭名為: Employee, EmpHiredate, Manager, MgrHiredate的資料項，來顯示所有比他的主管還要早進公司的員工之姓名、進公司日期和主管之姓名及進公司日期。
-- (自身)
SELECT e.ename AS "Employee", e.hiredate AS "EmpHiredate", d.ename AS "Manager",d.hiredate AS "MgrHiredat"
FROM emp e JOIN emp d ON (e.mgr = d.empno)#員工的經理VS經理的編碼
WHERE e.hiredate < d.hiredate ;
-- 8.顯示出表頭名為: dname, loc, Number of People, Salary的資料來顯示所有部門之部門名稱、部門所在地點、部門員工數量及部門員工的平均薪資，平均薪資四捨五入取到小數第二位。
-- (三表連結)
SELECT d.dname, d.loc, COUNT(e.empno) AS "Number of People", ROUND(AVG(e.sal),2) AS "Salary"
FROM dept d JOIN emp e ON (e.deptno = d.deptno)
GROUP BY d.deptno;
-- 9.顯示出所有部門之編號、名稱及部門員工人數(Emp#)，包含沒有員工的部門。
-- (外部連結)
SELECT  e.deptno, d.dname,COUNT(e.empno) AS "Emp#"
FROM emp e  RIGHT JOIN dept d ON (e.deptno = d.deptno)
GROUP BY d.deptno ; #d.depno=right