package com.rhymes.app.event.model;

import java.io.Serializable;

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
public class EventParam implements Serializable{

	// 전체페이지, 진행중인페이지, 종료된 페이지
	private String code;
	
	// search
	private String s_category; //����, ����, �ۼ���
	private String s_keyword;	// �˻���
	
	// paging
	private int pageNumber = 0;	//���� ������ 0���� ����
	private int recordCountPerPage=10;	//ǥ���� �� �������� �ۼ�
	
//	private int dataTable_length;	// 리스트 나열 갯수
	
	// [1]�������� -> 1~10 �� ���� �ҷ��;��� DB��
	private int start = 1;
	private int end = 10;
	
	// select
	private String authority;
	
	// sorting
	private String sorting="SEQ";	
	
	// alarm
	private String rdate;
	
	// 오늘 날짜 (종료된 이벤트 구분위해)
	private String ndate;
}
