-- WHERE == if�� == ������
/*
    ǥ����
    �� ������( =, >, <, !=, >=, <=, <> )  <> �����ʴ� != �̴�
    NULL, = NULL(Ʋ������) IS NULL(=NULL), IS NOT NULL(!=NULL)
    (), NOT, AND(&&), OR(||)
    
    SELECT
    FROM
    WHERE ������
*/

-- first_name�� Julia�� ����� ã�ƶ�
SELECT first_name, last_name, salary
FROM employees
WHERE first_name = 'Julia';

-- �޿��� $9000�̻��� ���
SELECT first_name, last_name, salary
FROM employees
WHERE salary >= 9000;

-- �̸��� Shanta���� ū �̸�
SELECT first_name, last_name, salary
FROM employees
WHERE first_name >= 'Shanta';
-- �̸��� ù���ڰ� S�� ����� �� ������ h�� �ٽ� ���Ѵ�
-- S�� 83�̴� 84 ~ 90 ��, �빮�� T ~ Z�� �̸��� ù������ ������� ���

SELECT first_name, last_name, salary
FROM employees
WHERE first_name >= 'a';
-- a�� 97�̿��� �ƹ��͵� ��µ��� �ʴ´� ��? �̸��� �빮�ڷ� �����Ѵ�
-- �빮���� �ƽ�Ű�ڵ�� 65 ~ 90�̴�. 97���� �۱� �����̴�

SELECT first_name, manager_id
FROM employees
WHERE manager_id = '';
-- ''; NULL�� �ƴ϶� �� �����̴�. �ƹ��͵� ��µ��� �ʴ´�

SELECT first_name, manager_id
FROM employees
WHERE manager_id IS NULL;
-- �Ŵ��� ���̵� ���� ������ ��� ������ STEVEN�� ���´�

SELECT first_name, manager_id
FROM employees
WHERE manager_id IS NOT NULL;
-- ������ STEVEN���� ��� ���


-- AND
SELECT first_name, last_name, salary
FROM employees
WHERE first_name = 'Shanta' AND first_name = 'John';
-- �ƹ��� ������ �ʴ´�
-- OR
SELECT first_name, last_name, salary
FROM employees
WHERE first_name = 'Shanta' OR first_name = 'John';
-- SHANTA�� JOHN�� ��� ���

-- �̸� John, �޿��� 5000�̻�
SELECT first_name, last_name, salary
FROM employees
WHERE first_name = 'John' AND salary > 5000;
-- �̸��� JOHN�� ����� ���� �˻� 3�����, �� �� 5000�̻� ���� �˻� 2�� ���
-- ������ ������ ���� �˻� �� ��� ���� ���� �˻� ��? ���ǹ� �Ǽ��� �� �����ϱ�

-- 2007�� 12�� 31�� ���Ŀ� �Ի��� ����� ����϶�
SELECT first_name, hire_date
FROM employees
-- WHERE hire_date > '07/12/31'; -- TO_DATE(
WHERE hire_date > TO_DATE('071231', 'YYMMDD'); -- TO_MONTH
-- DATE�� ���� �� TO_DATE�� ���� ����Ѵ�


-- ALL(AND), ANY(OR)
-- �Ѳ����� ���� �ְ� ����� �� ���ϴ�
SELECT first_name, salary
FROM employees
WHERE first_name = ALL('Julia', 'John');
-- first_name = 'Julia' AND first_name = 'John'
-- �̸��� �ΰ��� ����� ã�� ������ ���� �ȵ����� ALL, ANY�� ���ϱ� ���� ��

SELECT first_name, salary
FROM employees
WHERE first_name = ANY('Julia', 'John');
-- first_name = 'Julia' OR first_name = 'John'

SELECT first_name, salary
FROM employees
WHERE salary = ANY(8000, 3200, 6000);


-- IN, NOT IN
SELECT first_name, salary
FROM employees
WHERE salary IN(8000, 3200, 6000);

SELECT first_name, salary
FROM employees
WHERE salary NOT IN(8000, 3200, 6000);
-- 8000, 3200, 6000�� ������ ������ ������� ���´�

SELECT first_name, salary
FROM employees
WHERE first_name IN('Julia', 'John');
-- Julia�� John �λ���� ���
SELECT first_name, salary
FROM employees
WHERE first_name NOT IN('Julia', 'John');
-- Julia�� John �λ���� �����ϰ� ��� ���


-- exists
SELECT first_name, job_id
FROM employees e
WHERE EXISTS(   SELECT 1
                FROM dual
                WHERE e.job_id = 'IT_PROG' );
-- select 1 1�� ���̴�
-- employees ���̺� job_id �÷��� IT_PROG ������ ������ ��(1)�� ������

-- BETWEEN ���� ������
/*
SALARY >= 3200 AND SALARY <= 9000
SALARY BETWEEN 3200 AND 9000
*/
SELECT first_name, salary
FROM employeeS
WHERE SALARY BETWEEN 3200 AND 9000;
-- WHERE SALARY >= 3200 AND SALARY <= 9000

SELECT first_name, salary
FROM employeeS
WHERE SALARY NOT BETWEEN 3200 AND 9000;
-- WHERE SALARY < 3200 OR SALARY > 9000
-- BETWEEN AND �̴� OR�� �ٲٸ� �ȵȴ�


-- LIKE
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'G_ra_d';
-- _�� �ѹ���

-- �ſ� �߿�!
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'K%y'; -- % ���ڼ��� ������ ����

SELECT first_name
FROM employees
WHERE first_name LIKE '%Al%';
-- Al�� �� ��ġ�ʹ� ������� Al�� ��������� ������ ã��

-- 2006�⵵�� �Ի��� ���
SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '06/01%';

