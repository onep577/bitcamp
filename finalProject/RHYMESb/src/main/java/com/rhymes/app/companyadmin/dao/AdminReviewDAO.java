package com.rhymes.app.companyadmin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.companyadmin.model.review.AdminReviewDTO;
import com.rhymes.app.companyadmin.model.review.AdminReviewPagingDTO;

@Repository
public class AdminReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "adreview.";

	/** 페이징 조건(판매자, 페이지, 검색)에 맞는 리뷰 총 개수 리턴
	 * @param aRPDto
	 * @return
	 */
	public int getTotalReviewAmounts(AdminReviewPagingDTO aRPDto) {
		return sqlSession.selectOne(ns + "getTotalReviewAmounts", aRPDto);
	}	
	
	/**페이징 조건(판매자, 페이지, 검색)에 맞는 리뷰리스트 리턴
	 * @return
	 */
	public List<AdminReviewDTO> getAllReviewListByCName(AdminReviewPagingDTO aRPDto) {
		return sqlSession.selectList(ns + "getAllReviewListByCName", aRPDto);
	}
	
	/**리뷰seq에 맞는 리뷰디테일 리턴
	 * @param seq
	 * @return
	 */
	public AdminReviewDTO getOneReviewInfo(int seq) {
		return sqlSession.selectOne(ns + "getOneReviewInfo", seq);
	}
	
}
