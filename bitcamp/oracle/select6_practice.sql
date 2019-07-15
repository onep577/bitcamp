-- 실습


-- HR 계정
-- 1) EMPLOYEES 테이블에서 Kochhar의 급여보다 많은 사원의 정보를 사원번호,
-- 이름, 담당업무, 급여를 출력
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary > ( SELECT salary
                 FROM employees
                 WHERE last_name = 'Kochhar');
-- 2) EMPLOYEES 테이블에서 급여의 평균보다 적은 사원의 정보를 사원번호, 이름,
-- 담당업무, 급여, 부서번호를 출력
SELECT employee_id, last_name, job_id, salary, department_id
FROM employees
WHERE salary < (SELECT AVG(salary)
                FROM employees);
-- 3) EMPLOYEES 테이블에서 100번 부서의 최소 급여보다 최소 급여가 많은
-- 다른 모든 부서를 출력
SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) > (SELECT MIN(salary)
                     FROM employees
                     WHERE department_id = 100);
-- 4) 업무별로 최소 급여를 받는 사원의 정보를 사원번호, 이름, 업무, 부서번호 출력
-- 단, 업무별로 정렬
-- job_id 둘 다 빼면 33행 그대로면 22행 나온다.
-- AD_VP, 등 최소금액을 받는 같은 부서의 사원이 두명 이상인 경우가 있어서 22명 나온다
SELECT employee_id, last_name, job_id, salary, department_id
FROM employees
WHERE (salary, job_id) IN (SELECT MIN(salary), job_id
        FROM employees
        GROUP BY job_id)
ORDER BY job_id ASC;
/*
-- 다른 부서의 최소금액과 같은 금액을 받는 사원이 우리 부서에 있으면
-- 우리 부서의 최소금액과 다르더라도 출력된다
SELECT employee_id, last_name, job_id, salary, department_id
FROM employees
WHERE (salary) IN (SELECT MIN(salary)
        FROM employees
        GROUP BY job_id)
ORDER BY job_id ASC;
*/
-- 5) EMPLOYEES와 DEPARTMENTS 테이블에서 업무가 SA_MAN 사원의 정보를 이름,
-- 업무, 부서명, 근무지를 출력
SELECT last_name, job_id, d.department_name, location_id
FROM departments d, employees e
WHERE d.department_id = e.department_id
    AND e.job_id IN (SELECT job_id 
                     FROM employees 
                     WHERE job_id = 'SA_MAN');
-- 6) EMPLOYEES 테이블에서 가장 많은 사원을 갖는 MANAGER의 사원번호 출력
SELECT manager_id
FROM employees
GROUP BY manager_id
HAVING COUNT(manager_id) IN (SELECT MAX(COUNT(*))
                             FROM employees
                             GROUP BY manager_id);
-- 7) EMPLOYEES 테이블에서 가장 많은 사원이 속해있는 부서번호와 사원수 출력
SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id
HAVING COUNT(department_id) IN (SELECT MAX(COUNT(*))
                                FROM employees
                                GROUP BY department_id);
-- 8) ★ 많이 나온다 EMPLOYEES 테이블에서 사원번호가 123인 사원의 직업과 같고 사원번호가 192인
-- 사원의 급여(SAL)보다 많은 사원의 사원번호, 이름, 직업, 급여를 출력
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
-- 사원번호 123만 나온다 왜? FROM절에서 사원번호 123과 직원이 같아야하는데 123만 해당되게 했다
*/               
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE employee_id = 192)
    AND job_id IN (SELECT job_id
                   FROM employees
                   WHERE employee_id = 123);
-- 9) 직업(JOB)별로 최소 급여를 받는 사원의 정보를 사원번호, 이름, 업무, 부서명 출력
-- 조건 1: 직업별로 내림차순 정렬
-- PPT 답이 으잉?
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


