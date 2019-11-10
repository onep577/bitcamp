package com.rhymes.app.store.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class PreviewDto {

	private int seq;	//후기 고유번호
	private int pd_seq;	//후기가 참조하는 주문 디테일 ID(seq)
	private String userid;	//후기작성자 ID
	
	private String title;	//제목
	private String content;	//내용
	private String img;		//첨부파일
	
	private int likes_cnt;	//좋아요 수
	private int ref;		//원본글
	private int step;		//원본글과의 거리
	private int depth;		//답글 깊이
	private int del;		//삭제여부(1=삭제)
	private int parent;		//부모글 번호(seq)
	
	private String rdate;	//등록일
	private String p_name;	//상품이름
	
	private String mylike; //나의 좋아요 유무
	private String size; //사이즈
	
}
