package com.rhymes.app.store.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import com.rhymes.app.store.model.DetailParam;




import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.store.dao.PqnaDao;
import com.rhymes.app.store.model.PqnaDto;
import com.rhymes.app.store.service.PqnaService;

@Service
public class PqnaServiceImpl implements PqnaService {

	@Autowired
	private PqnaDao pqnaDao;
	
	//Pqna list
	@Override
	public List<PqnaDto> getPqnaList(DetailParam param) {
	
		return pqnaDao.getPqnaList(param);
	}

	//Pqna count
	@Override
	public int getPqnaCount(DetailParam param) {
		
		return pqnaDao.getPqnaCount(param);
	}

	//Pqna 업로드
	@Override
	public boolean PqnaUpload(PqnaDto dto) {
	
		return pqnaDao.PqnaUpload(dto);
	}

	//Pqna 디테일
	@Override
	public PqnaDto getPqnaDetail(int seq) {
		
		return pqnaDao.getPqnaDetail(seq);
	}

	//Pqna 수정
	@Override
	public boolean PqnaUpdateAf(PqnaDto dto) {
		
		return pqnaDao.PqnaUpdateAf(dto);
	}

	//Pqna 삭제
	@Override
	public boolean PqnaDelete(int seq) {
		
		return pqnaDao.PqnaDelete(seq);
	}

	//Pqna 답글
	@Override
	public boolean PqnaAnswer(PqnaDto dto) throws Exception {
		
		return pqnaDao.PqnaAnswer(dto);
	}

	
}
