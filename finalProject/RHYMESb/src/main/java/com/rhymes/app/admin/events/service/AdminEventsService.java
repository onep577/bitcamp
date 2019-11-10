package com.rhymes.app.admin.events.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.events.dao.AdminEventsDAO;

/**관리자-이벤트관리에서 공통으로 사용하는 서비스
 * @author minhj
 *
 */
@Service
public class AdminEventsService {

	@Autowired
	private AdminEventsDAO adminEventsDAO;
	
	/**keyword를 포함하는 모든 ID 리턴
	 * @param keyword
	 * @return
	 */
	public List<String> getUserid(String keyword){
		return adminEventsDAO.getUserid(keyword);
	}
}
