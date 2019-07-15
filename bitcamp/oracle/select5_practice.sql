-- ����1) EMPLOYEES ���̺��� King�� ������ �ҹ��ڷ� �˻��ϰ� 
-- �����ȣ, ����, ������(�ҹ��ڷ�),�μ���ȣ�� ����϶�.
SELECT employee_id, LOWER(last_name), LOWER(job_id), department_id
FROM employees
WHERE LOWER(last_name) = 'king';

-- ����2) EMPLOYEES ���̺��� King�� ������ �빮�ڷ� �˻��ϰ� 
-- �����ȣ, ����, ������(�빮�ڷ�),�μ���ȣ�� ����϶�.
SELECT employee_id, upper(last_name), upper(job_id), department_id
FROM employees
WHERE upper(last_name) = 'KING';

-- ����3) DEPARTMENTS ���̺��� (�μ���ȣ�� �μ��̸�), 
--    �μ��̸��� ��ġ��ȣ�� ���Ͽ� ����ϵ��� �϶�.
SELECT department_id || ' ' || department_name,
    department_name || ' ' || location_id
FROM departments;

SELECT CONCAT(department_id, department_name),
    CONCAT(department_name, location_id)
FROM departments;

-- ����4) EMPLOYEES ���̺��� �̸��� 
-- ù ���ڰ� ��K�� ���� ũ�� ��Y������ ���� ����� ������ 
-- �����ȣ, �̸�, ����, �޿�, �μ���ȣ�� ����϶�. 
-- �� �̸������� �����Ͽ���.
SELECT employee_id, first_name, job_id, salary, department_id
FROM employees
WHERE SUBSTR(first_name, 1, 1) > 'K'
    AND SUBSTR(first_name, 1, 1) < 'Y'
ORDER BY first_name ASC;

-- ����5) EMPLOYEES ���̺��� 20�� �μ� �� 
-- �̸��� ���� �� 
-- �޿��� �ڸ����� 
-- �����ȣ, �̸�, �̸��� �ڸ���(LENGTH), �޿�, �޿��� �ڸ����� ����϶�.
SELECT employee_id, first_name, LENGTH(first_name), salary, LENGTH(salary),
    department_id
FROM employees
WHERE department_id = 20;

-- ����6) EMPLOYEES ���̺��� �̸� �� ��e������ ��ġ�� ����϶�.
SELECT first_name, INSTR(first_name, 'e', 1, 1)
FROM employees;

-- ����7) ������ ������ �����ϰ� ����� �м��϶�.
SELECT  ROUND(4567.678), 
        ROUND(4567.678, 0), 
        ROUND(4567.678, 2),
        ROUND(4567.678, -2)
FROM dual;

-- ����8) EMPLOYEES ���̺��� �μ���ȣ�� 80�� 
-- ����� �޿��� 30���� ���� �������� ���Ͽ� ����϶�.
SELECT first_name, MOD(salary, 30), salary, department_id
FROM employees
WHERE department_id = 80;

-- ����9) EMPLOYEES ���̺��� 30�� �μ� �� �̸��� ��� ������ �����Ͽ� ����Ͽ���. 
-- �� ��� ������ �� �� �Ʒ��� ����϶�.
SELECT first_name || CHR(10) || job_id      -- ASCII('A') -> 65   CHR(65) -> A
FROM employees
WHERE department_id = 30;           -- chr(10)  \n

-- ����10) EMPLOYEES ���̺��� ������� �ٹ��� ���� ���� ���� �ΰ��� ����Ͽ���. 
-- �� �ٹ� �ϼ��� ���� ��� ������ ����Ͽ���.
SELECT last_name, hire_date, TO_DATE('09/06/12'),
    trunc(TO_DATE('09/06/12') - hire_date) AS "�ѱٹ� �ϼ�",    
    trunc((TO_DATE('09/06/12') - hire_date) / 7) AS "�ѱٹ� ���ϼ�",    
    MOD((TO_DATE('09/06/12') - hire_date), 7) AS "���� �ϼ�"    
