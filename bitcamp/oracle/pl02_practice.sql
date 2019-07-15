-- ����1) �̸��� �Է¹޾� �� ����� ���� �� �μ���� �޿��� �˻��ϴ� ���ν����� �����Ͽ���.
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
    
    DBMS_OUTPUT.PUT_LINE('��� : ' || p_name);
    DBMS_OUTPUT.PUT_LINE('�μ��� : ' || v_dname);
    DBMS_OUTPUT.PUT_LINE('�޿� : ' || v_sal);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('�Է��� ����� ã�� �� �����ϴ�');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('�ڷᰡ 2�� �̻��Դϴ�');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('��Ÿ �����Դϴ�');
END;
/

ROLLBACK;
ACCEP p_name PROMPT '����̸��� �Է��ϼ���'
EXEC pr_emp('&p_name');

-- ����2) EMP ���̺��� �̸����� �μ� ��ȣ�� �˻��ϴ� �Լ��� �ۼ��Ͽ���.
CREATE OR REPLACE FUNCTION f_deptno(p_name IN EMP.ENAME%TYPE)
    RETURN NUMBER
IS
    v_deptno EMP.DEPTNO%TYPE;
BEGIN
    SELECT DEPTNO INTO v_deptno
    FROM EMP
    WHERE ENAME = UPPER(p_name);
    
    DBMS_OUTPUT.PUT_LINE('��� : ' || p_name);
    DBMS_OUTPUT.PUT_LINE('�μ���ȣ : ' || v_deptno);
    
    RETURN v_deptno;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('�Է��� ����� ã�� �� �����ϴ�');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('�ڷᰡ 2�� �̻��Դϴ�');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('��Ÿ �����Դϴ�');
END;
/

VAR deptno NUMBER;
EXEC :deptno := f_deptno('FORD');
PRINT deptno;

-- ����3) EMP ���̺��� �̸��� �Է� �޾� �μ���ȣ,�μ���,�޿��� �˻��ϴ�
-- FUNCTION�� �ۼ��Ͽ���. �� �μ���ȣ�� RETURN�� ����Ͽ���.
CREATE OR REPLACE FUNCTION f_emp(E_NAME IN VARCHAR2)
    RETURN NUMBER
IS
    v_deptno EMP.DEPTNO%TYPE;
    -- return�� �ϱ����� ����
    v_dname DEPT.DNAME%TYPE;
    v_sal EMP.SAL%TYPE;
    v_empno EMP.EMPNO%TYPE;
BEGIN
    SELECT D.DEPTNO, D.DNAME, E.SAL INTO v_deptno, v_dname, v_sal
    FROM DEPT D, EMP E
    WHERE D.DEPTNO = E.DEPTNO
        AND E.ENAME = E_NAME;
    
    RETURN v_deptno;
    -- �ݵ�� return���� �����ؾ��Ѵ�
END;
/

ACCEPT p_name PROMPT '����̸� �Է��ϼ���'
SELECT f_emp('SMITH')
FROM DUAL;

/*
    PROCEDURE                       FUNCTION
    PL/SQL������ ����                 ���� �Ϻη� ����� �� �ִ� SELECT FUNC('FORD') FROM EMP;
    RETURN DATATYPE ����             RETURN DATATYPE�� �ʼ�
    RETURN �� �� �ִ�                 RETURN �ݵ�� �ؾ��Ѵ�
    INSERT, DELETE, UPDATE          SELECT
    3���� ���� SELECT�� ������ ���� ��, PROCEDURE���� FUNCTION�� �� ���� ����
*/



-- 1) �� ���ڸ� �����ϸ� ������ �ؼ� ������� ��ȯ�ϴ� �Լ��� �����Ͻÿ�.(�Լ��� add_num)
CREATE OR REPLACE FUNCTION add_num(NUM1 IN NUMBER, NUM2 IN NUMBER)
    RETURN NUMBER
IS

BEGIN
    RETURN (NUM1 + NUM2);
END;
/

ACCEPT NUM1 PROMPT '1.��'
ACCEPT NUM2 PROMPT '2.��'

SELECT add_num(&num1, &num2) FROM DUAL;



-- 2) �޿�(���ʽ� ����)�� ���� ������ ������ ���� �����ϴ� �Լ��� �ۼ��Ͻÿ�.
-- �޿��� �� $3,000���� ������ ������ 0% �����ϸ�, $3,000�̻� $7,000 �̸��̸� 10%, 
-- $7,000�̻� $10,000 �̸��̸� 20%, $10,000�� �̻��̸� 30%�� ������
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
        DBMS_OUTPUT.PUT_LINE('�޿�' || v_sum || ', ���� : ' || 0);
    ELSIF v_sum >= 3000 AND v_sum < 7000 THEN
        DBMS_OUTPUT.PUT_LINE('�޿�' || v_sum || ', ���� : ' || 10);
    ELSIF v_sum >= 7000 AND v_sum < 10000 THEN
        DBMS_OUTPUT.PUT_LINE('�޿�' || v_sum || ', ���� : ' || 20);
    ELSIF v_sum >= 10000 THEN
        DBMS_OUTPUT.PUT_LINE('�޿�' || v_sum || ', ���� : ' || 30);
    END IF;
    
