/*
    PL / SQL    Procedural extension to Structured Query Language
    3가지 형식이 있다 script, procedure, function

    PL : SQL을 확장한 순차적인 처리 언어 ex) 자바의 함수
    PL 목적 : 여러 처리를 한번에 하기 위해서 (함수의 목적과 같다)
    데이터베이스 질의어인 SQL과 일반 프로그래밍 언어의 특성을 결합한 언어
*/

-- PL 기본 구조
/*
선언부 : 사용할 변수나 상수를 선언
실행부 : 실제 처리할 login 부분을 담당하는 부분
예외처리부 : 처리중에 발생할 수 있는 각종 오류들을 처리
*/
 -- ON 뒤에 세미콜론 찍지 말자
 -- 출력이 안된다면 SERVEROUTPUT이 OFF로 되어있는 것이다
SET SERVEROUTPUT ON

BEGIN
    -- 실행부
    DBMS_OUTPUT.PUT_LINE('HELLO PL');
    -- SYSTEM.OUT.PRITNLN 이다
END;
/



-- SCRIPT
DECLARE -- 선언부
    MESSAGE VARCHAR2(10);
BEGIN   -- 실행부
    MESSAGE := 'hello pl';
        DBMS_OUTPUT.PUT_LINE(MESSAGE);
-- 예외처리부
END;
/



-- IF문
DECLARE
    counter INTEGER;
BEGIN
    counter := 1;
    counter := counter + 1;
    
    IF counter IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('result:counter is null');
    -- ELSIF
    ELSE
        DBMS_OUTPUT.PUT_LINE('result:counter is not null');
    END IF;
END;
/



-- FOR문
DECLARE
    counter INTEGER;
    i INTEGER;
BEGIN
    FOR i IN 1..9 LOOP
        DBMS_OUTPUT.PUT_LINE('i = ' || i);
        counter := 2 * i;
        DBMS_OUTPUT.PUT_LINE('2 * ' || i || ' = ' || counter);
        
    END LOOP;
    
END;
/



-- LOOP문
DECLARE
    v_cnt NUMBER := 0;
    v_tot NUMBER := 0;
BEGIN
    LOOP
        EXIT WHEN v_cnt = 10; -- v_cnt가 10이면 탈출
        
        v_cnt := v_cnt + 1;
        v_tot := v_tot + v_cnt;        
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('v_cnt ' || v_cnt);
    DBMS_OUTPUT.PUT_LINE('v_tot ' || v_tot);
END;
/



-- WHILE문
DECLARE
    v_cnt NUMBER := 0;
    v_tot NUMBER := 0;
BEGIN
    WHILE v_cnt < 10
    
    LOOP
        v_cnt := v_cnt + 1;
        v_tot := v_tot + v_cnt; 
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('v_cnt ' || v_cnt);
    DBMS_OUTPUT.PUT_LINE('v_tot ' || v_tot);
END;
/



-- goto
DECLARE
    v_name VARCHAR2(10) := 'LEE';
    v_case NUMBER := 1;
BEGIN
    CASE WHEN MOD(v_case, 2) = 0 THEN
            GOTO test1;
         WHEN MOD(v_case, 2) = 1 THEN
            GOTO test2;
         ELSE
            GOTO ERR;
    END CASE;
<<test1>>
    DBMS_OUTPUT.PUT_LINE(v_name || ' is woman');
    GOTO sub_end;
<<test2>>
    DBMS_OUTPUT.PUT_LINE(v_name || ' is man');
    GOTO sub_end;
<<ERR>>
    DBMS_OUTPUT.PUT_LINE('ERR');
    GOTO sub_end;
<<sub_end>>
    DBMS_OUTPUT.PUT_LINE('exit');
END;
/



-- exception
DECLARE
    counter INTEGER;
BEGIN
    counter := 10;
    counter := counter / 0;
    
    DBMS_OUTPUT.PUT_LINE(counter);
    
EXCEPTION WHEN OTHERS THEN -- 예외처리부
    DBMS_OUTPUT.PUT_LINE('OGHERS error');
END;
/



-- varray : variable array 고정 길이를 가진 배열
DECLARE
    TYPE varray_test IS VARRAY(3) OF INTEGER;
    -- 변수를 만든 게 아니라 TYPE을 만들었다, int varray_test[3];
    varray1 varray_test;
BEGIN
    varray1 := varray_test(11, 22, 33);
    DBMS_OUTPUT.PUT_LINE(varray1(2));
END;
/




ACCEPT p_deptno PROMPT '부서 번호를 입력하시오(급여의 합)'
-- INPUT화면이다 ACCEPT 프롬프트 윈도우이다
-- DB 디밸롭퍼가 사용한다
DECLARE
    v_salTotal NUMBER;
BEGIN
    SELECT SUM(salary) INTO v_salTotal
    FROM employees
    WHERE department_id = &P_deptno;
    -- 외부에서 입력받았다면 앞에 &를 붙여야한다
    DBMS_OUTPUT.PUT_LINE(&P_deptno || '번 부서의 급여의 합은 '
        || TO_CHAR(v_salTotal, '$999,999,999'));
END;
/
-- 부서번호가 들어가고 그 부서번호의 값에 맞는 것이 v_salTotal로 나온다
-- insert, delete, update db로 들어가는 것
-- select db에서 나오는 것




-- 사원번호 입력 받고 그 사원의 급여에 1000을 더한 값으로 갱신하라
-- 갱신한 값도 출력
ACCEPT P_empid PROMPT '사원번호를 입력하세요(급여 + 1000)'
DECLARE
    --v_result NUMBER;
    v_sal EMPLOYEES.salary%TYPE := 1000;
    -- EMPLOYEES 테이블안에 salary 타입이다
    v_salTotal NUMBER; -- 확인용 변수
BEGIN
    UPDATE employees
    SET salary = salary + v_sal
    WHERE employee_id = &p_empid;
    
    SELECT salary INTO v_salTotal
    FROM employees
    WHERE employee_id = &p_empid;
    
    DBMS_OUTPUT.PUT_LINE(&p_empid || '번 사원의 인상된 급여 : '
        || v_salTotal);
END;
/
ROLLBACK;



DECLARE
    -- ROWTYPE
    v_emp employees%ROWTYPE;
    -- employees에 있는 변수명에 (first_name, salary) 다 접근 가능하다
BEGIN
    SELECT employee_id, first_name, last_name, salary
        INTO v_emp.employee_id, v_emp.first_name, v_emp.last_name, v_emp.salary
    FROM employees
    WHERE employee_id = 100;
    
    DBMS_OUTPUT.PUT_LINE('사원번호 : ' || v_emp.employee_id);
    DBMS_OUTPUT.PUT_LINE('이름 : ' || v_emp.first_name);
    DBMS_OUTPUT.PUT_LINE('성 : ' || v_emp.last_name);
    DBMS_OUTPUT.PUT_LINE('급여 : ' || v_emp.salary);
END;
/

