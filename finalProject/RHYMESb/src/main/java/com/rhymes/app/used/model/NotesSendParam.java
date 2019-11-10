package com.rhymes.app.used.model;

import java.io.Serializable;

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
public class NotesSendParam implements Serializable {

	// id
	private String id;
	
	// search
	private String s_select; // 제목, 내용, 작성자
	private String s_keyword; // 검색어

	// paging
	private int s_pageNumber = 0; // 현재 페이지
	private int s_recordCountPerPage = 10; // 표현하려는 한 페이지의 글 수
	// [1] -> 1 ~ 10
	// [2] -> 11 ~ 20
	// [3] -> 21 ~ 30 , DB용 변수
	private int s_start = 1;
	private int s_end = 10;

}
