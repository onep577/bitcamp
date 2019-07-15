--����Ŭ 11g hr���� ��������

--1. ��å(Job Title)�� Sales Manager�� ������� �Ի�⵵�� �Ի�⵵(hire_date)�� ��� �޿��� ����Ͻÿ�. 
--   ��� �� �⵵�� �������� �������� �����Ͻÿ�. 



--2. �� ����(city)�� �ִ� ��� �μ� �������� ��ձ޿��� ��ȸ�ϰ��� �Ѵ�. 
--   ��ձ޿��� ���� ���� ���ú��� ���ø�(city)�� ��տ���, �ش� ������ �������� ����Ͻÿ�. 
--   ��, ���ÿ� �ٹ��ϴ� ������ 10�� �̻��� ���� �����ϰ� ��ȸ�Ͻÿ�.



--3. ��Public  Accountant���� ��å(job_title)���� ���ſ� �ٹ��� ���� �ִ� ��� ����� ����� �̸��� ����Ͻÿ�. 
--   (���� ��Public Accountant���� ��å(job_title)���� �ٹ��ϴ� ����� ��� ���� �ʴ´�.)      
--   �̸��� first_name, last_name�� �Ʒ��� �������� ���� ����Ѵ�.



--o4. �ڽ��� �Ŵ������� ����(salary)�� ���� �޴� �������� ��(last_name)�� ����(salary)�� ����Ͻÿ�. 
SELECT a.last_name, a.salary
FROM employees a, employees b
WHERE a.employee_id = b.manager_id
    AND a.salary > b.salary;

--x - �μ����� �μ���ȣ�� Ǯ����
--5. 2007�⿡ �Ի�(hire_date)�� �������� ���(employee_id), �̸�(first_name), ��(last_name), 
--   �μ���(department_name)�� ��ȸ�մϴ�.  
--   �̶�, �μ��� ��ġ���� ���� ������ ���, ��<Not Assigned>���� ����Ͻÿ�. 
SELECT a.employee_id, a.first_name, a.last_name, a.hire_date, b.department_name,
    NVL(TO_CHAR(a.department_id), '<Not Assigned>') AS "�μ���ġ"
FROM employees a, departments b
WHERE a.department_id = b.department_id(+)
    AND a.hire_date LIKE ('07%');
 
--o6. ������(job_title)�� ��Sales Representative���� ���� �߿��� ����(salary)�� 9,000�̻�, 10,000 ������ 
--   �������� �̸�(first_name), ��(last_name)�� ����(salary)�� ����Ͻÿ�
SELECT first_name, last_name, salary
FROM
    (   SELECT *
        FROM jobs j, employees e
        WHERE j.job_id = e.job_id
            AND j.job_title = ('Sales Representative') )
WHERE salary BETWEEN 9000 AND 10000;

-- ����� �ڵ�
SELECT e.FIRST_NAME, e.LAST_NAME, e.SALARY
FROM EMPLOYEES e, JOBS j
WHERE e.JOB_ID = j.JOB_ID 
	AND (e.SALARY BETWEEN 9000 AND 10000) 
	AND (j.JOB_TITLE = 'Sales Representative');

--o7. �μ����� ���� ���� �޿��� �ް� �ִ� ������ �̸�, �μ��̸�, �޿��� ����Ͻÿ�. 
--   �̸��� last_name�� ����ϸ�, �μ��̸����� �������� �����ϰ�, 
--   �μ��� ���� ��� �̸��� ���� ���� �������� �����Ͽ� ����մϴ�.
SELECT last_name, department_name, e.department_id, salary
FROM employees e, departments d
WHERE e.department_id = d.department_id
    AND (salary, e.department_id) IN (  SELECT MIN(salary), department_id
                                        FROM employees
                                        GROUP BY department_id)
ORDER BY d.department_name ASC, e.last_name ASC;

--o8. EMPLOYEES ���̺��� �޿��� ���� �޴� ������� ��ȸ���� �� ���ó�� 6��°���� 10 ��°���� 
--   5���� last_name, first_name, salary�� ��ȸ�ϴ� sql������ �ۼ��Ͻÿ�.
SELECT ROW_NUMBER()OVER(ORDER BY salary DESC) AS ROW_NUMBER, last_name, first_name, salary
FROM employees;

SELECT *
FROM 
    (SELECT ROW_NUMBER()OVER(ORDER BY salary DESC) AS ROW_NUMBER,
        last_name, first_name, salary
    FROM employees)
WHERE ROW_NUMBER BETWEEN 6 AND 10;

-- ����� �ڵ�
SELECT *
FROM
       (
       SELECT RANK() OVER (ORDER BY TRUNC(SALARY, -1) DESC) AS RANKING, LAST_NAME, 
               FIRST_NAME, TRUNC(SALARY, -1) AS SALARY
       FROM EMPLOYEES 
       ORDER BY SALARY DESC
       )
WHERE RANKING BETWEEN 6 AND 10;

