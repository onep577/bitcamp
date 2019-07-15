/*
    index : �˻��ϱ� ���� ����
    ���ϴ� ������ ��ġ�� ������ ��Ȯ�ϰ� �˾Ƴ� �� �ִ� ���
    -- �ڵ����� : Primary key, Unique
    -- �������� : Query
    
    �߶� �˻��Ѵ�
    a �˻� �� �ϰ� b �˻� �� �ϰ� c �˻� �ϴ� �� �ƴ϶� a �ƴϾ�? �׷� b
    b�� �ƴϾ�? �׷� c �¾�? c�� �˻�
    
    �����ؾ� ���� ���
    1. where���̳� join ���Ǿȿ� ���� ���Ǵ� �÷�  department_id
    2. null ���� ���� ���ԵǾ� �ִ� �÷�            manager_id
    3. where���̳� join ���Ǿȿ� �ΰ� �̻��� �÷�
    
    �����ؾ� �� ���� ���
    1. ���̺��� ũ��(row)�� ���� ��(3000�� ����)
    -- �����Ͱ� ���� �� �����ϸ� �ӵ��� ��������
    2. ���̺��� ���� ���ŵ� ��
    
*/

CREATE TABLE EMP_COPY
AS
SELECT * FROM employees;

-- �ڵ�����
ALTER TABLE EMP_COPY
ADD
CONSTRAINT PK_EMPCOPY_01 PRIMARY KEY(EMPLOYEE_ID);

-- INDEX Ȯ�� ��� INDEX�� �� ���´�
-- INDEX ��Ī�� PRIMARY KEY ��Ī�� ���� �̸��� ���´�
SELECT *
FROM ALL_INDEXES
WHERE index_name IN ('PK_EMPCOPY_01');

-- ���� ����
CREATE INDEX EMP_INDEX01
ON EMP_COPY(MANAGER_ID);

DROP INDEX EMP_INDEX01;