-- 10) EMPLOYEES 테이블에서 50번 부서의 최소 급여를 받는 사원보다 많은 급여를
-- 받는 사원의 정보를 사원번호, 이름, 업무, 입사일자, 급여, 부서번호 출력 단, 50번 제외
-- PPT 답이 으잉? 문제 풀어주실 때 강사님은 61행 나왔다
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
-- 11) EMPLOYEES 테이블에서 50번 부서의 최고 급여를 받는 사원보다 많은 급여를
-- 받는 사원의 정보를 사원번호, 이름, 업무, 입사일자, 급여, 부서번호 출력 단, 50번 제외
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





-- subquery 문제 (scott)
-- 60) BLAKE와 같은 부서에 있는 사원들의 이름과 입사일을 구하는데 BLAKE는 제외하고
-- 출력하시오.(BLAKE가 여러명일 수 있음)
SELECT *
FROM emp
WHERE ename = 'BLAKE';

SELECT ename, hiredate
FROM emp
WHERE deptno IN (SELECT deptno
                 FROM emp
                 WHERE ename = 'BLAKE')
    AND ename NOT IN ('BLAKE');
-- 61) (평균급여보다 많은 급여)를 받는 사원들의 사원번호, 이름, 월급을 출력하는데
-- (월급이 높은 사람순으로 출력)하시오.
SELECT AVG(sal)
FROM emp;

SELECT empno, ename, sal
FROM emp
WHERE sal > (SELECT AVG(sal)
             FROM emp)
ORDER BY sal DESC;
-- 62) (10번부서에서 급여를 가장 적게 받는 사원)과 동일한 급여를 받는 사원의 이름을 출력하시오.
SELECT MIN(sal)
FROM emp
WHERE deptno = 10;

SELECT ename
FROM emp
WHERE sal = (SELECT MIN(sal)
             FROM emp
             WHERE deptno = 10);
-- 63) 사원수가 3명이 넘는 부서의 부서명과 사원수를 출력하시오.
-- 내 코드
SELECT deptno, COUNT(*)
FROM emp
GROUP BY deptno
HAVING COUNT(*) > 3;

-- 강사님 코드
SELECT d.dname, COUNT(e.empno)
FROM emp e, dept d
WHERE e.deptno = d.deptno
GROUP BY d.dname
HAVING COUNT(e.empno) > 3;
-- 64) 사원번호가 7844인 사원보다 빨리 입사한 사원의 이름과 입사일을 출력하시오.
SELECT *
FROM emp
WHERE empno = 7844;

SELECT ename, hiredate
FROM emp
WHERE hiredate < (SELECT hiredate
                  FROM emp
                  WHERE empno = 7844);
-- 65) 직속상사(mgr)가 KING인 모든 사원의 이름과 급여를 출력하시오.
SELECT *
FROM emp a, emp b
WHERE b.mgr = a.empno
    AND a.ename = 'KING';
SELECT ename, sal, mgr
FROM emp
WHERE ename IN ( SELECT b.ename
                FROM emp a, emp b
                WHERE b.mgr = a.empno AND a.ename = 'KING');
-- 66) 20번 부서에서 가장 급여를 많이 받는 사원과 동일한 급여를 받는 사원의 이름과
-- 부서명, 급여, 급여등급을 출력하시오.(emp, dept, salgrade)
SELECT MAX(sal)
FROM emp
WHERE deptno = 20;

SELECT e.ename, d.dname, e.sal, s.grade
FROM dept d, emp e, salgrade s
WHERE d.deptno = e.deptno
   AND sal IN (SELECT MAX(sal) FROM emp WHERE deptno = 20)
   AND sal >= s.losal AND sal <= s.hisal;
   -- AND sal BETWEEN s.losal AND s.hisal;
