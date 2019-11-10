package com.rhymes.app.admin.events.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.admin.events.model.AdminPointsPagingDTO;
import com.rhymes.app.admin.events.model.PointsDTO;

@Repository
public class AdminPointsDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "adpoints.";
	
	/**총 적립금 지급내역 개수
	 * @return
	 */
	public int getTotalCountOfPoints(AdminPointsPagingDTO aPPDto) {
		int result = 0;
		
		try {
			result = sqlSession.selectOne(ns + "getTotalCountOfPoints", aPPDto);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result; 
	}
	
	/** 페이징, 검색 조건에 맞는 적립금 내역 리턴
	 * @param aPPDto
	 * @return
	 */
	public List<PointsDTO> getPointsLogByConditions(AdminPointsPagingDTO aPPDto){
		return sqlSession.selectList(ns + "getPointsLogByConditions", aPPDto);
	}
	
	/**매개변수로 받은 내용대로 적립금 디테일 수정
	 * @param pDto
	 * @return
	 */
	public int updatePointsDetail(PointsDTO pDto) {
		return sqlSession.update(ns +"updatePointsDetail", pDto);
	}
	
	/**ID가 갖는 모든 권한 리턴
	 * @param userid
	 * @return
	 */
	public List<String> getAuthoritiesById(String userid){
		return sqlSession.selectList(ns + "getAuthoritiesById", userid); 
	}
}
