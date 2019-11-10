package com.rhymes.app.member.model;

import java.io.Serializable;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@SuppressWarnings("serial")
@Getter
@Setter
@ToString
public class AuthoritiesDTO implements Serializable {

	private int seq;
	private String userid;
	private String authority;
	
	@Builder
	public AuthoritiesDTO() {}

	@Builder
	public AuthoritiesDTO(String userid, String authority) {
		super();
		this.userid = userid;
		this.authority = authority;
	}
	
	@Builder
	public AuthoritiesDTO(int seq, String userid, String authority) {
		super();
		this.seq = seq;
		this.userid = userid;
		this.authority = authority;
	}
}
/*
CREATE TABLE `authorities` (
	`SEQ` INT(11) NOT NULL,
	`ID` VARCHAR(1000) NOT NULL,
	`AUTHORITY` VARCHAR(1000) NOT NULL
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

ALTER TABLE AUTHORITIES ADD CONSTRAINT SEQ_NUM PRIMARY KEY (SEQ)
ALTER TABLE AUTHORITIES MODIFY COLUMN SEQ BIGINT NOT NULL AUTO_INCREMENT
*/