-- (DML) SELECT, DELETE, SELECT(90%), UPDATE
-- PL : ��Ŭ�������� ���� �ȵȴ�
SELECT * FROM EMP; -- SCOTT ����
SELECT * FROM EMPLOYEES; -- HUMAN RESOURCE (HR) ����
/*
SELECT �� ����
    *  ��� (��, ����, COLUMN, �Լ�, SUB QUERY)
FROM �� ���̺��, SUB QUERY
*/

SELECT 1 FROM DUAL;

-- ���� ������ ���̺� ��� �����ش�
SELECT * FROM TAB;


-- SCOTT ����
SELECT * FROM EMP;
-- ���̺��� ���ϴ� COLUMN���� �����ش�
SELECT EMPNO, ENAME, SAL FROM EMP;

-- DUAL : �������̺�
SELECT SYSDATE FROM DUAL;
SELECT 4 * 7 FROM DUAL;
SELECT 'HELLO' || 'HELLO' FROM DUAL;
-- ���ڿ��� ���� ����ǥ����
SELECT ROUND(10.5) FROM DUAL;
-- �ݿø�

-- �̸�, ����, ���� 300�޷� �λ�
SELECT ename, sal, sal + 300
FROM EMP;

-- ����, ����
SELECT sal, sal*12
FROM EMP;

-- ALIAS int alias[] = array;   alias[0] = 12;
-- �߰��� NULL���� ������ �� �ֵ���ǥ ���� ALIAS���� ���� ����
-- �� ��  ����,  "�� ��"  �����۵�
SELECT sal AS "����", sal*12 AS "����"
FROM EMP;

-- ���� ������  || "ABC" + "DEF"   "ABC" || "DEF"
SELECT ename || ' has $' || sal
FROM EMP;

-- distint : �ߺ���(row) ���� --> group by
-- ��ü �μ� ���
SELECT deptno FROM EMP;
-- � �μ��� �ִ��� �˰���� �� �ߺ��μ� �����ϸ� �� �� �ִ�
SELECT DISTINCT deptno FROM EMP;

-- DESC : ���̺��� COLUMN�� �ڷ��� ������ �����ش�
DESC EMP;



-- �ǽ�
-- SCOTT ����
SELECT * FROM EMP;
-- 1) EMP ���̺��� �����ȣ, ����̸�, ������ ����Ͻÿ�
SELECT EMPNO, ENAME, SAL
FROM EMP;
-- 2) EMP ���̺��� ����̸��� ������ ����ϴµ� �÷����� �� ��, �� ������
-- �ٲ㼭 ����Ͻÿ�
SELECT ENAME AS "��  ��", SAL AS "��  ��"
FROM EMP;
-- 3) EMP ���̺��� �����ȣ, ����̸�, ����, ������ ���ϰ� ���� �÷�����
-- �����ȣ, ����̸�, ����, �������� ����Ͻÿ�
SELECT EMPNO AS "�����ȣ", ENAME AS "����̸�", SAL AS "����", SAL*12 AS "����"
FROM EMP;
-- 4) EMP ���̺��� ����(JOB)�� �ߺ����� �ʰ� ǥ���Ͻÿ�
SELECT DISTINCT JOB
FROM EMP;

-- HR ����
-- 5) EMP ���̺��� �����ȣ, �̸�, �޿�, ���ʽ�, ���ʽ� �ݾ� ���
-- (����� ���ʽ��� ���� + (����*Ŀ�̼�))
-- NVL(�÷���, 0) ���� NULL�̸� �ڿ� ���� �־�����
SELECT employee_id, first_name, salary, NVL(commission_pct, 0),
    NVL(salary + (salary * commission_pct), 0)
FROM EMPLOYEES;
SELECT * FROM EMPLOYEES;
-- 6) EMPLOYEES ���̺��� LAST_NAME�� �̸����� SALARY�� �޿��� ����Ͽ���
SELECT LAST_NAME AS "�̸�", SALARY AS "�޿�"
FROM EMPLOYEES;
-- 7) EMPLOYEES ���̺��� LAST_NAME�� Name���� SALARY*12��
-- Annual Salary(����)�� ����Ͽ���
SELECT LAST_NAME AS "Name", SALARY*12 AS "Annual Salary"
FROM EMPLOYEES;
-- 8) EMPLOYEES ���̺��� �̸��� ������ �����Ͽ� ����Ͽ���
SELECT LAST_NAME || ' ' || JOB_ID AS "Employees"
FROM EMPLOYEES;
-- 9) EMPLOYEES ���̺��� �̸��� ������ "King is a PRESIDENT" �������� ���
SELECT '"' || LAST_NAME || ' is a ' || JOB_ID || '"'
FROM EMPLOYEES;
-- 10) EMPLOYEES ���̺��� �̸��� ������ "King: 1 Year salary = 6000" �������� ���
SELECT '"' || LAST_NAME || ' : 1 Year salary = ' || SALARY || '"'
FROM EMPLOYEES;
-- 11) EMPLOYEES ���̺��� JOB�� ��� ����϶�
SELECT JOB_ID FROM EMPLOYEES;
SELECT DISTINCT JOB_ID FROM EMPLOYEES;