FROM employees
ORDER BY "�ѱٹ� �ϼ�" DESC;

-- ����11) EMPLOYEES ���̺��� �μ� 50���� �޿� �տ� $�� �����ϰ� 3�ڸ����� ,�� ����϶�
SELECT first_name, department_id, salary, TO_CHAR(salary, '$999,999,999')
FROM employees
WHERE department_id = 50;

-- ����12) ������ ����� �м��Ͽ� ���ƶ�.
SELECT EMPLOYEE_ID,LAST_NAME, JOB_ID, SALARY,
    DECODE(JOB_ID,
        'IT_PROG', SALARY*1.1,
        'ST_MAN', SALARY*1.15,
        'SA_MAN', SALARY*1.2, SALARY) d_sal
FROM EMPLOYEES
WHERE JOB_ID IN('IT_PROG', 'ST_MAN', 'SA_MAN')
ORDER BY SALARY DESC;

-- �׷� �Լ� �ǽ� ����
-- ����1) EMPLOYEES ���̺��� ��� SALESMAN(SA_)�� ���Ͽ� 
-- �޿��� ���, �ְ��, ������, �հ踦 ���Ͽ� ����Ͽ���.
-- COUNT, SUM, AVG, MAX, MIN
SELECT AVG(salary), MAX(salary), MIN(salary), SUM(salary)
FROM employees
WHERE job_id LIKE 'SA%';

-- ����2) EMPLOYEES ���̺� ��ϵǾ� �ִ� �ο���, ���ʽ��� NULL�� �ƴ� 
-- �ο���, ���ʽ��� ���, ��ϵǾ� �ִ� �μ��� ���� ���Ͽ� ����϶�.
SELECT COUNT(employee_id), COUNT(*), TRUNC(AVG(commission_pct * SALARY)),
    COUNT(DISTINCT department_id)
FROM employees;

-- ����3) EMPLOYEES ���̺��� �μ����� 
-- �ο���, ��� �޿�, �����޿�, �ְ� �޿�, �޿��� ���� ���Ͽ� ����϶�.
SELECT department_id, COUNT(*), TRUNC(AVG(salary)), MIN(salary), MAX(salary), 
    SUM(salary) AS "�޿���"
FROM employees
GROUP BY department_id;

-- ����4) EMPLOYEES ���̺��� �� �μ����� / 
-- �ο���,�޿��� ���, ���� �޿�, �ְ� �޿�, �޿��� ���� ���Ͽ� 
-- �޿��� ���� ���� ������ ����Ͽ���.
SELECT department_id, COUNT(*), TRUNC(AVG(salary)), MIN(salary), MAX(salary), 
    SUM(salary) AS "�޿���"
FROM employees
GROUP BY department_id
ORDER BY "�޿���" DESC;

-- ����5) EMPLOYEES ���̺��� �μ���, ������ �׷��Ͽ� ����� 
-- �μ���ȣ, ����, �ο���, �޿��� ���, �޿��� ���� ���Ͽ� ����Ͽ���.
SELECT department_id, job_id, COUNT(*), TRUNC(AVG(salary)), SUM(salary)
FROM employees
GROUP BY department_id, job_id;

-- ����6) EMPLOYEES ���̺��� �μ� �ο��� 4���� ���� �μ��� 
-- �μ���ȣ, �ο���, �޿��� ���� ���Ͽ� ����Ͽ���
SELECT department_id, COUNT(*), SUM(salary)
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 4;

-- ����7) EMPLOYEES ���̺��� �޿��� �ִ� 10000�̻��� �μ��� ���ؼ� 
-- �μ���ȣ, ��� �޿�, �޿��� ���� ���Ͽ� ����Ͽ���.
SELECT department_id, TRUNC(AVG(salary)), SUM(salary), MAX(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary) >= 10000;

