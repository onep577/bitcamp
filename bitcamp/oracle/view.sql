/*
    view : ���� ���̺�
    ���� ����Ǵ� ���� �ƴϴ�(view) --> pointer

    �並 ���� �ٸ� ���� ����
    â���� �ݰ� ������ ���̺��� ��, �����͸� ���Բ��� �� ���� �ִ�
    
    int *p;
    int number;
    p = &number;
    �Ѱ��� View�� �������� ���̺��� �����͸� �˻��ϴ� ���� �����ϴ�.
    
    �ӵ��� ������.
    ������ ������ �� �ִ� --> readonly
*/

CREATE VIEW UB_TEST_01(
    JOB_ID,
    JOB_TITLE,
    MIN_SALARY
)
AS
SELECT job_id, job_title, min_salary
FROM jobs;

SELECT * FROM UB_TEST_01;
-- VIEW�� ���� JOBS ���̺��� ���� ���̴�. ����â�� ���� ���� ����

INSERT INTO ub_test_01
VALUES('DEVELOPER', '������', 1000);
-- VIEW�� �ִ� ��ó�� �������� VIEW�� ���� JOBS ���̺� �ִ´�
-- VIEW�� �����ϴ� ���̺��� �ƴϴ�

SELECT * FROM jobs;

ROLLBACK;   -- ������ �ǵ�����
COMMIT;     -- ������ �ֱ�



/*
���Ἲ : CONSTRAINT
PRIMARY KEY �⺻Ű     UNIQUE KEY + NOT NULL
UNIQUE KEY  ����Ű     �ϳ��ۿ� ���� + NULL ���
NOT NULL              NULL�� ������� �ʴ´�
CHECK                 ������ ���̳� �������� �� �̿ܿ� NULL�� ���
FOREIGN               1.TABLE, 2.TABLE ���� NULL ���
*/
CREATE TABLE TB_TEST_02(
    KEY_01 VARCHAR2(10),
    KEY_02 VARCHAR2(10),
    COL_01 VARCHAR2(20),
    COL_02 VARCHAR2(20),
    CONSTRAINT PK_TEST_02 PRIMARY KEY(KEY_01, KEY_02)
);

CREATE OR REPLACE VIEW UB_TEST_02(
    KEY_01,
    KEY_02,
    COL_01,
    CONSTRAINT PK_UB_TEST_02 PRIMARY KEY(KEY_01, KEY_02)
        DISABLE NOVALIDATE
        -- VIEW���� PRIMARY KEY �� �� �ؾ��Ѵ�
)
AS
SELECT KEY_01, KEY_02, COL_01
FROM TB_TEST_02;

SELECT * FROM TB_TEST_02;
SELECT * FROM UB_TEST_02;

INSERT INTO UB_TEST_02(KEY_01, KEY_02, COL_01)
VALUES('AAA', 'aaa', '111');

-- ������ AAA aaa�̰� �ؿ��� AAA AAA�̴�
-- AAA AAA�� �� ������ ����
INSERT INTO UB_TEST_02(KEY_01, KEY_02, COL_01)
VALUES('AAA', 'AAA', '111');

-- PRIMARY KEY�� NULL�� ������� �ʴ´�
-- ���� cannot insert NULL into ("HR"."TB_TEST_02"."KEY_02")
INSERT INTO UB_TEST_02(KEY_01, KEY_02, COL_01)
VALUES('AAA', '', '111');





-- READ ONLY
-- EMPLOYEES
CREATE OR REPLACE VIEW EMP_VIEW(
    "�����ȣ",
    "��",
    "�̸���",
    "�Ի���",
    "����",
    CONSTRAINT PK_UB_EMP PRIMARY KEY("�����ȣ") DISABLE NOVALIDATE
    -- PK_UB_EMP ��, ���̵� ���� �ٸ� ���̺�� ������ ���̺� ���� �ȵȴ�
    -- VIEW ��Ī�� ���󰡴� �� ���� ���
)
AS
SELECT employee_id, last_name, email, hire_date, job_id
FROM EMPLOYEES
WITH READ ONLY;
-- READ ONLY�� �����͸� �ٲٴ� �� �Ұ����ϴ�. �����͸� �� ���� �ִ�.

SELECT * FROM EMP_VIEW;

-- ���� : cannot perform a DML operation on a read-only view
INSERT INTO EMP_VIEW
VALUES(300, 'KIM', 'KIM@NAVER.COM', SYSDATE, 'iT_PROG');






-- �ΰ��� ���̺� �ִ� �����͵��� VIEW�� ���ؼ� �Ѳ����� ��� �����ϴ�.
-- OR REPLACE �ɼ��̴ϱ� ���� �ȴ�
CREATE OR REPLACE VIEW DEPT_EMP_VIEW
AS
SELECT e.employee_id, e.first_name, d.department_name, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id
WITH READ ONLY;

SELECT * FROM DEPT_EMP_VIEW;


