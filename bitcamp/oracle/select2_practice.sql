-- [�ǽ�����]
-- hr ����
SELECT * FROM employees;
-- 1) EMPLOYEES ���̺���
-- (�޿��� 3000) �̻��� ����� ������
-- �����ȣ, �̸�, ������, �޿��� ���
SELECT employee_id, first_name, job_id, salary
FROM employees
WHERE salary >= 3000;
-- 2) EMPLOYEES ���̺��� ��� ������ ST_MAN�� ����� ������ �����ȣ,
-- ����, ������, �޿�, �μ���ȣ�� ���
SELECT employee_id, first_name, job_id, salary, department_id
FROM employees
WHERE job_id LIKE 'ST_MAN';
-- 3) EMPLOYEES ���̺��� �Ի����ڰ� 2006�� 1�� 1�� ���Ŀ� �Ի��� ����� ������
-- �����ȣ, ����, ������, �޿�, �Ի�����, �μ���ȣ�� ���
SELECT employee_id, first_name, job_id, salary, department_id
FROM employees
WHERE hire_date > TO_DATE('20060101', 'YYYYMMDD');
-- 4) EMPLOYEES ���̺��� �޿��� 3000���� 5000 ������ ������ ����, ������,
-- �޿�, �μ���ȣ�� ���
SELECT first_name, last_name, job_id, salary, department_id
FROM employees
WHERE salary BETWEEN 3000 AND 5000;
-- 5) EMPLOYEES ���̺��� �����ȣ�� 145,152,203�� ����� ������
-- �����ȣ, ����, ������, �޿�, �Ի����� ���
SELECT employee_id, first_name, last_name, job_id, salary, hire_date
FROM employees
WHERE employee_id IN (145, 152, 203);
-- 6) EMPLOYEES ���̺��� �Ի����ڰ� 05�⵵�� �Ի��� ����� ������
-- �����ȣ, ����, ������, �޿�, �Ի�����, �μ���ȣ ���
SELECT employee_id, first_name, last_name, job_id, hire_date, department_id
FROM employees
WHERE hire_date LIKE '05%';
-- 7) EMPLOYEES ���̺��� ���ʽ��� NULL�� ����� ������ �����ȣ, ����,
-- ������, �޿�, �Ի�����, ���ʽ�, �μ���ȣ ���
SELECT employee_id, first_name, last_name, job_id, salary, hire_date,
commission_pct*salary, department_id
FROM employees
WHERE commission_pct IS NULL;
-- 8) EMPLOYEES ���̺��� �޿��� 1100�̻��̰� JOB�� ST_MAN�� ����� ������
-- �����ȣ, ����, ������, �޿�, �Ի�����, �μ���ȣ�� ���
SELECT employee_id, first_name, last_name, job_id, salary, hire_date, department_id
FROM employees
WHERE salary >= 1100 AND job_id = 'ST_MAN';
-- 9) EMPLOYEES ���̺��� �޿��� 10000�̻��̰ų� JOB�� Manager�� �����
-- ������ �����ȣ, ����, ������, �޿�, �Ի�����, �μ���ȣ ���
SELECT employee_id, first_name, last_name, job_id, salary, hire_date, department_id
FROM employees
WHERE salary >= 10000 OR job_id = 'Manager';
-- 10) EMPLOYEES ���̺��� JOB�� ST_MAN, SA_MAN, SA_REP�� �ƴ� �����
-- ������ �����ȣ, ����, ������, �޿� �μ���ȣ�� ���
SELECT employee_id, first_name, last_name, job_id, salary, department_id
FROM employees
WHERE job_id NOT IN ('ST_MAN', 'SA_MAN', 'SA_REP');
-- 11) ������ AD_PRES �޿��� 12000�̻��̰ų� ������ SA_MAN�� ����� ������
-- �����ȣ, �̸�, ����, �޿� ���
SELECT employee_id, first_name, last_name, job_id, salary
FROM employees
WHERE job_id = 'AD_PRES' AND salary >= 12000 OR job_id = 'SA_MAN';
-- 12) ������ AD_PRES �Ǵ� SA_MAN�̰� �޿��� 12000 �̻��� ����� ������
-- �����ȣ, �̸�, ����, �޿��� ���
SELECT employee_id, first_name, job_id, salary
FROM employees
WHERE job_id IN ('AD_PRES', 'SA_MAN') AND salary > 12000;


