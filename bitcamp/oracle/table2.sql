/*
무결성 : 컬럼에 지정하는 성질
-- PRIMARY KEY : 기본키, NULL을 허용하지 않음. 중복을 허용하지 않음. ID, 주민번호
-- UNIQUE KEY : 고유키, NULL을 허용. 중복을 허용하지 않음. E-MAIL
-- CHECK : 범위 설정. 선택 값을 설정. NULL을 허용.
-- FOREIGN KEY : 외래키. 다른 테이블에서 PRIMARY KEY이거나 UNIQUE KEY일 가능성이 있다.
                 테이블과 테이블을 연결해 주는 목적을 갖고 있다.
-- NOT NULL : NULL을 허용하지 않는다.
*/

DROP TABLE TB_TEST;

CREATE TABLE TB_TEST(
    COL_01 VARCHAR2(10) NOT NULL,
    COL_02 VARCHAR2(10)
);

INSERT INTO TB_TEST(COL_01, COL_02)
VALUES('AAA', 'aaa');

-- NOT NULL을 지정 안했기 때문에 NULL값이 가능하다
INSERT INTO TB_TEST(COL_01, COL_02)
VALUES('BBB', '');

-- 무결성 에러 : cannot insert NULL into
-- NOT NULL을 지정했기 때문에 COL_01에는 NULL이 올 수 없다
INSERT INTO TB_TEST(COL_01, COL_02)
VALUES('', 'ccc');

SELECT * FROM TB_TEST;



-- PRIMARY KEY
DROP TABLE TEST_01;

-- 에러 : table can have only one primary key
-- 프라이머리 키 두개 설정은 이렇게 못 한다
CREATE TABLE TEST_01(
    KEY_01 VARCHAR2(10) CONSTRAINT PK_TEST_01 PRIMARY KEY,
    -- CONSTRAINT 무결성
    KEY_02 VARCHAR2(10) CONSTRAINT PK_TEST_02 PRIMARY KEY,
    COL_01 VARCHAR2(20),
    COL_02 VARCHAR2(30)
);

-- 위에처럼 하나씩은 에러 아래처럼 한꺼번에는 OK
CREATE TABLE TEST_01(
    KEY_01 VARCHAR2(10),
    KEY_02 VARCHAR2(10),
    COL_01 VARCHAR2(20),
    COL_02 VARCHAR2(30),
    CONSTRAINT PK_TEST_01 PRIMARY KEY(KEY_01, KEY_02)
);

DROP TABLE TEST_01;

CREATE TABLE TEST_01(
    KEY_01 VARCHAR2(10) PRIMARY KEY,
    KEY_02 VARCHAR2(10),
    COL_01 VARCHAR2(20),
    COL_02 VARCHAR2(30)
);

DROP TABLE TEST_01;

CREATE TABLE TEST_01(
    KEY_01 VARCHAR2(10),
    KEY_02 VARCHAR2(10),
    COL_01 VARCHAR2(20),
    COL_02 VARCHAR2(30)
);

-- 기본키 즉, PRIMARY KEY 수정, 삭제 방법
ALTER TABLE TEST_01
ADD
CONSTRAINT PK_TEST_01
PRIMARY KEY(KEY_01, COL_01);

ALTER TABLE TEST_01
DROP CONSTRAINT PK_TEST_01;

ALTER TABLE TEST_01
ADD
CONSTRAINT PK_TEST_01
PRIMARY KEY(KEY_01, COL_01);



-- PRIMARY KEY
SELECT *
FROM user_constraints
WHERE table_name = 'TEST_01'
    AND constraint_type = 'P';

DROP TABLE TEST_01;

CREATE TABLE TEST_01(
    KEY_01 VARCHAR2(10),
    KEY_02 VARCHAR2(10),
    COL_01 VARCHAR2(20),
    COL_02 VARCHAR2(30),
    CONSTRAINT PK_TEST_01 PRIMARY KEY(KEY_01, KEY_02)
);

INSERT INTO test_01(key_01, key_02, col_01, col_02)
VALUES('AAA', 'aaa', '111', '111');

