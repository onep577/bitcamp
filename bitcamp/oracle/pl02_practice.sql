-- 문제1) 이름을 입력받아 그 사원의 정보 중 부서명과 급여를 검색하는 프로시저를 생성하여라.
SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE pr_emp(p_name IN EMP.ENAME%TYPE)
IS
    v_dname DEPT.DNAME%TYPE;
    v_sal EMP.SAL%TYPE;
BEGIN
    SELECT D.DNAME, E.SAL INTO v_dname, v_sal
    FROM DEPT D, EMP E
    WHERE D.DEPTNO = E.DEPTNO
        AND E.ENAME = UPPER(p_name);
    
    DBMS_OUTPUT.PUT_LINE('사원 : ' || p_name);
    DBMS_OUTPUT.PUT_LINE('부서명 : ' || v_dname);
    DBMS_OUTPUT.PUT_LINE('급여 : ' || v_sal);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('입력한 사원을 찾을 수 없습니다');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('자료가 2건 이상입니다');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('기타 에러입니다');
END;
/

ROLLBACK;
ACCEP p_name PROMPT '사원이름을 입력하세요'
EXEC pr_emp('&p_name');

-- 문제2) EMP 테이블에서 이름으로 부서 번호를 검색하는 함수를 작성하여라.
CREATE OR REPLACE FUNCTION f_deptno(p_name IN EMP.ENAME%TYPE)
    RETURN NUMBER
IS
    v_deptno EMP.DEPTNO%TYPE;
BEGIN
    SELECT DEPTNO INTO v_deptno
    FROM EMP
    WHERE ENAME = UPPER(p_name);
    
    DBMS_OUTPUT.PUT_LINE('사원 : ' || p_name);
    DBMS_OUTPUT.PUT_LINE('부서번호 : ' || v_deptno);
    
    RETURN v_deptno;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('입력한 사원을 찾을 수 없습니다');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('자료가 2건 이상입니다');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('기타 에러입니다');
END;
/

VAR deptno NUMBER;
EXEC :deptno := f_deptno('FORD');
PRINT deptno;

-- 문제3) EMP 테이블에서 이름을 입력 받아 부서번호,부서명,급여를 검색하는
-- FUNCTION을 작성하여라. 단 부서번호를 RETURN에 사용하여라.
CREATE OR REPLACE FUNCTION f_emp(E_NAME IN VARCHAR2)
    RETURN NUMBER
IS
    v_deptno EMP.DEPTNO%TYPE;
    -- return을 하기위한 변수
    v_dname DEPT.DNAME%TYPE;
    v_sal EMP.SAL%TYPE;
    v_empno EMP.EMPNO%TYPE;
BEGIN
    SELECT D.DEPTNO, D.DNAME, E.SAL INTO v_deptno, v_dname, v_sal
    FROM DEPT D, EMP E
    WHERE D.DEPTNO = E.DEPTNO
        AND E.ENAME = E_NAME;
    
    RETURN v_deptno;
    -- 반드시 return문이 존재해야한다
END;
/

ACCEPT p_name PROMPT '사원이름 입력하세요'
SELECT f_emp('SMITH')
FROM DUAL;

/*
    PROCEDURE                       FUNCTION
    PL/SQL문으로 실행                 식의 일부로 사용할 수 있다 SELECT FUNC('FORD') FROM EMP;
    RETURN DATATYPE 없음             RETURN DATATYPE은 필수
    RETURN 할 수 있다                 RETURN 반드시 해야한다
    INSERT, DELETE, UPDATE          SELECT
    3가지 보다 SELECT의 비중이 높다 즉, PROCEDURE보다 FUNCTION을 더 많이 쓴다
*/



-- 1) 두 숫자를 제공하면 덧셈을 해서 결과값을 반환하는 함수를 정의하시오.(함수명 add_num)
CREATE OR REPLACE FUNCTION add_num(NUM1 IN NUMBER, NUM2 IN NUMBER)
    RETURN NUMBER
IS

BEGIN
    RETURN (NUM1 + NUM2);
END;
/

ACCEPT NUM1 PROMPT '1.수'
ACCEPT NUM2 PROMPT '2.수'

SELECT add_num(&num1, &num2) FROM DUAL;



-- 2) 급여(보너스 포함)에 대한 세율을 다음과 같이 정의하는 함수를 작성하시오.
-- 급여가 월 $3,000보다 적으면 세율을 0% 적용하며, $3,000이상 $7,000 미만이면 10%, 
-- $7,000이상 $10,000 미만이면 20%, $10,000을 이상이면 30%를 적용함
-- sal+comm < 3000 0%, sal+comm < 7000 and sal+comm >= 3000 10%,
-- sal+comm < 10000 and sal+comm >= 7000 20%, sal+comm >= 10000 30%
CREATE OR REPLACE PROCEDURE p_salcomm(e_no IN NUMBER)
IS
    v_sal EMPLOYEES.SALARY%TYPE;
    v_comm EMPLOYEES.COMMISSION_PCT%TYPE;
    v_sum NUMBER;
BEGIN
    SELECT SALARY, COMMISSION_PCT INTO v_sal, v_comm
    FROM EMPLOYEES
    WHERE employee_id = e_no;
    
    IF v_comm IS NULL THEN
        v_sum := v_sal;
    ELSE
        v_sum := v_sal + (v_sal*v_comm);
    END IF;
    
    IF v_sum < 3000 THEN
        DBMS_OUTPUT.PUT_LINE('급여' || v_sum || ', 세율 : ' || 0);
    ELSIF v_sum >= 3000 AND v_sum < 7000 THEN
        DBMS_OUTPUT.PUT_LINE('급여' || v_sum || ', 세율 : ' || 10);
    ELSIF v_sum >= 7000 AND v_sum < 10000 THEN
        DBMS_OUTPUT.PUT_LINE('급여' || v_sum || ', 세율 : ' || 20);
    ELSIF v_sum >= 10000 THEN
        DBMS_OUTPUT.PUT_LINE('급여' || v_sum || ', 세율 : ' || 30);
    END IF;
    
