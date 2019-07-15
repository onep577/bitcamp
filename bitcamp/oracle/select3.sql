-- SOCTT 계정
-- ORDER BY 절 : 정렬
SELECT *
FROM emp
-- ORDER BY sal ASC; -- 올림 차순 정렬
-- ORDER BY sal DESC; -- 내림 차순 정렬
-- ORDER BY sal, ename;
ORDER BY deptno ASC, sal DESC;
-- deptno 오름차순 정렬 후 sal 내림차순 정렬한다

-- ALIAS
SELECT empno, ename, sal*12 as annsal
FROM emp
ORDER BY annsal asc;

-- nulls first 또는 nulls last 키워드
SELECT *
FROM emp
ORDER BY comm NULLS FIRST;
-- NULL 값이 들어있으면 무조건 처음에 출력한다

SELECT *
FROM emp
ORDER BY MGR NULLS LAST;
-- NULL 값이 들어있으면 무조건 마지막에 출력한다

-- 실습
-- SCOTT 계정
-- 19) EMP 테이블에서 사원번호, 사원이름 입사일을 출력하는데 입사일이
-- 빠른 사람순으로 정렬
SELECT empno, ename, hiredate
FROM EMP
ORDER BY HIREDATE ASC;
-- 20) EMP 테이블에서 사원이름, 급여, 연봉을 구하고 연봉이 많은 순으로 정렬
SELECT ename, sal, sal*12 AS 연봉
FROM EMP
ORDER BY 연봉 DESC;
-- 21) 10번 부서와 20번 부서에서 근무하고 있는 사원의 이름과 부서번호를 출력하
-- 는데 이름을 영문자순으로 표시
SELECT ename, deptno
FROM EMP
WHERE deptno IN (10, 20)
ORDER BY ename ASC;
-- 22) 커미션을 받는 모든 사원의 이름, 급여 및 커미션을
-- 커미션을 기준으로 내림차순으로 정렬
SELECT ename, sal, comm
FROM EMP
WHERE comm IS NOT NULL 
    -- AND comm != 0
    AND comm <> 0
ORDER BY comm DESC;

-- HR 계정
-- 1) EMPLOYEES 테이블에서 입사일자순으로 정렬하여 사원번호, 이름, 업무, 급여,
-- 입사일자, 부서번호를 출력
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM EMPLOYEES
ORDER BY hire_date ASC;
-- 2) EMPLOYEES 테이블에서 가장 최근에 입사한 순으로 사원번호, 이름, 업무,
-- 급여, 입사일자, 부서번호를 출력
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM EMPLOYEES
ORDER BY hire_date DESC;
-- 3) EMPLOYEES 테이블에서 부서번호로 정렬한 후 부서번호가 같을 경우 급여가
-- 많은 순으로 정렬하여 사원번호, 성명, 업무, 부서번호, 급여를 출력
SELECT employee_id, first_name, job_id, department_id, salary
FROM EMPLOYEES
ORDER BY department_id ASC, salary DESC;
-- 4) EMPLOYEES 테이블에서 첫번째 정렬은 부서번호로 두번째 정렬은 업무로 세번째 정렬은
-- 급여가 많은 순으로 정렬하여 사원번호, 성명, 입사일자, 부서번호, 업무, 급여를 출력
SELECT employee_id, first_name, hire_date, department_id, job_id, salary
FROM EMPLOYEES
ORDER BY department_id ASC, job_id ASC, salary DESC;














