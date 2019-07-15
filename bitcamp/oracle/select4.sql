-- 대문자 UPPER( 문자열 )     abcDEF
-- 소문자 LOWER( 문자열 )

-- 문자열을 합하는 기능
SELECT first_name || ' ' || last_name
FROM employees;

-- concat
SELECT concat(first_name, last_name)
FROM employees;

-- months_between : 두 날짜간의 월수(월 간격)
SELECT MONTHS_BETWEEN('2019-11-13', '2019-01-05')
FROM dual;

-- add_months : 특정 날짜의 월에 정수의 더한 다음 해당 날짜를 반환
SELECT add_months('2019-06-02', 8)
FROM dual;

-- extract() : 날짜 정보에서 특정한 연도, 월, 일, 시, 분, 초를 추출
SELECT systimestamp,
    EXTRACT(year from sysdate) AS 년,
    EXTRACT(month from sysdate) AS 월,
    EXTRACT(day from sysdate) AS 일,
    EXTRACT(HOUR   from CAST (SYSDATE AS TIMESTAMP)) AS 시,
    EXTRACT(minute from CAST (SYSDATE AS TIMESTAMP)) AS 분,
    EXTRACT(second from CAST (SYSDATE AS TIMESTAMP)) AS 초
FROM dual;


/*
NVL함수는 많이 사용된다
NVL(대상이 되는 컬럼, 0)           컬럼의 자료형 : NUMBER
-- 대상이 되는 컬럼이 NULL이면 0을 내보낸다 NULL이 아니면 컬럼값을 내보낸다

NVL(대상이 되는 컬럼, '없음')       컬럼의 자료형 : VARCHAR2
-- 대상이 되는 컬럼이 NULL이면 '없음'을 내보낸다 NULL이 아니면 컬럼값을 내보낸다

NVL2(대상이 되는 컬럼, 1, 0)
-- 대상이 되는 컬럼 NULL 아니면 1 NULL이면 0을 내보낸다
*/

SELECT first_name, NVL(commission_pct, 0)
FROM employees;

SELECT first_name, NVL2(commission_pct, '있음', '없음')
FROM employees;




-- 그룹으로 묶는 기능
-- job_id(업무), department_id(부서)
-- 중복행을 제거
SELECT DISTINCT department_id
FROM employees
ORDER BY department_id ASC;

-- GROUP BY절
-- GROUP BY로 묶였을때는 그룹으로 묶인 컬럼만 실행할 수 있다
--SELECT department_id, first_name -- 에러
SELECT department_id
FROM employees
GROUP BY department_id
ORDER BY department_id ASC;

/*
GROUP 함수
COUNT
SUM
AVG
MAX
MIN
*/
SELECT *
FROM employees
WHERE job_id = 'IT_PROG';

SELECT 
    COUNT(salary), COUNT(*), SUM(salary), AVG(salary),
    SUM(salary)/COUNT(*)
FROM employees
WHERE job_id = 'IT_PROG';
-- IT_PROG 5명있다
-- 5명 월급의 합계
-- 5명 월급의 평균의 합계


SELECT *
FROM employees
ORDER BY department_id ASC;

-- SELECT뒤에 올 수 있는 것은 묶은 컬럼과 그룹함수 뿐이다
-- department_id가 중복되지않게 오름차순으로 나온다
SELECT department_id, SUM(salary), MAX(salary), Round(AVG(salary))
FROM employees
GROUP BY department_id
ORDER BY department_id ASC;

-- 두가지 묶을 수 있다
-- department_id = 30에 job_id가 pu_MAN 4개, pu_CLERK 2개가 있다면
-- pu_MAN, pu_CLERK 각각 한번씩만 나온다
SELECT department_id, job_id
FROM employees
GROUP BY department_id, job_id;

-- GROUP BY
-- 조건절 HAVING -- 단독사용 불가, 그룹바이와 같이 쓰는 식구
-- job_id가 같은 사원들의 월급 합계 중 30000이상인 경우
SELECT job_id, SUM(salary)
FROM employees
GROUP BY job_id
HAVING SUM(salary) >= 30000
ORDER BY SUM(salary) DESC;

SELECT * FROM employees;
-- 월급이 5000불이 넘는 사원 중 월급의 합계가 20000불이 넘을 때

SELECT job_id
    , COUNT(*)
    -- 월급이 5000 넘는 사원들
    , SUM(salary)
--    , Trunc(AVG(salary))
FROM employees
WHERE salary > 5000
-- 조건을 먼저 주었다
GROUP BY job_id
HAVING SUM(salary) > 20000;

