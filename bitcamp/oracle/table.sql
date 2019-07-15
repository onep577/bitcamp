-- ���̺�
-- CREATE, ALTER, DROP : ����, ����, ����
-- INSERT, DELETE, SELECT, UPDATE : �������� �߰�, ����, �˻�, ����




-- ���̺� �����̽� ����
-- system �������� ����
CREATE TABLESPACE TABLESPACE2
DATAFILE 'E:\tablespace1\TEST_TBS1_01.DBF' SIZE 10M
AUTOEXTEND ON NEXT 1M MAXSIZE UNLIMITED -- �߰��Ǵ� �뷮
LOGGING
EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K
SEGMENT SPACE MANAGEMENT AUTO
FLASHBACK ON;

-- ���̺� �����̽� ����
ALTER TABLESPACE TABLESPACE2
RENAME TO TEST_TBS_NEW;

ALTER DATABASE
DATAFILE 'E:\tablespace1\TEST_TBS1_01.DBF' RESIZE 7M;

-- ���̺� �����̽� ����
DROP TABLESPACE TEST_TBS_NEW
iNCLUDING CONTENTS AND DATAFILES
CASCADE CONSTRAINTS; -- ���� ���Ǳ��� ������







-- ���̺� ����
DROP TABLE TB_TEST01;

CREATE TABLE TB_TEST01(
    COL_01 VARCHAR2(10),
    COL_02 VARCHAR2(10),
    COL_03 VARCHAR2(10),
    COL_04 VARCHAR2(10)
)

CREATE TABLE TB_TEST02(
    COL_01 VARCHAR2(10),
    COL_02 VARCHAR2(10),
    COL_03 VARCHAR2(10),
    COL_04 VARCHAR2(10)
)
TABLESPACE TABLESPACE2;






-- ������ �� ���� �Ѵ� ��? �����͸� ����, �����ϴ� ���� ������ �۾��̱� �����̴�
-- ���̺� ���� : ������ ����
CREATE TABLE TB_TEST03
AS
SELECT *
FROM jobs;

SELECT * FROM TB_TEST03;

-- ���̺� ���� : ������ ������
CREATE TABLE TB_TEST04
AS
SELECT *
FROM jobs
WHERE 1=2;

SELECT * FROM TB_TEST04;
-- ���������� ���ǹ�(1=2) �� ������ ���̺� ������ �ȴٰ� ������ �����ʹ� �� �����´�





-- ���̺� ���� : ���̺�� ����
ALTER TABLE TB_TEST04
RENAME
TO TB_TEST99;




-- ���� �÷� �߰�
ALTER TABLE TB_TEST99
ADD
COL_01 VARCHAR2(30);

SELECT * FROM TB_TEST99;

-- ���� �÷� �߰�
ALTER TABLE TB_TEST99
ADD
(COL_02 VARCHAR2(20), COL_03 NUMBER(10));

SELECT * FROM TB_TEST99;






-- ���� �÷� ����
ALTER TABLE TB_TEST99
MODIFY
COL_01 VARCHAR2(20);

-- ���� �÷� ����
ALTER TABLE TB_TEST99
MODIFY
(COL_02 VARCHAR2(10), COL_03 NUMBER(5,2) );

SELECT * FROM TB_TEST99;




-- ���� �÷� ����
ALTER TABLE TB_TEST99
DROP
COLUMN COL_01;
-- ���� �÷� ����
ALTER TABLE TB_TEST99
DROP
(COL_02, COL_03);

SELECT * FROM TB_TEST99;





-- �÷��� ����
ALTER TABLE TB_TEST99
RENAME
COLUMN job_id TO my_job;

-- ���̺� ����
DROP TABLE TB_TEST99;

-- ������ ����
-- ���̺��� ���� ���� �� �������� ���� �������� ���ɼ��� �ִ�
PURGE RECYCLEBIN;








