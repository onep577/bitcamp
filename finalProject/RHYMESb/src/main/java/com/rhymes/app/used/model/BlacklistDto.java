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
public class BlacklistDto implements Serializable {
	private int seq;
	private String b_id;
	private int b_seq;
	private String reporter;
	private String content;
	private String rdate;
	private String blackcount;
}

/*
create table rhy_used_blacklist(
seq int(255) not null auto_increment,
b_id varchar(1000),
reporter varchar(1000),
content varchar(1000),
rdate datetime,
review int(255),
primary key(seq),
foreign key(b_id) references rhy_mem(id)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8; 
 */
