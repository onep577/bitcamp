--오라클 11g hr계정 연습문제

--1. 직책(Job Title)이 Sales Manager인 사원들의 입사년도와 입사년도(hire_date)별 평균 급여를 출력하시오. 
--   출력 시 년도를 기준으로 오름차순 정렬하시오. 



--2. 각 도시(city)에 있는 모든 부서 직원들의 평균급여를 조회하고자 한다. 
--   평균급여가 가장 낮은 도시부터 도시명(city)과 평균연봉, 해당 도시의 직원수를 출력하시오. 
--   단, 도시에 근무하는 직원이 10명 이상인 곳은 제외하고 조회하시오.



--3. ‘Public  Accountant’의 직책(job_title)으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력하시오. 
--   (현재 ‘Public Accountant’의 직책(job_title)으로 근무하는 사원은 고려 하지 않는다.)      
--   이름은 first_name, last_name을 아래의 실행결과와 같이 출력한다.



--o4. 자신의 매니저보다 연봉(salary)를 많이 받는 직원들의 성(last_name)과 연봉(salary)를 출력하시오. 
SELECT a.last_name, a.salary
FROM employees a, employees b
WHERE a.employee_id = b.manager_id
    AND a.salary > b.salary;

--x - 부서명을 부서번호로 풀었다
--5. 2007년에 입사(hire_date)한 직원들의 사번(employee_id), 이름(first_name), 성(last_name), 
--   부서명(department_name)을 조회합니다.  
--   이때, 부서에 배치되지 않은 직원의 경우, ‘<Not Assigned>’로 출력하시오. 
SELECT a.employee_id, a.first_name, a.last_name, a.hire_date, b.department_name,
    NVL(TO_CHAR(a.department_id), '<Not Assigned>') AS "부서배치"
FROM employees a, departments b
WHERE a.department_id = b.department_id(+)
    AND a.hire_date LIKE ('07%');
 
--o6. 업무명(job_title)이 ‘Sales Representative’인 직원 중에서 연봉(salary)이 9,000이상, 10,000 이하인 
--   직원들의 이름(first_name), 성(last_name)과 연봉(salary)를 출력하시오
SELECT first_name, last_name, salary
FROM
    (   SELECT *
        FROM jobs j, employees e
        WHERE j.job_id = e.job_id
            AND j.job_title = ('Sales Representative') )
WHERE salary BETWEEN 9000 AND 10000;

-- 강사님 코드
SELECT e.FIRST_NAME, e.LAST_NAME, e.SALARY
FROM EMPLOYEES e, JOBS j
WHERE e.JOB_ID = j.JOB_ID 
	AND (e.SALARY BETWEEN 9000 AND 10000) 
	AND (j.JOB_TITLE = 'Sales Representative');

--o7. 부서별로 가장 적은 급여를 받고 있는 직원의 이름, 부서이름, 급여를 출력하시오. 
--   이름은 last_name만 출력하며, 부서이름으로 오름차순 정렬하고, 
--   부서가 같은 경우 이름을 기준 으로 오름차순 정렬하여 출력합니다.
SELECT last_name, department_name, e.department_id, salary
FROM employees e, departments d
WHERE e.department_id = d.department_id
    AND (salary, e.department_id) IN (  SELECT MIN(salary), department_id
                                        FROM employees
                                        GROUP BY department_id)
ORDER BY d.department_name ASC, e.last_name ASC;

--o8. EMPLOYEES 테이블에서 급여를 많이 받는 순서대로 조회했을 때 결과처럼 6번째부터 10 번째까지 
--   5명의 last_name, first_name, salary를 조회하는 sql문장을 작성하시오.
SELECT ROW_NUMBER()OVER(ORDER BY salary DESC) AS ROW_NUMBER, last_name, first_name, salary
FROM employees;

SELECT *
FROM 
    (SELECT ROW_NUMBER()OVER(ORDER BY salary DESC) AS ROW_NUMBER,
        last_name, first_name, salary
    FROM employees)
WHERE ROW_NUMBER BETWEEN 6 AND 10;

-- 강사님 코드
SELECT *
FROM
       (
       SELECT RANK() OVER (ORDER BY TRUNC(SALARY, -1) DESC) AS RANKING, LAST_NAME, 
               FIRST_NAME, TRUNC(SALARY, -1) AS SALARY
       FROM EMPLOYEES 
       ORDER BY SALARY DESC
       )
WHERE RANKING BETWEEN 6 AND 10;

