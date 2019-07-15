/*
���Ἲ : �÷��� �����ϴ� ����
-- PRIMARY KEY : �⺻Ű, NULL�� ������� ����. �ߺ��� ������� ����. ID, �ֹι�ȣ
-- UNIQUE KEY : ����Ű, NULL�� ���. �ߺ��� ������� ����. E-MAIL
-- CHECK : ���� ����. ���� ���� ����. NULL�� ���.
-- FOREIGN KEY : �ܷ�Ű. �ٸ� ���̺��� PRIMARY KEY�̰ų� UNIQUE KEY�� ���ɼ��� �ִ�.
                 ���̺�� ���̺��� ������ �ִ� ������ ���� �ִ�.
-- NOT NULL : NULL�� ������� �ʴ´�.
*/

DROP TABLE TB_TEST;

CREATE TABLE TB_TEST(
    COL_01 VARCHAR2(10) NOT NULL,
    COL_02 VARCHAR2(10)
);

INSERT INTO TB_TEST(COL_01, COL_02)
VALUES('AAA', 'aaa');

-- NOT NULL�� ���� ���߱� ������ NULL���� �����ϴ�
INSERT INTO TB_TEST(COL_01, COL_02)
VALUES('BBB', '');

-- ���Ἲ ���� : cannot insert NULL into
-- NOT NULL�� �����߱� ������ COL_01���� NULL�� �� �� ����
INSERT INTO TB_TEST(COL_01, COL_02)
VALUES('', 'ccc');

SELECT * FROM TB_TEST;



-- PRIMARY KEY
DROP TABLE TEST_01;

-- ���� : table can have only one primary key
-- �����̸Ӹ� Ű �ΰ� ������ �̷��� �� �Ѵ�
CREATE TABLE TEST_01(
    KEY_01 VARCHAR2(10) CONSTRAINT PK_TEST_01 PRIMARY KEY,
    -- CONSTRAINT ���Ἲ
    KEY_02 VARCHAR2(10) CONSTRAINT PK_TEST_02 PRIMARY KEY,
    COL_01 VARCHAR2(20),
    COL_02 VARCHAR2(30)
);

-- ����ó�� �ϳ����� ���� �Ʒ�ó�� �Ѳ������� OK
CREATE TABLE TEST_01(
    KEY_01 VARCHAR2(10),
    KEY_02 VARCHAR2(10),
    COL_01 VARCHAR2(20),
    COL_02 VARCHAR2(30),
    CONSTRAINT PK_TEST_01 PRIMARY KEY(KEY_01, KEY_02)
);

DROP TABLE TEST_01;

CREATE TABLE TEST_01(
    KEY_01 VARCHAR2(10) PRIMARY KEY,
    KEY_02 VARCHAR2(10),
    COL_01 VARCHAR2(20),
    COL_02 VARCHAR2(30)
);

DROP TABLE TEST_01;

CREATE TABLE TEST_01(
    KEY_01 VARCHAR2(10),
    KEY_02 VARCHAR2(10),
    COL_01 VARCHAR2(20),
    COL_02 VARCHAR2(30)
);

-- �⺻Ű ��, PRIMARY KEY ����, ���� ���
ALTER TABLE TEST_01
ADD
CONSTRAINT PK_TEST_01
PRIMARY KEY(KEY_01, COL_01);

ALTER TABLE TEST_01
DROP CONSTRAINT PK_TEST_01;

ALTER TABLE TEST_01
ADD
CONSTRAINT PK_TEST_01
PRIMARY KEY(KEY_01, COL_01);



-- PRIMARY KEY
SELECT *
FROM user_constraints
WHERE table_name = 'TEST_01'
    AND constraint_type = 'P';

DROP TABLE TEST_01;

CREATE TABLE TEST_01(
    KEY_01 VARCHAR2(10),
    KEY_02 VARCHAR2(10),
    COL_01 VARCHAR2(20),
    COL_02 VARCHAR2(30),
    CONSTRAINT PK_TEST_01 PRIMARY KEY(KEY_01, KEY_02)
);

INSERT INTO test_01(key_01, key_02, col_01, col_02)
VALUES('AAA', 'aaa', '111', '111');