END;
/

EXEC p_salcomm(172);



-- 3) �μ���ȣ�� �Է��ϸ� �ش� �μ����� �ٹ��ϴ� ��� ���� ��ȯ�ϴ� �Լ��� �����Ͻÿ�.
-- (�Լ��� get_emp_count)
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

ACCEPT DE_NO PROMPT '�μ���ȣ �Է��ϼ���'
SELECT get_emp_count(&DE_NO)
FROM DUAL;



-- 4) employees���̺��� �̿��ؼ� �Ի����� �����ϸ� �ٹ������� ���ϴ� �Լ��� �����Ͻÿ�.
-- (�Ҽ��� �ڸ� ����, �Լ��� get_info_hiredate)
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

    DBMS_OUTPUT.PUT_LINE('�ٹ����۳⵵ : ' || v_year);
    DBMS_OUTPUT.PUT_LINE('�ٹ����� : ' || v_year_now || '����');
    
    RETURN v_year_now;
END;
/
ACCEPT num PROMPT '�����ȣ�� �Է��ϼ���'
SELECT get_info_hiredate2(&num) FROM DUAL;

-- ����� �ڵ�
CREATE OR REPLACE FUNCTION get_info_hiredate3(hiredate DATE)
    RETURN INTEGER
IS
    -- varchar2
BEGIN
    RETURN trunc(months_between(SYSDATE, hiredate)/12);
END;
/

SELECT first_name, get_info_hiredate3(hire_date) ����
FROM employees;



-- 5) employees���̺��� �̿��ؼ� �����ȣ�� �Է��ϸ�
-- �ش� ����� ������ �̸��� ���ϴ� �Լ��� �����Ͻÿ�.(�Լ��� get_mgr_name)
CREATE OR REPLACE FUNCTION get_mgr_name2(emp_id IN EMPLOYEES.EMPLOYEE_ID%TYPE)
    RETURN VARCHAR2
IS
    m_name EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
    SELECT B.FIRST_NAME INTO m_name
    FROM EMPLOYEES A, EMPLOYEES B
    WHERE A.MANAGER_ID = B.EMPLOYEE_ID
        AND A.EMPLOYEE_ID = emp_id;
    
    DBMS_OUTPUT.PUT_LINE('�Ŵ����̸� : ' || m_name);
    
    RETURN m_name;
END;
/

ACCEPT emp_id PROMPT '�����ȣ �Է��ϼ���'
SELECT get_mgr_name2(&emp_id)
FROM DUAL;

-- ����� �ڵ�
SELECT employee_id, first_name, get_mgr_name(employee_id) "������ �̸�"
FROM employees;



-- 6) emp���̺�(SCOTT)�� �̿��ؼ� �����ȣ�� �Է��ϸ� �޿� ����� ���ϴ� �Լ��� �����Ͻÿ�.
-- (4000~5000 A, 3000~4000�̸� B, 2000~3000�̸� C, 1000~200�̸� D, 1000�̸� F, �Լ��� get_sal_grade)
CREATE OR REPLACE FUNCTION get_sal_grade(emp_id IN EMP.EMPNO%TYPE)
    RETURN VACHAR2
IS
    v_sal EMP.SAL%TYPE;
BEGIN
    SELECT SAL INTO v_sal
    FROM EMP
    WHERE EMPNO = emp_id;
    
    IF v_sal >= 4000 AND v_sal <= 5000 THEN
        DBMS_OUTPUT.PUT_LINE('�޿���� : A');
    ELSIF v_sal >= 3000 AND v_sal < 4000 THEN
        DBMS_OUTPUT.PUT_LINE('�޿���� : B');
    ELSIF v_sal >= 2000 AND v_sal < 3000 THEN
        DBMS_OUTPUT.PUT_LINE('�޿���� : C');
    ELSIF v_sal >= 1000 AND v_sal < 2000 THEN
        DBMS_OUTPUT.PUT_LINE('�޿���� : D');
    ELSIF v_sal < 1000 THEN
        DBMS_OUTPUT.PUT_LINE('�޿���� : F');
    END IF;
END;
/

ACCEPT emp_id PROMPT '�����ȣ �Է��ϼ���'
EXECUTE get_sal_grade(&emp_id);

-- ����� �ڵ�
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

SELECT ename, sal, get_sal_grade(empno) "�޿����"
FROM emp;


