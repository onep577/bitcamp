-- SUB QUERY
-- QUERY���� QUERY���̴�
-- �Ѱ��� ��(ROW)���� ��� ���� ��ȯ�Ǵ� QUERY

-- SELECT    ������(ROW) �����÷�(COLUMN)�� ��� ��, ������ �����ʹ� �Ѱ�, �÷� �Ѱ�
-- �����Ͱ� �������� ������ �ȵȴ�. SELECT������ ������ ROW�� �ϳ�
-- FROM     ������(ROW) �����÷�(COLUMN)�� �����ϴ�
-- �μ� = 10�� WHERE���� �ƴ϶� FROM������ �߷��� �� �ִ�
-- WHERE    ������(ROW) �����÷�(COLUMN)�� �����ϴ�     --> ���� ���� ���

/*
    -- SELECT (SELECT FIRSTNAME, LASTNAME FROM EMPLOYEES) �÷��� �ΰ����� �ȵȴ�
    -- SELECT (SELECT FIRSTNAME FROM EMPLOYEES) ���� �������̿��� �ȵȴ�
    -- SELECT (SELECT FIRSTNAME FROM EMPLOYEES WHERE EMPLOYEE_ID = 100) �ȴ� ��? ���� �ϳ�
    -- �׷��� SELECT�������� ��� �󵵰� �ſ� ���� ���� WHERE�� ���� FROM���� ����Ѵ�
*/



-- SELECT
SELECT employee_id, first_name,
    -- (SELECT last_name FROM employees) -- 107�� ���´�
        -- �����ڵ� single-row subquery returns more than one row 
    -- (SELECT SUM(salary), AVG(salary) FROM employees)
        -- �����ڵ� too many values 
    -- (SELECT SUM(salary) FROM employees) -- o
    (SELECT SUM(salary) FROM employees),
    (SELECT COUNT(*) FROM employees) -- o
FROM employees;

-- FROM
-- employee_id, last_name, salary, department_id
-- �������� ���� ��ġ�� �Ǿ��Ѵ�. *�� �����ϴ� ��? 4���� �� ���� �� �����ϱ�
SELECT *
-- SELECT employee_id, last_name, salary, department_id
-- �� �Ʒ� ���� ���� ���´�. �� �� �´�
FROM ( SELECT employee_id, last_name, salary, department_id
       FROM employees
       WHERE department_id = 20);

-- �μ���ȣ�� 20��, �޿��� 6000 �̻��� ���
SELECT *
FROM employees
WHERE department_id = 20 
    AND salary >= 6000;
SELECT *
FROM (SELECT *
      FROM employees
      WHERE department_id = 20)
WHERE salary >= 6000;

SELECT a.employee_id, a.first_name, a.job_id, b.job_id, b."�޿� �հ�", b."�ο���"
FROM employees a, (SELECT job_id, sum(salary) as "�޿� �հ�", COUNT(*) as "�ο���"
                   FROM employees
                   GROUP BY job_id) b
WHERE a.job_id = b.job_id;



-- WHERE
-- ������ ��պ��� �� ���� �޴� ���
-- ���� ���� �Ҷ� ���� �ľ��� �߿�! ���� ������ ���Ͼ� �ұ�?�� �������� ����
SELECT first_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- it���α׷��ӿ� ���� �͸�
SELECT first_name, job_id
FROM employees
WHERE job_id IN(SELECT job_id FROM jobs WHERE job_id = 'IT_PROG');
-- ���������� ������ �������� ���� �� ���� �и��ؼ� ������ �� �� ���

-- �μ����� ���� �޿��� ���� �޴� ����� ���� �޿��� �޴� ���
SELECT first_name, department_id, salary
FROM employees
WHERE salary IN (SELECT MIN(salary) 
                FROM employees
                GROUP BY department_id);

-- �μ����� ���� �޿��� ���� �޴� ����� ����
SELECT first_name, department_id, salary
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, MIN(salary)
                                  FROM employees
                                  GROUP BY department_id)
ORDER BY salary DESC;








-- �ǽ�


-- HR ����
-- 1) EMPLOYEES ���̺��� Kochhar�� �޿����� ���� ����� ������ �����ȣ,
-- �̸�, ������, �޿��� ���
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary > ( SELECT salary
                 FROM employees
                 WHERE last_name = 'Kochhar');
-- 2) EMPLOYEES ���̺��� �޿��� ��պ��� ���� ����� ������ �����ȣ, �̸�,
-- ������, �޿�, �μ���ȣ�� ���
SELECT employee_id, last_name, job_id, salary, department_id
FROM employees
WHERE salary < (SELECT AVG(salary)
                FROM employees);
