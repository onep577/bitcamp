package com.rhymes.app.admin.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rhymes.app.admin.member.service.AdminMemberService;
import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.MemberParam;
import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.member.model.SellerBean;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/admin/*")
public class AdminMemberController {

	HttpSession session;

	@Autowired
	AdminMemberService adminMemberService;

	// 회원 리스트
	@RequestMapping(value = "/memlist", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String memlist(Model model, MemberParam param, HttpSession session, HttpServletRequest req){
		log.info("show admin memlistview");
		
		//페이징
		int sn = param.getPageNumber();	//0 1 2
		int start = sn * param.getRecordCountPerPage() + 1;	// 1 11
		int end = (sn + 1) * param.getRecordCountPerPage(); // 10 20
		
		param.setStart(start);
		param.setEnd(end);
		
		List<MemBean> memlist = adminMemberService.getmemlist(param);
		
		//list 총 수
		int totalRecordCount = adminMemberService.getmemCount(param);
		
		model.addAttribute("memlist", memlist);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);		
		
		// 추가
		model.addAttribute("s_category",param.getS_category());
		model.addAttribute("s_keyword",param.getS_keyword());
		model.addAttribute("authority",param.getAuthority());
		
		// sorting
		model.addAttribute("sorting", param.getSorting());
		 
		return "memlist"; 
	}
	
	// 업체 리스트
	@RequestMapping(value = "/mem_c_list", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String mem_c_list(Model model, MemberParam param){
		log.info("show admin mem_c_list");
		
		//페이징
		int sn = param.getPageNumber();	//0 1 2
		int start = sn * param.getRecordCountPerPage() + 1;	// 1 11
		int end = (sn + 1) * param.getRecordCountPerPage(); // 10 20
		
		param.setStart(start);
		param.setEnd(end);
		
		List<SellerBean> mem_c_list = adminMemberService.getmem_c_list(param);
		
		//list 총 수
		int totalRecordCount = adminMemberService.getmem_c_Count(param);
		
		model.addAttribute("mem_c_list", mem_c_list);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);		
	
		// 추가
			
		model.addAttribute("s_category",param.getS_category());
		model.addAttribute("s_keyword",param.getS_keyword());
		model.addAttribute("authority",param.getAuthority());
		
		// sorting
		model.addAttribute("sorting", param.getSorting());
		
		return "mem_c_list"; 
	}
	
	// 수정창으로 회원정보 불러오기
	@ResponseBody
	@RequestMapping(value = "/mem_update", method = {RequestMethod.GET, RequestMethod.POST})
	public P_MemberDTO mem_update(Model model, HttpServletRequest req) {
		log.info("show admin mem_update");

		String id = req.getParameter("id");
		P_MemberDTO mem = adminMemberService.getAdMem(id);

		return mem;
	}
	
	// 회원정보 수정
	@ResponseBody
	@RequestMapping(value = "/mem_updateAf", method = {RequestMethod.GET, RequestMethod.POST})
	public P_MemberDTO mem_updateAf(P_MemberDTO pmem, Model model, HttpServletRequest req) {
		log.info("show admin mem_updateAf");

		adminMemberService.getAdMemAf(pmem);
		
		return pmem;
	}

	// 회원 정지
	@RequestMapping(value = "/memLock", method = {RequestMethod.GET, RequestMethod.POST})
	public String memLock(MemBean bean, HttpServletRequest req) {
		log.info("show admin memLock");
		
		if(bean.getAuthority().equals("ROLE_SELLER")) {
			String dd[] = req.getParameterValues("checkid");
			int checklen = dd.length;
			bean.setChecklen(checklen);
			
			adminMemberService.getMemLock(bean);
			return "redirect:/admin/mem_c_list";
		}
		else {
			String dd[] = req.getParameterValues("checkid");
			int checklen = dd.length;
			bean.setChecklen(checklen);
			
			adminMemberService.getMemLock(bean);
			return "redirect:/admin/memlist";			
		}
	}
	
	// 회원 정지 해제
	@RequestMapping(value = "/memLock_n", method = {RequestMethod.GET, RequestMethod.POST})
	public String memLock_n(MemBean bean, HttpServletRequest req) {
		log.info("show admin memLock");
		
		if(bean.getAuthority().equals("ROLE_SELLER")) {	// 업체리스트로 이동
			String dd[] = req.getParameterValues("checkid");
			int checklen = dd.length;
			bean.setChecklen(checklen);
			
			adminMemberService.getMemLock_n(bean);
			return "redirect:/admin/mem_c_list";
		}else {	// 회원리스트로 이동
			String dd[] = req.getParameterValues("checkid");
			int checklen = dd.length;
			bean.setChecklen(checklen);
			
			adminMemberService.getMemLock_n(bean);
			return "redirect:/admin/memlist";
		}
	}

	
	 
	

}