--o9. 사원의 부서가 속한 도시(city)가 ‘Seattle’인 사원의 이름, 해당 사원의 매니저 이름, 사원의 부서이름을 출력하시오. 
--   이때 사원의 매니저가 없을 경우 ‘<없음>’이라고 출력하시오. 이름은 last_name만 출력하며, 
--   사원의 이름을 오름차순으로 정렬하시오.
SELECT e.last_name, NVL(TO_CHAR(e.manager_id), '<없음>'), b.last_name, d.department_name
FROM employees e, employees b, departments d, locations o
WHERE e.department_id = d.department_id 
    AND d.location_id = o.location_id
    AND e.manager_id = b.employee_id(+)
    AND o.city = 'Seattle'
ORDER BY e.last_name ASC;

-- 강사님 코드
SELECT E.E_NAME, NVL(E.M_NAME, '<없음>'), D.DEPARTMENT_NAME
FROM 
      (
       SELECT 
              A.LAST_NAME AS E_NAME, B.LAST_NAME AS M_NAME, A.DEPARTMENT_ID 
       FROM EMPLOYEES A LEFT JOIN EMPLOYEES B 
           ON A.MANAGER_ID = B.EMPLOYEE_ID
      ) E, DEPARTMENTS D, LOCATIONS L
WHERE L.CITY = 'Seattle' 
	AND E.DEPARTMENT_ID = D.DEPARTMENT_ID 
		AND D.LOCATION_ID = L.LOCATION_ID
ORDER BY E.E_NAME ASC;

-- x
--10. 각 업무(job) 별로 연봉(salary)의 총합을 구하고자 한다. 연봉 총합이 가장 높은 업무부터 
--    업무명(job_title)과 연봉 총합을 조회하시오. 단 연봉총합이 30,000보다 큰 업무만 출력하시오.
SELECT ROWNUM AS RUM, job_id, SUM(salary)
    FROM employees
    GROUP BY job_id;            
SELECT ROW_NUMBER()OVER(PARTITION BY MAX(salary) ORDER BY MAX(salary))
FROM employees;

-- xx
--11. 각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 업무명(job_title), 
--    부서 명(department_name)을 조회하시오. 
--    단 도시명(city)이 ‘Seattle’인 지역(location)의 부서 (department)에 근무하는 직원을 사원번호 오름차순으로 출력하시오.


-- xx
--12. 2001~20003년사이에 입사한 직원의 이름(first_name), 입사일(hire_date), 관리자사번 (employee_id), 
--    관리자 이름(fist_name)을 조회합니다. 단, 관리자가 없는 사원정보도 출력 결과에 포함시켜 출력한다.

-- xx
--13. ‘Sales’ 부서에 속한 직원의 이름(first_name), 급여(salary), 부서이름(department_name)을 조회하시오. 
--    단, 급여는 100번 부서의 평균보다 적게 받는 직원 정보만 출력되어야 한다. 


-- o 강사님 코드가 더 좋다
--14. Employees 테이블에서 입사한달(hire_date)별로 인원수를 조회하시오.
SELECT SUBSTR(hire_date, 4, 2) AS "월별", COUNT(*)
FROM employees
GROUP by SUBSTR(hire_date, 4, 2)
ORDER BY 월별;

-- 강사님 코드
SELECT CONCAT(TO_CHAR(E.HIRE_DATE, 'MM'), '월') AS HIRE_DATE, COUNT(*)
FROM EMPLOYEES E
GROUP BY TO_CHAR(E.HIRE_DATE, 'MM')
ORDER BY TO_CHAR(E.HIRE_DATE, 'MM') ASC;  

-- X 부서별인데 부서가 NULL값인 부서도 조회했다
-- 사원 테이블과 부서테이블을 조인하여 NULL값이 있는 부서번호가 아닌 부서명으로 그룹하면 정답
--15. 부서별 직원들의 최대, 최소, 평균급여를 조회하되, 
--    평균급여가 ‘IT’ 부서의 평균급여보다 많고, ‘Sales’ 부서의 평균보다 적은 부서 정보만 출력하시오. 
SELECT department_id, MAX(salary), MIN(salary), ROUND(AVG(salary))
FROM employees
GROUP BY department_id
HAVING AVG(salary) > (  SELECT AVG(salary)
                        FROM employees e, departments d
                        WHERE e.department_id = d.department_id
                        AND d.department_name = ('IT'))
    AND AVG(salary) < ( SELECT AVG(salary)
                        FROM employees e, departments d
                        WHERE e.department_id = d.department_id
                        AND d.department_name = ('Sales'));

SELECT AVG(salary)
FROM employees e, departments d
WHERE e.department_id = d.department_id
    AND d.department_name = ('IT');
-- ‘IT’ 부서 평균급여 5760

