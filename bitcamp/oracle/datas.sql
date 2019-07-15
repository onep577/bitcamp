SELECT * FROM employees;
select * from employees;
SELECT * FROM EMPLOYEES;    /* 권장 */

-- 한줄 주석문
/*
범위 주석문
*/

-- 자료형
-- java        Oracle
-- int      == NUMBER
-- String   == VARCHAR2
-- double   == NUMBER(정수의 자릿수,소수의 자릿수)
-- Date     == Date

-- 문자열 자료형 CHAR, VARCHAR, LONG
-- CHAR
CREATE TABLE TB_CHAR(
    COL_CHAR1 CHAR(10 BYTE),    -- String COL_CHAR1 (크기);
    COL_CHAR2 CHAR(10 CHAR),
    COL_CHAR3 CHAR(10)
);

/*
CREATE TABLE 테이블명(
    컬럼명 컬럼의 자료형(크기)
);
*/
/*
INSERT INTO 테이블명(컬럼명, 컬럼명,...,컬럼명)
VALUES(값, 값,...,값)
*/

INSERT INTO TB_CHAR(COL_CHAR1, COL_CHAR2, COL_CHAR3)
VALUES('ABC','ABC','ABC');  -- 영문크기 1 BYTE

INSERT INTO TB_CHAR(COL_CHAR1, COL_CHAR2, COL_CHAR3)
VALUES('가','가','가');  -- 한글크기 3 BYTE

INSERT INTO TB_CHAR(COL_CHAR1, COL_CHAR2, COL_CHAR3)
VALUES('가나','가나','가나');
-- CHAR(5 BYTE) 로 줄이니까 ABC,가 만 들어간다
-- 왜? '가나'는 6byte '가나다'는 9byte로 더 길이서

INSERT INTO TB_CHAR(COL_CHAR1, COL_CHAR2, COL_CHAR3)
VALUES('가나다','가나다','가나다');
-- 길이가 16byte인 이유는 '가' 한 문자를 char형으로 취급하기 때문이다
-- 3 + 3 + 3 + 7 = 16

SELECT * FROM tb_char;

SELECT COL_CHAR1, COL_CHAR2, COL_CHAR3,
    LENGTHB(COL_CHAR1), LENGTHB(COL_CHAR2), LENGTHB(COL_CHAR3)
FROM tb_char;
-- CHAR는 고정길이라서 길이값으로 최소 10byte가 나온다
-- '가'를 char형으로 취급해서 10,12,14,16byte이다
-- 생성할 때 자료형을 입력하지 않으면 BYTE로 생성된다?

/*
CHAR : 10 BYTE  00000 00000
ABC ->          ABC00 00000

10 BYTE
가나다 ->        가나다0

10 CHAR
가 3 + 9 = 12              가0000 00000
가나 3 + 3 + 8 = 14        가나000 00000
가나다 3 + 3 + 3 + 7 = 16  가나다00 00000
*/

-- VARCHAR2
CREATE TABLE TB_VARCHAR(
    컬럼1 VARCHAR2(10 BYTE),
    컬럼2 VARCHAR2(10 CHAR),
    컬럼3 VARCHAR2(10)
);

INSERT INTO TB_VARCHAR(컬럼1, 컬럼2, 컬럼3)
VALUES('ABC', 'ABC', 'ABC');

INSERT INTO TB_VARCHAR(컬럼1, 컬럼2, 컬럼3)
VALUES('가나다', '가나다', '가나다');
-- VARCHAR2(5 BYTE)하면 '가나다'는 추가 못 한다
-- 왜? '가나다'는 9byte인데 컬럼은 5byte까지이기 때문이다

SELECT "컬럼1", "컬럼2", "컬럼3",
    LENGTHB("컬럼1"), LENGTHB("컬럼2"), LENGTHB("컬럼3")
