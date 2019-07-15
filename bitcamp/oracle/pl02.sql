/*
    block 되어있는 처리 -> 함수화
    PROCEDURE   - INSERT, DELETE, UPDATE
                1.IN, OUT(RETURN VALUE)
    FUNCTION    - SELECT
                1. 매개변수
                2. RETURN VALUE
*/

SET SERVEROUTPUT ON 

CREATE OR REPLACE PROCEDURE pl_func(inNumber IN NUMBER, outNumber OUT NUMBER)
-- IN은 들어가는 값
IS
    -- 선언부
BEGIN
    -- 실행부
    DBMS_OUTPUT.PUT_LINE('inNumber:' || inNumber);
    
    outNumber := 112233;
    -- 예외처리부
END;
/

-- 외부 변수
VAR val NUMBER;
-- 프로시저 호출
EXECUTE pl_func(111, :val);
-- outNumber를 : 했기 때문에 val도 : 해야한다
-- 변수 출력
PRINT val;


-- 매개 변수 없는 경우
CREATE OR REPLACE PROCEDURE hello_pro
IS
    msg VARCHAR2(100);
BEGIN
    msg := 'hello PROCEDURE';
    DBMS_OUTPUT.PUT_LINE(msg);
END;
/

EXEC hello_pro;


-- DEPARTMENTS ROW 추가
CREATE OR REPLACE PROCEDURE add_dept(
    p_deptno IN departments.department_id%TYPE,
    p_deptname IN departments.department_name%TYPE,
    p_loc IN departments.location_id%TYPE )
IS
BEGIN
    INSERT INTO departments(department_id, department_name, location_id)
    VALUES(p_deptno, p_deptname, p_loc);
    
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('추가에 실패하였습니다');
    -- ROLLBACK;
END;
/

EXEC add_dept(301, 'AAA', 2500);
SELECT * FROM DEPARTMENTS;
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID = 300;

ROLLBACK;


-- 문제1) UPDATE_SAL 프로시저는 사원번호를 입력받아서 급여인상 30%
CREATE OR REPLACE PROCEDURE update_sal(p_empno IN employees.employee_id%TYPE)
IS
BEGIN
    -- 실행부
    UPDATE employees
    SET salary = salary * 1.3
    WHERE employee_id = p_empno;
    
    -- 예외처리부
EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('출력에 실패하였습니다');
END;
/

ACCEPT p_empno PROMPT '사원번호 입력'
EXECUTE update_sal(&p_empno);
SELECT * FROM employees WHERE employee_id = 103;
ROLLBACK;

-- 문제2) 사원번호를 입력 받으면 그 사원의 이름, 사원번호, 사원급여도 출력이 되도록하라.
CREATE OR REPLACE PROCEDURE emp_result(inNumber IN employees.employee_id%TYPE)
IS
    v_name employees.first_name%TYPE;
    v_id employees.employee_id%TYPE;
    v_sal employees.salary%TYPE;
BEGIN
    SELECT first_name, employee_id, salary INTO v_name, v_id, v_sal
    FROM employees
    WHERE employee_id = inNumber;
    
    DBMS_OUTPUT.PUT_LINE('사원이름 : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('사원번호 : ' || v_id);
    DBMS_OUTPUT.PUT_LINE('사원급여 : ' || v_sal);
END;
/

ACCEPT p_empno PROMPT '사원번호 입력하세요'
EXECUTE emp_result(&p_empno);


ROLLBACK;





/*
    Cursor : 저장 주소공간 -> pointer
    
    암시적 커서 : 자동생성
        SQL%ROWCOUNT : ROW의 수
        SQL%FOUND : ROW의 수가 한 개 이상일 경우
        SQL%NOTFOUND : ROW수가 0
    
    명시적 커서 : 수동생성
*/
-- 암시적 커서
CREATE OR REPLACE PROCEDURE implicit_cursor(p_empno IN employees.employee_id%TYPE)
IS
    v_sal employees.salary%TYPE;
    v_update_row NUMBER;    -- 몇개의 행이 수정되는지 알아보는 저장 변수
BEGIN
    -- 검색
    SELECT salary INTO v_sal
    FROM employees
    WHERE employee_id = p_empno;
    
    -- 검색이 된 데이터가 있는 경우
    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('검색된 데이터가 있습니다' || v_sal);
    END IF;
    
    -- 수정
    UPDATE employees
    SET salary = salary * 1.1
    WHERE employee_id = p_empno;
    
    -- 출력
    v_update_row := SQL%ROWCOUNT;
    DBMS_OUTPUT.PUT_LINE('급여가 인상된 사원 수' || v_update_row);
    
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('검색된 데이터가 없습니다');
END;
/

EXECUTE implicit_cursor(101);
EXECUTE implicit_cursor(333);
ROLLBACK;



-- 명시적 커서
CREATE OR REPLACE PROCEDURE expCursor_test(v_deptno IN departments.department_id%TYPE)
IS
    CURSOR dept_avg
    IS
    -- 3개의 데이터를 꺼낼 수 있는 포인터
    SELECT D.DEPARTMENT_NAME, COUNT(E.EMPLOYEE_ID) CNT,
        ROUND(AVG(E.SALARY), 3) SAL
    FROM EMPLOYEES E, DEPARTMENTS D
    WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
        AND E.DEPARTMENT_ID = v_deptno
    GROUP BY D.DEPARTMENT_NAME;
    
    -- CURSOR에 PATCH 하기위한 변수들을 선언
    v_dname departments.department_name%TYPE;
    emp_cnt NUMBER;
    sal_avg NUMBER;
BEGIN
    -- CURSOR OPEN
    OPEN dept_avg;
    
    -- CURSOR FATCH
    FETCH dept_avg INTO v_dname, emp_cnt, sal_avg;
    
    DBMS_OUTPUT.PUT_LINE('부서명 : ' || v_dname);
    DBMS_OUTPUT.PUT_LINE('사원수 : ' || emp_cnt);
    DBMS_OUTPUT.PUT_LINE('급여평균 : ' || sal_avg);
    
    -- CURSOR
    CLOSE dept_avg;
END;
/

EXEC expcursor_test(50);









