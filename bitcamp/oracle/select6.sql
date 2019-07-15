-- SUB QUERY
-- QUERY안의 QUERY문이다
-- 한개의 행(ROW)에서 결과 값이 반환되는 QUERY

-- SELECT    단일행(ROW) 단일컬럼(COLUMN)만 사용 즉, 나오는 데이터는 한개, 컬럼 한개
-- 데이터가 여러개가 나오면 안된다. SELECT문에서 나오는 ROW는 하나
-- FROM     다중행(ROW) 다중컬럼(COLUMN)이 가능하다
-- 부서 = 10을 WHERE절이 아니라 FROM절에서 추려줄 수 있다
-- WHERE    다중행(ROW) 다중컬럼(COLUMN)이 가능하다     --> 제일 많이 사용

/*
    -- SELECT (SELECT FIRSTNAME, LASTNAME FROM EMPLOYEES) 컬럼이 두개여서 안된다
    -- SELECT (SELECT FIRSTNAME FROM EMPLOYEES) 행이 여러값이여서 안된다
    -- SELECT (SELECT FIRSTNAME FROM EMPLOYEES WHERE EMPLOYEE_ID = 100) 된다 왜? 행이 하나
    -- 그래서 SELECT절에서는 사용 빈도가 매우 적다 거의 WHERE절 가끔 FROM에서 사용한다
*/



-- SELECT
SELECT employee_id, first_name,
    -- (SELECT last_name FROM employees) -- 107개 나온다
        -- 에러코드 single-row subquery returns more than one row 
    -- (SELECT SUM(salary), AVG(salary) FROM employees)
        -- 에러코드 too many values 
    -- (SELECT SUM(salary) FROM employees) -- o
    (SELECT SUM(salary) FROM employees),
    (SELECT COUNT(*) FROM employees) -- o
FROM employees;

-- FROM
-- employee_id, last_name, salary, department_id
-- 내보내는 값이 매치가 되야한다. *도 가능하다 왜? 4개를 다 받을 수 있으니까
SELECT *
-- SELECT employee_id, last_name, salary, department_id
-- 위 아래 같은 값이 나온다. 둘 다 맞다
FROM ( SELECT employee_id, last_name, salary, department_id
       FROM employees
       WHERE department_id = 20);

-- 부서번호가 20번, 급여가 6000 이상인 사원
SELECT *
FROM employees
WHERE department_id = 20 
    AND salary >= 6000;
SELECT *
FROM (SELECT *
      FROM employees
      WHERE department_id = 20)
WHERE salary >= 6000;

SELECT a.employee_id, a.first_name, a.job_id, b.job_id, b."급여 합계", b."인원수"
FROM employees a, (SELECT job_id, sum(salary) as "급여 합계", COUNT(*) as "인원수"
                   FROM employees
                   GROUP BY job_id) b
WHERE a.job_id = b.job_id;



-- WHERE
-- 월급의 평균보다 더 많이 받는 사원
-- 서브 쿼리 할땐 문제 파악이 중요! 먼저 무엇을 구하야 할까?를 중점으로 보자
SELECT first_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- it프로그래머에 대한 것만
SELECT first_name, job_id
FROM employees
WHERE job_id IN(SELECT job_id FROM jobs WHERE job_id = 'IT_PROG');
-- 서브쿼리는 조건이 여러개가 있을 때 따로 분리해서 쿼리를 쓸 때 사용

-- 부서별로 가장 급여를 적게 받는 사원과 같은 급여를 받는 사원
SELECT first_name, department_id, salary
FROM employees
WHERE salary IN (SELECT MIN(salary) 
                FROM employees
                GROUP BY department_id);

-- 부서별로 가장 급여를 적게 받는 사원의 정보
SELECT first_name, department_id, salary
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, MIN(salary)
                                  FROM employees
                                  GROUP BY department_id)
ORDER BY salary DESC;








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
SELECT employee_id, last_name, job_id, salary, department_id
FROM employees
WHERE (salary, job_id) IN (SELECT MIN(salary), job_id
        FROM employees
        GROUP BY job_id)
ORDER BY job_id ASC;
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
HAVING COUNT(*) IN (SELECT MAX(COUNT(*))
                    FROM employees
                    GROUP BY department_id);
-- 8) EMPLOYEES 테이블에서 사원번호가 123인 사원의 직업과 같고 사원번호가 192인
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
-- PPT 답이 으잉?
SELECT MIN(salary)
FROM employees
WHERE department_id = 50;

SELECT employee_id, last_name, job_id, hire_date, salary, department_id
FROM employees
WHERE salary > (SELECT MIN(salary)
                FROM employees
                WHERE department_id = 50)
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
ORDER BY salary ASC;
