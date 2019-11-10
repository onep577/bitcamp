package com.rhymes.app.admin.used.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rhymes.app.admin.used.model.AdminBbsParam;
import com.rhymes.app.admin.used.model.AdminBlParam;
import com.rhymes.app.admin.used.model.AdminSParam;
import com.rhymes.app.admin.used.service.AdminUsedService;
import com.rhymes.app.used.Service.UsedService;
import com.rhymes.app.used.model.BlacklistDto;
import com.rhymes.app.used.model.ProductsDto;
import com.rhymes.app.used.model.SellerDto;

@Controller
@RequestMapping(value = "admin/*")
public class AdminUsedController {

	@Autowired
	AdminUsedService adminUsedService;

	@Autowired
	UsedService usedService;

	@GetMapping(value="/admin/memsellerlist")
	public String memsellerlist(Model model,SellerDto sDto, AdminSParam sparam) {
		
		
		int totalRecordCount = adminUsedService.getAdminSellerCount(sparam);
		int sn = sparam.getPageNumber(); // 0 , 1, 2
		int start = sn * sparam.getRecordCountPerPage() + 1; // 0 -> 1 , 1 - > 11 1 11
		int end = (sn + 1) * sparam.getRecordCountPerPage(); // 0 - > 10, 1 - > 20 10 20
		
		sparam.setStart(start);
		sparam.setEnd(end);

		List<BlacklistDto> list = adminUsedService.getAdminSellerlist(sparam);

		model.addAttribute("select", sparam.getSelect());
		model.addAttribute("keyword", sparam.getKeyword());

		model.addAttribute("pageNumber", sn); // 현재 페이지 넘버
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", sparam.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);

		model.addAttribute("list", list);

		
		
		return "admin/used/admin_used_memsellerlist";
	}
	
	@GetMapping(value = "/mem_blacklist") // 블랙리스트 목록을 얻는다
	public String getblacklist(Model model, BlacklistDto bDto, AdminBlParam blparam) {

		int totalRecordCount = adminUsedService.getAdminBlCount(blparam);
		int sn = blparam.getPageNumber(); // 0 , 1, 2
		int start = sn * blparam.getRecordCountPerPage() + 1; // 0 -> 1 , 1 - > 11 1 11
		int end = (sn + 1) * blparam.getRecordCountPerPage(); // 0 - > 10, 1 - > 20 10 20

		blparam.setStart(start);
		blparam.setEnd(end);

		List<BlacklistDto> list = adminUsedService.getAdminBlacklist(blparam);

		model.addAttribute("select", blparam.getSelect());
		model.addAttribute("keyword", blparam.getKeyword());

		model.addAttribute("pageNumber", sn); // 현재 페이지 넘버
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", blparam.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);

		model.addAttribute("list", list);

		return "admin/used/admin_used_blacklist";
	}

	@GetMapping(value = "/used/usedlist") // 중고 전체 판매 게시글을 얻는다
	public String getAdminUsedlist(Model model, ProductsDto pDto, AdminBbsParam adparam) {

		int totalRecordCount = adminUsedService.getAdminBbsCount(adparam);

		// pageNumber 취득
		int sn = adparam.getPageNumber(); // 0 , 1, 2
		int start = sn * adparam.getRecordCountPerPage() + 1; // 0 -> 1 , 1 - > 11 1 11
		int end = (sn + 1) * adparam.getRecordCountPerPage(); // 0 - > 10, 1 - > 20 10 20

		adparam.setStart(start);
		adparam.setEnd(end);

		List<ProductsDto> list = adminUsedService.getAdminUsedlist(adparam);

		model.addAttribute("select", adparam.getSelect());
		model.addAttribute("keyword", adparam.getKeyword());

		model.addAttribute("pageNumber", sn); // 현재 페이지 넘버
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", adparam.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);

		model.addAttribute("list", list);

		return "admin/used/admin_used_sell_list";
	}

	@GetMapping(value = "/used/useddelete")
	public String AdminUsedDelete(@RequestParam(value = "chbox") List<String> seq) {

		for (int i = 0; i < seq.size(); i++) {
			String n = seq.get(i);
			int n2 = Integer.parseInt(n);
			usedService.deleteProduct(n2);
		}

		return "redirect:/admin/used/usedlist";
	}

	@GetMapping(value = "/used/userban")
	public String AdminUserBan(@RequestParam(value = "ckbox") List<String> seq,
			@RequestParam(value = "b_id") List<String> b_id) {

		for (int i = 0; i < seq.size(); i++) {

			boolean b = adminUsedService.AdminBanCount(b_id.get(i));

			String n = seq.get(i);
			int n2 = Integer.parseInt(n);

			boolean c = adminUsedService.AdminBanReview(n2);
		}

		return "redirect:/admin/mem_blacklist";
	}

	@GetMapping(value = "/used/userbancancel")
	public String AdminUserBanCancel(@RequestParam(value = "ckbox") List<String> seq) {

		for (int i = 0; i < seq.size(); i++) {

			String n = seq.get(i);
			int n2 = Integer.parseInt(n);

			boolean c = adminUsedService.AdminUserBanCancel(n2);
		}

		return "redirect:/admin/mem_blacklist";
	}
	
	@GetMapping(value="/used/userLock")
	public String AdminUsedLock(@RequestParam(value = "s_id") List<String> s_id) {
		
		for (int i = 0; i < s_id.size(); i++) {
				
			boolean b = adminUsedService.AdminUserLock(s_id.get(i));
		}
		
		
		return "redirect:/admin/memsellerlist";
	}
	
	@GetMapping(value="/used/userUnLock")
	public String AdminuserUnLock(@RequestParam(value = "s_id") List<String> s_id) {
		
		for (int i = 0; i < s_id.size(); i++) {
			
			boolean b = adminUsedService.AdminUserUnLock(s_id.get(i));
		}
		
		
		return "redirect:/admin/memsellerlist";
	}
}
