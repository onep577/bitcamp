package com.rhymes.app.admin.events.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**관리자-이벤트관리에서 공통으로 사용하는 서비스
 * @author minhj
 *
 */
@Repository
public class AdminEventsDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "adcommon.";
	
	/**keyword를 포함하는 모든 ID 리턴
	 * @param keyword
	 * @return
	 */
	public List<String> getUserid(String keyword){
		return sqlSession.selectList(ns + "getUserid", keyword);
	}
}
