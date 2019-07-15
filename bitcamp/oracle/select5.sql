/*
JOIN
īƼ�� �� : �����ͳ��� ������� ��
F �ܷ�Ű, �����̸Ӹ� Ű
�����ϱ� ���ؼ��� �ܷ�Ű��� ������ �־���Ѵ�
������ ���� : �츮 ���̺� ���� �����͸� �����´�
*/
/*
    Join
    �ΰ� �̻��� ���̺��� �����ؼ� �����͸� �˻��ϴ� ����̴�.
    ���� ���̻��� ��(row)���� ����� �� primary Kay(�⺻Ű),
    Foreign Key(�ܷ�Ű) ���� ����ؼ� Join�Ѵ�
    
    Primary Key(�⺻Ű) - ���̺� ����, �ߺ����� �ʴ� Ű -> id, seq
    Foreign Key(�ܷ�Ű) - �ٸ� ���̺��� Primary Key, ����Ű�� ���ɼ��� ����.
    
    inner Join *****
    cross Join X
    outer Join
        left   ***
        right  ***
    self Join  *****
    
    SQL : Oracle, Ansi SQL
*/

-- inner Join
-- Ansi SQL
-- employees���� ������ e�� ������ �ȴ�
SELECT e.employee_id, e.first_name, e.salary, 
    e.department_id, d.department_id, 
    d.department_name, d.location_id
FROM employees e INNER JOIN departments d
    ON e.department_id = d.department_id;
    -- employees ���̺� �ִ� E.department_id �̰� ����
    -- d.department_id�� ������ departments ����

-- employees - �������̴�
-- �μ���ȣ�� ���� ������
SELECT *
FROM employees
where department_id is null;


-- Oracle
SELECT e.employee_id, e.first_name, e.salary,
    e.department_id, d.department_id,
    d.department_name, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id;


-- Shanta�� title�� �� �� �ִ�
SELECT e.first_name, e.job_id, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
    AND e.first_name = 'Shanta';



-- �����ȣ 147 �μ���, �������� ���
-- employees, departments, jobs
SELECT e.employee_id,
    e.department_id, d.department_id, d.department_name,
    e.job_id, j.job_id, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
    AND e.job_id = j.job_id
    AND e.employee_id = 147;
-- employees ���̺� �ִ� �÷� employee_id�� �����͸� �����ؼ�
-- employees ���̺� ���� �÷� department_name, job_title��
-- �����͸� �� �� �ִ�




-- cross Join
-- ansi SQL
SELECT e.employee_id, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e CROSS JOIN departments d;
-- Oracle
SELECT e.employee_id, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e, departments d;




-- full outer Join ������ ���ܵ� ��
SELECT e.employee_id, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e FULL OUTER JOIN departments d
    ON e.department_id = d.department_id
WHERE e.department_id IS NULL OR d.department_id IS NULL;
--       Ŵ����                       110 �̻�Ǵ� �μ���ȣ




-- outer Join
-- left
-- Ansi
-- employees ���̺��� ���� �����ش�
SELECT e.employee_id, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e LEFT OUTER JOIN departments d
    ON e.department_id = d.department_id;
-- Oracle
-- employees ���̺��� ���� �����ش�
SELECT e.employee_id, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);
-- + ��ȣ�� ���� ���� ���ΰ�

-- ������ - departments
-- ��, employees ���̺��� departments�� �������� �� �κ�
SELECT e.employee_id, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
    AND e.department_id IS NULL;





-- self Join : ������ ���̺��� Join
-- ���� ���̺������� �ٸ� ���̺��̶�� ��������
-- employees ���̺��� manager_id�� ����� �����ȣ�̴�
SELECT a.employee_id, a.first_name,
    a.manager_id, b.employee_id,
    b.first_name
FROM employees a, employees b
WHERE a.manager_id = b.employee_id;
-- ���� ���� ������? �� ����� �����ȣ
-- a(���) : �Ŵ�����ȣ, b(�Ŵ���)



-- ������ ����
SELECT a.employee_id, a.first_name as "���",
    a.manager_id as "����� ���", b.employee_id,
    b.first_name as "���"
FROM employees a, employees b
WHERE a.manager_id = b.employee_id(+)
CONNECT by PRIOR a.manager_id = a.employee_id; -- �����
--CONNECT by a.manager_id = PRIOR a.employee_id; -- �����








