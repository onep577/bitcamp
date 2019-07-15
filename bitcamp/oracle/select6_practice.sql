-- �ǽ�


-- HR ����
-- 1) EMPLOYEES ���̺��� Kochhar�� �޿����� ���� ����� ������ �����ȣ,
-- �̸�, ������, �޿��� ���
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary > ( SELECT salary
                 FROM employees
                 WHERE last_name = 'Kochhar');
-- 2) EMPLOYEES ���̺��� �޿��� ��պ��� ���� ����� ������ �����ȣ, �̸�,
-- ������, �޿�, �μ���ȣ�� ���
SELECT employee_id, last_name, job_id, salary, department_id
FROM employees
WHERE salary < (SELECT AVG(salary)
                FROM employees);
-- 3) EMPLOYEES ���̺��� 100�� �μ��� �ּ� �޿����� �ּ� �޿��� ����
-- �ٸ� ��� �μ��� ���
SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) > (SELECT MIN(salary)
                     FROM employees
                     WHERE department_id = 100);
-- 4) �������� �ּ� �޿��� �޴� ����� ������ �����ȣ, �̸�, ����, �μ���ȣ ���
-- ��, �������� ����
-- job_id �� �� ���� 33�� �״�θ� 22�� ���´�.
-- AD_VP, �� �ּұݾ��� �޴� ���� �μ��� ����� �θ� �̻��� ��찡 �־ 22�� ���´�
SELECT employee_id, last_name, job_id, salary, department_id
FROM employees
WHERE (salary, job_id) IN (SELECT MIN(salary), job_id
        FROM employees
        GROUP BY job_id)
ORDER BY job_id ASC;
/*
-- �ٸ� �μ��� �ּұݾװ� ���� �ݾ��� �޴� ����� �츮 �μ��� ������
-- �츮 �μ��� �ּұݾװ� �ٸ����� ��µȴ�
SELECT employee_id, last_name, job_id, salary, department_id
FROM employees
WHERE (salary) IN (SELECT MIN(salary)
        FROM employees
        GROUP BY job_id)
ORDER BY job_id ASC;
*/
-- 5) EMPLOYEES�� DEPARTMENTS ���̺��� ������ SA_MAN ����� ������ �̸�,
-- ����, �μ���, �ٹ����� ���
SELECT last_name, job_id, d.department_name, location_id
FROM departments d, employees e
WHERE d.department_id = e.department_id
    AND e.job_id IN (SELECT job_id 
                     FROM employees 
                     WHERE job_id = 'SA_MAN');
-- 6) EMPLOYEES ���̺��� ���� ���� ����� ���� MANAGER�� �����ȣ ���
SELECT manager_id
FROM employees
GROUP BY manager_id
HAVING COUNT(manager_id) IN (SELECT MAX(COUNT(*))
                             FROM employees
                             GROUP BY manager_id);
-- 7) EMPLOYEES ���̺��� ���� ���� ����� �����ִ� �μ���ȣ�� ����� ���
SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id
HAVING COUNT(department_id) IN (SELECT MAX(COUNT(*))
                                FROM employees
                                GROUP BY department_id);
-- 8) �� ���� ���´� EMPLOYEES ���̺��� �����ȣ�� 123�� ����� ������ ���� �����ȣ�� 192��
-- ����� �޿�(SAL)���� ���� ����� �����ȣ, �̸�, ����, �޿��� ���
SELECT *
FROM employees
WHERE employee_id = 123;
-- JOB_ID ST_MAN
SELECT *
FROM employees
WHERE employee_id = 192;
-- SALARY 4000

/*
SELECT employee_id, last_name, job_id, salary
FROM (SELECT employee_id, last_name, job_id, salary
      FROM employees
      WHERE employee_id = 123)
WHERE salary > (SELECT salary
                FROM employees
                WHERE employee_id = 192);
-- �����ȣ 123�� ���´� ��? FROM������ �����ȣ 123�� ������ ���ƾ��ϴµ� 123�� �ش�ǰ� �ߴ�
*/               
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE employee_id = 192)
    AND job_id IN (SELECT job_id
                   FROM employees
                   WHERE employee_id = 123);