-- 3) EMPLOYEES ���̺��� 100�� �μ��� �ּ� �޿����� �ּ� �޿��� ����
-- �ٸ� ��� �μ��� ���
SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) > (SELECT MIN(salary)
                     FROM employees
                     WHERE department_id = 100);
-- 4) �������� �ּ� �޿��� �޴� ����� ������ �����ȣ, �̸�, ����, �μ���ȣ ���
-- ��, �������� ����
SELECT employee_id, last_name, job_id, salary, department_id
FROM employees
WHERE (salary, job_id) IN (SELECT MIN(salary), job_id
        FROM employees
        GROUP BY job_id)
ORDER BY job_id ASC;
-- 5) EMPLOYEES�� DEPARTMENTS ���̺��� ������ SA_MAN ����� ������ �̸�,
-- ����, �μ���, �ٹ����� ���
SELECT last_name, job_id, d.department_name, location_id
FROM departments d, employees e
WHERE d.department_id = e.department_id
    AND e.job_id IN (SELECT job_id 
                     FROM employees 
                     WHERE job_id = 'SA_MAN');
-- 6) EMPLOYEES ���̺��� ���� ���� ����� ���� MANAGER�� �����ȣ ���
SELECT manager_id
FROM employees
GROUP BY manager_id
HAVING COUNT(manager_id) IN (SELECT MAX(COUNT(*))
                             FROM employees
                             GROUP BY manager_id);
-- 7) EMPLOYEES ���̺��� ���� ���� ����� �����ִ� �μ���ȣ�� ����� ���
SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id
HAVING COUNT(*) IN (SELECT MAX(COUNT(*))
                    FROM employees
                    GROUP BY department_id);
-- 8) EMPLOYEES ���̺��� �����ȣ�� 123�� ����� ������ ���� �����ȣ�� 192��
-- ����� �޿�(SAL)���� ���� ����� �����ȣ, �̸�, ����, �޿��� ���
SELECT *
FROM employees
WHERE employee_id = 123;
-- JOB_ID ST_MAN
SELECT *
FROM employees
WHERE employee_id = 192;
-- SALARY 4000

/*
SELECT employee_id, last_name, job_id, salary
FROM (SELECT employee_id, last_name, job_id, salary
      FROM employees
      WHERE employee_id = 123)
WHERE salary > (SELECT salary
                FROM employees
                WHERE employee_id = 192);
-- �����ȣ 123�� ���´� ��? FROM������ �����ȣ 123�� ������ ���ƾ��ϴµ� 123�� �ش�ǰ� �ߴ�
*/               
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE employee_id = 192)
    AND job_id IN (SELECT job_id
                   FROM employees
                   WHERE employee_id = 123);
-- 9) ����(JOB)���� �ּ� �޿��� �޴� ����� ������ �����ȣ, �̸�, ����, �μ��� ���
-- ���� 1: �������� �������� ����
-- PPT ���� ����?
SELECT job_id, min_salary
FROM jobs;

SELECT *
FROM employees
WHERE (job_id, salary) IN (SELECT job_id, min_salary
                           FROM jobs);

SELECT employee_id, last_name, job_id, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
    AND (e.job_id, e.salary) IN (SELECT job_id, MIN(salary)
                                 FROM employees
                                 GROUP BY job_id)
ORDER BY e.job_id DESC;


-- 10) EMPLOYEES ���̺��� 50�� �μ��� �ּ� �޿��� �޴� ������� ���� �޿���
-- �޴� ����� ������ �����ȣ, �̸�, ����, �Ի�����, �޿�, �μ���ȣ ��� ��, 50�� ����
-- PPT ���� ����?
SELECT MIN(salary)
FROM employees
WHERE department_id = 50;

SELECT employee_id, last_name, job_id, hire_date, salary, department_id
FROM employees
WHERE salary > (SELECT MIN(salary)
                FROM employees
                WHERE department_id = 50)
ORDER BY salary DESC;
-- 11) EMPLOYEES ���̺��� 50�� �μ��� �ְ� �޿��� �޴� ������� ���� �޿���
-- �޴� ����� ������ �����ȣ, �̸�, ����, �Ի�����, �޿�, �μ���ȣ ��� ��, 50�� ����
SELECT MAX(salary)
FROM employees
WHERE department_id = 50;

SELECT employee_id, last_name, job_id, hire_date, salary, department_id
FROM employees
WHERE salary > (SELECT MAX(salary)
                FROM employees
                WHERE department_id = 50)
ORDER BY salary ASC;
