package com.rhymes.app.customer.service;

import java.util.List;

import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.QnaDto;
import com.rhymes.app.customer.model.QnaOrderDto;

public interface QnaService {

	//qna list가져오기
	public List<QnaDto> getQnaList(CustomerParam param);
	
	//qna count
	public int getQnaCount(CustomerParam param);
	
	//qna orderlist 가져오기
	public List<QnaOrderDto> getQnaOrderList(String id);
	
	//qna 디테일 가져오기
	public QnaDto getQnaDetail(int seq);
	
	//qna 업로드
	public boolean QnaUpload(QnaDto dto);
	
	//qna 수정
	public boolean QnaUpdateAf(QnaDto dto);

	//qna 파일이름가져오기
	public String getfilename(int seq);
	
	//qna 삭제
	public boolean QnaDelete(int seq);
	
	//qna 부모글삭제 자식글 삭제
	public boolean QnaParentDelete(int ref);
	
}
