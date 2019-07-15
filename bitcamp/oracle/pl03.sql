-- function return

-- 입력받은 값으로부터 10%의 세율을 취득하는 함수
CREATE OR REPLACE FUNCTION tax_value(p_val IN NUMBER) RETURN NUMBER
IS
BEGIN
    RETURN (p_val * 0.1);
END;
/

SELECT tax_value(100)
FROM DUAL;

VAR t_val NUMBER;
EXECUTE :t_val := tax_value(100);
PRINT t_val;


-- 사원번호 입력하면 사원의 급여가 리턴되는 function
CREATE OR REPLACE FUNCTION empno_sal(p_empno IN NUMBER)
    RETURN NUMBER
IS
    v_sal employees.salary%TYPE;
    -- return을 하기위한 변수
BEGIN
    SELECT salary INTO v_sal
    FROM EMPLOYEES
    WHERE employee_id = p_empno;
    
    RETURN v_sal;
    -- 반드시 return문이 존재해야한다
END;
/

SELECT empno_sal(100)
FROM DUAL;

ROLLBACK;


