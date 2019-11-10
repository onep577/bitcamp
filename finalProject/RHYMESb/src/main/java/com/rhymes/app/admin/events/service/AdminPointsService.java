package com.rhymes.app.admin.events.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.events.dao.AdminPointsDAO;
import com.rhymes.app.admin.events.model.AdminPointsPagingDTO;
import com.rhymes.app.admin.events.model.PointsDTO;

@Service
public class AdminPointsService {

	@Autowired
	private AdminPointsDAO adminPointsDAO;
	
	/**총 적립금 지급내역 개수
	 * @return
	 */
	public int getTotalCountOfPoints(AdminPointsPagingDTO aPPDto) {
		return adminPointsDAO.getTotalCountOfPoints(aPPDto);
	}
	
	/** 페이징, 검색 조건에 맞는 적립금 내역 리턴
	 * @param aPPDto
	 * @return
	 */
	public List<PointsDTO> getPointsLogByConditions(AdminPointsPagingDTO aPPDto){
		return adminPointsDAO.getPointsLogByConditions(aPPDto);
	}
	
	/**매개변수로 받은 내용대로 적립금 디테일 수정
	 * @param pDto
	 * @return
	 */
	public int updatePointsDetail(PointsDTO pDto) {
		return adminPointsDAO.updatePointsDetail(pDto);
	}	
	
	/**ID가 갖는 권한 리턴, 중복되는 경우 MEMBER-SELLER-ADMIN-USEDSELLER 순서로 리턴
	 * @param userid
	 * @return
	 */
	public String getAuthoritiesById(String userid){
		List<String> authList = adminPointsDAO.getAuthoritiesById(userid);
		String[] authorities = {"ROLE_MEMBER", "ROLE_USEDSELLER", "ROLE_ADMIN", "ROLE_SELLER"};
		
		for(String auth : authorities) 
			if( authList.contains(auth) ) 
				return auth;						
		
		return "member";
	}
}
