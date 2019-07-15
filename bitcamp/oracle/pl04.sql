/*
    3�� ���
    procedure   insert, delete, update
    function    select
    ������ : ȣ���ؾ� ����, return ���� �ݵ�� �־�� �Ѵ�.
    
    trigger     �˹߽�Ű��. ������ �߻�
    insert      old����,
    delete      new ����,
    update      old new ��� ���
    ������ ȣ������� ���� ȣ���� �ȵȴ� 
*/

SET SERVEROUTPUT ON

-- triger�� �ۿ��� ȣ���ϴ� �� �ƴϱ� ������ �Ű������� ����
CREATE OR REPLACE TRIGGER triger_test
    BEFORE
    -- departments ���̺��� update�� ����Ǳ� ����
        UPDATE ON departments
        FOR EACH ROW 
        -- ��� ROW�� ����
BEGIN
    DBMS_OUTPUT.PUT_LINE('������ �÷��� �� : ' || :OLD.department_name);
    DBMS_OUTPUT.PUT_LINE('������ �÷��� �� : ' || :NEW.department_name);
END;
/

UPDATE departments
SET department_name = '���ߺ�'
WHERE department_id = 60;

ROLLBACK;

-- �������� triger�� ���� ��ų ���� �ְ� �����Ŀ� triger�� ���� ��ų ���� �ִ�
CREATE OR REPLACE TRIGGER sum_triger
    BEFORE
        INSERT OR UPDATE ON employees
        -- INSERT�� �ϰų� UPDATE�� �� ��
        FOR EACH ROW
DECLARE
    avg_sal NUMBER;
BEGIN
    SELECT ROUND(AVG(salary), 3) INTO avg_sal
    FROM employees;
    
    DBMS_OUTPUT.PUT_LINE('�޿���� : ' || avg_sal);
END;
/

SELECT ROUND(AVG(salary), 3)
FROM employees;

INSERT INTO employees(employee_id, last_name,
    hire_date, department_id, job_id, salary, email)
VALUES(510, 'tiger', sysdate, 60, 'IT_PROG', 10000, 'tiger123r@naver.com');



-- ����� �������� ���ϰ� �� ���
-- ���� �� �� ���� �� ���
-- �Է� �� �� ���� �� ���
CREATE OR REPLACE TRIGGER emp_trigger
    BEFORE
    UPDATE OR DELETE OR INSERT ON employees
    FOR EACH ROW
BEGIN
    IF UPDATING THEN
        IF :OLD.employee_id = '100' THEN
            RAISE_APPLICATION_ERROR(-20001, '�̹�ȣ�� ������ �� �����ϴ�');
        END IF;
    END IF;

END;
/

UPDATE employees
SET salary = 2500
WHERE employee_id = 100;


-- Ʈ���Ŵ� �ݵ�� ������!!!
DROP TRIGGER EMP_TRIGGER;
DROP TRIGGER SUM_TRIGER;
DROP TRIGGER TRIGER_TEST;









