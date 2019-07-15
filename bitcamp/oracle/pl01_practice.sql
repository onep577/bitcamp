SET SERVEROUTPUT ON

BEGIN
    -- 실행부
    DBMS_OUTPUT.PUT_LINE('HELLO PL');
    -- SYSTEM.OUT.PRITNLN 이다
END;
/

--문제1) 사원번호가 7369인 사원의 급여에 1500을 더하여 갱신하여라.
DECLARE
    v_sal EMP.SAL%TYPE := 1500;
    v_salTotal NUMBER;
BEGIN
    UPDATE EMP
    SET SAL = SAL + v_sal
    WHERE EMPNO = 7369;
    
    SELECT SAL INTO v_salTotal
    FROM EMP
    WHERE EMPNO = 7369;
    
    DBMS_OUTPUT.PUT_LINE('7369번 사원의 인상된 급여 : ' || v_salTotal);
END;
/
ROLLBACK;

--문제2) 업무를 입력받아 급여의 합을 출력하는 SCRIPT를 작성하여라.

ACCEPT p_job PROMPT '업무를 입력하세요(급여의 합 출력)'
DECLARE
    v_salSum emp.sal%TYPE;
BEGIN
    SELECT SUM(SAL) INTO v_salSum
    FROM EMP
    WHERE job = UPPER('&p_job');
    
    DBMS_OUTPUT.PUT_LINE('&p_job' || '업무 사원의 급여 합계 : ' ||
        --TO_CHAR(v_salSum, '$999,999'));
        v_salSum);
        -- $999,999를 넣은것과 안 넣은것 둘 다 가능하다
END;
/

--문제3) EMP 테이블에 EMPNO_SEQUENCE의 SEQUENCE를 이용하여
--이름.급여,부서번호를 입력받아 등록하는 SCRIPT를 작성하여라.
--단 10번부서는 입력된 급여에 20%의 가산하여 등록하고 30번부서는 10% 가산 점이 있다.
SELECT * FROM EMP;
SELECT EMPNO_SEQUENCE.NEXTVAL
FROM DUAL;
SELECT EMPNO_SEQUENCE.CURRVAL
FROM DUAL;

DROP SEQUENCE EMPNO_SEQUENCE;

CREATE SEQUENCE EMPNO_SEQUENCE
    INCREMENT BY 1
    START WITH 8000;
    
ACCEPT p_name PROMPT '사원 이름을 입력하세요'
ACCEPT p_sal PROMPT '사원 급여를 입력하세요'
ACCEPT p_deptno PROMPT '부서번호(10/20/30)를 입력하세요'

DECLARE
    v_seq NUMBER(10);
    v_name emp.ename%TYPE := UPPER('&p_name');
    v_sal emp.sal%TYPE := &p_sal;
    v_deptno emp.deptno%TYPE := &p_deptno;
BEGIN
    IF &p_deptno = 10 THEN
        v_sal := &p_sal * 1.2;
    ELSIF &p_deptno = 30 THEN
        v_sal := &p_sal * 1.1;
    END IF;
    
    INSERT INTO EMP(EMPNO, ENAME, SAL, DEPTNO)
    VALUES(EMPNO_SEQUENCE.NEXTVAL, v_name, v_sal, v_deptno);
    
    DBMS_OUTPUT.PUT_LINE('시퀀스 : ' || EMPNO_SEQUENCE.CURRVAL || ', 사원 이름 : '
        || v_name || ', 사원 급여 : ' || v_sal || ', 사원 부서번호 : ' || v_deptno);
END;
/

-- 문제4) EMP 테이블에서 이름을 입력 받아 아래의 형태로 출력하는 SCRIPT를 작성하여라.
-- 조회하고자 하는 사원의 이름을 입력하시오 : scott
-- 사원번호 : 7788
ACCEPT p_name PROMPT '사원 이름을 입력하세요'
DECLARE
    v_deptno emp.deptno%TYPE;
    v_sal emp.sal%TYPE;
    v_name EMP.ename%TYPE := UPPER('&p_name');
BEGIN
    SELECT sal, deptno INTO v_sal, v_deptno
    FROM EMP
    WHERE ENAME = v_name;
    DBMS_OUTPUT.PUT_LINE(v_name || '의 사원번호 : ' || v_deptno);
    DBMS_OUTPUT.PUT_LINE(v_name || '의 사원급여 : ' || v_sal);
    
-- 없을 때 처리
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('사원이 존재하지 않습니다');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('사원은 두건 이상입니다');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('기타 에러입니다');
END;
/

--문제5) 이름을 입력받아 급여와 입사일을 출력하는 SCRIPT를 작성하여라.
ACCEPT p_name PROMPT '사원 이름을 입력하세요'
DECLARE
    v_result EMP%ROWTYPE;
BEGIN
    SELECT sal, hiredate INTO v_result.sal, v_result.hiredate
    FROM EMP
    WHERE ENAME = '&p_name';
    DBMS_OUTPUT.PUT_LINE('&p_name' || '사원의 급여 : ' || v_result.sal
        || ', 입사일 : ' || v_result.hiredate);
END;
/


