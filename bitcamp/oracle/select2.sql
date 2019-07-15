-- WHERE == if문 == 조건절
/*
    표현식
    비교 연산자( =, >, <, !=, >=, <=, <> )  <> 같지않다 != 이다
    NULL, = NULL(틀린문법) IS NULL(=NULL), IS NOT NULL(!=NULL)
    (), NOT, AND(&&), OR(||)
    
    SELECT
    FROM
    WHERE 조건절
*/

-- first_name이 Julia인 사원을 찾아라
SELECT first_name, last_name, salary
FROM employees
WHERE first_name = 'Julia';

-- 급여가 $9000이상인 사원
SELECT first_name, last_name, salary
FROM employees
WHERE salary >= 9000;

-- 이름이 Shanta보다 큰 이름
SELECT first_name, last_name, salary
FROM employees
WHERE first_name >= 'Shanta';
-- 이름의 첫글자가 S인 사원이 또 있으면 h로 다시 비교한다
-- S는 83이다 84 ~ 90 즉, 대문자 T ~ Z가 이름의 첫글자인 사원들이 출력

SELECT first_name, last_name, salary
FROM employees
WHERE first_name >= 'a';
-- a는 97이여서 아무것도 출력되지 않는다 왜? 이름은 대문자로 시작한다
-- 대문자의 아스키코드는 65 ~ 90이다. 97보다 작기 때문이다

SELECT first_name, manager_id
FROM employees
WHERE manager_id = '';
-- ''; NULL이 아니라 빈 문자이다. 아무것도 출력되지 않는다

SELECT first_name, manager_id
FROM employees
WHERE manager_id IS NULL;
-- 매니저 아이디가 없는 유인한 사람 사장인 STEVEN만 나온다

SELECT first_name, manager_id
FROM employees
WHERE manager_id IS NOT NULL;
-- 사장인 STEVEN빼고 모두 출력


-- AND
SELECT first_name, last_name, salary
FROM employees
WHERE first_name = 'Shanta' AND first_name = 'John';
-- 아무도 나오지 않는다
-- OR
SELECT first_name, last_name, salary
FROM employees
WHERE first_name = 'Shanta' OR first_name = 'John';
-- SHANTA와 JOHN이 모두 출력

-- 이름 John, 급여가 5000이상
SELECT first_name, last_name, salary
FROM employees
WHERE first_name = 'John' AND salary > 5000;
-- 이름이 JOHN인 사람을 먼저 검색 3명출력, 그 후 5000이상 같이 검색 2명 출력
-- 간단한 조건을 먼저 검색 후 모든 조건 같이 검색 왜? 조건문 실수할 수 있으니까

-- 2007년 12월 31일 이후에 입사한 사원을 출력하라
SELECT first_name, hire_date
FROM employees
-- WHERE hire_date > '07/12/31'; -- TO_DATE(
WHERE hire_date > TO_DATE('071231', 'YYMMDD'); -- TO_MONTH
-- DATE와 비교할 땐 TO_DATE를 많이 사용한다


-- ALL(AND), ANY(OR)
-- 한꺼번에 값을 넣고 사용할 때 편리하다
SELECT first_name, salary
FROM employees
WHERE first_name = ALL('Julia', 'John');
-- first_name = 'Julia' AND first_name = 'John'
-- 이름이 두개인 사람을 찾는 문법은 말이 안되지만 ALL, ANY의 비교하기 위해 씀

SELECT first_name, salary
FROM employees
WHERE first_name = ANY('Julia', 'John');
-- first_name = 'Julia' OR first_name = 'John'

SELECT first_name, salary
FROM employees
WHERE salary = ANY(8000, 3200, 6000);


-- IN, NOT IN
SELECT first_name, salary
FROM employees
WHERE salary IN(8000, 3200, 6000);

SELECT first_name, salary
FROM employees
WHERE salary NOT IN(8000, 3200, 6000);
-- 8000, 3200, 6000을 제외한 나머지 사원들이 나온다

SELECT first_name, salary
FROM employees
WHERE first_name IN('Julia', 'John');
-- Julia와 John 두사람만 출력
SELECT first_name, salary
FROM employees
WHERE first_name NOT IN('Julia', 'John');
-- Julia와 John 두사람을 제외하고 모두 출력


-- exists
SELECT first_name, job_id
FROM employees e
WHERE EXISTS(   SELECT 1
                FROM dual
                WHERE e.job_id = 'IT_PROG' );
-- select 1 1은 참이다
-- employees 테이블에 job_id 컬럼에 IT_PROG 직업이 있으면 참(1)을 보낸다

-- BETWEEN 범위 연산자
/*
SALARY >= 3200 AND SALARY <= 9000
SALARY BETWEEN 3200 AND 9000
*/
SELECT first_name, salary
FROM employeeS
WHERE SALARY BETWEEN 3200 AND 9000;
-- WHERE SALARY >= 3200 AND SALARY <= 9000

SELECT first_name, salary
FROM employeeS
WHERE SALARY NOT BETWEEN 3200 AND 9000;
-- WHERE SALARY < 3200 OR SALARY > 9000
-- BETWEEN AND 이다 OR로 바꾸면 안된다


-- LIKE
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'G_ra_d';
-- _는 한문자

-- 매우 중요!
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'K%y'; -- % 글자수의 제한이 없다

SELECT first_name
FROM employees
WHERE first_name LIKE '%Al%';
-- Al가 들어간 위치와는 상관없이 Al가 들어있으면 무조건 찾기

-- 2006년도에 입사한 사원
SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '06/01%';