SELECT AVG(salary)
FROM employees e, departments d
WHERE e.department_id = d.department_id
    AND d.department_name = ('Sales');
-- ‘Sales’ 부서 평균급여 8955.8


-- 강사님 코드
SELECT D.DEPARTMENT_NAME, MAX(E.SALARY), MIN(E.SALARY), TRUNC(AVG(E.SALARY), 0)
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
HAVING TRUNC(AVG(E.SALARY), 0) > (
                                  SELECT  TRUNC(AVG(E.SALARY), 0)
                                  FROM EMPLOYEES E, DEPARTMENTS D
                                  WHERE D.DEPARTMENT_NAME = 'IT' 
                                  AND D.DEPARTMENT_ID = E.DEPARTMENT_ID
                                   )
   	AND  TRUNC(AVG(E.SALARY), 0) < (
                                   SELECT TRUNC(AVG(E.SALARY), 0)
                                   FROM EMPLOYEES E, DEPARTMENTS D
                                   WHERE D.DEPARTMENT_NAME = 'Sales' 
                                   AND D.DEPARTMENT_ID = E.DEPARTMENT_ID);

-- X
--16. 각 부서별로 직원이 한명만 있는 부서만 조회하시오. 
--    단, 직원이 없는 부서에 대해서는 ‘<신생부서>’라는 문자열이 출력되도록 하고,
--    출력결과는 다음과 같이 부서명이 내림차순 으로 정렬되어야한다.

SELECT department_id
FROM employees
GROUP BY department_id

HAVING COUNT(department_id) = 0
     
ORDER BY department_name DESC;

-- X
--17. 부서별 입사월별 직원수를 출력하시오. 
--    단, 직원수가 5명 이상인 부서만 출력되어야 하며 출력결과는 부서이름 순으로 한다.
SELECT *
FROM employees;

SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id;

SELECT employee_id, last_name, department_id, COUNT(*)OVER(PARTITION BY department_id)
FROM employees;



-- XX
--18. 국가(country_name) 별 도시(city)별 직원수를 조회하시오. 
--    단, 부서에 속해있지 않은 직원 이 있기 때문에 106명의 직원만 출력이 된다. 
--    부서정보가 없는 직원은 국가명과 도시명 대신에 ‘<부서없음>’이 출력되도록 하여 107명 모두 출력되게 한다.


-- 
--19. 각 부서별 최대 급여자의 아이디(employee_id), 이름(first_name), 급여(salary)를 출력하시오. 
--    단, 최대 급여자가 속한 부서의 평균급여를 마지막으로 출력하여 평균급여와 비교할 수 있게 할 것.
SELECT employee_id, first_name, salary, department_id
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, MAX(salary)
        FROM employees
        WHERE department_id IS NOT NULL
        GROUP BY department_id);


SELECT employee_id, first_name, salary
FROM 
    (SELECT department_id
    FROM
        (SELECT department_id, MAX(salary)
        FROM employees
        WHERE department_id IS NOT NULL
        GROUP BY department_id)
    );

--20. 커미션(commission_pct)별 직원수를 조회하시오. 
--    커미션은 아래실행결과처럼 0.2, 0.25는 모두 .2로, 0.3, 0.35는 .3 형태로 출력되어야 한다. 
--    단, 커미션 정보가 없는 직원들도 있는 데 커미션이 없는 직원 그룹은 ‘<커미션 없음>’이 출력되게 한다.
SELECT commission_pct, NVL(TO_CHAR(TRUNC(commission_pct, 1)), '<커미션 없음>')
FROM employees
GROUP BY commission_pct;

--21. 커미션(commission_pct)을 가장 많이 받은 상위 4명의
--    부서명(department_name), 직원명 (first_name), 급여(salary), 커미션(commission_pct) 정보를 조회하시오. 
--    출력결과는 커미션 을 많이 받는 순서로 출력하되 동일한 커미션에 대해서는 급여가 높은 직원이 먼저 출력 되게 한다.
SELECT *
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY commission_pct DESC;

SELECT ROWNUM AS RUM, first_name, salary, commission_pct, department_id
    FROM 
        (SELECT *
        FROM employees
        WHERE commission_pct IS NOT NULL
        ORDER BY commission_pct DESC);

SELECT d.department_name, e.first_name, e.salary, e.commission_pct
FROM departments d,
    (SELECT ROWNUM AS RUM, first_name, salary, commission_pct, department_id
    FROM 
        (SELECT *
        FROM employees
        WHERE commission_pct IS NOT NULL
        ORDER BY commission_pct DESC)
    ) e
WHERE e.department_id = d.department_id
    AND RUM <= 4
ORDER BY salary DESC;















