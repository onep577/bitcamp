-- hr 계정
-- 7.ppt
-- 문제1) EMPLOYEES 테이블에서 부서별로 인원수, 평균 급여, 급여의 합, 최소 급여,
-- 최대 급여를 포함하는 EMP_DEPTNO 테이블을 생성하라
CREATE TABLE EMP_DEPTNO
AS
SELECT department_id AS DEPTNO, COUNT(department_id) AS E_COUNT,
    AVG(salary) AS E_ACG, SUM(salary) AS E_SUM,
    MIN(salary) AS E_MIN, MAX(salary) AS E_MAX
FROM EMPLOYEES
GROUP BY department_id;

SELECT * FROM EMP_DEPTNO;
DROP TABLE EMP_DEPTNO;
-- 문제2) EMP_DEPTNO 테이블에 ETC COLUMN을 추가하라.
-- 단, 자료형은 VARCHAR2(50) 사용하라
ALTER TABLE EMP_DEPTNO
ADD
ETC_COLUMN VARCHAR2(50);
ALTER TABLE EMP_DEPTNO
ADD
(ETC_COLUMN VARCHAR2(50));
-- 문제3) EMP_DEPTNO 테이블에 ETC COLUMN을 수정하라.
-- 자료형은 VARCHAR2(15)로 하라.
ALTER TABLE EMP_DEPTNO
MODIFY
(ETC_COLUMN VARCHAR2(15));
-- 문제4) EMP_DEPTNO 테이블에 있는 ETC을 삭제하고 확인하라.
ALTER TABLE EMP_DEPTNO
DROP
COLUMN ETC_COLUMN;
SELECT * FROM EMP_DEPTNO;
-- 문제5) 이전에 생성한 EMP_DEPTNO 테이블의 이름을 EMP_DEPT로 변경하라
RENAME EMP_DEPTNO
TO EMP_DEPT;

SELECT * FROM EMP_DEPT;
-- 문제6) EMP_DEPT 테이블을 삭제하라
DROP TABLE EMP_DEPT
CASCADE CONSTRAINTS;
-- 매우 중요!
-- 테이블을 복사하면 안에 데이터만 가져오고 무결성을 못 가져온다
-- 문제7) EMPLOYEES 테이블을 EMP 테이블을 생성하고 복제하도록 하라.(데이터 포함)
CREATE TABLE EMP
AS
SELECT *
FROM EMPLOYEES;

SELECT * FROM EMP;
-- 문제8) EMP 테이블에 row를 추가해 봅니다.
-- 다만, 반드시 데이터를 기입을 안해도 되면, NULL로 설정하도록 한다.
INSERT INTO EMP(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER,
    HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
VALUES('500','','HWANG','A@NAVER.COM','',
    TO_DATE('2019/06/24','YYYY-MM-DD'),'IT_PROG','','','','');

ROLLBACK;
-- 문제9) EMPLOYEES 테이블에서 EMPNO, ENAME, SAL, HIREDATE의 COLUMN만
-- 선택하여 EMP_10 테이블을 생성(데이터 미포함)한 후 10번 부서만 선택하여 이에
-- 대응하는 값을 EMP_10 테이블에 입력하라.
DROP TABLE EMP_10;

CREATE TABLE EMP_10(ID, NAME, SAL, HIREDATE)
AS
SELECT employee_id, first_name, salary, hire_date
FROM EMPLOYEES
WHERE 1=2;

SELECT * FROM employees WHERE department_id = 10;

INSERT INTO EMP_10
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, HIRE_DATE
FROM employees WHERE department_id = 10;

SELECT * FROM EMP_10;
-- 문제10) EMPLOYEES 테이블에서 사원 번호가 107인 사원의 부서를 10번으로 변경하여라.
SELECT department_id FROM employees WHERE employee_id = 107; -- 60

UPDATE EMPLOYEES
SET DEPARTMENT_ID = 10
WHERE employee_id = 107;

ROLLBACK;

-- 문제11) EMPLOYEES 테이블에서 사원 번호가 180인 사원의 부서를 20,
-- 급여를 3500으로 변경하여라.
SELECT * FROM employees WHERE employee_id = 180; -- 50, 3200

UPDATE employees
SET department_id = 20, salary = 3500
WHERE employee_id = 180;
-- 문제12) EMPLOYEES 테이블에서 Smith의 업무와 급여가
-- Hall의 업무와 급여와 일치하도록 수정하라.
SELECT * FROM employees WHERE last_name = 'Smith';

