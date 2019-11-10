package com.rhymes.app.admin.events.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rhymes.app.admin.events.model.AdminPointsPagingDTO;
import com.rhymes.app.admin.events.model.PointsDTO;
import com.rhymes.app.admin.events.service.AdminEventsService;
import com.rhymes.app.admin.events.service.AdminPointsService;
import com.rhymes.app.member.model.mypage.MemberPointDTO;
import com.rhymes.app.member.service.MypagePointsService;
import com.rhymes.app.used.Service.MyUsedService;

import lombok.extern.slf4j.Slf4j;


/**관리자페이지에서 적립금 관련 컨트롤러
 * @author minhj
 */
@Slf4j
@Controller
@RequestMapping(value = "/admin/mypage/*")
public class AdminPointsController {

	@Autowired
	private AdminEventsService adminEventsService;
	
	@Autowired
	private AdminPointsService adminPointsService;
	
	@Autowired
	private MyUsedService myUsedService;
	
	@Autowired
	private MypagePointsService mypagePointsService;
	
	/**관리자-이벤트-적립금관리 뷰
	 * 페이징, 검색
	 * @return
	 */
	@RequestMapping(value = "/points", method = {RequestMethod.POST, RequestMethod.GET})
	public String showMypageAdminPoints(Model model, AdminPointsPagingDTO pDto) {
		log.info("showMypageAdminPoints()");
		//테이블 컬럼 문자열
		String[] cols = {"No", "ID", "내용", "적립액", "사용금액", "사용가능금액", "만료일", "쿠폰번호"};
		
		pDto.setTotalSize(adminPointsService.getTotalCountOfPoints(pDto));
				
		model.addAttribute("cols", cols);
		model.addAttribute("pDto", pDto);
		model.addAttribute("pointsList", adminPointsService.getPointsLogByConditions(pDto));
				
		return "admin/member/mypage/points";
	}
	
	/**Ajax 통신을 통해 적립금 내용 수정
	 * @param model
	 * @param jsMap
	 * @param pcp
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/points/updatedetail", method = RequestMethod.POST)
	public String updatePointDetail(Model model, @RequestBody Map<String, Object> jsMap, Principal pcp) {
		log.info("updatePointDetail()");
		/* 선언부 */
		PointsDTO pDto = PointsDTO.builder().seq( Integer.parseInt(jsMap.get("seq") + "") )
											.comment( jsMap.get("comment") + "" )
											.amount( Integer.parseInt(jsMap.get("amount") + "" ) )
											.used_amount( Integer.parseInt(jsMap.get("used_amount") + "") ).build();
		
		/* 수행부 */
		//업데이트 완료되면 1리턴, 오류발생하면 0리턴
		int updateResult = 0;
		try {
			updateResult = adminPointsService.updatePointsDetail(pDto);
			
			switch(updateResult) {
				case 1 : return "1";
				default : return "0";
			}
			
		}catch (Exception e) {
			return "0";
		}		
	}
	
	/**Ajax 통신을 통해 아이디 리턴(autocomplete)
	 * @param model
	 * @param value
	 * @param pcp
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/points/getmembers", method = {RequestMethod.POST, RequestMethod.GET} )
	public List<String> getMembers(String value, Principal prc) throws Exception{
		log.info("getMembers()" + value);
						
		return adminEventsService.getUserid(value);				
	}
	
	/**Ajax 통신을 통해 권한 리턴(autocomplete)
	 * @param model
	 * @param value
	 * @param pcp
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/points/getmemberauth", method = {RequestMethod.POST, RequestMethod.GET})
	public List<String> getMemberAuth(@RequestBody String value) throws Exception{
		String userid = value.replaceAll("=", "");
		log.info("getMemberAuth() " + userid);
		
		String auth = adminPointsService.getAuthoritiesById(userid).replace("ROLE_", "");
		
		List<String> authorities = new ArrayList();
		authorities.add(auth);
		
		return authorities;
	}
	
	/**Ajax 통신을 통해 적립금 입력내용을 저장
	 * @param model
	 * @param value
	 * @param pcp
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/points/insertnew", method = RequestMethod.POST)
	public String insertPointsData(Model model, @RequestBody Map<String, Object> jsMap, Principal pcp) {
		log.info("insertPointsData() size:" + jsMap.size());
		int result = 0;

		Iterator it = jsMap.keySet().iterator();
		while( it.hasNext() ) {
			String[] pointsDetail = (jsMap.get(it.next()) + "").split("___");
			MemberPointDTO mPDto = new MemberPointDTO(pointsDetail[0], pointsDetail[1], Integer.parseInt( pointsDetail[2] ));
			result = mypagePointsService.addNewPoint(mPDto);
		}		
		
		return result + "";
	}
}
