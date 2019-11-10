package com.rhymes.app.companyadmin.controller;

import java.security.Principal;
import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rhymes.app.companyadmin.model.review.AdminReviewDTO;
import com.rhymes.app.companyadmin.model.review.AdminReviewPagingDTO;
import com.rhymes.app.companyadmin.service.AdminReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/productreview")
public class AdminPReviewController {
	
	@Autowired
	private AdminReviewService adminReviewService;
	
	@Autowired
	private SqlSession ss;
	
	@RequestMapping(value = "/showlist")
	public String showAdminReviewList(Model model, Principal pcp, AdminReviewPagingDTO aRPDto) throws Exception{
		log.info("showAdminReviewList()");
		
		/* 선언 */
		String user = pcp.getName();
		aRPDto.setC_name(user);		
		List<AdminReviewDTO> reviewList = null;
		String[] cols = {"No", "리뷰제목", "작성자", "좋아요", "등록일시", "상품명", "구매수량", "상품색상"};
		
		/* 수행 */
		aRPDto.setTotalSize( adminReviewService.getTotalReviewAmounts(aRPDto) );
		reviewList = adminReviewService.getAllReviewListByCName(aRPDto);
//		log.info("user : " + user);
//		log.info("pdto : " + aRPDto);
//		log.info("total : " + ss.selectOne("adreview.getTotalReviewAmounts",aRPDto));
//		for (Iterator iterator = reviewList.iterator(); iterator.hasNext();) {
//			AdminReviewDTO adminReviewDTO = (AdminReviewDTO) iterator.next();
//			log.info("!!!! : " + adminReviewDTO);
//		}
		
		/* add attr */
		model.addAttribute("reviewList", reviewList);	//리뷰리스트
		model.addAttribute("aRPDto", aRPDto);		//페이징 DTO
		model.addAttribute("cols", cols);			//테이블 컬럼 이름
		
		return "admin/productreview";
	}
	
	@RequestMapping(value = "/showdetail")
	public String showAdminReviewDetail(Model model, @RequestParam(defaultValue = "0") int seq) {
		log.info("showAdminReviewDetail() ");
		
		/* 선언 */
		AdminReviewDTO aRDto = null;
		
		/* 수행 */
		aRDto = adminReviewService.getOneReviewInfo(seq);
		log.info("ard" + aRDto);
		if(aRDto == null ) return "redirect:/admin/productreview/showlist";	//null 걸러줌		
		
		model.addAttribute("aRDto", aRDto);
		
		return "admin/productreview/detail";
	}
	
	
}