-- 9) ����(JOB)���� �ּ� �޿��� �޴� ����� ������ �����ȣ, �̸�, ����, �μ��� ���
-- ���� 1: �������� �������� ����
-- PPT ���� ����?
SELECT job_id, min_salary
FROM jobs;

SELECT *
FROM employees
WHERE (job_id, salary) IN (SELECT job_id, min_salary
                           FROM jobs);

SELECT employee_id, last_name, job_id, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
    AND (e.job_id, e.salary) IN (SELECT job_id, MIN(salary)
                                 FROM employees
                                 GROUP BY job_id)
ORDER BY e.job_id DESC;


-- 10) EMPLOYEES ���̺��� 50�� �μ��� �ּ� �޿��� �޴� ������� ���� �޿���
-- �޴� ����� ������ �����ȣ, �̸�, ����, �Ի�����, �޿�, �μ���ȣ ��� ��, 50�� ����
-- PPT ���� ����? ���� Ǯ���ֽ� �� ������� 61�� ���Դ�
SELECT MIN(salary)
FROM employees
WHERE department_id = 50;

SELECT employee_id, last_name, job_id, hire_date, salary, department_id
FROM employees
WHERE salary > (SELECT MIN(salary)
                FROM employees
                WHERE department_id = 50)
AND department_id != 50
ORDER BY salary DESC;
-- 11) EMPLOYEES ���̺��� 50�� �μ��� �ְ� �޿��� �޴� ������� ���� �޿���
-- �޴� ����� ������ �����ȣ, �̸�, ����, �Ի�����, �޿�, �μ���ȣ ��� ��, 50�� ����
SELECT MAX(salary)
FROM employees
WHERE department_id = 50;

SELECT employee_id, last_name, job_id, hire_date, salary, department_id
FROM employees
WHERE salary > (SELECT MAX(salary)
                FROM employees
                WHERE department_id = 50)
AND department_id <> 50
ORDER BY salary ASC;





-- subquery ���� (scott)
-- 60) BLAKE�� ���� �μ��� �ִ� ������� �̸��� �Ի����� ���ϴµ� BLAKE�� �����ϰ�
-- ����Ͻÿ�.(BLAKE�� �������� �� ����)
SELECT *
FROM emp
WHERE ename = 'BLAKE';

SELECT ename, hiredate
FROM emp
WHERE deptno IN (SELECT deptno
                 FROM emp
                 WHERE ename = 'BLAKE')
    AND ename NOT IN ('BLAKE');
-- 61) (��ձ޿����� ���� �޿�)�� �޴� ������� �����ȣ, �̸�, ������ ����ϴµ�
-- (������ ���� ��������� ���)�Ͻÿ�.
SELECT AVG(sal)
FROM emp;

SELECT empno, ename, sal
FROM emp
WHERE sal > (SELECT AVG(sal)
             FROM emp)
ORDER BY sal DESC;
-- 62) (10���μ����� �޿��� ���� ���� �޴� ���)�� ������ �޿��� �޴� ����� �̸��� ����Ͻÿ�.
SELECT MIN(sal)
FROM emp
WHERE deptno = 10;

SELECT ename
FROM emp
WHERE sal = (SELECT MIN(sal)
             FROM emp
             WHERE deptno = 10);
-- 63) ������� 3���� �Ѵ� �μ��� �μ���� ������� ����Ͻÿ�.
-- �� �ڵ�
SELECT deptno, COUNT(*)
FROM emp
GROUP BY deptno
HAVING COUNT(*) > 3;

-- ����� �ڵ�
SELECT d.dname, COUNT(e.empno)
FROM emp e, dept d
WHERE e.deptno = d.deptno
GROUP BY d.dname
HAVING COUNT(e.empno) > 3;
-- 64) �����ȣ�� 7844�� ������� ���� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�.
SELECT *
FROM emp
WHERE empno = 7844;

