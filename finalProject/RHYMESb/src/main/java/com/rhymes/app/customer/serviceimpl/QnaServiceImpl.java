package com.rhymes.app.customer.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.QnaDto;
import com.rhymes.app.customer.model.QnaOrderDto;
import com.rhymes.app.customer.service.QnaService;
import com.rhymes.app.customer.dao.QnaDao;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDao qnaDao;

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

	//qna 글쓰기
	@Override
	public boolean QnaUpload(QnaDto dto) {
		
		return qnaDao.QnaUpload(dto);
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

	// qna 부모글 자식글 삭제
	@Override
	public boolean QnaParentDelete(int ref) {
		
		return qnaDao.QnaParentDelete(ref);
	}

	
}
