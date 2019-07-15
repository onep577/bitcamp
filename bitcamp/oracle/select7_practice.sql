-- 33) 각 사원의 이름을 표시하고 근무 달 수(입사일로부터 현재까지의 달수)를 계산하여
-- 열 레이블을 MONTHS_WORKED로 지정하시오. 결과는 정수로 반올림하여 표시하고 근무달 수를
-- 기준으로 오름차순으로 정렬하시오.(MONTHS_BETWEEN 함수 참고)
SELECT ename, round(MONTHS_BETWEEN(sysdate, hiredate)) as "MONTHS_WORKED"
FROM emp
ORDER BY round(MONTHS_BETWEEN(sysdate, hiredate)) ASC;

-- 34)emp테이블에서 이름, 업무, 근무연차를 출력하시오.
SELECT ename, job, hiredate,
     CASE SUBSTR(hiredate, 1, 2)
        WHEN '80' THEN '40년차'
        WHEN '81' THEN '39년차'
        WHEN '82' THEN '38년차'
    END AS "근무연차"
FROM emp;

SELECT ename, job, trunc(MONTHS_BETWEEN(sysdate, hiredate) / 12) as "근무연차"
from emp;
-- 35)emp테이블에서 사원이름, 월급, 월급과 커미션을 더한 값을 컬럼명 실급여라고 해서 출력.
-- 단, NULL값은 나타나지 않게 작성하시오.
SELECT ename, sal, NVL(comm, 0), sal+NVL(comm, 0) "실급여"
FROM emp;

-- 36)월급과 커미션을 합친 금액이 2,000이상인 급여를 받는 사원의 이름,업무,월급,커미션,고용날짜
-- 를 출력하시오. 단, 고용날짜는 1980-12-17 형태로 출력하시오.
SELECT ename, job, sal, NVL(comm, 0), 
    to_char(hiredate, 'YY-MM-DD'), sal+NVL(comm, 0)
FROM emp
WHERE (sal+NVL(comm, 0)) >= 2000;

-- 37)DECODE 또는 CASE WHEN THEN 함수를 사용하여 다음 데이터에 따라 JOB열의 값을 기준으로
-- 모든 사원의 등급을 표시하시오.
-- 업무        등급
-- PRESIDENT   A
-- ANALYST     B
-- MANAGER     C
-- SALESMAN    D
-- CLERK       E
-- 기타         0

SELECT ename, job,
    CASE job
        WHEN 'PRESIDENT' THEN 'A'
        WHEN 'ANALYST' THEN 'B'
        WHEN 'MANAGER' THEN 'C'
        WHEN 'SALESMAN' THEN 'D'
        WHEN 'CLERK' THEN 'E'
        ELSE '0'
    END AS "등급"
FROM emp;




-- (HR 계정)

-- 1. 가장 최근 입사한 사원순으로 작성해서 1 ~ 10번째 사원의 정보를 출력하시오.
SELECT *
FROM
    (SELECT rownum as rnum,     -- 2.번호를 붙인다
        employee_id, first_name, hire_date
    FROM
        (SELECT *               -- 1.DATE 설정
        FROM employees
        ORDER BY hire_date DESC)
    )
WHERE rnum > 1 AND rnum <= 10; -- 3.범위 설정

-- 2. 급여순으로 작성해서 11 ~ 20 사원의 정보를 출력하시오.
SELECT *
FROM
    (SELECT rownum as rnum,     -- 2.번호를 붙인다
        employee_id, first_name, salary
    FROM
        (SELECT *               -- 1.DATE 설정
        FROM employees
        ORDER BY salary DESC)
    )
WHERE rnum > 10 AND rnum <= 20; -- 3.범위 설정

-- 3. 입사한 순서대로 번호를 할당하고, JOB_ID가 IT_PROG이며, 05년도에 입사한 사원을 3명만 출력하라
SELECT employee_id, first_name, job_id, hire_date
FROM
    (SELECT ROW_NUMBER()OVER(PARTITION BY SUBSTR(hire_date,1,2) ORDER BY hire_date ASC) AS "RN",
        employee_id, first_name, job_id, hire_date
    FROM employees
    WHERE job_id = 'IT_PROG'
        AND SUBSTR(hire_date,1,2) = '05')
WHERE RN BETWEEN 1 AND 3;










