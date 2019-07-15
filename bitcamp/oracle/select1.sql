-- (DML) SELECT, DELETE, SELECT(90%), UPDATE
-- PL : 이클립스에서 실행 안된다
SELECT * FROM EMP; -- SCOTT 계정
SELECT * FROM EMPLOYEES; -- HUMAN RESOURCE (HR) 계정
/*
SELECT 절 선택
    *  모든 (값, 문자, COLUMN, 함수, SUB QUERY)
FROM 절 테이블명, SUB QUERY
*/

SELECT 1 FROM DUAL;

-- 현재 계정의 테이블 모두 보여준다
SELECT * FROM TAB;


-- SCOTT 계정
SELECT * FROM EMP;
-- 테이블에서 원하는 COLUMN만을 보여준다
SELECT EMPNO, ENAME, SAL FROM EMP;

-- DUAL : 가상테이블
SELECT SYSDATE FROM DUAL;
SELECT 4 * 7 FROM DUAL;
SELECT 'HELLO' || 'HELLO' FROM DUAL;
-- 문자열은 작은 따옴표쓰자
SELECT ROUND(10.5) FROM DUAL;
-- 반올림

-- 이름, 월급, 월급 300달러 인상
SELECT ename, sal, sal + 300
FROM EMP;

-- 월급, 연봉
SELECT sal, sal*12
FROM EMP;

-- ALIAS int alias[] = array;   alias[0] = 12;
-- 중간에 NULL값이 들어가야할 때 쌍따옴표 쓴다 ALIAS에서 많이 쓴다
-- 월 급  에러,  "월 급"  정상작동
SELECT sal AS "월급", sal*12 AS "연봉"
FROM EMP;

-- 연결 연산자  || "ABC" + "DEF"   "ABC" || "DEF"
SELECT ename || ' has $' || sal
FROM EMP;

-- distint : 중복행(row) 삭제 --> group by
-- 전체 부서 출력
SELECT deptno FROM EMP;
-- 어떤 부서가 있는지 알고싶을 때 중복부서 삭제하면 알 수 있다
SELECT DISTINCT deptno FROM EMP;

-- DESC : 테이블의 COLUMN의 자료형 구조를 보여준다
DESC EMP;



-- 실습
-- SCOTT 계정
SELECT * FROM EMP;
-- 1) EMP 테이블에서 사원번호, 사원이름, 월급을 출력하시오
SELECT EMPNO, ENAME, SAL
FROM EMP;
-- 2) EMP 테이블에서 사원이름과 월급을 출력하는데 컬럼명은 이 름, 월 급으로
-- 바꿔서 출력하시오
SELECT ENAME AS "이  름", SAL AS "월  급"
FROM EMP;
-- 3) EMP 테이블에서 사원번호, 사원이름, 월급, 연봉을 구하고 각각 컬럼명은
-- 사원번호, 사원이름, 월급, 연봉으로 출력하시오
SELECT EMPNO AS "사원번호", ENAME AS "사원이름", SAL AS "월급", SAL*12 AS "연봉"
FROM EMP;
-- 4) EMP 테이블의 업무(JOB)를 중복되지 않게 표시하시오
SELECT DISTINCT JOB
FROM EMP;

-- HR 계정
-- 5) EMP 테이블의 사원번호, 이름, 급여, 보너스, 보너스 금액 출력
-- (참고로 보너스는 월급 + (월급*커미션))
-- NVL(컬럼명, 0) 값이 NULL이면 뒤에 값이 넣어진다
SELECT employee_id, first_name, salary, NVL(commission_pct, 0),
    NVL(salary + (salary * commission_pct), 0)
FROM EMPLOYEES;
SELECT * FROM EMPLOYEES;
-- 6) EMPLOYEES 테이블에서 LAST_NAME을 이름으로 SALARY를 급여로 출력하여라
SELECT LAST_NAME AS "이름", SALARY AS "급여"
FROM EMPLOYEES;
-- 7) EMPLOYEES 테이블에서 LAST_NAME을 Name으로 SALARY*12를
-- Annual Salary(연봉)로 출력하여라
SELECT LAST_NAME AS "Name", SALARY*12 AS "Annual Salary"
FROM EMPLOYEES;
-- 8) EMPLOYEES 테이블에서 이름과 업무를 연결하여 출력하여라
SELECT LAST_NAME || ' ' || JOB_ID AS "Employees"
FROM EMPLOYEES;
-- 9) EMPLOYEES 테이블에서 이름과 업무를 "King is a PRESIDENT" 형식으로 출력
SELECT '"' || LAST_NAME || ' is a ' || JOB_ID || '"'
FROM EMPLOYEES;
-- 10) EMPLOYEES 테이블에서 이름과 연봉을 "King: 1 Year salary = 6000" 형식으로 출력
SELECT '"' || LAST_NAME || ' : 1 Year salary = ' || SALARY || '"'
FROM EMPLOYEES;
-- 11) EMPLOYEES 테이블에서 JOB을 모두 출력하라
SELECT JOB_ID FROM EMPLOYEES;
SELECT DISTINCT JOB_ID FROM EMPLOYEES;




