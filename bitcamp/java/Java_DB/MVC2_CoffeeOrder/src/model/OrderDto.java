package model;

import java.io.Serializable;
/*
DROP TABLE COFFEEORDER
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_COFFEEORDER;

CREATE TABLE COFFEEORDER(
	SEQ NUMBER(8) PRIMARY KEY,
	-- +되서 증가되기 때문에 중복 안되고 NULL이 있을 수 없다
	CUS VARCHAR2(20) NOT NULL,
	-- 이 테이블에선 외래키이다 어디에 있나? CUSTOMER 테이블에

	COFFEE_TYPE VARCHAR2(40) NOT NULL,
	COFFEE_SIZE VARCHAR2(40) NOT NULL,
	COFFEE_SYRUP VARCHAR2(40),
	
	COFFEE_SHOT VARCHAR2(1),
	COFFEE_WHIP VARCHAR2(1),
	COFFEE_NUMBER NUMBER(8) NOT NULL,
	COFFEE_TOTALPRICE NUMBER(10) NOT NULL,
	
	WDATE DATE NOT NULL
);

CREATE SEQUENCE SEQ_COFFEEORDER
START WITH 1
INCREMENT BY 1;

ALTER TABLE COFFEEORDER
ADD CONSTRAINT FK_COFFEEORDER_CUS FOREIGN KEY(CUS)
-- 여기서 CUS는 COFFEEORDER 테이블
REFERENCES CUSTOMER(ID);
-- 여기서 ID는 CUSTOMER 테이블

ALTER TABLE COFFEEORDER
ADD CONSTRAINT FK_COFFEEORDER_COFFEE_TYPE FOREIGN KEY(COFFEE_TYPE)
-- 여기서 COFFEE_TYPE은 COFFEEORDER 테이블
REFERENCES COFFEEPRICE(COFF_TYPE);
-- 여기서 COFF_TYPE은 COFFEEPRICE 테이블

--TEST_SEQ.NEXTVAL
--		.CURRENT

SELECT * FROM COFFEEORDER;
*/
public class OrderDto implements Serializable {
	private int seq;
	private String id;
	private String coffee_type;
	private String coffee_size;
	private String coffee_syrup;
	private String coffee_shot;
	private String coffee_whip;
	private int coffee_number;
	private int coffee_totalPrice;
	private String wdate;
	
	public OrderDto() {
	}

	public OrderDto(int seq, String id, String coffee_type, String coffee_size, String coffee_syrup, String coffee_shot,
			String coffee_whip, int coffee_number, int coffee_totalPrice, String wdate) {
		super();
		this.seq = seq;
		this.id = id;
		this.coffee_type = coffee_type;
		this.coffee_size = coffee_size;
		this.coffee_syrup = coffee_syrup;
		this.coffee_shot = coffee_shot;
		this.coffee_whip = coffee_whip;
		this.coffee_number = coffee_number;
		this.coffee_totalPrice = coffee_totalPrice;
		this.wdate = wdate;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCoffee_type() {
		return coffee_type;
	}

	public void setCoffee_type(String coffee_type) {
		this.coffee_type = coffee_type;
	}

	public String getCoffee_size() {
		return coffee_size;
	}

	public void setCoffee_size(String coffee_size) {
		this.coffee_size = coffee_size;
	}

	public String getCoffee_syrup() {
		return coffee_syrup;
	}

	public void setCoffee_syrup(String coffee_syrup) {
		this.coffee_syrup = coffee_syrup;
	}

	public String getCoffee_shot() {
		return coffee_shot;
	}

	public void setCoffee_shot(String coffee_shot) {
		this.coffee_shot = coffee_shot;
	}

	public String getCoffee_whip() {
		return coffee_whip;
	}

	public void setCoffee_whip(String coffee_whip) {
		this.coffee_whip = coffee_whip;
	}

	public int getCoffee_number() {
		return coffee_number;
	}

	public void setCoffee_number(int coffee_number) {
		this.coffee_number = coffee_number;
	}

	public int getCoffee_totalPrice() {
		return coffee_totalPrice;
	}

	public void setCoffee_totalPrice(int coffee_totalPrice) {
		this.coffee_totalPrice = coffee_totalPrice;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	@Override
	public String toString() {
		return "OrderDto [seq=" + seq + ", id=" + id + ", coffee_type=" + coffee_type + ", coffee_size=" + coffee_size
				+ ", coffee_syrup=" + coffee_syrup + ", coffee_shot=" + coffee_shot + ", coffee_whip=" + coffee_whip
				+ ", coffee_number=" + coffee_number + ", coffee_totalPrice=" + coffee_totalPrice + ", wdate=" + wdate
				+ "]";
	}

}
