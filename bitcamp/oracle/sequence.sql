/*
    sequence : 유일한 값을 생성해 주는 Oracle Object다
    회원번호, 게시판의 글 번호
    -- 게시판 앞에 있는 1, 2, 3, 4는 시퀀스가 아니다
    -- 그냥 for문으로 숫자만 나온거다

    SEQUENCE를 생성하면 PRIMARY KEY와 같이 순차적으로 증가하는 컬럼을
    자동적으로 생성할 수 있다
    SEQUENCE는 초기화가 불가능하다 1 2 3 4 5
    
    int count = 1;
    count++;

*/

-- sequence 생성
CREATE SEQUENCE TEST_SEQ
INCREMENT BY 1  -- 1씩 증가 ++
START WITH 10   -- 시작 10부터
MAXVALUE 100
MINVALUE 1;

-- CURRVAL -- 현재 시퀀스의 값
SELECT TEST_SEQ.CURRVAL
FROM DUAL;

-- NEXTVAL -- 진행 값
SELECT TEST_SEQ.NEXTVAL
FROM DUAL;

-- SEQUENCE 수정
ALTER SEQUENCE TEST_SEQ
INCREMENT BY 3;

-- SEQUENCE 초기화가 불가능
DROP SEQUENCE TEST_SEQ;

INSERT INTO employees(EMPLOYEES_SEQ.NEXTVALM);





-- 동의어(SYNONYM / 객체의 별명)
/*
    int array_postion_number[];
    int arrPosNum[] = array_postion_number;
    arrPosNum[0] = 1;
*/
CREATE SYNONYM "사원들"
FOR EMPLOYEES;

SELECT * FROM "사원들";

INSERT INTO "사원들"
VALUES(EMPLOYEES_SEQ.NEXTVAL,
    '길동', '홍', 'HGD', '123-4567', TO_DATE('2005/01/01', 'YYYY/MM/DD'),
    'IT_PROG', 20000, NULL, 100, 10);

SELECT * FROM employees;


