package com.rhymes.app.admin.events.controller;

import java.security.Principal;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rhymes.app.admin.events.model.AdminPointsPagingDTO;
import com.rhymes.app.admin.events.model.CouponDTO;
import com.rhymes.app.admin.events.model.CouponDetailDTO;
import com.rhymes.app.admin.events.model.CouponDetailPagingDTO;
import com.rhymes.app.admin.events.service.AdminCouponService;
import com.rhymes.app.common.util.MypageUtils;

import lombok.extern.slf4j.Slf4j;

/**관리자페이지에서 이벤트관련 컨트롤러
 * @author minhj
 */
@Slf4j
@Controller
@RequestMapping(value = "/admin/mypage/*")
public class AdminCouponController {
	
	@Autowired
	private AdminCouponService adminCouponService;

	/**관리자-마이페이지 메인 뷰
	 * @return
	 */
	@GetMapping(value = "/main")
	public String showMypageAdminMain() {
		log.info("showMypageAdminMain()");
		return "admin/member/mypage";
	}
	
	/**관리자-이벤트-쿠폰관리 뷰
	 * @return
	 */
	@GetMapping(value = "/coupon")
	public String showMypageAdminCoupon(Model model, AdminPointsPagingDTO pDto) {
		log.info("showMypageAdminCoupon()");
		
		/* 선언부 */
		String[] cols = {"No", "쿠폰이름", "쿠폰내용", "구분", "기능", "유효기간(월)", "등록일  "}; //테이블 컬럼 문자열
		int totalSize = 0;
		List<CouponDTO> couponList = null;
						
		//log.info(pDto.toString());
				
		totalSize = adminCouponService.getTotalCountOfCoupons(pDto);
		pDto.setTotalSize(totalSize);
		couponList = adminCouponService.getCouponsByConditions(pDto);
		
		//log.info(couponList.toString());

		model.addAttribute("cols", cols);
		model.addAttribute("pDto", pDto);
		model.addAttribute("couponList", couponList);
		
		return "admin/member/mypage/coupon";
	}
	
	/**관리자-이벤트-쿠폰관리-쿠폰상세 뷰
	 * @return
	 */
	@GetMapping(value = "/coupon/detail")
	public String showMypageAdminCouponDetail(@RequestParam(defaultValue = "1") int seq, Model model
			, CouponDetailPagingDTO pDto) {
		log.info("showMypageAdminCouponDetail()");
			
		
		/* 선언부 */
		CouponDTO cDto = null;
		List<CouponDetailDTO> couponDetailList = null;
		pDto.setSeq(seq);
		
		//어떤쿠폰인지 추가
		cDto = adminCouponService.getCouponInfoBySeq(seq);
				
		//쿠폰 디테일 추가(쿠폰번호, 발행일, 사용자, 등록자 등)
		pDto.setTotalSize(adminCouponService.getTotalCountOfCouponDetail(pDto));
		couponDetailList = adminCouponService.getCouponDetails(pDto);
		//log.info("list : " + couponDetailList.toString());

		//log.info(pDto.toString());	
		
		model.addAttribute("cDto", cDto);	//쿠폰정보
		model.addAttribute("pDto", pDto);	//쿠폰디테일 페이징정보
		model.addAttribute("couponDetailList", couponDetailList);	//쿠폰디테일 내용
		
		return "admin/member/mypage/sub/coupon_detail";
	}
	
	/**Ajax 통신을 통해 새 쿠폰 생성(rhy_mem_coupon)
	 * @param model
	 * @param jsMap
	 * @param pcp
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/coupon/makenew", method = RequestMethod.POST)
	public String makeNewCoupon(Model model, @RequestBody Map<String, String> jsMap, Principal pcp) {
		log.info("couponCodeGenerate()");
		/* 선언부 */
		int result = 0;
		//String[] dtoCols = {"title", "sub_title", "app_cate", "func", "func_num", "func_measure", "func_time_limit"};
		CouponDTO cDto = new CouponDTO(jsMap);
		//log.info("cdto : " + cDto);

		/* 수행부 */		
		try {
			result = adminCouponService.insertNewCoupon(cDto);
			return (result > 0)?"1":"0";
		}catch (Exception e) {
			return "0";
		}		
	}
	
	
	/**Ajax 통신을 통해 새로운 쿠폰번호 발행(rhy_mem_coupon_detail)
	 * @param model
	 * @param jsMap
	 * @param pcp
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/coupon/detail/generate", method = RequestMethod.POST)
	public String couponCodeGenerate(Model model, @RequestBody Map<String, Object> jsMap, Principal pcp) {
		log.info("couponCodeGenerate()");
		/* 선언부 */
		int result = 0;
		int amount = 0;
		int c_seq = 0;
		List<CouponDetailDTO> codeList = null;
		
		/* 수행부 */		
		try {
			c_seq = Integer.parseInt( jsMap.get("c_seq") + "" );
			amount = Integer.parseInt( jsMap.get("amount") + "" );
			codeList = MypageUtils.getRandCoupsTimestampList(c_seq, amount);
			
//			for(CouponDetailDTO d : codeList) {
//				log.info(d.getSeq() + ", str : " + d.getCoup_code() );
//			}
			result = adminCouponService.insertCouponList(codeList);
			
			return (result > 0)?"1":"0";
		}catch (Exception e) {
			return "0";
		}		
	}
	
	/**Ajax 통신을 통해 쿠폰 지급(rhy_mem_coupon_detail)
	 * @param jsMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/coupon/detail/givecoupon", method = RequestMethod.POST)
	public String giveCouponToOneUser(@RequestBody Map<String, Object> jsMap) {
		log.info("giveCouponToOneUser()");
		/* 선언부 */
		int result = 0;
		//CouponDTO 필드
		int c_seq = 0, timeLimit = 1;
		//CouponDetailDTO 선언과 필드변수
		CouponDetailDTO cDDto = null;
		String coupon_code = "", userid = "", gdate = "", expdate = "";
		DateFormatter df = new DateFormatter("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance(Locale.KOREA);
		
		/* 수행부 */		
		try {
			c_seq = Integer.parseInt( jsMap.get("c_seq") + "" );
			timeLimit = Integer.parseInt( jsMap.get("func_time_limit") + "" );
			coupon_code = jsMap.get("coupon_code") + "";
			userid = jsMap.get("userid") + "";
			
			gdate = df.print(cal.getTime(), Locale.KOREA);//쿠폰 등록일은 현재시점으로 설정
			cal.add( cal.MONTH , timeLimit);
			expdate = df.print(cal.getTime(), Locale.KOREA);
			
			cDDto = new CouponDetailDTO(c_seq, userid, coupon_code, gdate, expdate);

			result = adminCouponService.giveCouponToOneUser(cDDto);
			
			return (result > 0)?"1":"0";
		}catch (Exception e) {
			return "0";
		}		
	}
}