-- ���� : AAA�� aaa�� �ߺ��� ���̴� unique constraint (HR.SYS_C007082) violated
INSERT INTO test_01(key_01, key_02, col_01, col_02)
VALUES('AAA', 'aaa', '111', '111');

INSERT INTO test_01(key_01, key_02, col_01, col_02)
VALUES('BBB', 'aaa', '111', '111');

INSERT INTO test_01(key_01, key_02, col_01, col_02)
VALUES('AAA', 'bbb', '111', '111');

-- ���� : NULL ���̴� cannot insert NULL into
INSERT INTO test_01(key_01, key_02, col_01, col_02)
VALUES('', 'aaa', '111', '111');

INSERT INTO test_01(key_01, key_02, col_01, col_02)
VALUES('CCC', '', '111', '111');

SELECT * FROM TEST_01;

DROP TABLE TEST_01;

CREATE TABLE TEST_01(
    KEY_01 VARCHAR2(10),
    KEY_02 VARCHAR2(10),
    COL_01 VARCHAR2(20),
    COL_02 VARCHAR2(30),
    CONSTRAINT PK_TEST_01 PRIMARY KEY(KEY_01, KEY_02)
);

INSERT INTO test_01(key_01, key_02, col_01, col_02)
VALUES('AAA', 'aaa', '111', '111');

INSERT INTO test_01(key_01, key_02, col_01, col_02)
VALUES('AAA', 'AAA', '111', '111');

INSERT INTO test_01(key_01, key_02, col_01, col_02)
VALUES('AAA', 'ccc', '111', '111');

INSERT INTO test_01(key_01, key_02, col_01, col_02)
VALUES('BBB', 'ccc', '111', '111');

INSERT INTO test_01(key_01, key_02, col_01, col_02)
VALUES('BBB', 'aaa', '111', '111');

-- �� �� ��ġ�ϱ� ���� : unique constraint
INSERT INTO test_01(key_01, key_02, col_01, col_02)
VALUES('BBB', 'aaa', '111', '111');

SELECT * FROM test_01;







-- UNIQUE
-- �ߺ� ��� ���Ѵ�. NULL ����Ѵ�
CREATE TABLE TEST_02(
    KEY_01 VARCHAR2(10) CONSTRAINT UK_TEST_01 UNIQUE,
    KEY_02 VARCHAR2(10),
    COL_01 VARCHAR2(20),
    COL_02 VARCHAR2(20)
);

INSERT INTO test_02(KEY_01, KEY_02, COL_01, COL_02)
VALUES('AAA', 'aaa', '111', '111');

DROP TABLE TEST_02 -- UK_TEST_01 �̸��� ���´�
CASCADE CONSTRAINTS; -- ���Ἲ���� ��� ����

CREATE TABLE TEST_02(
    KEY_01 VARCHAR2(10),
    KEY_02 VARCHAR2(10),
    COL_01 VARCHAR2(20),
    COL_02 VARCHAR2(20),
    CONSTRAINT UK_TEST_01 UNIQUE(KEY_01, KEY_02)
);

INSERT INTO test_02(KEY_01, KEY_02, COL_01, COL_02)
VALUES('AAA', 'aaa', '111', '111');

INSERT INTO test_02(KEY_01, KEY_02, COL_01, COL_02)
VALUES('AAA', 'bbb', '111', '111');

-- �ߺ����� ������� �ʴ´� ���� : unique constraint (HR.UK_TEST_01) violated
INSERT INTO test_02(KEY_01, KEY_02, COL_01, COL_02)
VALUES('AAA', 'aaa', '111', '111');

INSERT INTO test_02(KEY_01, KEY_02, COL_01, COL_02)
VALUES('AAA', '', '111', '111');

INSERT INTO test_02(KEY_01, KEY_02, COL_01, COL_02)
VALUES('', 'aaa', '111', '111');

INSERT INTO test_02(KEY_01, KEY_02, COL_01, COL_02)
VALUES('', '', '111', '111');

SELECT * FROM test_02;

-- PRIMARY�� UNIQUE�� ����
-- PRIMARY  �ߺ� x, NULL ��� x     ex) ���̵�
-- UNIQUE   �ߺ� x, NULL ��� O     ex) �̸���





-- CHECK �ߺ� ��� o, null �� o
DROP TABLE TEST_03
CASCADE CONSTRAINTS;