UPDATE employees
SET (job_id, salary) = (SELECT job_id, salary -- sa_rep, 9000
                        FROM employees
                        WHERE last_name = 'Hall')
WHERE last_name = 'Smith';







-- SCOTT 계정
-- TABLE 문제.TXT
-- 문제1) EMP 테이블에서 EMPNO,ENAME,SAL,HIREDATE의 COLUMN만 선택하여
-- EMP_10 테이블을 생성한 후 10번 부서만 선택하여 이에 대응하는 값을 EMP_10테이블에 입력하여라.
DROP TABLE EMP_10;

CREATE TABLE EMP_10(EMPNO, ENAME, SAL, HIREDATE)
AS
SELECT EMPNO, ENAME, SAL, HIREDATE
FROM EMP
WHERE 1=2;

INSERT INTO EMP_10
SELECT EMPNO, ENAME, SAL, HIREDATE
FROM EMP
WHERE DEPTNO = 10;

SELECT * FROM EMP_10;
-- 문제2) EMP 테이블에서 사원 번호가7369인 사원의 부서를 10번으로 변경하여라.
UPDATE EMP
SET DEPTNO = 10
WHERE EMPNO = 7369;

SELECT * FROM EMP;
-- 문제3) EMP 테이블에서 사원 번호가7369인 사원의 부서를 20, 급여를 3500으로 변경하여라.
UPDATE EMP
SET DEPTNO = 20, SAL = 3500
WHERE EMP_10 = 7369;

-- 문제4) EMP 테이블에서 10번 부서의 사원을 모두 30번 부서로 갱신하여라.
UPDATE EMP
SET DEPTNO = 30
WHERE DEPTNO = 10;

SELECT * FROM EMP;
-- 문제5) DEPT 테이블에서 부서 번호 10을 15로 갱신하여라.
SELECT * FROM DEPT;

UPDATE DEPT
SET DEPTNO = 15
WHERE DEPTNO = 10;
-- 문제6) EMP 테이블에서 사원번호가 7499인 사원의 정보를 삭제하여라.
SELECT * FROM EMP;

DELETE
FROM EMP
WHERE EMPNO = 7499;
-- 문제7) EMP 테이블에서 입사일자가 80년인 사원의 정보를 삭제하여라.
SELECT * FROM EMP;

DELETE EMP
WHERE TO_CHAR(HIREDATE, 'YY') = '80';

ROLLBACK;
-- 1. 아래의 구조를 만족하는 MY_DATA 테이블을 생성하시오. 단 ID가 PRIMARY KEY이다.
CREATE TABLE MY_DATE(
    ID      NUMBER(4) NOT NULL,
    NAME    VARCHAR2(10),
    USERID  VARCHAR2(30),
    SALARY  NUMBER(10,2),
    CONSTRAINT PK_MY_DATE PRIMARY KEY(ID)
);

-- 2. 1번에 의해 생성된 테이블에 아래의 값을 입력하여라.
INSERT INTO MY_DATE(ID, NAME, USERID, SALARY)
VALUES ('1', 'Scott', 'sscott', '10000');

INSERT INTO MY_DATE
VALUES ('2', 'Ford', 'fford', '13000');

INSERT INTO MY_DATE
VALUES ('3', 'Patel', 'ppatel', '33000');

INSERT INTO MY_DATE
VALUES ('4', 'Good', 'ggood', '44450');

SELECT * FROM MY_DATE;
-- 3. ID가 3번인 사람의 급여를 65,000.00으로 갱신하고 영구적으로 데이터베이스에 반영하여라.
UPDATE MY_DATE
SET SALARY = 65000
WHERE ID = '3';

SELECT * FROM MY_DATE;

COMMIT;
-- 4. 이름이 Ford인 사원을 영구 제명하여라.
DELETE
FROM MY_DATE
WHERE NAME = 'Ford';

SELECT * FROM MY_DATE;

COMMIT;
-- 5. 급여가 15,000이하인 사람의 급여를 15,000로 변경하여라.
UPDATE MY_DATE
SET SALARY = 15000
WHERE SALARY < 15000;

-- 6. 1번에서 생성한 테이블을 삭제하여라.
DROP TABLE MY_DATE;







