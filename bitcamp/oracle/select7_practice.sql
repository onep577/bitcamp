-- 33) �� ����� �̸��� ǥ���ϰ� �ٹ� �� ��(�Ի��Ϸκ��� ��������� �޼�)�� ����Ͽ�
-- �� ���̺��� MONTHS_WORKED�� �����Ͻÿ�. ����� ������ �ݿø��Ͽ� ǥ���ϰ� �ٹ��� ����
-- �������� ������������ �����Ͻÿ�.(MONTHS_BETWEEN �Լ� ����)
SELECT ename, round(MONTHS_BETWEEN(sysdate, hiredate)) as "MONTHS_WORKED"
FROM emp
ORDER BY round(MONTHS_BETWEEN(sysdate, hiredate)) ASC;

-- 34)emp���̺��� �̸�, ����, �ٹ������� ����Ͻÿ�.
SELECT ename, job, hiredate,
     CASE SUBSTR(hiredate, 1, 2)
        WHEN '80' THEN '40����'
        WHEN '81' THEN '39����'
        WHEN '82' THEN '38����'
    END AS "�ٹ�����"
FROM emp;

SELECT ename, job, trunc(MONTHS_BETWEEN(sysdate, hiredate) / 12) as "�ٹ�����"
from emp;
-- 35)emp���̺��� ����̸�, ����, ���ް� Ŀ�̼��� ���� ���� �÷��� �Ǳ޿���� �ؼ� ���.
-- ��, NULL���� ��Ÿ���� �ʰ� �ۼ��Ͻÿ�.
SELECT ename, sal, NVL(comm, 0), sal+NVL(comm, 0) "�Ǳ޿�"
FROM emp;

-- 36)���ް� Ŀ�̼��� ��ģ �ݾ��� 2,000�̻��� �޿��� �޴� ����� �̸�,����,����,Ŀ�̼�,��볯¥
-- �� ����Ͻÿ�. ��, ��볯¥�� 1980-12-17 ���·� ����Ͻÿ�.
SELECT ename, job, sal, NVL(comm, 0), 
    to_char(hiredate, 'YY-MM-DD'), sal+NVL(comm, 0)
FROM emp
WHERE (sal+NVL(comm, 0)) >= 2000;

-- 37)DECODE �Ǵ� CASE WHEN THEN �Լ��� ����Ͽ� ���� �����Ϳ� ���� JOB���� ���� ��������
-- ��� ����� ����� ǥ���Ͻÿ�.
-- ����        ���
-- PRESIDENT   A
-- ANALYST     B
-- MANAGER     C
-- SALESMAN    D
-- CLERK       E
-- ��Ÿ         0

SELECT ename, job,
    CASE job
        WHEN 'PRESIDENT' THEN 'A'
        WHEN 'ANALYST' THEN 'B'
        WHEN 'MANAGER' THEN 'C'
        WHEN 'SALESMAN' THEN 'D'
        WHEN 'CLERK' THEN 'E'
        ELSE '0'
    END AS "���"
FROM emp;




-- (HR ����)

-- 1. ���� �ֱ� �Ի��� ��������� �ۼ��ؼ� 1 ~ 10��° ����� ������ ����Ͻÿ�.
SELECT *
FROM
    (SELECT rownum as rnum,     -- 2.��ȣ�� ���δ�
        employee_id, first_name, hire_date
    FROM
        (SELECT *               -- 1.DATE ����
        FROM employees
        ORDER BY hire_date DESC)
    )
WHERE rnum > 1 AND rnum <= 10; -- 3.���� ����

-- 2. �޿������� �ۼ��ؼ� 11 ~ 20 ����� ������ ����Ͻÿ�.
SELECT *
FROM
    (SELECT rownum as rnum,     -- 2.��ȣ�� ���δ�
        employee_id, first_name, salary
    FROM
        (SELECT *               -- 1.DATE ����
        FROM employees
        ORDER BY salary DESC)
    )
WHERE rnum > 10 AND rnum <= 20; -- 3.���� ����

-- 3. �Ի��� ������� ��ȣ�� �Ҵ��ϰ�, JOB_ID�� IT_PROG�̸�, 05�⵵�� �Ի��� ����� 3�� ����϶�
SELECT employee_id, first_name, job_id, hire_date
FROM
    (SELECT ROW_NUMBER()OVER(PARTITION BY SUBSTR(hire_date,1,2) ORDER BY hire_date ASC) AS "RN",
        employee_id, first_name, job_id, hire_date
    FROM employees
    WHERE job_id = 'IT_PROG'
        AND SUBSTR(hire_date,1,2) = '05')
WHERE RN BETWEEN 1 AND 3;