-- 67) 총급여(sal+comm)가 평균 급여보다 많은 급여를 받는 사람의 부서번호, 이름,
-- 총급여,  커미션을 출력하시오.(커미션은 유(O),무(X)로 표시하고 컬럼명은 "comm유무" 출력)
SELECT AVG(sal)
FROM emp;
SELECT deptno, ename, sal+NVL(comm,0), comm, NVL2(comm,'O','X') as "comm유무"
FROM emp
WHERE sal+NVL(comm,0) > (SELECT AVG(sal)
                         FROM emp);

-- 68) CHICAGO 지역에서 근무하는 사원의 평균 급여보다 높은 급여를 받는 사원의
-- 이름과 급여, 지역명을 출력하시오.
SELECT AVG(e.sal)
FROM dept d, emp e
WHERE d.deptno = e.deptno AND loc = 'CHICAGO';
-- 내 코드
select e.ename, e.sal, d.loc
from emp e, dept d
WHERE d.deptno = e.deptno 
    AND e.sal > ( SELECT AVG(e.sal)
                  FROM dept d, emp e
                  WHERE d.deptno = e.deptno AND loc = 'CHICAGO');
-- 다시보자!!!
-- 강사님 코드
SELECT e.ename, e.sal, d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno -- 지역명을 구하기 위해서
    AND sal > ( SELECT AVG(sal)
                FROM emp
                WHERE deptno = (SELECT deptno -- 지역번호를 구함
                                FROM dept
                                WHERE loc = 'CHICAGO')
                GROUP BY deptno);
-- 69) 업무가 SALESMAN인 직원이 2명 이상인 부서의 이름, 근무하는
-- 사원의 이름, 업무를 출력 하시오.(컬럼명은 부서명, 사원명, 업무로 출력)
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

-- 다시 보자!!!
-- 강사님 코드
SELECT d.dname, e.ename, e.job
FROM emp e, dept d
WHERE e.deptno = d.deptno
    AND e.deptno IN (SELECT deptno
                     FROM emp
                     WHERE job = 'SALESMAN'
                     GROUP BY deptno
                     HAVING COUNT(job) >= 2);
-- 70) 커미션이 없는 사원들 중 월급이 가장 높은 사원의 이름과 급여등급을 출력하시오.
SELECT MAX(sal)
FROM emp
WHERE comm IS NULL;
SELECT e.ename, e.sal, s.grade
FROM emp e, salgrade s
WHERE sal IN (SELECT MAX(sal)
              FROM emp
              WHERE comm IS NULL)
    AND sal BETWEEN s.losal AND s.hisal;

-- 71) SMITH의 관리자(mgr)의 이름과 부서명, 근무지역을 출력하시오.
SELECT e.ename, d.dname, d.loc
FROM emp e, dept d
WHERE e.deptno  = d.deptno
    AND empno = (SELECT MGR FROM EMP WHERE ename = 'SMITH');


-- joinAndSubQuery
-- 1) 급여가 3000에서 5000사이인 사원의 이름과 소속부서명 출력
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
 

-- 2) 직급이 MANAGER인 사원의 이름과 부서명을 출력

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
  

-- 3) ACCOUNTING 부서 소속 사원의 이름과 입사일 출력
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
        

-- 4) 커미션을 받는 사원의 이름과 그가 속한 부서명
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

-- 5) 뉴욕에 근무하는 사원의 이름과 급여
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

-- 6) 급여가 1200이하인 사원의 이름과 급여, 근무지
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
-- | 연습 :조인과 서브 쿼리
-- *-----------------------------------------------------------------*

-- <<1>> EMP와 DEPT TABLE을 JOIN하여 부서 번호, 부서명, 이름, 급여를 출력하라.
SELECT d.deptno, d.dname, e.ename, e.sal
FROM emp e, dept d
WHERE e.deptno = d.deptno;

select deptno, dname, ename, sal
from emp natural join dept;

-- <<2>> 이름이 'ALLEN'인 사원의 부서명을 출력하라.
select dname
from emp e, dept d
where e.deptno = d.deptno
and e.ename = 'ALLEN';

select d.dname
from emp e join dept d
on e.ename = 'ALLEN' and e.deptno = d.deptno;

-- <<3>> EMP Table의 데이터를 출력하되 해당사원에 대한 상관번호와 상관의 성명을 함께 출력하라.
select e.ename, e.mgr, c.ename mgr_name
from emp e, emp c
where e.mgr = c.empno;

select e.ename, e.mgr, c.ename mgr_name
from emp e join emp c
on e.mgr = c.empno;

-- <<4>> DEPT Table 에는 존재하는 부서코드이지만 해당부서에 근무하는 사람이 존재하지 않는 경우의 결과를 출력하라.
select *
from dept
where deptno not in (
                  select deptno
                  from emp
                  group by deptno
                  having count(*) > 0) ;
                 
-- <<5>> 'ALLEN'의 직무와 같은 사람의 이름, 부서명, 급여, 직무를 출력하라.
select e.ename, d.dname, e.sal, e.job
from emp e, dept d
where e.deptno = d.deptno
	and e.job = (select job from emp where ename = 'ALLEN');

-- <<6>> 'JONES'가 속해있는 부서의 모든 사람의 사원번호, 이름, 입사일자, 급여를 출력하라.
SELECT deptno
FROM emp
WHERE ename = 'JONES';
SELECT empno, ename, hiredate, sal
FROM emp
WHERE deptno = (SELECT deptno
                FROM emp
                WHERE ename = 'JONES');
                
-- 강사님 코드
select e.empno, e.ename, e.hiredate, e.sal
from emp e
where e.deptno = (select deptno from emp where ename = 'JONES');
        
-- <<7>> 전체 사원의 평균 임금보다 많은 사원의 사원번호, 이름, 부서명, 입사일, 지역, 급여를 출력하라.
SELECT AVG(sal)
FROM emp;
SELECT e.empno, e.ename, e.deptno, d.dname, e.hiredate, e.sal
FROM emp e, dept d
WHERE e.deptno = d.deptno 
    AND sal > ( SELECT AVG(sal)
                FROM emp);

-- <<8>> 10번 부서 사람들 중에서 20번 부서의 사원과 같은 업무를 하는 사원의 
-- 사원번호, 이름, 부서명, 입사일, 지역을 출력하라.
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
-- 강사님 코드
select e.empno, e.ename, d.dname, e.hiredate, d.loc
from emp e, dept d
where e.deptno = d.deptno
	and e.job in (select job from emp where deptno = 20 );
   
-- <<9>> 10번 부서 중에서 30번 부서에는 없는 업무를 하는 사원의 사원번호, 이름, 부서명, 입사일자, 지역을 출력하라.
select e.empno, e.ename, d.dname, e.hiredate, d.loc
from emp e, dept d
where e.deptno = d.deptno
   and e.job not in (select job from emp where deptno = 30);

   
-- <<10>> 10번 부서에 근무하는 사원의 사원번호, 이름, 부서명, 지역, 급여를 급여가 많은 순으로 출력하라.
select e.empno, e.ename, d.dname, d.loc, e.sal
from emp e, dept d
where e.deptno = d.deptno
   and e.deptno = 10;
  
  
-- <<11>> 'MARTIN'이나 'SCOTT'의 급여와 같은 사원의 사원번호, 이름, 급여를 출력하라.
select empno, ename, sal
from emp
   where sal in ( select sal from emp where ename in ('MARTIN', 'SCOTT') );

-- <<12>> 급여가 30번 부서의 최고 급여보다 높은 사원의 사원번호, 이름, 급여를 출력하라.
select empno, ename, sal
from emp
where sal > (select max(sal) from emp where deptno = 30 );

  
-- <<13>> 급여가 30번 부서의 최저 급여보다 높은 사원의 사원번호, 이름, 급여를 출력하라.
select empno, ename, sal
from emp
where sal > (select min(sal) from emp where deptno = 30 );

