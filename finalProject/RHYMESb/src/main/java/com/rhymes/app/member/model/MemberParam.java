package com.rhymes.app.member.model;

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
public class MemberParam implements Serializable{

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
	private String sorting;	
	
	// alarm
	private String rdate;
	
}