FROM tb_varchar;
-- CHAR은 고정길이이고,
-- VARCHAR는 가변길이라서 처음 생성할 때 입력한 10BYTE가 아닌 문자열의 길이
-- 즉, 'ABC'의 길이 3BYTE, '가나다'의 길이 9BYTE가 나온다
-- 컬럼명은 영어로 쓰자! 한글로 쓰면 쌍따움표 해야한다

-- LONG 최대 2GB까지 저장 가능
CREATE TABLE TB_LONG(
    COL_LONG1 LONG
--    COL_LONG2 LONG
);
-- 한 테이블에 오직 하나의 LONG 컬럼만 사용 가능하다

INSERT INTO TB_LONG(COL_LONG1)
VALUES('ABC');
-- oracle LONG이 문자열

select * from TB_LONG;

CREATE TABLE TB_NUMBER(
    COL_NUM1 NUMBER,
    COL_NUM2 NUMBER(5), 
    -- 정수 5자리까지 가능, 소수를 넣는다면 반올림된다
    COL_NUM3 NUMBER(5, 2),
    -- 정수소수 합쳐서 5자리, 정수는 3자리를 넘을 수 없다,
    -- 소수자리는 반올림되어 2자리만 나온다
    COL_NUM4 NUMBER(*, 2)
    -- 소수자리는 반올림되어 2자리만 나온다
);
INSERT INTO TB_NUMBER(COL_NUM1, COL_NUM2, COL_NUM3, COL_NUM4)
VALUES(1234.56789, 12345.567, 123.567, 1.789);
--                 123456.567 넣는다면 에러
--                            1234.56 넣는다면 에러
SELECT * FROM TB_NUMBER;

-- 숫자 자료형 INTEGER == 정수
CREATE TABLE TB_INTEGER(
    COL_INT1 INTEGER,
    COL_INT2 INTEGER
);

-- NUMBER(정수,실수)
CREATE TABLE TB_NUMBER(
    COL_NUM1 NUMBER,
    COL_NUM2 NUMBER(5),
    COL_NUM3 NUMBER(5, 2),
    COL_NUM4 NUMBER(*, 2)
);

INSERT INTO tb_number(COL_NUM1, COL_NUM2, COL_NUM3, COL_NUM4)
VALUES(1234.5678, 12345, 123.456, 1234.56789);

INSERT INTO tb_number(COL_NUM1, COL_NUM2, COL_NUM3, COL_NUM4)
VALUES(1234.5678, 12345, 234.567, 1234.56789);
-- 오류 1234.567 5자리에 소수 2자리까지이므로

SELECT * FROM tb_number;

-- 날짜 자료형 DATE
-- 연도, 월, 일, 시, 분, 초 까지 다 저장된다
CREATE TABLE TB_DATE(
    COL_DATE1 DATE,
    COL_DATE2 DATE
);

INSERT INTO TB_DATE(COL_DATE1, COL_DATE2)
VALUES(SYSDATE, SYSDATE - 1);
-- SYSDATE 오늘 년도/월/일

SELECT * FROM tb_date;

INSERT INTO TB_DATE(COL_DATE1, COL_DATE2)
VALUES(SYSDATE, TO_DATE('2019-01-01 10:32:24', 'YYYY-MM-DD HH:MI:SS'));
INSERT INTO TB_DATE(COL_DATE1, COL_DATE2)
VALUES('19-08-15', '19-01-31');
-- 월은 13부터 일은 그 달의 마지막날을 넘기면 에러
-- 11월은 31부터 12월은 32부터 에러

INSERT INTO TB_DATE(COL_DATE1, COL_DATE2)
VALUES(SYSDATE, '2019-07-12 10:32:24'); -- 에러
-- 오류 보고 : literal does not match format string

INSERT INTO TB_DATE(COL_DATE1, COL_DATE2)
VALUES(SYSDATE, TO_DATE('20190417103224','YYYYMMDDHHMISS'));

-- VARCHAR2(문자열) -> DATE(날짜형식) : TO_DATE
-- DATE(날짜형식) -> VARCHAR2(문자열) : TO_CHAR










