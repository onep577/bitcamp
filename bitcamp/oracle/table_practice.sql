-- hr ����
-- 7.ppt
-- ����1) EMPLOYEES ���̺��� �μ����� �ο���, ��� �޿�, �޿��� ��, �ּ� �޿�,
-- �ִ� �޿��� �����ϴ� EMP_DEPTNO ���̺��� �����϶�
CREATE TABLE EMP_DEPTNO
AS
SELECT department_id AS DEPTNO, COUNT(department_id) AS E_COUNT,
    AVG(salary) AS E_ACG, SUM(salary) AS E_SUM,
    MIN(salary) AS E_MIN, MAX(salary) AS E_MAX
FROM EMPLOYEES
GROUP BY department_id;

SELECT * FROM EMP_DEPTNO;
DROP TABLE EMP_DEPTNO;
-- ����2) EMP_DEPTNO ���̺� ETC COLUMN�� �߰��϶�.
-- ��, �ڷ����� VARCHAR2(50) ����϶�
ALTER TABLE EMP_DEPTNO
ADD
ETC_COLUMN VARCHAR2(50);
ALTER TABLE EMP_DEPTNO
ADD
(ETC_COLUMN VARCHAR2(50));
-- ����3) EMP_DEPTNO ���̺� ETC COLUMN�� �����϶�.
-- �ڷ����� VARCHAR2(15)�� �϶�.
ALTER TABLE EMP_DEPTNO
MODIFY
(ETC_COLUMN VARCHAR2(15));
-- ����4) EMP_DEPTNO ���̺� �ִ� ETC�� �����ϰ� Ȯ���϶�.
ALTER TABLE EMP_DEPTNO
DROP
COLUMN ETC_COLUMN;
SELECT * FROM EMP_DEPTNO;
-- ����5) ������ ������ EMP_DEPTNO ���̺��� �̸��� EMP_DEPT�� �����϶�
RENAME EMP_DEPTNO
TO EMP_DEPT;

SELECT * FROM EMP_DEPT;
-- ����6) EMP_DEPT ���̺��� �����϶�
DROP TABLE EMP_DEPT
CASCADE CONSTRAINTS;
-- �ſ� �߿�!
-- ���̺��� �����ϸ� �ȿ� �����͸� �������� ���Ἲ�� �� �����´�
-- ����7) EMPLOYEES ���̺��� EMP ���̺��� �����ϰ� �����ϵ��� �϶�.(������ ����)
CREATE TABLE EMP
AS
SELECT *
FROM EMPLOYEES;

SELECT * FROM EMP;
-- ����8) EMP ���̺� row�� �߰��� ���ϴ�.
-- �ٸ�, �ݵ�� �����͸� ������ ���ص� �Ǹ�, NULL�� �����ϵ��� �Ѵ�.
INSERT INTO EMP(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER,
    HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
VALUES('500','','HWANG','A@NAVER.COM','',
    TO_DATE('2019/06/24','YYYY-MM-DD'),'IT_PROG','','','','');

ROLLBACK;
-- ����9) EMPLOYEES ���̺��� EMPNO, ENAME, SAL, HIREDATE�� COLUMN��
-- �����Ͽ� EMP_10 ���̺��� ����(������ ������)�� �� 10�� �μ��� �����Ͽ� �̿�
-- �����ϴ� ���� EMP_10 ���̺� �Է��϶�.
DROP TABLE EMP_10;

CREATE TABLE EMP_10(ID, NAME, SAL, HIREDATE)
AS
SELECT employee_id, first_name, salary, hire_date
FROM EMPLOYEES
WHERE 1=2;

SELECT * FROM employees WHERE department_id = 10;

INSERT INTO EMP_10
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, HIRE_DATE
FROM employees WHERE department_id = 10;

SELECT * FROM EMP_10;
-- ����10) EMPLOYEES ���̺��� ��� ��ȣ�� 107�� ����� �μ��� 10������ �����Ͽ���.
SELECT department_id FROM employees WHERE employee_id = 107; -- 60

UPDATE EMPLOYEES
SET DEPARTMENT_ID = 10
WHERE employee_id = 107;

ROLLBACK;

-- ����11) EMPLOYEES ���̺��� ��� ��ȣ�� 180�� ����� �μ��� 20,
-- �޿��� 3500���� �����Ͽ���.
SELECT * FROM employees WHERE employee_id = 180; -- 50, 3200