-- ����8) EMPLOYEES ���̺��� ������ 
-- �޿��� ����� 10000 �̻��� ������ ���ؼ� 
-- ������,��� �޿�, �޿��� ���� ���Ͽ� ����϶�.
SELECT job_id, TRUNC(AVG(salary)), SUM(salary)
FROM employees
GROUP BY job_id
HAVING AVG(salary) >= 10000;

-- ����9) EMPLOYEES ���̺��� ��ü ������ 10000�� �ʰ��ϴ� 
-- �� ������ ���ؼ� ������ ���޿� �հ踦 ����϶�. 
-- �� �Ǹſ��� �����ϰ� SA%
-- �� �޿� �հ�� ����(��������)�϶�.(SA_)
SELECT job_id, SUM(SALARY)
FROM employees
WHERE job_id NOT LIKE 'SA%'
GROUP BY job_id
HAVING SUM(SALARY) > 10000
ORDER BY SUM(salary) DESC;

-- SCOTT
--23) emp���̺��� ����(job)�� ù���ڴ� �빮�� �������� �ҹ��ڷ� ����Ͻÿ�.
-- INITCAP
SELECT job, INITCAP(job)
FROM EMP;

--24) emp���̺��� ����̸� �� A�� ���Ե� ����̸��� ���ϰ� 
-- �� �̸� �� �տ��� 3�ڸ� �����Ͽ� ���
SELECT ename, SUBSTR(ename, 1, 3)   -- SUBSTR("ABCDE", 1, 4) ->  BCD
FROM emp
WHERE ename LIKE '%A%';

--25) �̸��� ����° ���ڰ� A�� ��� ����� �̸��� ǥ���Ͻÿ�.
SELECT ename
FROM emp
WHERE SUBSTR(ename, 3, 1) = 'A';

--26) �̸��� J,A �Ǵ� M���� �����ϴ� ��� ����� �̸�
-- (ù ���ڴ� �빮�ڷ�, ������ ���ڴ� �ҹ��ڷ� ǥ��) INITCAP
-- �� �̸��� ���̸� ǥ���Ͻÿ�.(�� ���̺��� name�� length�� ǥ��)    LENGTH
SELECT INITCAP(ename) AS NAME, LENGTH(ename) AS LENGTH
FROM emp
WHERE ename LIKE 'A%' OR ename LIKE 'J%' OR ename LIKE 'M%';

--27) �̸��� ���ڼ��� 6�� �̻��� ����� �̸��� �ҹ��ڷ� �̸��� ����Ͻÿ�
SELECT LOWER(ename)
FROM emp
WHERE LENGTH(ename) >= 6; 

--28) �̸��� ���ڼ��� 6�� �̻��� ����� �̸��� �տ��� 3�ڸ� ���Ͽ� �ҹ��ڷ� ����Ͻÿ�.
SELECT LOWER(SUBSTR(ename, 1, 3))
FROM emp
WHERE LENGTH(ename) >= 6; 

--29) ��� ����� �̸��� �޿��� ǥ���Ͻÿ�. �޿��� 15�� ���̷� ���ʿ� $��ȣ�� ä���� ��������
--    ǥ���ϰ� �����̺��� SALARY�� �����Ͻÿ�. LPAD
SELECT ename, sal, LPAD(sal, 15, '$') AS SALARY
FROM emp;









/*
    Join : �ٸ� ���̺� ����Ǿ� �����͸� �����ϱ� ���� ó��
    employees -> �μ���ȣ     
    �μ��� -> departments �μ���ȣ    
    blank -> �μ���ȣ -> departments �μ���ȣ -> �μ���
*/
-- ����1) Steven King�� �μ����� ����϶�.
SELECT e.last_name, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
    AND e.last_name = 'King'    
    AND e.first_name = 'Steven';

-- ����2) IT�μ����� �ٹ��ϰ� �ִ� ������� ����϶�.
SELECT e.first_name, e.job_id,
    e.department_id, d.department_id,
    d.department_name 