-- 에러 : AAA와 aaa가 중복된 값이다 unique constraint (HR.SYS_C007082) violated
INSERT INTO test_01(key_01, key_02, col_01, col_02)
VALUES('AAA', 'aaa', '111', '111');

INSERT INTO test_01(key_01, key_02, col_01, col_02)
VALUES('BBB', 'aaa', '111', '111');

INSERT INTO test_01(key_01, key_02, col_01, col_02)
VALUES('AAA', 'bbb', '111', '111');

-- 에러 : NULL 값이다 cannot insert NULL into
INSERT INTO test_01(key_01, key_02, col_01, col_02)
VALUES('', 'aaa', '111', '111');

INSERT INTO test_01(key_01, key_02, col_01, col_02)
VALUES('CCC', '', '111', '111');

SELECT * FROM TEST_01;

DROP TABLE TEST_01;

CREATE TABLE TEST_01(
    KEY_01 VARCHAR2(10),
    KEY_02 VARCHAR2(10),
    COL_01 VARCHAR2(20),
    COL_02 VARCHAR2(30),
    CONSTRAINT PK_TEST_01 PRIMARY KEY(KEY_01, KEY_02)
);

INSERT INTO test_01(key_01, key_02, col_01, col_02)
VALUES('AAA', 'aaa', '111', '111');

INSERT INTO test_01(key_01, key_02, col_01, col_02)
VALUES('AAA', 'AAA', '111', '111');

INSERT INTO test_01(key_01, key_02, col_01, col_02)
VALUES('AAA', 'ccc', '111', '111');

INSERT INTO test_01(key_01, key_02, col_01, col_02)
VALUES('BBB', 'ccc', '111', '111');

INSERT INTO test_01(key_01, key_02, col_01, col_02)
VALUES('BBB', 'aaa', '111', '111');

-- 둘 다 겹치니까 에러 : unique constraint
INSERT INTO test_01(key_01, key_02, col_01, col_02)
VALUES('BBB', 'aaa', '111', '111');

SELECT * FROM test_01;







-- UNIQUE
-- 중복 허용 안한다. NULL 허용한다
CREATE TABLE TEST_02(
    KEY_01 VARCHAR2(10) CONSTRAINT UK_TEST_01 UNIQUE,
    KEY_02 VARCHAR2(10),
    COL_01 VARCHAR2(20),
    COL_02 VARCHAR2(20)
);

INSERT INTO test_02(KEY_01, KEY_02, COL_01, COL_02)
VALUES('AAA', 'aaa', '111', '111');

DROP TABLE TEST_02 -- UK_TEST_01 이름이 남는다
CASCADE CONSTRAINTS; -- 무결성까지 모두 삭제

CREATE TABLE TEST_02(
    KEY_01 VARCHAR2(10),
    KEY_02 VARCHAR2(10),
    COL_01 VARCHAR2(20),
    COL_02 VARCHAR2(20),
    CONSTRAINT UK_TEST_01 UNIQUE(KEY_01, KEY_02)
);

INSERT INTO test_02(KEY_01, KEY_02, COL_01, COL_02)
VALUES('AAA', 'aaa', '111', '111');

INSERT INTO test_02(KEY_01, KEY_02, COL_01, COL_02)
VALUES('AAA', 'bbb', '111', '111');

-- 중복값은 허용하지 않는다 에러 : unique constraint (HR.UK_TEST_01) violated
INSERT INTO test_02(KEY_01, KEY_02, COL_01, COL_02)
VALUES('AAA', 'aaa', '111', '111');

INSERT INTO test_02(KEY_01, KEY_02, COL_01, COL_02)
VALUES('AAA', '', '111', '111');

INSERT INTO test_02(KEY_01, KEY_02, COL_01, COL_02)
VALUES('', 'aaa', '111', '111');

INSERT INTO test_02(KEY_01, KEY_02, COL_01, COL_02)
VALUES('', '', '111', '111');

SELECT * FROM test_02;

-- PRIMARY와 UNIQUE의 차이
-- PRIMARY  중복 x, NULL 허용 x     ex) 아이디
-- UNIQUE   중복 x, NULL 허용 O     ex) 이메일





