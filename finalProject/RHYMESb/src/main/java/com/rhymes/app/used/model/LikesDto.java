package com.rhymes.app.used.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Setter
@Getter
public class LikesDto implements Serializable {
	private int seq;
	private int bno;
	private String mname;
}

/*
 create table rhy_used_likes(
seq int(255) not null auto_increment,
p_no int(255),
m_no int(255),
primary key(seq),
foreign key(p_no) references rhy_used_products(seq)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8; 
*/