--o9. ����� �μ��� ���� ����(city)�� ��Seattle���� ����� �̸�, �ش� ����� �Ŵ��� �̸�, ����� �μ��̸��� ����Ͻÿ�. 
--   �̶� ����� �Ŵ����� ���� ��� ��<����>���̶�� ����Ͻÿ�. �̸��� last_name�� ����ϸ�, 
--   ����� �̸��� ������������ �����Ͻÿ�.
SELECT e.last_name, NVL(TO_CHAR(e.manager_id), '<����>'), b.last_name, d.department_name
FROM employees e, employees b, departments d, locations o
WHERE e.department_id = d.department_id 
    AND d.location_id = o.location_id
    AND e.manager_id = b.employee_id(+)
    AND o.city = 'Seattle'
ORDER BY e.last_name ASC;

-- ����� �ڵ�
SELECT E.E_NAME, NVL(E.M_NAME, '<����>'), D.DEPARTMENT_NAME
FROM 
      (
       SELECT 
              A.LAST_NAME AS E_NAME, B.LAST_NAME AS M_NAME, A.DEPARTMENT_ID 
       FROM EMPLOYEES A LEFT JOIN EMPLOYEES B 
           ON A.MANAGER_ID = B.EMPLOYEE_ID
      ) E, DEPARTMENTS D, LOCATIONS L
WHERE L.CITY = 'Seattle' 
	AND E.DEPARTMENT_ID = D.DEPARTMENT_ID 
		AND D.LOCATION_ID = L.LOCATION_ID
ORDER BY E.E_NAME ASC;

-- x
--10. �� ����(job) ���� ����(salary)�� ������ ���ϰ��� �Ѵ�. ���� ������ ���� ���� �������� 
--    ������(job_title)�� ���� ������ ��ȸ�Ͻÿ�. �� ���������� 30,000���� ū ������ ����Ͻÿ�.
SELECT ROWNUM AS RUM, job_id, SUM(salary)
    FROM employees
    GROUP BY job_id;            
SELECT ROW_NUMBER()OVER(PARTITION BY MAX(salary) ORDER BY MAX(salary))
FROM employees;

-- xx
--11. �� ���(employee)�� ���ؼ� ���(employee_id), �̸�(first_name), ������(job_title), 
--    �μ� ��(department_name)�� ��ȸ�Ͻÿ�. 
--    �� ���ø�(city)�� ��Seattle���� ����(location)�� �μ� (department)�� �ٹ��ϴ� ������ �����ȣ ������������ ����Ͻÿ�.


-- xx
--12. 2001~20003����̿� �Ի��� ������ �̸�(first_name), �Ի���(hire_date), �����ڻ�� (employee_id), 
--    ������ �̸�(fist_name)�� ��ȸ�մϴ�. ��, �����ڰ� ���� ��������� ��� ����� ���Խ��� ����Ѵ�.

-- xx
--13. ��Sales�� �μ��� ���� ������ �̸�(first_name), �޿�(salary), �μ��̸�(department_name)�� ��ȸ�Ͻÿ�. 
--    ��, �޿��� 100�� �μ��� ��պ��� ���� �޴� ���� ������ ��µǾ�� �Ѵ�. 


-- o ����� �ڵ尡 �� ����
--14. Employees ���̺��� �Ի��Ѵ�(hire_date)���� �ο����� ��ȸ�Ͻÿ�.
SELECT SUBSTR(hire_date, 4, 2) AS "����", COUNT(*)
FROM employees
GROUP by SUBSTR(hire_date, 4, 2)
ORDER BY ����;

-- ����� �ڵ�
SELECT CONCAT(TO_CHAR(E.HIRE_DATE, 'MM'), '��') AS HIRE_DATE, COUNT(*)
FROM EMPLOYEES E
GROUP BY TO_CHAR(E.HIRE_DATE, 'MM')
ORDER BY TO_CHAR(E.HIRE_DATE, 'MM') ASC;  

-- X �μ����ε� �μ��� NULL���� �μ��� ��ȸ�ߴ�
-- ��� ���̺�� �μ����̺��� �����Ͽ� NULL���� �ִ� �μ���ȣ�� �ƴ� �μ������� �׷��ϸ� ����
--15. �μ��� �������� �ִ�, �ּ�, ��ձ޿��� ��ȸ�ϵ�, 
--    ��ձ޿��� ��IT�� �μ��� ��ձ޿����� ����, ��Sales�� �μ��� ��պ��� ���� �μ� ������ ����Ͻÿ�. 
SELECT department_id, MAX(salary), MIN(salary), ROUND(AVG(salary))
FROM employees
GROUP BY department_id
HAVING AVG(salary) > (  SELECT AVG(salary)
                        FROM employees e, departments d
                        WHERE e.department_id = d.department_id
                        AND d.department_name = ('IT'))
    AND AVG(salary) < ( SELECT AVG(salary)
                        FROM employees e, departments d
                        WHERE e.department_id = d.department_id
                        AND d.department_name = ('Sales'));

SELECT AVG(salary)
FROM employees e, departments d
WHERE e.department_id = d.department_id
    AND d.department_name = ('IT');
-- ��IT�� �μ� ��ձ޿� 5760

