-- scott ����
-- View����
-- ����1) EMP ���̺��� 20�� �μ��� ���� ������ �����ϴ� EMP_20 VIEW�� ���� �Ͽ���
CREATE OR REPLACE VIEW VW_EMP_20(
    EMPNO,
    ENAME,
    JOB,
    MGR,
    HIREDATE,
    SAL,
    COMM,
    DEPTNO
)
AS
SELECT *
FROM EMP
WHERE DEPTNO = 20;

-- ����2) EMP ���̺��� 30�� �μ��� EMPNO�� EMP_NO�� ENAME�� NAME�� SAL�� SALARY�� �ٲپ� EMP_30 VIEW�� ���� �Ͽ���.
CREATE OR REPLACE VIEW VW_EMP_30(
    EMP_NO,
    NAME,
    SALARY
)
AS
SELECT EMPNO, ENAME, SAL
FROM EMP;
-- ����3) �μ����� �μ���,�ּ� �޿�,�ִ� �޿�,�μ��� ��� �޿��� �����ϴ� DEPT_SUM VIEW�� �����Ͽ���.
CREATE OR REPLACE VIEW VW_DEPT_SUM(
    NAME,
    MIN_SAL,
    MAX_SAL,
    AVG_SAL
)
AS
SELECT D.DNAME, MIN(SAL), MAX(SAL), AVG(SAL)
FROM DEPT D, EMP E
WHERE D.DEPTNO(+) = E.DEPTNO
GROUP BY D.DNAME;




-- SEQUENCE����
--1. �ʱⰪ1���� �ִ밪999,999���� 1�� �����ϴ� TEST_SEQ SEQUENCE�� �����Ͽ���.
CREATE SEQUENCE TEST_SEQ
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 999999
    MINVALUE 1;

-- 2. 1������ �ۼ��� SRQUENCE�� ���� ���� ��ȸ�Ͽ���.
SELECT TEST_SEQ.NEXTVAL
FROM DUAL;

SELECT TEST_SEQ.CURRVAL
FROM DUAL;

-- 3. CURRVAL�� NEXTVAL�� �����Ͽ���.

-- 4. 1������ ������ SRQUENCE�� �����Ͽ���.
DROP SEQUENCE TEST_SEQ;
