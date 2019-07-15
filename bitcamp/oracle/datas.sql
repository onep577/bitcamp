SELECT * FROM employees;
select * from employees;
SELECT * FROM EMPLOYEES;    /* ���� */

-- ���� �ּ���
/*
���� �ּ���
*/

-- �ڷ���
-- java        Oracle
-- int      == NUMBER
-- String   == VARCHAR2
-- double   == NUMBER(������ �ڸ���,�Ҽ��� �ڸ���)
-- Date     == Date

-- ���ڿ� �ڷ��� CHAR, VARCHAR, LONG
-- CHAR
CREATE TABLE TB_CHAR(
    COL_CHAR1 CHAR(10 BYTE),    -- String COL_CHAR1 (ũ��);
    COL_CHAR2 CHAR(10 CHAR),
    COL_CHAR3 CHAR(10)
);

/*
CREATE TABLE ���̺��(
    �÷��� �÷��� �ڷ���(ũ��)
);
*/
/*
INSERT INTO ���̺��(�÷���, �÷���,...,�÷���)
VALUES(��, ��,...,��)
*/

INSERT INTO TB_CHAR(COL_CHAR1, COL_CHAR2, COL_CHAR3)
VALUES('ABC','ABC','ABC');  -- ����ũ�� 1 BYTE

INSERT INTO TB_CHAR(COL_CHAR1, COL_CHAR2, COL_CHAR3)
VALUES('��','��','��');  -- �ѱ�ũ�� 3 BYTE

INSERT INTO TB_CHAR(COL_CHAR1, COL_CHAR2, COL_CHAR3)
VALUES('����','����','����');
-- CHAR(5 BYTE) �� ���̴ϱ� ABC,�� �� ����
-- ��? '����'�� 6byte '������'�� 9byte�� �� ���̼�

INSERT INTO TB_CHAR(COL_CHAR1, COL_CHAR2, COL_CHAR3)
VALUES('������','������','������');
-- ���̰� 16byte�� ������ '��' �� ���ڸ� char������ ����ϱ� �����̴�
-- 3 + 3 + 3 + 7 = 16

SELECT * FROM tb_char;

SELECT COL_CHAR1, COL_CHAR2, COL_CHAR3,
    LENGTHB(COL_CHAR1), LENGTHB(COL_CHAR2), LENGTHB(COL_CHAR3)
FROM tb_char;
-- CHAR�� �������̶� ���̰����� �ּ� 10byte�� ���´�
-- '��'�� char������ ����ؼ� 10,12,14,16byte�̴�
-- ������ �� �ڷ����� �Է����� ������ BYTE�� �����ȴ�?

/*
CHAR : 10 BYTE  00000 00000
ABC ->          ABC00 00000

10 BYTE
������ ->        ������0

10 CHAR
�� 3 + 9 = 12              ��0000 00000
���� 3 + 3 + 8 = 14        ����000 00000
������ 3 + 3 + 3 + 7 = 16  ������00 00000
*/

-- VARCHAR2
CREATE TABLE TB_VARCHAR(
    �÷�1 VARCHAR2(10 BYTE),
    �÷�2 VARCHAR2(10 CHAR),
    �÷�3 VARCHAR2(10)
);

INSERT INTO TB_VARCHAR(�÷�1, �÷�2, �÷�3)
VALUES('ABC', 'ABC', 'ABC');

INSERT INTO TB_VARCHAR(�÷�1, �÷�2, �÷�3)
VALUES('������', '������', '������');
-- VARCHAR2(5 BYTE)�ϸ� '������'�� �߰� �� �Ѵ�
-- ��? '������'�� 9byte�ε� �÷��� 5byte�����̱� �����̴�

SELECT "�÷�1", "�÷�2", "�÷�3",
    LENGTHB("�÷�1"), LENGTHB("�÷�2"), LENGTHB("�÷�3")
FROM tb_varchar;
-- CHAR�� ���������̰�,
-- VARCHAR�� �������̶� ó�� ������ �� �Է��� 10BYTE�� �ƴ� ���ڿ��� ����
-- ��, 'ABC'�� ���� 3BYTE, '������'�� ���� 9BYTE�� ���´�
-- �÷����� ����� ����! �ѱ۷� ���� �ֵ���ǥ �ؾ��Ѵ�

-- LONG �ִ� 2GB���� ���� ����
CREATE TABLE TB_LONG(
    COL_LONG1 LONG
--    COL_LONG2 LONG
);
-- �� ���̺� ���� �ϳ��� LONG �÷��� ��� �����ϴ�

INSERT INTO TB_LONG(COL_LONG1)
VALUES('ABC');
-- oracle LONG�� ���ڿ�

select * from TB_LONG;

CREATE TABLE TB_NUMBER(
    COL_NUM1 NUMBER,
    COL_NUM2 NUMBER(5), 
    -- ���� 5�ڸ����� ����, �Ҽ��� �ִ´ٸ� �ݿø��ȴ�
    COL_NUM3 NUMBER(5, 2),
    -- �����Ҽ� ���ļ� 5�ڸ�, ������ 3�ڸ��� ���� �� ����,
    -- �Ҽ��ڸ��� �ݿø��Ǿ� 2�ڸ��� ���´�
    COL_NUM4 NUMBER(*, 2)
    -- �Ҽ��ڸ��� �ݿø��Ǿ� 2�ڸ��� ���´�
);
INSERT INTO TB_NUMBER(COL_NUM1, COL_NUM2, COL_NUM3, COL_NUM4)
VALUES(1234.56789, 12345.567, 123.567, 1.789);
--                 123456.567 �ִ´ٸ� ����
--                            1234.56 �ִ´ٸ� ����
SELECT * FROM TB_NUMBER;

-- ���� �ڷ��� INTEGER == ����
CREATE TABLE TB_INTEGER(
    COL_INT1 INTEGER,
    COL_INT2 INTEGER
);

-- NUMBER(����,�Ǽ�)
CREATE TABLE TB_NUMBER(
    COL_NUM1 NUMBER,
    COL_NUM2 NUMBER(5),
    COL_NUM3 NUMBER(5, 2),
    COL_NUM4 NUMBER(*, 2)
);

INSERT INTO tb_number(COL_NUM1, COL_NUM2, COL_NUM3, COL_NUM4)
VALUES(1234.5678, 12345, 123.456, 1234.56789);

INSERT INTO tb_number(COL_NUM1, COL_NUM2, COL_NUM3, COL_NUM4)
VALUES(1234.5678, 12345, 234.567, 1234.56789);
-- ���� 1234.567 5�ڸ��� �Ҽ� 2�ڸ������̹Ƿ�

SELECT * FROM tb_number;

-- ��¥ �ڷ��� DATE
-- ����, ��, ��, ��, ��, �� ���� �� ����ȴ�
CREATE TABLE TB_DATE(
    COL_DATE1 DATE,
    COL_DATE2 DATE
);

INSERT INTO TB_DATE(COL_DATE1, COL_DATE2)
VALUES(SYSDATE, SYSDATE - 1);
-- SYSDATE ���� �⵵/��/��

SELECT * FROM tb_date;

INSERT INTO TB_DATE(COL_DATE1, COL_DATE2)
VALUES(SYSDATE, TO_DATE('2019-01-01 10:32:24', 'YYYY-MM-DD HH:MI:SS'));
INSERT INTO TB_DATE(COL_DATE1, COL_DATE2)
VALUES('19-08-15', '19-01-31');
-- ���� 13���� ���� �� ���� ���������� �ѱ�� ����
-- 11���� 31���� 12���� 32���� ����

INSERT INTO TB_DATE(COL_DATE1, COL_DATE2)
VALUES(SYSDATE, '2019-07-12 10:32:24'); -- ����
-- ���� ���� : literal does not match format string

INSERT INTO TB_DATE(COL_DATE1, COL_DATE2)
VALUES(SYSDATE, TO_DATE('20190417103224','YYYYMMDDHHMISS'));

-- VARCHAR2(���ڿ�) -> DATE(��¥����) : TO_DATE
-- DATE(��¥����) -> VARCHAR2(���ڿ�) : TO_CHAR