-- SCOTT ����
SELECT * FROM EMP;
-- 6) emp ���̺��� �����ȣ�� 7698 �� ����� �̸�, ����, �޿��� ����Ͻÿ�.
SELECT ename, job, sal
FROM EMP
WHERE empno = 7698;
-- 7) emp ���̺��� ����̸��� SMITH�� ����� �̸��� ����, �μ���ȣ�� ���Ͻÿ�.
SELECT ename, sal, deptno
FROM EMP
WHERE ename = 'SMITH';
-- 8) ������ 2500�̻� 3500�̸��� ����� �̸�, �Ի���, ������ ���Ͻÿ�.
SELECT ename, hiredate ,sal
FROM EMP
WHERE sal >= 2500 AND SAL < 3500;
-- 9) �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸�, ����, �޿��� ����Ͻÿ�.
SELECT ename, hiredate ,sal
FROM EMP
WHERE sal NOT BETWEEN 2000 AND 3000;
-- 10) 81��05��01�ϰ� 81��12��03�� ���̿� �Ի��� ����� �̸�, �޿�, �Ի����� ����Ͻÿ�.
SELECT ename, sal, hiredate
FROM EMP
WHERE hiredate BETWEEN TO_DATE('81/05/01') AND TO_DATE('81/12/03');
-- 11) emp���̺��� �����ȣ�� 7566,7782,7934�� ����� ������ ������� �����ȣ,�̸�,
--     ������ ����Ͻÿ�.
SELECT empno, ename, sal
FROM EMP
WHERE empno NOT IN (7566, 7782, 7934);
-- 12) �μ���ȣ 30(deptno)���� �ٹ��ϸ� ��2,000�޷� ���ϸ� �޴� 81��05��01�� ������ 
--     �Ի��� ����� �̸�, �޿�, �μ���ȣ, �Ի����� ����Ͻÿ�.
SELECT ename, sal, deptno, hiredate
FROM EMP
WHERE deptno = 30 AND SAL <= 2000 AND hiredate <= '81/05/01';
-- 13) emp���̺��� �޿��� 2,000�� 5,000 ���̰� �μ���ȣ�� 10 �Ǵ� 30�� ����� �̸���
--     �޿�,�μ���ȣ�� �����Ͻÿ�.
SELECT ename, sal, deptno
FROM EMP
WHERE (sal BETWEEN 2000 AND 5000) AND deptno IN (10, 30);
-- 14) ������ SALESMAN �Ǵ� MANAGER�̸鼭 �޿��� 1,600, 2,975 �Ǵ� 2,850�� �ƴ�
--     ��� ����� �̸�, ���� �� �޿��� ǥ���Ͻÿ�.
SELECT ename, sal, JOB
FROM EMP
WHERE JOB IN ('SALESMAN', 'MANAGER') AND sal NOT IN (1600, 2975, 2850);
-- 15) emp���̺��� ����̸� �� S�� ���Ե��� ���� ����� �� �μ���ȣ�� 20�� �������
--     �̸��� �μ���ȣ�� ����Ͻÿ�.
SELECT ename, deptno
FROM EMP
WHERE  ename NOT LIKE '%S%' AND deptno = 20;
-- 16) emp���̺��� �̸��� A�� E�� �ִ� ��� ����� �̸��� ǥ���Ͻÿ�.
SELECT ename
FROM EMP
--WHERE  ename LIKE '%A%E%'; -- X
WHERE  ename LIKE '%A%'
    AND ename LIKE '%E%';
-- 17) emp���̺��� �����ڰ� ���� ��� ����� �̸��� ������ ǥ���Ͻÿ�.
SELECT ename, JOB
FROM EMP
WHERE MGR IS NULL;
-- 18) emp���̺��� Ŀ�̼� �׸��� �Էµ� ������� �̸��� �޿�, Ŀ�̼��� ���Ͻÿ�.
SELECT ename, sal, comm
FROM EMP
WHERE comm IS NOT NULL
    -- AND comm != 0
    AND COMM <> 0;