END;
/

EXEC p_salcomm(172);



-- 3) 부서번호를 입력하면 해당 부서에서 근무하는 사원 수를 반환하는 함수를 정의하시오.
-- (함수명 get_emp_count)
CREATE OR REPLACE FUNCTION get_emp_count(
    deptno IN employees.department_id%TYPE) RETURN NUMBER
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
    HAVING DEPARTMENT_ID = deptno;
    
    RETURN v_count;
END;
/

ACCEPT DE_NO PROMPT '부서번호 입력하세요'
SELECT get_emp_count(&DE_NO)
FROM DUAL;



-- 4) employees테이블을 이용해서 입사일을 제공하면 근무연차를 구하는 함수를 정의하시오.
-- (소수점 자리 절삭, 함수명 get_info_hiredate)
CREATE OR REPLACE FUNCTION get_info_hiredate2(emp_id IN employees.employee_id%TYPE)
    RETURN NUMBER
IS
    v_year NUMBER;
    v_year_now NUMBER;
BEGIN
    SELECT TO_CHAR(HIRE_DATE, 'YY') INTO v_year
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = emp_id;    

    v_year_now := SUBSTR(TO_DATE(SYSDATE), 1, 2);   
    v_year_now := v_year_now - v_year + 1;

    DBMS_OUTPUT.PUT_LINE('근무시작년도 : ' || v_year);
    DBMS_OUTPUT.PUT_LINE('근무연차 : ' || v_year_now || '년차');
    
    RETURN v_year_now;
END;
/
ACCEPT num PROMPT '사원번호를 입력하세요'
SELECT get_info_hiredate2(&num) FROM DUAL;

-- 강사님 코드
CREATE OR REPLACE FUNCTION get_info_hiredate3(hiredate DATE)
    RETURN INTEGER
IS
    -- varchar2
BEGIN
    RETURN trunc(months_between(SYSDATE, hiredate)/12);
END;
/

SELECT first_name, get_info_hiredate3(hire_date) 연차
FROM employees;



-- 5) employees테이블을 이용해서 사원번호를 입력하면
-- 해당 사원의 관리자 이름을 구하는 함수를 정의하시오.(함수명 get_mgr_name)
CREATE OR REPLACE FUNCTION get_mgr_name2(emp_id IN EMPLOYEES.EMPLOYEE_ID%TYPE)
    RETURN VARCHAR2
IS
    m_name EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
    SELECT B.FIRST_NAME INTO m_name
    FROM EMPLOYEES A, EMPLOYEES B
    WHERE A.MANAGER_ID = B.EMPLOYEE_ID
        AND A.EMPLOYEE_ID = emp_id;
    
    DBMS_OUTPUT.PUT_LINE('매니저이름 : ' || m_name);
    
    RETURN m_name;
END;
/

ACCEPT emp_id PROMPT '사원번호 입력하세요'
SELECT get_mgr_name2(&emp_id)
FROM DUAL;

-- 강사님 코드
SELECT employee_id, first_name, get_mgr_name(employee_id) "관리자 이름"
FROM employees;



-- 6) emp테이블(SCOTT)을 이용해서 사원번호를 입력하면 급여 등급을 구하는 함수를 정의하시오.
-- (4000~5000 A, 3000~4000미만 B, 2000~3000미만 C, 1000~200미만 D, 1000미만 F, 함수명 get_sal_grade)
CREATE OR REPLACE FUNCTION get_sal_grade(emp_id IN EMP.EMPNO%TYPE)
    RETURN VACHAR2
IS
    v_sal EMP.SAL%TYPE;
BEGIN
    SELECT SAL INTO v_sal
    FROM EMP
    WHERE EMPNO = emp_id;
    
    IF v_sal >= 4000 AND v_sal <= 5000 THEN
        DBMS_OUTPUT.PUT_LINE('급여등급 : A');
    ELSIF v_sal >= 3000 AND v_sal < 4000 THEN
        DBMS_OUTPUT.PUT_LINE('급여등급 : B');
    ELSIF v_sal >= 2000 AND v_sal < 3000 THEN
        DBMS_OUTPUT.PUT_LINE('급여등급 : C');
    ELSIF v_sal >= 1000 AND v_sal < 2000 THEN
        DBMS_OUTPUT.PUT_LINE('급여등급 : D');
    ELSIF v_sal < 1000 THEN
        DBMS_OUTPUT.PUT_LINE('급여등급 : F');
    END IF;
END;
/

ACCEPT emp_id PROMPT '사원번호 입력하세요'
EXECUTE get_sal_grade(&emp_id);

-- 강사님 코드
CREATE OR REPLACE FUNCTION get_sal_grade(emp_no emp.empno%TYPE)
    RETURN VARCHAR2
IS
    sgrade VARCHAR2(2);
BEGIN
    SELECT
        CASE WHEN sal >= 4000 AND sal <= 5000 THEN 'A'
             WHEN sal >= 3000 AND sal < 4000 THEN 'B'
             WHEN sal >= 2000 AND sal < 3000 THEN 'C'
             WHEN sal >= 1000 AND sal < 2000 THEN 'D'
             ELSE 'F'
        END grade INTO sgrade
    FROM emp
    WHERE empno = emp_no;
    
    RETURN sgrade;
END;
/

SELECT ename, sal, get_sal_grade(empno) "급여등급"
FROM emp;