FROM employees e, departments d
WHERE e.department_id = d.department_id
    AND d.department_name = 'IT';

-- ����3) EMPLOYEES ���̺�� DEPARTMENTS ���̺���  Cartesian Product(��� ������ ����� Join)�Ͽ� 
-- �����ȣ,�̸�,����,�μ���ȣ,�μ���,�ٹ����� ����Ͽ���.  -- cross join
SELECT
    *
FROM employees e, departments d;

-- ����4) EMPLOYEES ���̺��� �����ȣ,�̸�,����, 
-- EMPLOYEES ���̺��� �μ���ȣ, DEPARTMENTS ���̺��� �μ���ȣ,�μ���,�ٹ����� ����Ͽ���.
SELECT e.employee_id, e.first_name, e.job_id,
    e.department_id, d.department_id,
    d.department_name, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id;

-- ����5) EMPLOYEES ���̺�� DEPARTMENTS ���̺��� �μ���ȣ�� �����ϰ�
-- SA_MAN ������� �����ȣ,�̸�,�޿�,�μ���,�ٹ����� ����϶�.
SELECT e.employee_id, e.first_name, e.salary, e.job_id,
    e.department_id, d.department_id,
    d.department_name, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id
    AND e.job_id = 'SA_MAN';

-- ����6) EMPLOYEES ���̺�� DEPARTMENTS ���̺��� 
-- DEPARTMENTS ���̺� �ִ� ��� �ڷḦ 
-- �����ȣ,�̸�,����, EMPLOYEES ���̺��� �μ���ȣ, DEPARTMENTS ���̺��� �μ���ȣ,
-- �μ���,�ٹ����� ����Ͽ���
SELECT e.employee_id, e.first_name, e.job_id,
    e.department_id, d.department_id, d.department_name, d.location_id
FROM departments d, employees e
WHERE d.department_id = e.department_id(+);

-- ����7) EMPLOYEES ���̺��� Self join�Ͽ� ������(�Ŵ���)�� ����Ͽ���.
SELECT a.first_name || '�� ���� ' || b.first_name || '�Դϴ�'
FROM employees a, employees b   -- ���, �Ŵ���
WHERE a.manager_id = b.employee_id;

-- ����8) EMPLOYEES ���̺��� left join�Ͽ� ������(�Ŵ���)�� ����ϰ�
-- �Ŵ��� ���̵� ���� ����� �����ϰ� ��������� �ϸ�,  �޿��� �������� ����϶�.     
SELECT a.employee_id, a.first_name, 
    a.manager_id, b.employee_id,
    b.first_name
FROM employees a, employees b
WHERE a.manager_id = b.employee_id(+)
START WITH a.manager_id IS NOT NULL
CONNECT BY a.manager_id = PRIOR a.employee_id
ORDER BY a.salary DESC;

-- ����9) EMPLOYEES ���̺��� right join�Ͽ� 
-- ������(�Ŵ���)�� 108�� 
-- ��������� 
-- �޿��� �������� ����϶�.
SELECT a.employee_id, a.first_name, a.salary,
    a.manager_id, b.employee_id,
    b.first_name
FROM employees a, employees b
WHERE a.manager_id(+) = b.employee_id
    AND a.manager_id = 108
CONNECT BY PRIOR a.manager_id = a.employee_id
ORDER BY a.salary DESC;

-- scott
-- 50) ��� ����� �̸�, �μ���ȣ, �μ��̸��� ǥ���Ͻÿ�.(emp,dept)
SELECT e.ename, 
    e.deptno, d.deptno,
    d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno;

--51) ������ MANAGER�� ����� ������ �̸�,����,�μ���,�ٹ��� ������
--    ����Ͻÿ�.(emp,dept)
SELECT e.ename, e.job, d.dname, d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno
    AND e.job = 'MANAGER';