SELECT AVG(salary)
FROM employees e, departments d
WHERE e.department_id = d.department_id
    AND d.department_name = ('Sales');
-- ��Sales�� �μ� ��ձ޿� 8955.8


-- ����� �ڵ�
SELECT D.DEPARTMENT_NAME, MAX(E.SALARY), MIN(E.SALARY), TRUNC(AVG(E.SALARY), 0)
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
HAVING TRUNC(AVG(E.SALARY), 0) > (
                                  SELECT  TRUNC(AVG(E.SALARY), 0)
                                  FROM EMPLOYEES E, DEPARTMENTS D
                                  WHERE D.DEPARTMENT_NAME = 'IT' 
                                  AND D.DEPARTMENT_ID = E.DEPARTMENT_ID
                                   )
   	AND  TRUNC(AVG(E.SALARY), 0) < (
                                   SELECT TRUNC(AVG(E.SALARY), 0)
                                   FROM EMPLOYEES E, DEPARTMENTS D
                                   WHERE D.DEPARTMENT_NAME = 'Sales' 
                                   AND D.DEPARTMENT_ID = E.DEPARTMENT_ID);

-- X
--16. �� �μ����� ������ �Ѹ� �ִ� �μ��� ��ȸ�Ͻÿ�. 
--    ��, ������ ���� �μ��� ���ؼ��� ��<�Ż��μ�>����� ���ڿ��� ��µǵ��� �ϰ�,
--    ��°���� ������ ���� �μ����� �������� ���� ���ĵǾ���Ѵ�.

SELECT department_id
FROM employees
GROUP BY department_id

HAVING COUNT(department_id) = 0
     
ORDER BY department_name DESC;

-- X
--17. �μ��� �Ի���� �������� ����Ͻÿ�. 
--    ��, �������� 5�� �̻��� �μ��� ��µǾ�� �ϸ� ��°���� �μ��̸� ������ �Ѵ�.
SELECT *
FROM employees;

SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id;

SELECT employee_id, last_name, department_id, COUNT(*)OVER(PARTITION BY department_id)
FROM employees;



-- XX
--18. ����(country_name) �� ����(city)�� �������� ��ȸ�Ͻÿ�. 
--    ��, �μ��� �������� ���� ���� �� �ֱ� ������ 106���� ������ ����� �ȴ�. 
--    �μ������� ���� ������ ������� ���ø� ��ſ� ��<�μ�����>���� ��µǵ��� �Ͽ� 107�� ��� ��µǰ� �Ѵ�.


-- 
--19. �� �μ��� �ִ� �޿����� ���̵�(employee_id), �̸�(first_name), �޿�(salary)�� ����Ͻÿ�. 
--    ��, �ִ� �޿��ڰ� ���� �μ��� ��ձ޿��� ���������� ����Ͽ� ��ձ޿��� ���� �� �ְ� �� ��.
SELECT employee_id, first_name, salary, department_id
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, MAX(salary)
        FROM employees
        WHERE department_id IS NOT NULL
        GROUP BY department_id);


SELECT employee_id, first_name, salary
FROM 
    (SELECT department_id
    FROM
        (SELECT department_id, MAX(salary)
        FROM employees
        WHERE department_id IS NOT NULL
        GROUP BY department_id)
    );

--20. Ŀ�̼�(commission_pct)�� �������� ��ȸ�Ͻÿ�. 
--    Ŀ�̼��� �Ʒ�������ó�� 0.2, 0.25�� ��� .2��, 0.3, 0.35�� .3 ���·� ��µǾ�� �Ѵ�. 
--    ��, Ŀ�̼� ������ ���� �����鵵 �ִ� �� Ŀ�̼��� ���� ���� �׷��� ��<Ŀ�̼� ����>���� ��µǰ� �Ѵ�.
SELECT commission_pct, NVL(TO_CHAR(TRUNC(commission_pct, 1)), '<Ŀ�̼� ����>')
FROM employees
GROUP BY commission_pct;

--21. Ŀ�̼�(commission_pct)�� ���� ���� ���� ���� 4����
--    �μ���(department_name), ������ (first_name), �޿�(salary), Ŀ�̼�(commission_pct) ������ ��ȸ�Ͻÿ�. 
--    ��°���� Ŀ�̼� �� ���� �޴� ������ ����ϵ� ������ Ŀ�̼ǿ� ���ؼ��� �޿��� ���� ������ ���� ��� �ǰ� �Ѵ�.
SELECT *
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY commission_pct DESC;

SELECT ROWNUM AS RUM, first_name, salary, commission_pct, department_id
    FROM 
        (SELECT *
        FROM employees
        WHERE commission_pct IS NOT NULL
        ORDER BY commission_pct DESC);

SELECT d.department_name, e.first_name, e.salary, e.commission_pct
FROM departments d,
    (SELECT ROWNUM AS RUM, first_name, salary, commission_pct, department_id
    FROM 
        (SELECT *
        FROM employees
        WHERE commission_pct IS NOT NULL
        ORDER BY commission_pct DESC)
    ) e
WHERE e.department_id = d.department_id
    AND RUM <= 4
ORDER BY salary DESC;















