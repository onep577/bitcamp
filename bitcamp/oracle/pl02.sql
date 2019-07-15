/*
    block �Ǿ��ִ� ó�� -> �Լ�ȭ
    PROCEDURE   - INSERT, DELETE, UPDATE
                1.IN, OUT(RETURN VALUE)
    FUNCTION    - SELECT
                1. �Ű�����
                2. RETURN VALUE
*/

SET SERVEROUTPUT ON 

CREATE OR REPLACE PROCEDURE pl_func(inNumber IN NUMBER, outNumber OUT NUMBER)
-- IN�� ���� ��
IS
    -- �����
BEGIN
    -- �����
    DBMS_OUTPUT.PUT_LINE('inNumber:' || inNumber);
    
    outNumber := 112233;
    -- ����ó����
END;
/

-- �ܺ� ����
VAR val NUMBER;
-- ���ν��� ȣ��
EXECUTE pl_func(111, :val);
-- outNumber�� : �߱� ������ val�� : �ؾ��Ѵ�
-- ���� ���
PRINT val;


-- �Ű� ���� ���� ���
CREATE OR REPLACE PROCEDURE hello_pro
IS
    msg VARCHAR2(100);
BEGIN
    msg := 'hello PROCEDURE';
    DBMS_OUTPUT.PUT_LINE(msg);
END;
/

EXEC hello_pro;


-- DEPARTMENTS ROW �߰�
CREATE OR REPLACE PROCEDURE add_dept(
    p_deptno IN departments.department_id%TYPE,
    p_deptname IN departments.department_name%TYPE,
    p_loc IN departments.location_id%TYPE )
IS
BEGIN
    INSERT INTO departments(department_id, department_name, location_id)
    VALUES(p_deptno, p_deptname, p_loc);
    
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('�߰��� �����Ͽ����ϴ�');
    -- ROLLBACK;
END;
/

EXEC add_dept(301, 'AAA', 2500);
SELECT * FROM DEPARTMENTS;
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID = 300;

ROLLBACK;


-- ����1) UPDATE_SAL ���ν����� �����ȣ�� �Է¹޾Ƽ� �޿��λ� 30%
CREATE OR REPLACE PROCEDURE update_sal(p_empno IN employees.employee_id%TYPE)
IS
BEGIN
    -- �����
    UPDATE employees
    SET salary = salary * 1.3
    WHERE employee_id = p_empno;
    
    -- ����ó����
EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('��¿� �����Ͽ����ϴ�');
END;
/

ACCEPT p_empno PROMPT '�����ȣ �Է�'
EXECUTE update_sal(&p_empno);
SELECT * FROM employees WHERE employee_id = 103;
ROLLBACK;

-- ����2) �����ȣ�� �Է� ������ �� ����� �̸�, �����ȣ, ����޿��� ����� �ǵ����϶�.
CREATE OR REPLACE PROCEDURE emp_result(inNumber IN employees.employee_id%TYPE)
IS
    v_name employees.first_name%TYPE;
    v_id employees.employee_id%TYPE;
    v_sal employees.salary%TYPE;
BEGIN
    SELECT first_name, employee_id, salary INTO v_name, v_id, v_sal
    FROM employees
    WHERE employee_id = inNumber;
    
    DBMS_OUTPUT.PUT_LINE('����̸� : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || v_id);
    DBMS_OUTPUT.PUT_LINE('����޿� : ' || v_sal);
END;
/

ACCEPT p_empno PROMPT '�����ȣ �Է��ϼ���'
EXECUTE emp_result(&p_empno);


ROLLBACK;





/*
    Cursor : ���� �ּҰ��� -> pointer
    
    �Ͻ��� Ŀ�� : �ڵ�����
        SQL%ROWCOUNT : ROW�� ��
        SQL%FOUND : ROW�� ���� �� �� �̻��� ���
        SQL%NOTFOUND : ROW���� 0
    
    ����� Ŀ�� : ��������
*/
-- �Ͻ��� Ŀ��
CREATE OR REPLACE PROCEDURE implicit_cursor(p_empno IN employees.employee_id%TYPE)
IS
    v_sal employees.salary%TYPE;
    v_update_row NUMBER;    -- ��� ���� �����Ǵ��� �˾ƺ��� ���� ����
BEGIN
    -- �˻�
    SELECT salary INTO v_sal
    FROM employees
    WHERE employee_id = p_empno;
    
    -- �˻��� �� �����Ͱ� �ִ� ���
    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('�˻��� �����Ͱ� �ֽ��ϴ�' || v_sal);
    END IF;
    
    -- ����
    UPDATE employees
    SET salary = salary * 1.1
    WHERE employee_id = p_empno;
    
    -- ���
    v_update_row := SQL%ROWCOUNT;
    DBMS_OUTPUT.PUT_LINE('�޿��� �λ�� ��� ��' || v_update_row);
    
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('�˻��� �����Ͱ� �����ϴ�');
END;
/

EXECUTE implicit_cursor(101);
EXECUTE implicit_cursor(333);
ROLLBACK;



-- ����� Ŀ��
CREATE OR REPLACE PROCEDURE expCursor_test(v_deptno IN departments.department_id%TYPE)
IS
    CURSOR dept_avg
    IS
    -- 3���� �����͸� ���� �� �ִ� ������
    SELECT D.DEPARTMENT_NAME, COUNT(E.EMPLOYEE_ID) CNT,
        ROUND(AVG(E.SALARY), 3) SAL
    FROM EMPLOYEES E, DEPARTMENTS D
    WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
        AND E.DEPARTMENT_ID = v_deptno
    GROUP BY D.DEPARTMENT_NAME;
    
    -- CURSOR�� PATCH �ϱ����� �������� ����
    v_dname departments.department_name%TYPE;
    emp_cnt NUMBER;
    sal_avg NUMBER;
BEGIN
    -- CURSOR OPEN
    OPEN dept_avg;
    
    -- CURSOR FATCH
    FETCH dept_avg INTO v_dname, emp_cnt, sal_avg;
    
    DBMS_OUTPUT.PUT_LINE('�μ��� : ' || v_dname);
    DBMS_OUTPUT.PUT_LINE('����� : ' || emp_cnt);
    DBMS_OUTPUT.PUT_LINE('�޿���� : ' || sal_avg);
    
    -- CURSOR
    CLOSE dept_avg;
END;
/

EXEC expcursor_test(50);