CREATE TABLE TEST_03(
    KEY_01 VARCHAR2(10),
    KEY_02 VARCHAR2(10),
    COL_01 VARCHAR2(20),
    COL_02 NUMBER,
    CONSTRAINT CHK_TEST_01 CHECK(COL_01 IN('���', '��', '�ٳ���')),
    CONSTRAINT CHK_TEST_02 CHECK(COL_02 > 0 AND COL_02 <= 100)
);

INSERT INTO test_03(KEY_01, KEY_02, COL_01, COL_02)
VALUES('AAA', 'aaa', '���', 1);

-- �ߺ� ��� O
INSERT INTO test_03(KEY_01, KEY_02, COL_01, COL_02)
VALUES('AAA', 'aaa', '���', 1);

INSERT INTO test_03(KEY_01, KEY_02, COL_01, COL_02)
VALUES('AAA', 'aaa', '�ٳ���', 2);

-- ������ ���� �ƴϴ� �ֿ��� ���� : check constraint (HR.CHK_TEST_01) violated
INSERT INTO test_03(KEY_01, KEY_02, COL_01, COL_02)
VALUES('AAA', 'aaa', '��', 2);

INSERT INTO test_03(KEY_01, KEY_02, COL_01, COL_02)
VALUES('AAA', 'aaa', '��', 100);

-- CHECK�� NULL�� ����Ѵ�
INSERT INTO test_03(KEY_01, KEY_02, COL_01, COL_02)
VALUES('AAA', 'aaa', '', 100);

-- CHECK�� �� �� NULL�� ����Ѵ�
-- �������� NULL���� �ְ� ������ ''�� ����
INSERT INTO test_03(KEY_01, KEY_02, COL_01, COL_02)
VALUES('AAA', 'aaa', '', '');


SELECT * FROM test_03;

-- ���Ἲ ���� �� ����





-- FOREIGN KEY : �� ���̺��� �����ϴ� ����
-- �θ� ���̺��̶�� �θ��� ��� �������� �ʴ�
-- �θ� ���̺��� DEPARTMENTS, JOBS ���̺� �ش�ȴ�
DROP TABLE TEST_CHD;
DROP TABLE TEST_PAR;

CREATE TABLE TEST_PAR(
    KEY_01 VARCHAR2(10),
    KEY_02 VARCHAR2(10),
    COL_01 VARCHAR2(20),
    COL_02 VARCHAR2(20),
    CONSTRAINT PK_TEST_PAR PRIMARY KEY(KEY_01, KEY_02)
);

-- �ڽ����̺� EMPLOYEES�� �ش�ȴ�
CREATE TABLE TEST_CHD(
    KEY_01 VARCHAR2(10) CONSTRAINT PK_TEST_CHD PRIMARY KEY,
    -- ������ ���� �̸��� ���� EMPLOYEES job_id, JOBS job_idó��
    FK_KEY_01 VARCHAR2(10),
    FK_KEY_02 VARCHAR2(10),
    CONSTRAINT FK_TEST_CHD FOREIGN KEY(FK_KEY_01, FK_KEY_02)
        REFERENCES TEST_PAR(KEY_01, KEY_02)
);

INSERT INTO test_par(KEY_01, KEY_02, COL_01, COL_02)
VALUES('AAA', 'aaa', '111', '111');

INSERT INTO test_par(KEY_01, KEY_02, COL_01, COL_02)
VALUES('BBB', 'bbb', '222', '222');

INSERT INTO test_par(KEY_01, KEY_02, COL_01, COL_02)
VALUES('CCC', 'ccc', '333', '333');



INSERT INTO test_par(KEY_01, KEY_02, COL_01, COL_02)
VALUES('DDD', 'ddd', '444', '444');

-- �����̸Ӹ�Ű KEY_01, KEY_02�� 444�� ��� �ȴ�
-- �����̸Ӹ�Ű�� �ߺ��Ǹ� �ȵǰ� NULL �ȵȴ�
INSERT INTO test_par(COL_01, COL_02, KEY_01, KEY_02)
VALUES('DDD', 'ddd', '444', '444');

-- �÷����� ������ �÷��� ������� ����
INSERT INTO test_par
VALUES('EEE', 'eee', '555', '555');

