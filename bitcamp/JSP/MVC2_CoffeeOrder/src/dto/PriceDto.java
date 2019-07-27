package dto;

import java.io.Serializable;

/*
CREATE TABLE COFFEEPRICE(
	COFF_TYPE VARCHAR(50) NOT NULL,
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
*/

public class PriceDto implements Serializable {
	private static final long serialVersionUID = 8558583969139943120L;
	
	private String coff_type;
	private int coff_short;
	private int coff_tall;
	private int coff_grand;
	
	public PriceDto() {
	}

	public PriceDto(String coff_type, int coff_short, int coff_tall, int coff_grand) {
		super();
		this.coff_type = coff_type;
		this.coff_short = coff_short;
		this.coff_tall = coff_tall;
		this.coff_grand = coff_grand;
	}

	public String getCoff_type() {
		return coff_type;
	}

	public void setCoff_type(String coff_type) {
		this.coff_type = coff_type;
	}

	public int getCoff_short() {
		return coff_short;
	}

	public void setCoff_short(int coff_short) {
		this.coff_short = coff_short;
	}

	public int getCoff_tall() {
		return coff_tall;
	}

	public void setCoff_tall(int coff_tall) {
		this.coff_tall = coff_tall;
	}

	public int getCoff_grand() {
		return coff_grand;
	}

	public void setCoff_grand(int coff_grand) {
		this.coff_grand = coff_grand;
	}

	@Override
	public String toString() {
		return "PriceDto [coff_type=" + coff_type + ", coff_short=" + coff_short + ", coff_tall=" + coff_tall
				+ ", coff_grand=" + coff_grand + "]";
	}
}
