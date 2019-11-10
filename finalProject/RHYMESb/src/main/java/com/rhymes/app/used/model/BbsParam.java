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
public class BbsParam implements Serializable {

	// search
	private String category;

	private String select; // 제목, 내용, 작성자
	private String keyword; // 검색어

	// paging
	private int pageNumber = 0; // 현재 페이지
	private int recordCountPerPage = 12; // 표현하려는 한 페이지의 글 수

	// [1] -> 1 ~ 10
	// [2] -> 11 ~ 20
	// [3] -> 21 ~ 30 , DB용 변수
	private int start = 1;
	private int end = 10;

}
