/*
    sequence : ������ ���� ������ �ִ� Oracle Object��
    ȸ����ȣ, �Խ����� �� ��ȣ
    -- �Խ��� �տ� �ִ� 1, 2, 3, 4�� �������� �ƴϴ�
    -- �׳� for������ ���ڸ� ���°Ŵ�

    SEQUENCE�� �����ϸ� PRIMARY KEY�� ���� ���������� �����ϴ� �÷���
    �ڵ������� ������ �� �ִ�
    SEQUENCE�� �ʱ�ȭ�� �Ұ����ϴ� 1 2 3 4 5
    
    int count = 1;
    count++;

*/

-- sequence ����
CREATE SEQUENCE TEST_SEQ
INCREMENT BY 1  -- 1�� ���� ++
START WITH 10   -- ���� 10����
MAXVALUE 100
MINVALUE 1;

-- CURRVAL -- ���� �������� ��
SELECT TEST_SEQ.CURRVAL
FROM DUAL;

-- NEXTVAL -- ���� ��
SELECT TEST_SEQ.NEXTVAL
FROM DUAL;

-- SEQUENCE ����
ALTER SEQUENCE TEST_SEQ
INCREMENT BY 3;

-- SEQUENCE �ʱ�ȭ�� �Ұ���
DROP SEQUENCE TEST_SEQ;

INSERT INTO employees(EMPLOYEES_SEQ.NEXTVALM);





-- ���Ǿ�(SYNONYM / ��ü�� ����)
/*
    int array_postion_number[];
    int arrPosNum[] = array_postion_number;
    arrPosNum[0] = 1;
*/
CREATE SYNONYM "�����"
FOR EMPLOYEES;

SELECT * FROM "�����";

INSERT INTO "�����"
VALUES(EMPLOYEES_SEQ.NEXTVAL,
    '�浿', 'ȫ', 'HGD', '123-4567', TO_DATE('2005/01/01', 'YYYY/MM/DD'),
    'IT_PROG', 20000, NULL, 100, 10);

SELECT * FROM employees;


