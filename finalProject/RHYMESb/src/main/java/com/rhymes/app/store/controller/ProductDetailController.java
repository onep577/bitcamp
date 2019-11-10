package com.rhymes.app.store.controller;

import java.security.Principal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rhymes.app.companyadmin.service.ProductManageService;
import com.rhymes.app.store.model.ProductDto;
import com.rhymes.app.store.model.RestockNotifyDto;
import com.rhymes.app.store.model.StockDto;
import com.rhymes.app.store.model.WishlistDto;
import com.rhymes.app.store.model.category.Category2Dto;
import com.rhymes.app.store.service.PurchaseService;
import com.rhymes.app.store.service.StoreService;
import com.rhymes.app.used.Service.UsedService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j

@RequestMapping("/store")
public class ProductDetailController {
	
	@Autowired HttpServletRequest req;
	@Autowired StoreService store;
	@Autowired ProductManageService productmanage;
	@Autowired PurchaseService purchase;
	@Autowired UsedService usedService;
	   
	DecimalFormat formatter = new DecimalFormat("###,###");
	
	// 상품 상세정보 페이지로 이동
	   @RequestMapping(value="/productDetail", method = RequestMethod.GET)
	   public String productDetail(Model model, ProductDto product, Principal prc, HttpServletRequest req) throws Exception{
	      
	      String userId = "";
	      if(prc != null) {
	         userId = prc.getName();
	      }
	      
	      List<StockDto> sizelist = purchase.getSizeList(product.getP_seq());
	      
	      ProductDto productDto = purchase.getProductDetail(product.getP_seq());
	      productDto.setP_price2(formatter.format(productDto.getP_price()));
	      productDto.setBfs_price2(formatter.format(productDto.getBfs_price()));
	      
	      log.info("------------" + product.getMdate());
	      
	      if(productDto.getMdate() != null || ("").equals(productDto.getMdate())){
		      String madeYear = productDto.getMdate().substring(0,4);
	   	      String madeMonth = productDto.getMdate().substring(4);
	   	      productDto.setMadeYear(madeYear);
	   	      productDto.setMadeMonth(madeMonth);
	      }
	      
	    // 위시리스트 중복 체크
	       WishlistDto wish = new WishlistDto();
	       //접속 ID GET
	       wish.setId(userId);
	       wish.setP_seq(product.getP_seq());
	       boolean wishChk = purchase.chkWishlist(wish);
	      
	    //left nav
	       model.addAttribute("c1_name", product.getC1_name());
	       // 브랜드 리스트
	       List<String> clist = store.getCompnayList();    
	       model.addAttribute("clist", clist);
	       // 2차 카테고리 리스트
	       List<Category2Dto> cate2list = new ArrayList<Category2Dto>();
	       
	       if(product.getC1_name() != "" || product.getC1_name() != null) {
	         if(product.getC1_name().equals("MEN")) {
	            cate2list = productmanage.getCate2List(1);
	         }else if(product.getC1_name().equals("WOMEN")) {
	            cate2list = productmanage.getCate2List(2);
	         }
	       }
	       
	       model.addAttribute("userId", userId);
	       model.addAttribute("cate2list", cate2list);
	       model.addAttribute("wishChk", wishChk);
	       model.addAttribute("sizelist", sizelist);
	       model.addAttribute("productDto", productDto);
	      
	      return "productDetail.tiles";
	   }
	   
	   // 상품상세페이지에서 WISHLIST-BTN EVENT(AJAX)
	   @ResponseBody
	   @GetMapping("/operWishlist")
	   public String insertWishlist(WishlistDto wish, Principal prc) throws Exception {
	      String userId = "";
	      if(prc != null) {
	         userId = prc.getName();
	      }
	      
	      String str = "";
	      
	      //세션에서 아이디 담아야함(수정필요)
	      wish.setId(userId);
	      
	      // 단일상품의 위시리스트 버튼을 이미 클릭했는지 확인 후 분기
	      boolean wishChk = purchase.chkWishlist(wish);
	      
	      // 위시리스트에 존재하는 경우
	      if(wishChk) {
	         boolean deleteBool = purchase.deleteWishlist(wish);
	         if(deleteBool) {
	            str = "delete";            
	         }else {
	            str = "제거 실패ㅠ";
	         }
	      // 위시리스트에 존재하지 않는 경우   
	      }else {
	         boolean insertBool = purchase.insertWishlist(wish);
	         
	         if(insertBool) {
	            str = "insert";
	         }else {
	            str ="등록 실패 ㅎ";
	         }
	      }
	      return str;
	   }
	   
	   //재입고 신청 INSERT EVENT(AJAX)
	   @ResponseBody
	   @GetMapping("/restockNotify_insert")
	   public String restockNotify_insert(Principal prc, RestockNotifyDto restock) throws Exception {

		  String msg = "";
		  String userId = "";
	      // 로그인이 되어있을 때
		  if(prc != null) {
	         userId = prc.getName();
	         restock.setId(userId);
	         
	        	boolean rnChk = purchase.chkRestockN(restock);
	        	// 재입고 테이블에 존재할 때
	        	if(rnChk) {
	        		msg = "already";
	        	}
	        	else {
	        		boolean bool = purchase.insertRestockN(restock);
	        		if(bool) {
	        			msg = "insert";
	        		}
	        	}
	      }
		  
	      return msg;
	   }
	
	
	
}
