/*
    view : 가상 테이블
    실제 저장되는 것은 아니다(view) --> pointer

    뷰를 통해 다른 곳에 접근
    창문을 닫고 각각의 테이블을 즉, 데이터를 보게끔만 할 수도 있다
    
    int *p;
    int number;
    p = &number;
    한개의 View로 여러개의 테이블의 데이터를 검색하는 것이 가능하다.
    
    속도가 빠르다.
    제한을 설정할 수 있다 --> readonly
*/

CREATE VIEW UB_TEST_01(
    JOB_ID,
    JOB_TITLE,
    MIN_SALARY
)
AS
SELECT job_id, job_title, min_salary
FROM jobs;

SELECT * FROM UB_TEST_01;
-- VIEW를 통해 JOBS 테이블을 보는 것이다. 유리창을 통해 안을 본다

INSERT INTO ub_test_01
VALUES('DEVELOPER', '개발자', 1000);
-- VIEW에 넣는 것처럼 보이지만 VIEW를 통해 JOBS 테이블에 넣는다
-- VIEW는 실존하는 테이블이 아니다

SELECT * FROM jobs;

ROLLBACK;   -- 데이터 되돌리기
COMMIT;     -- 데이터 넣기



/*
무결성 : CONSTRAINT
PRIMARY KEY 기본키     UNIQUE KEY + NOT NULL
UNIQUE KEY  고유키     하나밖에 없는 + NULL 허용
NOT NULL              NULL을 허용하지 않는다
CHECK                 지정한 값이나 범위안의 값 이외에 NULL을 허용
FOREIGN               1.TABLE, 2.TABLE 연결 NULL 허용
*/
CREATE TABLE TB_TEST_02(
    KEY_01 VARCHAR2(10),
    KEY_02 VARCHAR2(10),
    COL_01 VARCHAR2(20),
    COL_02 VARCHAR2(20),
    CONSTRAINT PK_TEST_02 PRIMARY KEY(KEY_01, KEY_02)
);

CREATE OR REPLACE VIEW UB_TEST_02(
    KEY_01,
    KEY_02,
    COL_01,
    CONSTRAINT PK_UB_TEST_02 PRIMARY KEY(KEY_01, KEY_02)
        DISABLE NOVALIDATE
        -- VIEW에서 PRIMARY KEY 쓸 때 해야한다
)
AS
SELECT KEY_01, KEY_02, COL_01
FROM TB_TEST_02;

SELECT * FROM TB_TEST_02;
SELECT * FROM UB_TEST_02;

INSERT INTO UB_TEST_02(KEY_01, KEY_02, COL_01)
VALUES('AAA', 'aaa', '111');

-- 위에는 AAA aaa이고 밑에는 AAA AAA이다
-- AAA AAA는 한 쌍으로 보자
INSERT INTO UB_TEST_02(KEY_01, KEY_02, COL_01)
VALUES('AAA', 'AAA', '111');

-- PRIMARY KEY는 NULL값 허용하지 않는다
-- 에러 cannot insert NULL into ("HR"."TB_TEST_02"."KEY_02")
INSERT INTO UB_TEST_02(KEY_01, KEY_02, COL_01)
VALUES('AAA', '', '111');





-- READ ONLY
-- EMPLOYEES
CREATE OR REPLACE VIEW EMP_VIEW(
    "사원번호",
    "성",
    "이메일",
    "입사일",
    "업무",
    CONSTRAINT PK_UB_EMP PRIMARY KEY("사원번호") DISABLE NOVALIDATE
    -- PK_UB_EMP 즉, 아이디 값을 다른 테이블과 같으면 테이블 생성 안된다
    -- VIEW 명칭을 따라가는 게 좋은 방법
)
AS
SELECT employee_id, last_name, email, hire_date, job_id
FROM EMPLOYEES
WITH READ ONLY;
-- READ ONLY는 데이터를 바꾸는 건 불가능하다. 데이터를 볼 수만 있다.

SELECT * FROM EMP_VIEW;

-- 에러 : cannot perform a DML operation on a read-only view
INSERT INTO EMP_VIEW
VALUES(300, 'KIM', 'KIM@NAVER.COM', SYSDATE, 'iT_PROG');






-- 두개의 테이블에 있는 데이터들을 VIEW를 통해서 한꺼번에 취득 가능하다.
-- OR REPLACE 옵션이니까 빼도 된다
CREATE OR REPLACE VIEW DEPT_EMP_VIEW
AS
SELECT e.employee_id, e.first_name, d.department_name, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id
WITH READ ONLY;

SELECT * FROM DEPT_EMP_VIEW;


