-- Ư�� query
-- CASE, DECODE
SELECT employee_id, first_name, phone_number,
    CASE SUBSTR(phone_number, 1, 3)
    -- phone_number 1��°���� 3���� ���ڰ������� �� ������ �����Ͱ� 515�̸� ���� ���
        WHEN '515' THEN '����'
        WHEN '590' THEN '�λ�'
        WHEN '659' THEN '����'
        WHEN '603' THEN '����'
        ELSE '��Ÿ'
    END AS "����"
FROM employees;

SELECT employee_id, first_name, phone_number,
    CASE
        WHEN SUBSTR(phone_number, 1, 3) = '515' THEN '����'
        WHEN SUBSTR(phone_number, 1, 3) = '590' THEN '�λ�'
        WHEN SUBSTR(phone_number, 1, 3) = '659' THEN '����'
        WHEN SUBSTR(phone_number, 1, 3) = '603' THEN '����'
        ELSE '��Ÿ'
    END AS "����"
FROM employees;


-- DECODE
SELECT employee_id, first_name, phone_number,
    DECODE( SUBSTR(phone_number, 1, 3),
            '515', '����',
            '590', '�λ�',
            '659', '����',
            '603', '����',
            '��Ÿ') AS "����"
FROM employees;




-- �Խ��ǿ��� ��Ͽ��� �� �� 5�� ���� or 10�� ���⸦ �������� �� 5�� or 10���� �߶� �����;��Ѵ�
-- ��ü�� list�� �����ͼ� �ڸ��� �ڹٰ� ����� db���� �߶� ������ �� ����
-- �÷����� �����Ӱ� ������ ���� �Լ�
-- OVER( ) PARTITION BY ORDER BY
-- ���� RANK 1 ~ 5

--SELECT job_id, COUNT(*)
SELECT job_id, salary, COUNT(*)OVER(PARTITION BY job_id ORDER BY salary DESC)
-- COUNT�� �ش�Ǵ� ������ �����. �׷����� job_id ���� salary �������� ���
-- job_id�� ���� �� �ȿ��� salary�� �������� ����
FROM employees;

SELECT job_id, COUNT(*)OVER()
-- employees ���̺��� ���� �� ī��Ʈ�� ����
FROM employees;

SELECT job_id, COUNT(*)OVER(PARTITION by job_id)    -- �׷������ ������ ī��Ʈ
FROM employees;

-- salary�� ����
-- MAX
-- MIN
-- SUM
-- AVG





-- �м��Լ� ���� ����Ѵ�
-- ���� rank
-- RANK()               1 2 3 3 5 6
-- DENSE_RANK()         1 2 3 3 4 5
-- ROW_NUMBER()         1 2 3 4 5 6
-- ROWNUM

--SELECT first_name, salary, RANK()
-- RANK�� �׷��Լ��� ���� OVER�� ����Ѵ�
--SELECT first_name, salary, RANK()OVER ����
SELECT first_name, salary,
    RANK()OVER(ORDER BY salary DESC) AS RANK,
    DENSE_RANK()OVER(ORDER BY salary DESC) AS DENSE_RANK,
    ROW_NUMBER()OVER(ORDER BY salary DESC) AS ROW_NUMBER   
FROM employees
ORDER BY salary DESC;

-- 10���� �����͸��� �����ϴ� ��� !!! �ſ� �߿� !!!
SELECT ROWNUM, employee_id, first_name, salary
FROM employees
WHERE ROWNUM <= 10;

-- ROWNUM�� �ٿ��� ������ ������ ã�ƾ��ϴµ� �ݴ� �������� �ƹ��͵� �ȳ��´�
SELECT ROWNUM, employee_id, first_name, salary  --2
FROM employees
WHERE ROWNUM >= 11 AND ROWNUM <= 20;            --1

-- 1. DATA�� ����
-- 2. ROWNUM �ϼ�
-- 3. ������ ����
SELECT RNUM, employee_id, first_name, salary
FROM
    (SELECT ROWNUM AS RNUM, -- ROWNUM �ϼ�
        employee_id, first_name, salary
    FROM
        (SELECT employee_id, first_name, salary -- 1. DATA�� ����
        FROM employees)
    )
WHERE RNUM > 10 AND RNUM <= 20; -- ������ ����





