package bit.com.a.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
DROP TABLE EXAM_STUDENT
CASCADE CONSTRAINTS;
--무결성도 지우자

CREATE TABLE STUDENT(
	ID		VARCHAR2(20)	PRIMARY KEY,	-- 아이디
	PWD		VARCHAR2(20)	NOT NULL,		-- 비밀번호
	NAME	VARCHAR2(20)	NOT NULL,		-- 이름
	GENDER	NUMBER(1)		NOT NULL,		-- 성별
	AUTH	NUMBER(1)		NOT NULL		-- 3 학생, 2 교수, 1 관리자
)
*/

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Student implements Serializable {
	private String id;			// 아이디
	private String pwd;			// 비밀번호
	private String name;		// 이름
	private int gender;			// 성별
	private int auth;			// 3 학생, 2 교수, 1 관리자

}
