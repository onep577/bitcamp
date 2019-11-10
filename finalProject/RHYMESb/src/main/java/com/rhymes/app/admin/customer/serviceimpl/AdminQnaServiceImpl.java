package com.rhymes.app.admin.customer.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.customer.dao.AdminQnaDao;
import com.rhymes.app.admin.customer.service.AdminQnaService;
import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.QnaDto;
import com.rhymes.app.customer.model.QnaOrderDto;
 
@Service
public class AdminQnaServiceImpl implements AdminQnaService {

	@Autowired
	private AdminQnaDao qnaDao;

	//qna list
	@Override
	public List<QnaDto> getQnaList(CustomerParam param) {
		
		return qnaDao.getQnaList(param);
	}

	//qna count
	@Override
	public int getQnaCount(CustomerParam param) {
		
		return qnaDao.getQnaCount(param);
	}

	//qna orderlist 가져오기
	@Override
	public List<QnaOrderDto> getQnaOrderList(String id) {
		
		return qnaDao.getQnaOrderList(id);
	}

	//qna detail
	@Override
	public QnaDto getQnaDetail(int seq) {
		
		return qnaDao.getQnaDetail(seq);
	}

	
	//qna 수정
	@Override
	public boolean QnaUpdateAf(QnaDto dto) {
		
		return qnaDao.QnaUpdateAf(dto);
	}

	//qna 파일명가져오기
	@Override
	public String getfilename(int seq) {
		
		return qnaDao.getfilename(seq);
	}

	//qna 삭제
	@Override
	public boolean QnaDelete(int seq) {
		
		return qnaDao.QnaDelete(seq);
	}
	
	//qna 부모글 자식글 삭제
	@Override
	public boolean QnaParentDelete(int ref) {
		
		return qnaDao.QnaParentDelete(ref);
	}

	//qna 답글
	@Override
	public boolean QnaAnswer(QnaDto dto) throws Exception {
		
		return qnaDao.QnaAnswer(dto);
	}
	
}
