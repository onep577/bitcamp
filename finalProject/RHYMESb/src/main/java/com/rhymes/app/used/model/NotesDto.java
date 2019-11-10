package com.rhymes.app.used.model;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class NotesDto implements Serializable {
	private int seq;			// 시퀀스
	private String send_id;		// 보내는 사람 아이디
	private String recv_id;		// 받는 사람 아이디
	private String content;		// 쪽지 내용
	private String data_send;		// 쪽지를 보낸 날짜
	private String data_read;		// 받는이가 쪽지를 받은 날짜
	private String recv_read;	// 받는이가 쪽지를 읽은 여부
	private String send_del;	// 보낸이가 보낸 쪽지함에서 삭제 여부
	private String recv_del;	// 받는이가 받은 쪽지함에서 삭제 여부
	
	private int readcount; // 수신확인을 위한 컬럼
}
/*
create table rhy_used_notes(
seq int(255) not null auto_increment,
send_id varchar(1000),
recv_id varchar(1000),
title  varchar(1000),
content  varchar(1000),
data_send datetime,
data_read datetime,
recv_read  varchar(1000),
send_del  varchar(1000),
recv_del  varchar(1000),
primary key(seq),
foreign key(send_id) references rhy_mem(id)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8; 
 */