-- �빮�� UPPER( ���ڿ� )     abcDEF
-- �ҹ��� LOWER( ���ڿ� )

-- ���ڿ��� ���ϴ� ���
SELECT first_name || ' ' || last_name
FROM employees;

-- concat
SELECT concat(first_name, last_name)
FROM employees;

-- months_between : �� ��¥���� ����(�� ����)
SELECT MONTHS_BETWEEN('2019-11-13', '2019-01-05')
FROM dual;

-- add_months : Ư�� ��¥�� ���� ������ ���� ���� �ش� ��¥�� ��ȯ
SELECT add_months('2019-06-02', 8)
FROM dual;

-- extract() : ��¥ �������� Ư���� ����, ��, ��, ��, ��, �ʸ� ����
SELECT systimestamp,
    EXTRACT(year from sysdate) AS ��,
    EXTRACT(month from sysdate) AS ��,
    EXTRACT(day from sysdate) AS ��,
    EXTRACT(HOUR   from CAST (SYSDATE AS TIMESTAMP)) AS ��,
    EXTRACT(minute from CAST (SYSDATE AS TIMESTAMP)) AS ��,
    EXTRACT(second from CAST (SYSDATE AS TIMESTAMP)) AS ��
FROM dual;


/*
NVL�Լ��� ���� ���ȴ�
NVL(����� �Ǵ� �÷�, 0)           �÷��� �ڷ��� : NUMBER
-- ����� �Ǵ� �÷��� NULL�̸� 0�� �������� NULL�� �ƴϸ� �÷����� ��������

NVL(����� �Ǵ� �÷�, '����')       �÷��� �ڷ��� : VARCHAR2
-- ����� �Ǵ� �÷��� NULL�̸� '����'�� �������� NULL�� �ƴϸ� �÷����� ��������

NVL2(����� �Ǵ� �÷�, 1, 0)
-- ����� �Ǵ� �÷� NULL �ƴϸ� 1 NULL�̸� 0�� ��������
*/

SELECT first_name, NVL(commission_pct, 0)
FROM employees;

SELECT first_name, NVL2(commission_pct, '����', '����')
FROM employees;




-- �׷����� ���� ���
-- job_id(����), department_id(�μ�)
-- �ߺ����� ����
SELECT DISTINCT department_id
FROM employees
ORDER BY department_id ASC;

-- GROUP BY��
-- GROUP BY�� ���������� �׷����� ���� �÷��� ������ �� �ִ�
--SELECT department_id, first_name -- ����
SELECT department_id
FROM employees
GROUP BY department_id
ORDER BY department_id ASC;

/*
GROUP �Լ�
COUNT
SUM
AVG
MAX
MIN
*/
SELECT *
FROM employees
WHERE job_id = 'IT_PROG';

SELECT 
    COUNT(salary), COUNT(*), SUM(salary), AVG(salary),
    SUM(salary)/COUNT(*)
FROM employees
WHERE job_id = 'IT_PROG';
-- IT_PROG 5���ִ�
-- 5�� ������ �հ�
-- 5�� ������ ����� �հ�


SELECT *
FROM employees
ORDER BY department_id ASC;

-- SELECT�ڿ� �� �� �ִ� ���� ���� �÷��� �׷��Լ� ���̴�
-- department_id�� �ߺ������ʰ� ������������ ���´�
SELECT department_id, SUM(salary), MAX(salary), Round(AVG(salary))
FROM employees
GROUP BY department_id
ORDER BY department_id ASC;

-- �ΰ��� ���� �� �ִ�
-- department_id = 30�� job_id�� pu_MAN 4��, pu_CLERK 2���� �ִٸ�
-- pu_MAN, pu_CLERK ���� �ѹ����� ���´�
SELECT department_id, job_id
FROM employees
GROUP BY department_id, job_id;

-- GROUP BY
-- ������ HAVING -- �ܵ���� �Ұ�, �׷���̿� ���� ���� �ı�
-- job_id�� ���� ������� ���� �հ� �� 30000�̻��� ���
SELECT job_id, SUM(salary)
FROM employees
GROUP BY job_id
HAVING SUM(salary) >= 30000
ORDER BY SUM(salary) DESC;

SELECT * FROM employees;
-- ������ 5000���� �Ѵ� ��� �� ������ �հ谡 20000���� ���� ��

SELECT job_id
    , COUNT(*)
    -- ������ 5000 �Ѵ� �����
    , SUM(salary)
--    , Trunc(AVG(salary))
FROM employees
WHERE salary > 5000
-- ������ ���� �־���
GROUP BY job_id
HAVING SUM(salary) > 20000;