SELECT ename, hiredate
FROM emp
WHERE hiredate < (SELECT hiredate
                  FROM emp
                  WHERE empno = 7844);
-- 65) ���ӻ��(mgr)�� KING�� ��� ����� �̸��� �޿��� ����Ͻÿ�.
SELECT *
FROM emp a, emp b
WHERE b.mgr = a.empno
    AND a.ename = 'KING';
SELECT ename, sal, mgr
FROM emp
WHERE ename IN ( SELECT b.ename
                FROM emp a, emp b
                WHERE b.mgr = a.empno AND a.ename = 'KING');
-- 66) 20�� �μ����� ���� �޿��� ���� �޴� ����� ������ �޿��� �޴� ����� �̸���
-- �μ���, �޿�, �޿������ ����Ͻÿ�.(emp, dept, salgrade)
SELECT MAX(sal)
FROM emp
WHERE deptno = 20;

SELECT e.ename, d.dname, e.sal, s.grade
FROM dept d, emp e, salgrade s
WHERE d.deptno = e.deptno
   AND sal IN (SELECT MAX(sal) FROM emp WHERE deptno = 20)
   AND sal >= s.losal AND sal <= s.hisal;
   -- AND sal BETWEEN s.losal AND s.hisal;
-- 67) �ѱ޿�(sal+comm)�� ��� �޿����� ���� �޿��� �޴� ����� �μ���ȣ, �̸�,
-- �ѱ޿�,  Ŀ�̼��� ����Ͻÿ�.(Ŀ�̼��� ��(O),��(X)�� ǥ���ϰ� �÷����� "comm����" ���)
SELECT AVG(sal)
FROM emp;
SELECT deptno, ename, sal+NVL(comm,0), comm, NVL2(comm,'O','X') as "comm����"
FROM emp
WHERE sal+NVL(comm,0) > (SELECT AVG(sal)
                         FROM emp);

-- 68) CHICAGO �������� �ٹ��ϴ� ����� ��� �޿����� ���� �޿��� �޴� �����
-- �̸��� �޿�, �������� ����Ͻÿ�.
SELECT AVG(e.sal)
FROM dept d, emp e
WHERE d.deptno = e.deptno AND loc = 'CHICAGO';
-- �� �ڵ�
select e.ename, e.sal, d.loc
from emp e, dept d
WHERE d.deptno = e.deptno 
    AND e.sal > ( SELECT AVG(e.sal)
                  FROM dept d, emp e
                  WHERE d.deptno = e.deptno AND loc = 'CHICAGO');
-- �ٽú���!!!
-- ����� �ڵ�
SELECT e.ename, e.sal, d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno -- �������� ���ϱ� ���ؼ�
    AND sal > ( SELECT AVG(sal)
                FROM emp
                WHERE deptno = (SELECT deptno -- ������ȣ�� ����
                                FROM dept
                                WHERE loc = 'CHICAGO')
                GROUP BY deptno);
-- 69) ������ SALESMAN�� ������ 2�� �̻��� �μ��� �̸�, �ٹ��ϴ�
-- ����� �̸�, ������ ��� �Ͻÿ�.(�÷����� �μ���, �����, ������ ���)
SELECT a.dname
FROM dept a, emp b
WHERE a.deptno = b.deptno
AND b.job = 'SALESMAN'
GROUP BY a.dname HAVING COUNT(*) > 2;

SELECT d.dname, e.ename, e.job
FROM emp e, dept d
WHERE e.deptno = d.deptno
    AND COUNT(*) > (SELECT COUNT(deptno)
FROM EMP
WHERE JOB = 'SALESMAN');

-- �ٽ� ����!!!
-- ����� �ڵ�
SELECT d.dname, e.ename, e.job
FROM emp e, dept d
WHERE e.deptno = d.deptno
    AND e.deptno IN (SELECT deptno
                     FROM emp
                     WHERE job = 'SALESMAN'
                     GROUP BY deptno
                     HAVING COUNT(job) >= 2);
-- 70) Ŀ�̼��� ���� ����� �� ������ ���� ���� ����� �̸��� �޿������ ����Ͻÿ�.
SELECT MAX(sal)
FROM emp
WHERE comm IS NULL;
SELECT e.ename, e.sal, s.grade
FROM emp e, salgrade s
WHERE sal IN (SELECT MAX(sal)
              FROM emp
              WHERE comm IS NULL)
    AND sal BETWEEN s.losal AND s.hisal;

-- 71) SMITH�� ������(mgr)�� �̸��� �μ���, �ٹ������� ����Ͻÿ�.
SELECT e.ename, d.dname, d.loc
FROM emp e, dept d
WHERE e.deptno  = d.deptno
    AND empno = (SELECT MGR FROM EMP WHERE ename = 'SMITH');


-- joinAndSubQuery
-- 1) �޿��� 3000���� 5000������ ����� �̸��� �ҼӺμ��� ���
SELECT E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN 3000 AND 5000;
/*
ENAME      DNAME   

---------- --------------      

SCOTT      RESEARCH      
KING       ACCOUNTING     
FORD       RESEARCH     
*/
 

-- 2) ������ MANAGER�� ����� �̸��� �μ����� ���

SELECT E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND JOB LIKE 'MAN%';
/*
ENAME      DNAME   

---------- --------------  

JONES      RESEARCH        
BLAKE      SALES      
CLARK      ACCOUNTING    
*/
  

-- 3) ACCOUNTING �μ� �Ҽ� ����� �̸��� �Ի��� ���
SELECT E.ENAME, E.HIREDATE
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND DNAME LIKE 'ACCOUNTING%';
/*
ENAME      HIREDATE     
---------- --------  

CLARK      81/06/09         
KING       81/11/17    
MILLER     82/01/23   
*/
        

-- 4) Ŀ�̼��� �޴� ����� �̸��� �װ� ���� �μ���
SELECT E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND COMM>0;
/*
ENAME      DNAME     
---------- --------------     
ALLEN      SALES     
WARD       SALES     
MARTIN     SALES    
*/

-- 5) ���忡 �ٹ��ϴ� ����� �̸��� �޿�
SELECT E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND D.LOC LIKE 'NEW Y%';
/*
ENAME     SAL         
---------- ----------         
CLARK    2450         
KING     5000         
MILLER   1300        
*/

-- 6) �޿��� 1200������ ����� �̸��� �޿�, �ٹ���
SELECT E.ENAME, E.SAL, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND E.SAL<=1200;
/*
ENAME     SAL LOC     
---------- ---------- -------------    
SMITH     800 DALLAS 
JAMES     950 CHICAGO
*/



-- *-----------------------------------------------------------------*
-- | ���� :���ΰ� ���� ����
-- *-----------------------------------------------------------------*

-- <<1>> EMP�� DEPT TABLE�� JOIN�Ͽ� �μ� ��ȣ, �μ���, �̸�, �޿��� ����϶�.
SELECT d.deptno, d.dname, e.ename, e.sal
FROM emp e, dept d
WHERE e.deptno = d.deptno;

select deptno, dname, ename, sal
from emp natural join dept;

-- <<2>> �̸��� 'ALLEN'�� ����� �μ����� ����϶�.
select dname
from emp e, dept d
where e.deptno = d.deptno
and e.ename = 'ALLEN';

select d.dname
from emp e join dept d
on e.ename = 'ALLEN' and e.deptno = d.deptno;

-- <<3>> EMP Table�� �����͸� ����ϵ� �ش����� ���� �����ȣ�� ����� ������ �Բ� ����϶�.
select e.ename, e.mgr, c.ename mgr_name
from emp e, emp c
where e.mgr = c.empno;

select e.ename, e.mgr, c.ename mgr_name
from emp e join emp c
on e.mgr = c.empno;

