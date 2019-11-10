package com.rhymes.app.store.controller;

import java.security.Principal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
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
import com.rhymes.app.store.model.ProductParam;
import com.rhymes.app.store.model.RestockNotifyDto;
import com.rhymes.app.store.model.StockDto;
import com.rhymes.app.store.model.WishlistDto;
import com.rhymes.app.store.model.category.Category1Dto;
import com.rhymes.app.store.model.category.Category2Dto;
import com.rhymes.app.store.model.category.Category3Dto;
import com.rhymes.app.store.service.PurchaseService;
import com.rhymes.app.store.service.StoreService;
import com.rhymes.app.used.Service.UsedService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j

@RequestMapping("/store")
public class StoreMainController {
   
   @Autowired HttpServletRequest req;
   @Autowired StoreService store;
   @Autowired ProductManageService productmanage;
   @Autowired PurchaseService purchase;
   @Autowired UsedService usedService;
   
   DecimalFormat formatter = new DecimalFormat("###,###");
   
   // 2차카테고리 AJAX(SORTING left-navi)
   @ResponseBody
   @GetMapping("/kCate2List")
   public List<Category2Dto> getkCate2List(ProductParam param) throws Exception{
      List<Category2Dto> cate2list = store.getkCate2List(param);
      return cate2list;
   }
   // 3차카테고리 AJAX(SORTING left-navi)   
   @ResponseBody
   @GetMapping("/kCate3List")
   public List<Category3Dto> getkCate3List(ProductParam param) throws Exception{
      List<Category3Dto> cate3list = store.getkCate3List(param);
      return cate3list;
   }
   
   // 2차카테고리 AJAX(COMPANY ADMIN X 일반left-navi)
   @ResponseBody
   @GetMapping("/cate2List")
   public List<Category2Dto> getCate2List(int c1_seq) throws Exception{
      List<Category2Dto> cate2list = productmanage.getCate2List(c1_seq);
      return cate2list;
   }
   
   // 3차카테고리 AJAX(COMPANY ADMIN X 일반left-navi)
   @ResponseBody
   @GetMapping("/cate3List")
   public List<Category3Dto> getCate3List(int c2_seq) throws Exception{
      List<Category3Dto> cate3list = productmanage.getCate3List(c2_seq);
      return cate3list;
   }

   // 2차카테고리 선택 -> 해당 카테고리 사이즈단위 생성 후 리턴(AJAX)
   @ResponseBody
   @GetMapping("/sizeUnit")
   public List<String> sizeUnit(String c2_seq) throws Exception{
      int c2_seq2 = Integer.parseInt(c2_seq);
      
      String[] sizeUnits = productmanage.getSizeunit(c2_seq2).split("/");
      List<String> list = Arrays.asList(sizeUnits);
     
      return list;
   }
   
   
}