UPDATE employees
SET department_id = 20, salary = 3500
WHERE employee_id = 180;
-- ����12) EMPLOYEES ���̺��� Smith�� ������ �޿���
-- Hall�� ������ �޿��� ��ġ�ϵ��� �����϶�.
SELECT * FROM employees WHERE last_name = 'Smith';

UPDATE employees
SET (job_id, salary) = (SELECT job_id, salary -- sa_rep, 9000
                        FROM employees
                        WHERE last_name = 'Hall')
WHERE last_name = 'Smith';







-- SCOTT ����
-- TABLE ����.TXT
-- ����1) EMP ���̺��� EMPNO,ENAME,SAL,HIREDATE�� COLUMN�� �����Ͽ�
-- EMP_10 ���̺��� ������ �� 10�� �μ��� �����Ͽ� �̿� �����ϴ� ���� EMP_10���̺� �Է��Ͽ���.
DROP TABLE EMP_10;

CREATE TABLE EMP_10(EMPNO, ENAME, SAL, HIREDATE)
AS
SELECT EMPNO, ENAME, SAL, HIREDATE
FROM EMP
WHERE 1=2;

INSERT INTO EMP_10
SELECT EMPNO, ENAME, SAL, HIREDATE
FROM EMP
WHERE DEPTNO = 10;

SELECT * FROM EMP_10;
-- ����2) EMP ���̺��� ��� ��ȣ��7369�� ����� �μ��� 10������ �����Ͽ���.
UPDATE EMP
SET DEPTNO = 10
WHERE EMPNO = 7369;

SELECT * FROM EMP;
-- ����3) EMP ���̺��� ��� ��ȣ��7369�� ����� �μ��� 20, �޿��� 3500���� �����Ͽ���.
UPDATE EMP
SET DEPTNO = 20, SAL = 3500
WHERE EMP_10 = 7369;

-- ����4) EMP ���̺��� 10�� �μ��� ����� ��� 30�� �μ��� �����Ͽ���.
UPDATE EMP
SET DEPTNO = 30
WHERE DEPTNO = 10;

SELECT * FROM EMP;
-- ����5) DEPT ���̺��� �μ� ��ȣ 10�� 15�� �����Ͽ���.
SELECT * FROM DEPT;

UPDATE DEPT
SET DEPTNO = 15
WHERE DEPTNO = 10;
-- ����6) EMP ���̺��� �����ȣ�� 7499�� ����� ������ �����Ͽ���.
SELECT * FROM EMP;

DELETE
FROM EMP
WHERE EMPNO = 7499;
-- ����7) EMP ���̺��� �Ի����ڰ� 80���� ����� ������ �����Ͽ���.
SELECT * FROM EMP;

DELETE EMP
WHERE TO_CHAR(HIREDATE, 'YY') = '80';

ROLLBACK;
-- 1. �Ʒ��� ������ �����ϴ� MY_DATA ���̺��� �����Ͻÿ�. �� ID�� PRIMARY KEY�̴�.
CREATE TABLE MY_DATE(
    ID      NUMBER(4) NOT NULL,
    NAME    VARCHAR2(10),
    USERID  VARCHAR2(30),
    SALARY  NUMBER(10,2),
    CONSTRAINT PK_MY_DATE PRIMARY KEY(ID)
);

-- 2. 1���� ���� ������ ���̺� �Ʒ��� ���� �Է��Ͽ���.
INSERT INTO MY_DATE(ID, NAME, USERID, SALARY)
VALUES ('1', 'Scott', 'sscott', '10000');

INSERT INTO MY_DATE
VALUES ('2', 'Ford', 'fford', '13000');

INSERT INTO MY_DATE
VALUES ('3', 'Patel', 'ppatel', '33000');

INSERT INTO MY_DATE
VALUES ('4', 'Good', 'ggood', '44450');

SELECT * FROM MY_DATE;
-- 3. ID�� 3���� ����� �޿��� 65,000.00���� �����ϰ� ���������� �����ͺ��̽��� �ݿ��Ͽ���.
UPDATE MY_DATE
SET SALARY = 65000
WHERE ID = '3';

SELECT * FROM MY_DATE;

COMMIT;
-- 4. �̸��� Ford�� ����� ���� �����Ͽ���.
DELETE
FROM MY_DATE
WHERE NAME = 'Ford';

SELECT * FROM MY_DATE;

COMMIT;
-- 5. �޿��� 15,000������ ����� �޿��� 15,000�� �����Ͽ���.
UPDATE MY_DATE
SET SALARY = 15000
WHERE SALARY < 15000;

-- 6. 1������ ������ ���̺��� �����Ͽ���.
DROP TABLE MY_DATE;