-- <<4>> DEPT Table ���� �����ϴ� �μ��ڵ������� �ش�μ��� �ٹ��ϴ� ����� �������� �ʴ� ����� ����� ����϶�.
select *
from dept
where deptno not in (
                  select deptno
                  from emp
                  group by deptno
                  having count(*) > 0) ;
                 
-- <<5>> 'ALLEN'�� ������ ���� ����� �̸�, �μ���, �޿�, ������ ����϶�.
select e.ename, d.dname, e.sal, e.job
from emp e, dept d
where e.deptno = d.deptno
	and e.job = (select job from emp where ename = 'ALLEN');

-- <<6>> 'JONES'�� �����ִ� �μ��� ��� ����� �����ȣ, �̸�, �Ի�����, �޿��� ����϶�.
SELECT deptno
FROM emp
WHERE ename = 'JONES';
SELECT empno, ename, hiredate, sal
FROM emp
WHERE deptno = (SELECT deptno
                FROM emp
                WHERE ename = 'JONES');
                
-- ����� �ڵ�
select e.empno, e.ename, e.hiredate, e.sal
from emp e
where e.deptno = (select deptno from emp where ename = 'JONES');
        
-- <<7>> ��ü ����� ��� �ӱݺ��� ���� ����� �����ȣ, �̸�, �μ���, �Ի���, ����, �޿��� ����϶�.
SELECT AVG(sal)
FROM emp;
SELECT e.empno, e.ename, e.deptno, d.dname, e.hiredate, e.sal
FROM emp e, dept d
WHERE e.deptno = d.deptno 
    AND sal > ( SELECT AVG(sal)
                FROM emp);

-- <<8>> 10�� �μ� ����� �߿��� 20�� �μ��� ����� ���� ������ �ϴ� ����� 
-- �����ȣ, �̸�, �μ���, �Ի���, ������ ����϶�.
SELECT job
FROM emp
WHERE deptno = 10;
SELECT e.empno, e.ename, d.dname, e.hiredate, d.loc, e.job
FROM emp e, dept d
WHERE e.deptno = d.deptno
    AND e.deptno = 10
    AND e.job IN --'MANAGER'
    --AND e.job = --'MANAGER'
                (SELECT job
                 FROM emp
                 WHERE deptno = 20);
-- ����� �ڵ�
select e.empno, e.ename, d.dname, e.hiredate, d.loc
from emp e, dept d
where e.deptno = d.deptno
	and e.job in (select job from emp where deptno = 20 );
   
-- <<9>> 10�� �μ� �߿��� 30�� �μ����� ���� ������ �ϴ� ����� �����ȣ, �̸�, �μ���, �Ի�����, ������ ����϶�.
select e.empno, e.ename, d.dname, e.hiredate, d.loc
from emp e, dept d
where e.deptno = d.deptno
   and e.job not in (select job from emp where deptno = 30);

   
-- <<10>> 10�� �μ��� �ٹ��ϴ� ����� �����ȣ, �̸�, �μ���, ����, �޿��� �޿��� ���� ������ ����϶�.
select e.empno, e.ename, d.dname, d.loc, e.sal
from emp e, dept d
where e.deptno = d.deptno
   and e.deptno = 10;
  
  
-- <<11>> 'MARTIN'�̳� 'SCOTT'�� �޿��� ���� ����� �����ȣ, �̸�, �޿��� ����϶�.
select empno, ename, sal
from emp
   where sal in ( select sal from emp where ename in ('MARTIN', 'SCOTT') );

-- <<12>> �޿��� 30�� �μ��� �ְ� �޿����� ���� ����� �����ȣ, �̸�, �޿��� ����϶�.
select empno, ename, sal
from emp
where sal > (select max(sal) from emp where deptno = 30 );

  
-- <<13>> �޿��� 30�� �μ��� ���� �޿����� ���� ����� �����ȣ, �̸�, �޿��� ����϶�.
select empno, ename, sal
from emp
where sal > (select min(sal) from emp where deptno = 30 );

