-- 특수 query
-- CASE, DECODE
SELECT employee_id, first_name, phone_number,
    CASE SUBSTR(phone_number, 1, 3)
    -- phone_number 1번째부터 3개의 문자가져왔을 때 나오는 데이터가 515이면 서울 출력
        WHEN '515' THEN '서울'
        WHEN '590' THEN '부산'
        WHEN '659' THEN '광주'
        WHEN '603' THEN '대전'
        ELSE '기타'
    END AS "지역"
FROM employees;

SELECT employee_id, first_name, phone_number,
    CASE
        WHEN SUBSTR(phone_number, 1, 3) = '515' THEN '서울'
        WHEN SUBSTR(phone_number, 1, 3) = '590' THEN '부산'
        WHEN SUBSTR(phone_number, 1, 3) = '659' THEN '광주'
        WHEN SUBSTR(phone_number, 1, 3) = '603' THEN '대전'
        ELSE '기타'
    END AS "지역"
FROM employees;


-- DECODE
SELECT employee_id, first_name, phone_number,
    DECODE( SUBSTR(phone_number, 1, 3),
            '515', '서울',
            '590', '부산',
            '659', '광주',
            '603', '대전',
            '기타') AS "지역"
FROM employees;




-- 게시판에서 목록열기 할 때 5줄 보기 or 10개 보기를 선택했을 때 5개 or 10개씩 잘라서 가져와야한다
-- 전체를 list로 가져와서 자르면 자바가 힘들다 db에서 잘라 가져올 때 쓴다
-- 컬럼에서 자유롭게 보도록 묶는 함수
-- OVER( ) PARTITION BY ORDER BY
-- 월급 RANK 1 ~ 5

--SELECT job_id, COUNT(*)
SELECT job_id, salary, COUNT(*)OVER(PARTITION BY job_id ORDER BY salary DESC)
-- COUNT에 해당되는 것으로 묶어라. 그룹으로 job_id 묶고 salary 순번으로 출력
-- job_id로 묶고 그 안에서 salary을 역순으로 순번
FROM employees;

SELECT job_id, COUNT(*)OVER()
-- employees 테이블을 전부 다 카운트한 숫자
FROM employees;

SELECT job_id, COUNT(*)OVER(PARTITION by job_id)    -- 그룹단위로 나누어 카운트
FROM employees;

-- salary로 복습
-- MAX
-- MIN
-- SUM
-- AVG





-- 분석함수 많이 사용한다
-- 순위 rank
-- RANK()               1 2 3 3 5 6
-- DENSE_RANK()         1 2 3 3 4 5
-- ROW_NUMBER()         1 2 3 4 5 6
-- ROWNUM

--SELECT first_name, salary, RANK()
-- RANK도 그룹함수라서 에러 OVER를 써야한다
--SELECT first_name, salary, RANK()OVER 에러
SELECT first_name, salary,
    RANK()OVER(ORDER BY salary DESC) AS RANK,
    DENSE_RANK()OVER(ORDER BY salary DESC) AS DENSE_RANK,
    ROW_NUMBER()OVER(ORDER BY salary DESC) AS ROW_NUMBER   
FROM employees
ORDER BY salary DESC;

-- 10명의 데이터만을 산출하는 경우 !!! 매우 중요 !!!
SELECT ROWNUM, employee_id, first_name, salary
FROM employees
WHERE ROWNUM <= 10;

-- ROWNUM이 붙여진 다음에 범위를 찾아야하는데 반대 순서여서 아무것도 안나온다
SELECT ROWNUM, employee_id, first_name, salary  --2
FROM employees
WHERE ROWNUM >= 11 AND ROWNUM <= 20;            --1

-- 1. DATA의 설정
-- 2. ROWNUM 완성
-- 3. 범위를 설정
SELECT RNUM, employee_id, first_name, salary
FROM
    (SELECT ROWNUM AS RNUM, -- ROWNUM 완성
        employee_id, first_name, salary
    FROM
        (SELECT employee_id, first_name, salary -- 1. DATA의 설정
        FROM employees)
    )
WHERE RNUM > 10 AND RNUM <= 20; -- 범위를 설정