-- 52) Ŀ�̼��� �ް� �޿��� 1,600�̻��� ����� ����̸�,�μ���,�ٹ����� ����Ͻÿ�
SELECT e.ename, d.dname, d.loc, e.sal, e.comm
FROM emp e, dept d
WHERE e.deptno = d.deptno
    AND e.comm IS NOT NULL
    AND e.comm <> 0
    AND e.sal >= 1600;

-- 53) �ٹ����� CHICAGO�� ��� ����� �̸�,����,�μ���ȣ �� �μ��̸��� ǥ���Ͻÿ�.
SELECT e.ename, e.job, e.deptno, d.deptno, d.dname, d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno
    AND d.loc = 'CHICAGO';

-- 54) �ٹ������� �ٹ��ϴ� ����� ���� 5�� ������ ���, �ο��� ���� ���ü����� �����Ͻÿ�.
-- (�ٹ� �ο��� 0���� ���� ǥ��)
SELECT d.loc, COUNT(e.empno)
FROM emp e, dept d
WHERE e.deptno(+) = d.deptno
GROUP BY d.loc
HAVING COUNT(e.empno) <= 5
ORDER BY COUNT(e.empno) ASC;

-- 55) ����� �̸� �� ��� ��ȣ�� �������� �̸��� ������ ��ȣ�� �Բ� ǥ���ϰ� 
-- ������ �� ���̺��� employee, emp#, manager, mgr#�� �����Ͻÿ�.
SELECT a.ename employee, a.empno emp#,
    b.ename manager, b.empno mgr#
FROM emp a, emp b
WHERE a.mgr = b.empno;

-- 56) �����ں��� ���� �Ի��� ��� ����� �̸� �� �Ի����� 
-- �������� �̸� �� �Ի��ϰ� �Բ� ǥ���ϰ� �����ں��� �Ի����� ���� ����� �����϶�.
-- �� ���̺��� ���� employee, emp hired, manager, mgr hired�� ����
SELECT a.ename employee, a.hiredate "emp hired", b.ename manager, b.hiredate "mgr hired"
FROM emp a, emp b
WHERE a.mgr = b.empno
    AND a.hiredate < b.hiredate;

-- 57) ����� �̸� �� �����ȣ�� �������� �̸��� ������ ��ȣ�� �Բ� ǥ���ϰ� 
-- ������ �� ���̺��� employee, emp#, manager, mgr#�� �����ϴµ� 
-- King�� �����Ͽ� �����ڰ� ���� ��� ����� ǥ���ϵ��� �ϰ� 
-- ����� �����ȣ�� �������� ����
SELECT a.ename employee, a.empno emp#, b.ename manager, b.empno mgr# 
FROM emp a, emp b
WHERE a.mgr = b.empno(+)
ORDER BY a.empno ASC;

-- 58) ������ �μ���ȣ, ����̸� �� ������ ����� ������ �μ����� �ٹ��ϴ� 
-- ��� ����� ǥ���ϵ��� ���Ǹ� �ۼ��ϰ� 
-- �μ���ȣ�� department, ����̸��� employee, ������ �μ����� �ٹ��ϴ� ����� colleague�� ǥ���Ͻÿ�.
-- (�μ���ȣ, ����̸�,���� ������ �������� ����) 
SELECT a.empno employee, a.deptno department, b.deptno, b.empno colleague
FROM emp a, emp b   -- �����(a), ����(b)
WHERE a.deptno = b.deptno
    AND a.empno != b.empno
ORDER BY a.deptno, a.ename, b.ename;

-- 59)10�� �μ����� �ٹ��ϴ� ������� 
-- �μ���ȣ, �μ��̸�, ����̸�, ����, �޿������ ����Ͻÿ�.
SELECT e.deptno, d.dname, e.ename, e.sal, s.grade
FROM emp e, dept d, salgrade s
WHERE e.deptno = d.deptno
    AND e.deptno = 10
    -- AND e.sal >= s.losal AND e.sal <= s.hisal
    AND e.sal BETWEEN s.losal AND s.hisal;