-- CHECK 중복 허용 o, null 값 o
DROP TABLE TEST_03
CASCADE CONSTRAINTS;

CREATE TABLE TEST_03(
    KEY_01 VARCHAR2(10),
    KEY_02 VARCHAR2(10),
    COL_01 VARCHAR2(20),
    COL_02 NUMBER,
    CONSTRAINT CHK_TEST_01 CHECK(COL_01 IN('사과', '배', '바나나')),
    CONSTRAINT CHK_TEST_02 CHECK(COL_02 > 0 AND COL_02 <= 100)
);

INSERT INTO test_03(KEY_01, KEY_02, COL_01, COL_02)
VALUES('AAA', 'aaa', '사과', 1);

-- 중복 허용 O
INSERT INTO test_03(KEY_01, KEY_02, COL_01, COL_02)
VALUES('AAA', 'aaa', '사과', 1);

INSERT INTO test_03(KEY_01, KEY_02, COL_01, COL_02)
VALUES('AAA', 'aaa', '바나나', 2);

-- 지정한 값이 아니다 귤에서 에러 : check constraint (HR.CHK_TEST_01) violated
INSERT INTO test_03(KEY_01, KEY_02, COL_01, COL_02)
VALUES('AAA', 'aaa', '귤', 2);

INSERT INTO test_03(KEY_01, KEY_02, COL_01, COL_02)
VALUES('AAA', 'aaa', '배', 100);

-- CHECK는 NULL값 허용한다
INSERT INTO test_03(KEY_01, KEY_02, COL_01, COL_02)
VALUES('AAA', 'aaa', '', 100);

-- CHECK는 둘 다 NULL값 허용한다
-- 숫자지만 NULL값을 넣고 싶으면 ''를 쓴다
INSERT INTO test_03(KEY_01, KEY_02, COL_01, COL_02)
VALUES('AAA', 'aaa', '', '');


SELECT * FROM test_03;

-- 무결성 복습 꼭 하자





-- FOREIGN KEY : 두 테이블을 연결하는 목적
-- 부모 테이블이라고 부른다 사실 적절하진 않다
-- 부모 테이블을 DEPARTMENTS, JOBS 테이블에 해당된다
DROP TABLE TEST_CHD;
DROP TABLE TEST_PAR;

CREATE TABLE TEST_PAR(
    KEY_01 VARCHAR2(10),
    KEY_02 VARCHAR2(10),
    COL_01 VARCHAR2(20),
    COL_02 VARCHAR2(20),
    CONSTRAINT PK_TEST_PAR PRIMARY KEY(KEY_01, KEY_02)
);

-- 자식테이블 EMPLOYEES에 해당된다
CREATE TABLE TEST_CHD(
    KEY_01 VARCHAR2(10) CONSTRAINT PK_TEST_CHD PRIMARY KEY,
    -- 원래는 같은 이름을 쓴다 EMPLOYEES job_id, JOBS job_id처럼
    FK_KEY_01 VARCHAR2(10),
    FK_KEY_02 VARCHAR2(10),
    CONSTRAINT FK_TEST_CHD FOREIGN KEY(FK_KEY_01, FK_KEY_02)
        REFERENCES TEST_PAR(KEY_01, KEY_02)
);

INSERT INTO test_par(KEY_01, KEY_02, COL_01, COL_02)
VALUES('AAA', 'aaa', '111', '111');

INSERT INTO test_par(KEY_01, KEY_02, COL_01, COL_02)
VALUES('BBB', 'bbb', '222', '222');

INSERT INTO test_par(KEY_01, KEY_02, COL_01, COL_02)
VALUES('CCC', 'ccc', '333', '333');



INSERT INTO test_par(KEY_01, KEY_02, COL_01, COL_02)
VALUES('DDD', 'ddd', '444', '444');

-- 프라이머리키 KEY_01, KEY_02에 444는 없어서 된다
-- 프라이머리키는 중복되면 안되고 NULL 안된다
INSERT INTO test_par(COL_01, COL_02, KEY_01, KEY_02)
VALUES('DDD', 'ddd', '444', '444');

-- 컬럼명이 없으면 컬럼의 순서대로 들어간다
INSERT INTO test_par
VALUES('EEE', 'eee', '555', '555');