INSERT INTO test_par(KEY_01, KEY_02)
VALUES('FFF', 'fff');
-- �÷����� �ݵ�� �־�� �ϴ� ���� �ƴϴ�


SELECT * FROM TEST_PAR;
SELECT * FROM TEST_CHD;


--INSERT INTO TEST_CHD(KEY_01, FK_KEY_01, FK_KEY_02)
--VALUES('111', '', '');
-- ���� NULL �� �ڸ� �� �θ� Ŭ������ �ִ� ���̾�� �Ѵ�
INSERT INTO TEST_CHD(KEY_01, FK_KEY_01, FK_KEY_02)
VALUES('1010', 'AAA', 'aaa');

-- ���� : �θ� ���̺� �����Ͱ� ���� ���Ἲ ���� unique constraint (HR.PK_TEST_CHD) violated
-- ���� NULL �� �ڸ� �� �ϳ��� �θ� Ŭ������ �ִ� ���� �ٸ��� ����
INSERT INTO TEST_CHD(KEY_01, FK_KEY_01, FK_KEY_02)
VALUES('2020', 'AAA', 'bbb');

-- integrity constraint (HR.FK_TEST_CHD) violated - parent key not found
-- �÷����� �״���ε� ������ ������ �ٲ㼭 �����ϱ� ����
INSERT INTO TEST_CHD(KEY_01, FK_KEY_01, FK_KEY_02)
VALUES('2020', 'bbb', 'BBB');

INSERT INTO TEST_CHD(KEY_01, FK_KEY_01, FK_KEY_02)
VALUES('2020', 'BBB', 'bbb');

-- �򰥸��� Ŵ���� ����
-- �ܷ�Ű�� �ܺο� Ű ���� �ִ��� NULL���� ����Ѵ�
INSERT INTO TEST_CHD(KEY_01, FK_KEY_01, FK_KEY_02)
VALUES('3030', '', '');

-- FOREIGN KEY �ΰ� �߿� �� �� �θ� ���̺� ���̶� ���� �� ������ �Է� �����ϴ�
-- �� �� �ϳ��� NULL���̸� �ٸ� �ϳ��� � ���� ���� �� �ִ�
-- ��? �θ� ���̺�� ��ġ���� �ʴ� �ڽ� ���̺��� FOREIGN KEY�� �����̱� �����̴� ex) Ŵ����
INSERT INTO TEST_CHD(KEY_01, FK_KEY_01, FK_KEY_02)
VALUES('4040', 'GGG', '');

INSERT INTO TEST_CHD(KEY_01, FK_KEY_01, FK_KEY_02)
VALUES('5050', '', 'ggg');

-- ���� : integrity constraint (HR.FK_TEST_CHD) violated - parent key not found
INSERT INTO TEST_CHD(KEY_01, FK_KEY_01, FK_KEY_02)
VALUES('6060', 'GGG', 'ggg');

INSERT INTO TEST_CHD(KEY_01, FK_KEY_01, FK_KEY_02)
VALUES('6060', '', 'AAA');

INSERT INTO TEST_CHD(KEY_01, FK_KEY_01, FK_KEY_02)
VALUES('7070', 'AAA', 'aaa');

SELECT * FROM TEST_PAR;
SELECT * FROM TEST_CHD;
-- 'AAA' 'BBB' 'CCC' '' �װ����� ���






COMMIT; -- DB���� �����ϰ� ���� �� COMMIT����. �����͸� �ִ´�
-- COMMIT�� �ϸ� ROLLBACK �Ұ����ϴ�
ROLLBACK; -- DB�� ������ �ֱ� ���� �������ִ� ��. �����͸� �ǵ�����







-- jobs ���̺� ������ ���ԵǼ� �����´�
CREATE TABLE TB_TEST_BK
AS
SELECT *
FROM jobs;

SELECT * FROM TB_TEST_BK;

-- UPDATE
UPDATE tb_test_bk
SET min_salary = 0, max_salary = 100
WHERE job_id LIKE 'AD%';

ROLLBACK;

UPDATE tb_test_bk
SET min_salary = 0, max_salary = 0
WHERE max_salary >= 10000;

-- DELETE
DELETE
FROM tb_test_bk
WHERE max_salary < 10000;

DROP TABLE tb_test_bk;






