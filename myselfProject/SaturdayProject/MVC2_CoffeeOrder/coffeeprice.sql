CREATE TABLE COFFEEPRICE(
	COFF_TYPE VARCHAR(50) PRIMARY KEY,
	COFF_SHORT NUMBER(10),
	COFF_TALL NUMBER(10),
	COFF_GRAND NUMBER(10)
)

DROP TABLE COFFEEPRICE;

SELECT * FROM COFFEEPRICE;

INSERT INTO COFFEEPRICE(COFF_TYPE, COFF_SHORT, COFF_TALL, COFF_GRAND) VALUES('아메리카노', 1000, 1500, 2000)
INSERT INTO COFFEEPRICE(COFF_TYPE, COFF_SHORT, COFF_TALL, COFF_GRAND) VALUES('프라프치노', 1500, 2000, 2500)
INSERT INTO COFFEEPRICE(COFF_TYPE, COFF_SHORT, COFF_TALL, COFF_GRAND) VALUES('카라멜 마끼아또', 2000, 2500, 3000)
INSERT INTO COFFEEPRICE(COFF_TYPE, COFF_SHORT, COFF_TALL, COFF_GRAND) VALUES('카푸치노', 2000, 2500, 3000)
INSERT INTO COFFEEPRICE(COFF_TYPE, COFF_SHORT, COFF_TALL, COFF_GRAND) VALUES('오늘의 커피', 1500, 2000, 2500)