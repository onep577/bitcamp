-- SOCTT ����
-- ORDER BY �� : ����
SELECT *
FROM emp
-- ORDER BY sal ASC; -- �ø� ���� ����
-- ORDER BY sal DESC; -- ���� ���� ����
-- ORDER BY sal, ename;
ORDER BY deptno ASC, sal DESC;
-- deptno �������� ���� �� sal �������� �����Ѵ�

-- ALIAS
SELECT empno, ename, sal*12 as annsal
FROM emp
ORDER BY annsal asc;

-- nulls first �Ǵ� nulls last Ű����
SELECT *
FROM emp
ORDER BY comm NULLS FIRST;
-- NULL ���� ��������� ������ ó���� ����Ѵ�

SELECT *
FROM emp
ORDER BY MGR NULLS LAST;
-- NULL ���� ��������� ������ �������� ����Ѵ�

-- �ǽ�
-- SCOTT ����
-- 19) EMP ���̺��� �����ȣ, ����̸� �Ի����� ����ϴµ� �Ի�����
-- ���� ��������� ����
SELECT empno, ename, hiredate
FROM EMP
ORDER BY HIREDATE ASC;
-- 20) EMP ���̺��� ����̸�, �޿�, ������ ���ϰ� ������ ���� ������ ����
SELECT ename, sal, sal*12 AS ����
FROM EMP
ORDER BY ���� DESC;
-- 21) 10�� �μ��� 20�� �μ����� �ٹ��ϰ� �ִ� ����� �̸��� �μ���ȣ�� �����
-- �µ� �̸��� �����ڼ����� ǥ��
SELECT ename, deptno
FROM EMP
WHERE deptno IN (10, 20)
ORDER BY ename ASC;
-- 22) Ŀ�̼��� �޴� ��� ����� �̸�, �޿� �� Ŀ�̼���
-- Ŀ�̼��� �������� ������������ ����
SELECT ename, sal, comm
FROM EMP
WHERE comm IS NOT NULL 
    -- AND comm != 0
    AND comm <> 0
ORDER BY comm DESC;

-- HR ����
-- 1) EMPLOYEES ���̺��� �Ի����ڼ����� �����Ͽ� �����ȣ, �̸�, ����, �޿�,
-- �Ի�����, �μ���ȣ�� ���
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM EMPLOYEES
ORDER BY hire_date ASC;
-- 2) EMPLOYEES ���̺��� ���� �ֱٿ� �Ի��� ������ �����ȣ, �̸�, ����,
-- �޿�, �Ի�����, �μ���ȣ�� ���
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM EMPLOYEES
ORDER BY hire_date DESC;
-- 3) EMPLOYEES ���̺��� �μ���ȣ�� ������ �� �μ���ȣ�� ���� ��� �޿���
-- ���� ������ �����Ͽ� �����ȣ, ����, ����, �μ���ȣ, �޿��� ���
SELECT employee_id, first_name, job_id, department_id, salary
FROM EMPLOYEES
ORDER BY department_id ASC, salary DESC;
-- 4) EMPLOYEES ���̺��� ù��° ������ �μ���ȣ�� �ι�° ������ ������ ����° ������
-- �޿��� ���� ������ �����Ͽ� �����ȣ, ����, �Ի�����, �μ���ȣ, ����, �޿��� ���
SELECT employee_id, first_name, hire_date, department_id, job_id, salary
FROM EMPLOYEES
ORDER BY department_id ASC, job_id ASC, salary DESC;














