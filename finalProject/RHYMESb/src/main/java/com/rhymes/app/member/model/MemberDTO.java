package com.rhymes.app.member.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@SuppressWarnings("serial")
@Getter
@Setter
public class MemberDTO implements Serializable {
	
	private int seq;
	private String userid;
	private String userpw;
	private String social;
	
	private boolean isAccountNonExpired = true;
	private boolean isAccountNonLock = true;
	private boolean isCredentialsIsNonExpired = true;
	private boolean enabled;
	private List<AuthoritiesDTO> authList;
	private Date rdate;
	
	
	public MemberDTO() {}
	
	
	@Builder
	public MemberDTO(String userid, String userpw) {
		super();
		this.userid = userid;
		this.userpw = userpw;
	}

	@Builder
	public MemberDTO(String userid, String userpw, boolean enabled) {
		super();
		this.userid = userid;
		this.userpw = userpw;
		this.enabled = enabled;
	}	
	
	@Builder
	public MemberDTO(int seq, String userid, String userpw, boolean isAccountNonExpired, boolean isAccountNonLock,
			boolean isCredentialsIsNonExpired, boolean enabled, List<AuthoritiesDTO> authList, Date rdate) {
		super();
		this.seq = seq;
		this.userid = userid;
		this.userpw = userpw;
		this.isAccountNonExpired = isAccountNonExpired;
		this.isAccountNonLock = isAccountNonLock;
		this.isCredentialsIsNonExpired = isCredentialsIsNonExpired;
		this.enabled = enabled;
		this.authList = authList;
		this.rdate = rdate;
	}
	
	@Builder
	public MemberDTO(int seq, String userid, String userpw, boolean isAccountNonExpired, boolean isAccountNonLock,
			boolean isCredentialsIsNonExpired, boolean enabled, Date rdate) {
		super();
		this.seq = seq;
		this.userid = userid;
		this.userpw = userpw;
		this.isAccountNonExpired = isAccountNonExpired;
		this.isAccountNonLock = isAccountNonLock;
		this.isCredentialsIsNonExpired = isCredentialsIsNonExpired;
		this.enabled = enabled;
		this.rdate = rdate;
	}

	@Override
	public String toString() {
		return "MemberDTO [seq=" + seq + ", userid=" + userid + ", userpw=" + userpw + ", isAccountNonExpired="
				+ isAccountNonExpired + ", isAccountNonLock=" + isAccountNonLock + ", isCredentialsIsNonExpired="
				+ isCredentialsIsNonExpired + ", enabled=" + enabled + ", authList=" + authList + ", rdate=" + rdate
				+ "]";
	}
	

}
/*
CREATE TABLE `rhy_mem` (
	`SEQ` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`ID` VARCHAR(1000) NOT NULL COMMENT '아이디',
	`PW` VARCHAR(1000) NOT NULL COMMENT '비밀번호',
	`isAccountNonExpired` VARCHAR(1000) NULL DEFAULT 'true' COMMENT '계정만료여부',
	`isAccountNonLock` VARCHAR(1000) NULL DEFAULT 'true' COMMENT '계정잠금여부',
	`isCredentialslsNonExpired` VARCHAR(1000) NULL DEFAULT 'true' COMMENT '자격만료여부',
	`isEnabled` VARCHAR(1000) NULL DEFAULT 'true' COMMENT '사용가능여부',
	`RDATE` DATETIME NOT NULL DEFAULT '',
	PRIMARY KEY (`SEQ`),
	UNIQUE INDEX `UNIQUE_ID` (`ID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=2
;
*/

