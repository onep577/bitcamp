SET SERVEROUTPUT ON

BEGIN
    -- �����
    DBMS_OUTPUT.PUT_LINE('HELLO PL');
    -- SYSTEM.OUT.PRITNLN �̴�
END;
/

--����1) �����ȣ�� 7369�� ����� �޿��� 1500�� ���Ͽ� �����Ͽ���.
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
    
    DBMS_OUTPUT.PUT_LINE('7369�� ����� �λ�� �޿� : ' || v_salTotal);
END;
/
ROLLBACK;

--����2) ������ �Է¹޾� �޿��� ���� ����ϴ� SCRIPT�� �ۼ��Ͽ���.

ACCEPT p_job PROMPT '������ �Է��ϼ���(�޿��� �� ���)'
DECLARE
    v_salSum emp.sal%TYPE;
BEGIN
    SELECT SUM(SAL) INTO v_salSum
    FROM EMP
    WHERE job = UPPER('&p_job');
    
    DBMS_OUTPUT.PUT_LINE('&p_job' || '���� ����� �޿� �հ� : ' ||
        --TO_CHAR(v_salSum, '$999,999'));
        v_salSum);
        -- $999,999�� �����Ͱ� �� ������ �� �� �����ϴ�
END;
/

--����3) EMP ���̺� EMPNO_SEQUENCE�� SEQUENCE�� �̿��Ͽ�
--�̸�.�޿�,�μ���ȣ�� �Է¹޾� ����ϴ� SCRIPT�� �ۼ��Ͽ���.
--�� 10���μ��� �Էµ� �޿��� 20%�� �����Ͽ� ����ϰ� 30���μ��� 10% ���� ���� �ִ�.
SELECT * FROM EMP;
SELECT EMPNO_SEQUENCE.NEXTVAL
FROM DUAL;
SELECT EMPNO_SEQUENCE.CURRVAL
FROM DUAL;

DROP SEQUENCE EMPNO_SEQUENCE;

CREATE SEQUENCE EMPNO_SEQUENCE
    INCREMENT BY 1
    START WITH 8000;
    
ACCEPT p_name PROMPT '��� �̸��� �Է��ϼ���'
ACCEPT p_sal PROMPT '��� �޿��� �Է��ϼ���'
ACCEPT p_deptno PROMPT '�μ���ȣ(10/20/30)�� �Է��ϼ���'

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
    
    DBMS_OUTPUT.PUT_LINE('������ : ' || EMPNO_SEQUENCE.CURRVAL || ', ��� �̸� : '
        || v_name || ', ��� �޿� : ' || v_sal || ', ��� �μ���ȣ : ' || v_deptno);
END;
/

-- ����4) EMP ���̺��� �̸��� �Է� �޾� �Ʒ��� ���·� ����ϴ� SCRIPT�� �ۼ��Ͽ���.
-- ��ȸ�ϰ��� �ϴ� ����� �̸��� �Է��Ͻÿ� : scott
-- �����ȣ : 7788
ACCEPT p_name PROMPT '��� �̸��� �Է��ϼ���'
DECLARE
    v_deptno emp.deptno%TYPE;
    v_sal emp.sal%TYPE;
    v_name EMP.ename%TYPE := UPPER('&p_name');
BEGIN
    SELECT sal, deptno INTO v_sal, v_deptno
    FROM EMP
    WHERE ENAME = v_name;
    DBMS_OUTPUT.PUT_LINE(v_name || '�� �����ȣ : ' || v_deptno);
    DBMS_OUTPUT.PUT_LINE(v_name || '�� ����޿� : ' || v_sal);
    
-- ���� �� ó��
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('����� �������� �ʽ��ϴ�');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('����� �ΰ� �̻��Դϴ�');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('��Ÿ �����Դϴ�');
END;
/

--����5) �̸��� �Է¹޾� �޿��� �Ի����� ����ϴ� SCRIPT�� �ۼ��Ͽ���.
ACCEPT p_name PROMPT '��� �̸��� �Է��ϼ���'
DECLARE
    v_result EMP%ROWTYPE;
BEGIN
    SELECT sal, hiredate INTO v_result.sal, v_result.hiredate
    FROM EMP
    WHERE ENAME = '&p_name';
    DBMS_OUTPUT.PUT_LINE('&p_name' || '����� �޿� : ' || v_result.sal
        || ', �Ի��� : ' || v_result.hiredate);
END;
/