INSERT INTO test_par(KEY_01, KEY_02)
VALUES('FFF', 'fff');
-- 컬럼명은 반드시 넣어야 하는 것은 아니다


SELECT * FROM TEST_PAR;
SELECT * FROM TEST_CHD;


--INSERT INTO TEST_CHD(KEY_01, FK_KEY_01, FK_KEY_02)
--VALUES('111', '', '');
-- 위에 NULL 두 자리 다 부모 클래스에 있는 값이어야 한다
INSERT INTO TEST_CHD(KEY_01, FK_KEY_01, FK_KEY_02)
VALUES('1010', 'AAA', 'aaa');

-- 에러 : 부모 테이블에 데이터가 없다 무결성 에러 unique constraint (HR.PK_TEST_CHD) violated
-- 위에 NULL 두 자리 중 하나라도 부모 클래스에 있는 값과 다르면 에러
INSERT INTO TEST_CHD(KEY_01, FK_KEY_01, FK_KEY_02)
VALUES('2020', 'AAA', 'bbb');

-- integrity constraint (HR.FK_TEST_CHD) violated - parent key not found
-- 컬럼명은 그대로인데 데이터 순서가 바꿔서 넣으니까 에러
INSERT INTO TEST_CHD(KEY_01, FK_KEY_01, FK_KEY_02)
VALUES('2020', 'bbb', 'BBB');

INSERT INTO TEST_CHD(KEY_01, FK_KEY_01, FK_KEY_02)
VALUES('2020', 'BBB', 'bbb');

-- 헷갈리면 킴벌리 생각
-- 외래키는 외부에 키 값이 있던지 NULL값을 허용한다
INSERT INTO TEST_CHD(KEY_01, FK_KEY_01, FK_KEY_02)
VALUES('3030', '', '');

-- FOREIGN KEY 두개 중에 둘 다 부모 테이블 값이랑 같을 때 데이터 입력 가능하다
-- 둘 중 하나라도 NULL값이면 다른 하나는 어떤 값도 들어올 수 있다
-- 왜? 부모 테이블과 매치되지 않는 자식 테이블의 FOREIGN KEY는 별도이기 때문이다 ex) 킴벌리
INSERT INTO TEST_CHD(KEY_01, FK_KEY_01, FK_KEY_02)
VALUES('4040', 'GGG', '');

INSERT INTO TEST_CHD(KEY_01, FK_KEY_01, FK_KEY_02)
VALUES('5050', '', 'ggg');

-- 에러 : integrity constraint (HR.FK_TEST_CHD) violated - parent key not found
INSERT INTO TEST_CHD(KEY_01, FK_KEY_01, FK_KEY_02)
VALUES('6060', 'GGG', 'ggg');

INSERT INTO TEST_CHD(KEY_01, FK_KEY_01, FK_KEY_02)
VALUES('6060', '', 'AAA');

INSERT INTO TEST_CHD(KEY_01, FK_KEY_01, FK_KEY_02)
VALUES('7070', 'AAA', 'aaa');

SELECT * FROM TEST_PAR;
SELECT * FROM TEST_CHD;
-- 'AAA' 'BBB' 'CCC' '' 네가지만 허용






COMMIT; -- DB에도 적용하고 싶을 때 COMMIT하자. 데이터를 넣는다
-- COMMIT을 하면 ROLLBACK 불가능하다
ROLLBACK; -- DB에 완전히 넣기 전에 실행해주는 것. 데이터를 되돌린다







-- jobs 테이블 데이터 포함되서 가져온다
CREATE TABLE TB_TEST_BK
AS
SELECT *
FROM jobs;

SELECT * FROM TB_TEST_BK;

-- UPDATE
UPDATE tb_test_bk
SET min_salary = 0, max_salary = 100
WHERE job_id LIKE 'AD%';

ROLLBACK;

UPDATE tb_test_bk
SET min_salary = 0, max_salary = 0
WHERE max_salary >= 10000;

-- DELETE
DELETE
FROM tb_test_bk
WHERE max_salary < 10000;

DROP TABLE tb_test_bk;






