/*
    PL / SQL    Procedural extension to Structured Query Language
    3���� ������ �ִ� script, procedure, function

    PL : SQL�� Ȯ���� �������� ó�� ��� ex) �ڹ��� �Լ�
    PL ���� : ���� ó���� �ѹ��� �ϱ� ���ؼ� (�Լ��� ������ ����)
    �����ͺ��̽� ���Ǿ��� SQL�� �Ϲ� ���α׷��� ����� Ư���� ������ ���
*/

-- PL �⺻ ����
/*
����� : ����� ������ ����� ����
����� : ���� ó���� login �κ��� ����ϴ� �κ�
����ó���� : ó���߿� �߻��� �� �ִ� ���� �������� ó��
*/
 -- ON �ڿ� �����ݷ� ���� ����
 -- ����� �ȵȴٸ� SERVEROUTPUT�� OFF�� �Ǿ��ִ� ���̴�
SET SERVEROUTPUT ON

BEGIN
    -- �����
    DBMS_OUTPUT.PUT_LINE('HELLO PL');
    -- SYSTEM.OUT.PRITNLN �̴�
END;
/



-- SCRIPT
DECLARE -- �����
    MESSAGE VARCHAR2(10);
BEGIN   -- �����
    MESSAGE := 'hello pl';
        DBMS_OUTPUT.PUT_LINE(MESSAGE);
-- ����ó����
END;
/



-- IF��
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



-- FOR��
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



-- LOOP��
DECLARE
    v_cnt NUMBER := 0;
    v_tot NUMBER := 0;
BEGIN
    LOOP
        EXIT WHEN v_cnt = 10; -- v_cnt�� 10�̸� Ż��
        
        v_cnt := v_cnt + 1;
        v_tot := v_tot + v_cnt;        
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('v_cnt ' || v_cnt);
    DBMS_OUTPUT.PUT_LINE('v_tot ' || v_tot);
END;
/



-- WHILE��
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
    
EXCEPTION WHEN OTHERS THEN -- ����ó����
    DBMS_OUTPUT.PUT_LINE('OGHERS error');
END;
/



-- varray : variable array ���� ���̸� ���� �迭
DECLARE
    TYPE varray_test IS VARRAY(3) OF INTEGER;
    -- ������ ���� �� �ƴ϶� TYPE�� �������, int varray_test[3];
    varray1 varray_test;
BEGIN
    varray1 := varray_test(11, 22, 33);
    DBMS_OUTPUT.PUT_LINE(varray1(2));
END;
/




ACCEPT p_deptno PROMPT '�μ� ��ȣ�� �Է��Ͻÿ�(�޿��� ��)'
-- INPUTȭ���̴� ACCEPT ������Ʈ �������̴�
-- DB �����۰� ����Ѵ�
DECLARE
    v_salTotal NUMBER;
BEGIN
    SELECT SUM(salary) INTO v_salTotal
    FROM employees
    WHERE department_id = &P_deptno;
    -- �ܺο��� �Է¹޾Ҵٸ� �տ� &�� �ٿ����Ѵ�
    DBMS_OUTPUT.PUT_LINE(&P_deptno || '�� �μ��� �޿��� ���� '
        || TO_CHAR(v_salTotal, '$999,999,999'));
END;
/
-- �μ���ȣ�� ���� �� �μ���ȣ�� ���� �´� ���� v_salTotal�� ���´�
-- insert, delete, update db�� ���� ��
-- select db���� ������ ��




-- �����ȣ �Է� �ް� �� ����� �޿��� 1000�� ���� ������ �����϶�
-- ������ ���� ���
ACCEPT P_empid PROMPT '�����ȣ�� �Է��ϼ���(�޿� + 1000)'
DECLARE
    --v_result NUMBER;
    v_sal EMPLOYEES.salary%TYPE := 1000;
    -- EMPLOYEES ���̺�ȿ� salary Ÿ���̴�
    v_salTotal NUMBER; -- Ȯ�ο� ����
BEGIN
    UPDATE employees
    SET salary = salary + v_sal
    WHERE employee_id = &p_empid;
    
    SELECT salary INTO v_salTotal
    FROM employees
    WHERE employee_id = &p_empid;
    
    DBMS_OUTPUT.PUT_LINE(&p_empid || '�� ����� �λ�� �޿� : '
        || v_salTotal);
END;
/
ROLLBACK;



DECLARE
    -- ROWTYPE
    v_emp employees%ROWTYPE;
    -- employees�� �ִ� ������ (first_name, salary) �� ���� �����ϴ�
BEGIN
    SELECT employee_id, first_name, last_name, salary
        INTO v_emp.employee_id, v_emp.first_name, v_emp.last_name, v_emp.salary
    FROM employees
    WHERE employee_id = 100;
    
    DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || v_emp.employee_id);
    DBMS_OUTPUT.PUT_LINE('�̸� : ' || v_emp.first_name);
    DBMS_OUTPUT.PUT_LINE('�� : ' || v_emp.last_name);
    DBMS_OUTPUT.PUT_LINE('�޿� : ' || v_emp.salary);
END;
/

