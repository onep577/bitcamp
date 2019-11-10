package com.rhymes.app.used.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class NotesRecvParam implements Serializable {

	// id
	private String id;
	
	// search
	private String r_select; // 제목, 내용, 작성자
	private String r_keyword; // 검색어

	// paging
	private int r_pageNumber = 0; // 현재 페이지
	private int r_recordCountPerPage = 10; // 표현하려는 한 페이지의 글 수
	// [1] -> 1 ~ 10
	// [2] -> 11 ~ 20
	// [3] -> 21 ~ 30 , DB용 변수
	private int r_start = 1;
	private int r_end = 10;

}
