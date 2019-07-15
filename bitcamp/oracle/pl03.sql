-- function return

-- �Է¹��� �����κ��� 10%�� ������ ����ϴ� �Լ�
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


-- �����ȣ �Է��ϸ� ����� �޿��� ���ϵǴ� function
CREATE OR REPLACE FUNCTION empno_sal(p_empno IN NUMBER)
    RETURN NUMBER
IS
    v_sal employees.salary%TYPE;
    -- return�� �ϱ����� ����
BEGIN
    SELECT salary INTO v_sal
    FROM EMPLOYEES
    WHERE employee_id = p_empno;
    
    RETURN v_sal;
    -- �ݵ�� return���� �����ؾ��Ѵ�
END;
/

SELECT empno_sal(100)
FROM DUAL;

ROLLBACK;


