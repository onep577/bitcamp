package com.rhymes.app.customer.model;

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
public class CustomerParam implements Serializable{

	// search
	private String s_category; //����, ����, �ۼ���
	private String s_keyword;	// �˻���
	
	// paging
	private int pageNumber = 0;	//���� ������ 0���� ����
	private int recordCountPerPage = 10;	//ǥ���� �� �������� �ۼ�
	
	// [1]�������� -> 1~10 �� ���� �ҷ��;��� DB��
	private int start = 1;
	private int end = 10;
	
	private String id;
		
}
