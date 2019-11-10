package com.rhymes.app.store.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.store.dao.PreviewDao;
import com.rhymes.app.store.model.DetailParam;
import com.rhymes.app.store.model.PreviewDto;
import com.rhymes.app.store.service.PreviewService;

@Service
public class PreviewServiceImpl implements PreviewService {

	@Autowired
	private PreviewDao previewDao;
	
	//preview list
	@Override
	public List<PreviewDto> getPreviewList(DetailParam param) {
		
		return previewDao.getPreviewList(param);
	}

	//preview count
	@Override
	public int getPreviewCount(DetailParam param) {
		
		return previewDao.getPreviewCount(param);
	}

	//like 여부
	@Override
	public boolean getlikes(Map<String, Object> map) {
		
		return previewDao.getlikes(map);
	}

	//like 추가
	@Override
	public boolean addlikes(Map<String, Object> map) {
		
		return previewDao.addlikes(map);
	}

	//like 삭제
	@Override
	public boolean deletelikes(Map<String, Object> map) {
		
		return previewDao.deletelikes(map);
	}

	//총 like 수 올리기
	@Override
	public boolean uptotalcount(DetailParam param) {
		
		return previewDao.uptotalcount(param);
	}

	//총 like 수 내리기
	@Override
	public boolean downtotalcount(DetailParam param) {
		
		return previewDao.downtotalcount(param);
	}

	//총 like 수 가져오기
	@Override
	public int liketotalcount(DetailParam param) {
		
		return previewDao.liketotalcount(param);
	}

	
	
}
