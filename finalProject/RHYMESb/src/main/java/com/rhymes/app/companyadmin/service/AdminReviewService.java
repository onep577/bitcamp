package com.rhymes.app.companyadmin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.companyadmin.dao.AdminReviewDAO;
import com.rhymes.app.companyadmin.model.review.AdminReviewDTO;
import com.rhymes.app.companyadmin.model.review.AdminReviewPagingDTO;

@Service
public class AdminReviewService {

	@Autowired
	private AdminReviewDAO adminReviewDAO;
	
	/** 페이징 조건(판매자, 페이지, 검색)에 맞는 리뷰 총 개수 리턴
	 * @param aRPDto
	 * @return
	 */
	public int getTotalReviewAmounts(AdminReviewPagingDTO aRPDto) {
		return adminReviewDAO.getTotalReviewAmounts(aRPDto);
	}
	
	/**페이징 조건(판매자, 페이지, 검색)에 맞는 리뷰리스트 리턴
	 * @return
	 */
	public List<AdminReviewDTO> getAllReviewListByCName(AdminReviewPagingDTO aRPDto) {
		return adminReviewDAO.getAllReviewListByCName(aRPDto);
	}
	
	/**리뷰seq에 맞는 리뷰디테일 리턴
	 * @param seq
	 * @return
	 */
	public AdminReviewDTO getOneReviewInfo(int seq) {
		return adminReviewDAO.getOneReviewInfo(seq);
	}
}
