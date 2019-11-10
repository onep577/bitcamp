package com.rhymes.app.store.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rhymes.app.companyadmin.service.ProductManageService;
import com.rhymes.app.store.model.ProductDto;
import com.rhymes.app.store.model.ProductParam;
import com.rhymes.app.store.model.category.Category1Dto;
import com.rhymes.app.store.model.category.Category2Dto;
import com.rhymes.app.store.service.PurchaseService;
import com.rhymes.app.store.service.StoreService;
import com.rhymes.app.used.Service.UsedService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j

@RequestMapping("/store")
public class ProductListController {

	   @Autowired HttpServletRequest req;
	   @Autowired StoreService store;
	   @Autowired ProductManageService productmanage;
	   @Autowired PurchaseService purchase;
	   @Autowired UsedService usedService;
	   
	   DecimalFormat formatter = new DecimalFormat("###,###");
	   
	// 상품 리스트   
	   @GetMapping("/productList")
	   public String productList(Model model, ProductParam param) throws Exception{
		  
	      // SORTING DEFAULT
		/*
		 * if( param.getSorting()==null||("").equals(param.getSorting()) ) {
		 * param.setSorting("NEW"); }
		 */
	      
	      // 업체 리스트 GET
	      List<String> clist = store.getCompnayList();   
	      // 1차 카테고리 리스트 초기화
	      List<Category1Dto> cate1list = new ArrayList<Category1Dto>();
	      // 2차 카테고리 리스트 초기화
	      List<Category2Dto> cate2list = new ArrayList<Category2Dto>();
	      
	      // 1차카테고리 존재할 때
	      if(param.getC1_name()!=null && !param.getC1_name().equals("")) {
	         // 카테고리 선택/검색해서 들어갈 때, 1차 카테고리 리스트 GET
	         if(param.getKeyword()!=null && param.getKeyword()!= "") {
	            if(param.getC1_name().equals("MEN")) {
	               param.setC1_seq(1);
	            }else if(param.getC1_name().equals("WOMEN")) {
	               param.setC1_seq(2);
	            }
	            cate2list = store.getkCate2List(param);
	         // HEADER에서 클릭해서 1차카테고리만 가지고 들어갈 때, 1차 카테고리 리스트 GET   
	         }else{
	            if(param.getC1_name().equals("MEN")) {
	               cate2list = productmanage.getCate2List(1);
	            }else if(param.getC1_name().equals("WOMEN")) {
	               cate2list = productmanage.getCate2List(2);
	            }
	         }
	      // 브랜드 클릭 + 카테고리1 선택없이 전체검색시 카테고리 리스트 설정
	      }else if(param.getC1_name()==null || param.getC1_name().equals("")){
	         cate1list = store.getkCate1List(param);
	         model.addAttribute("cate1list", cate1list);         
	      }
	      log.info("KEYWORD : " + param.getKeyword());
	      log.info("KEY : " + param.getKey());
	      log.info("SORTING : " + param.getSorting());
	      
	      // paging 처리
	      int sn = param.getPageNumber(); 
	      int start = sn * param.getRecordCountPerPage() + 1; 
	      int end = (sn + 1) * param.getRecordCountPerPage();
	      param.setStart(start);
	      param.setEnd(end);
	            
	      // 상품 총갯수
	      int totalProduct = store.getProductCnt(param);
	      
	      // 상품 리스트
	      List<ProductDto> plist = store.getProductList(param);
	      
	      for (int i = 0; i < plist.size(); i++) {
	         int p_price = plist.get(i).getP_price();
	         int bfs_price = plist.get(i).getBfs_price();
	         plist.get(i).setP_price2(formatter.format(p_price));
	         plist.get(i).setBfs_price2(formatter.format(bfs_price));
	         
	      }
	      	      
	      
	      log.info("상품리스트 사이즈 : " + plist.size());
	      log.info("상품리스트 상품 총 갯수 : " + totalProduct);
	      
	      // OPTIONS
	      model.addAttribute("key", param.getKey());
	      model.addAttribute("sorting", param.getSorting());
	      model.addAttribute("criterion", param.getCriterion());
	      model.addAttribute("keyword", param.getKeyword());
	      //left nav
	      model.addAttribute("cate2list", cate2list);
	      model.addAttribute("clist", clist);
	      model.addAttribute("c1_name", param.getC1_name());
	      model.addAttribute("c2_name", param.getC2_name());
	      model.addAttribute("c3_name", param.getC3_name());
	      //페이징
	      model.addAttribute("pageNumber", sn);
	      model.addAttribute("totalRecordCount", totalProduct);
	      model.addAttribute("pageCountPerScreen", 10);
	      model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
	      //상품 리스트   
	      model.addAttribute("plist", plist);
	      
	      return "productList.tiles";
	   }
	
	
	
}
