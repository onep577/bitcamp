package com.rhymes.app.companyadmin.controller;

import java.io.Serializable;
import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rhymes.app.companyadmin.service.ProductManageService;
import com.rhymes.app.member.model.SellerDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/admin/company/*")
//@RequestMapping(value = "/companyadmin/*")
public class CompanyAdminMainController implements Serializable {

	HttpSession session;
	
	@Autowired
	ProductManageService manage;
	
	@GetMapping("/main")
	   public String goMain(Principal prc, Model model, RedirectAttributes redirect)throws Exception{
		  String url = "";
	      String c_id = "";
	 	  String c_name = "";
	      
	      if(prc != null) {
	     	  c_id = prc.getName();
	     	  SellerDTO seller = new SellerDTO();
	     	  seller.setId(c_id); 
	     	  seller = manage.getCname(seller);
	     	  c_name = seller.getC_name();
	     	 
	     	  if(!c_name.equals("") && c_name!=null) {
	     		  model.addAttribute("c_name", c_name);
	     		  url = "companyadminmain";
	     	  }else if(c_name.equals("") || c_name==null) {
	     		 url = "redirect:/main";
	     	  }
	     	  
	      }else{
	    	  url = "redirect:/main";
	      }
	      
	     return url;
		
	}
	
}
