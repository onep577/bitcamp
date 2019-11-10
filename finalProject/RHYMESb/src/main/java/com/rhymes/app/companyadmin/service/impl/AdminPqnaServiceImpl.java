package com.rhymes.app.companyadmin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.companyadmin.dao.AdminPqnaDao;
import com.rhymes.app.companyadmin.service.AdminPqnaService;
import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.store.model.DetailParam;
import com.rhymes.app.store.model.PqnaDto;

@Service
public class AdminPqnaServiceImpl implements AdminPqnaService {

	@Autowired
	private AdminPqnaDao pqnadao;
	
	//Pqna list
	@Override
	public List<PqnaDto> getPqnaList(DetailParam param) {
	
		return pqnadao.getPqnaList(param);
	}

	//Pqna count
	@Override
	public int getPqnaCount(DetailParam param) {
		
		return pqnadao.getPqnaCount(param);
	}

	//Pqna 업로드
	@Override
	public boolean PqnaUpload(PqnaDto dto) {
	
		return pqnadao.PqnaUpload(dto);
	}

	//Pqna 디테일
	@Override
	public PqnaDto getPqnaDetail(int seq) {
		
		return pqnadao.getPqnaDetail(seq);
	}

	//Pqna 수정
	@Override
	public boolean PqnaUpdateAf(PqnaDto dto) {
		
		return pqnadao.PqnaUpdateAf(dto);
	}

	//Pqna 삭제
	@Override
	public boolean PqnaDelete(int seq) {
		
		return pqnadao.PqnaDelete(seq);
	}

	//Pqna 답글
	@Override
	public boolean PqnaAnswer(PqnaDto dto) throws Exception {
		
		return pqnadao.PqnaAnswer(dto);
	}

}
