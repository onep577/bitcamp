package com.rhymes.app.used.model;

import java.io.Serializable;
import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class CommentsDto implements Serializable {
	private int seq;		// 시퀀스
	private String id;		// 아이디
	private String comments;	// 댓글
	private String date;		// 등록일
	private String parent;	// 부모글
	private int ref;		// 시퀀스랑 동일
	private int step;		// 길이
	private int depth;		// 깊이
	
	private int rpagenumber;
	
	private int start;
	private int end;
}

/* 
 create table rhy_used_comments(
seq int(20) not null auto_increment,
id varchar(1000),
comments varchar(1000),
wdate date,
parent int(20),
ref int(20),
step int(20),
depth int(20),
primary key(seq),
foreign key(id) references rhy_mem(id))
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8; 
*/
