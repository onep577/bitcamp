package com.rhymes.app.store.controller;

import java.security.Principal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rhymes.app.companyadmin.service.ProductManageService;
import com.rhymes.app.store.model.BasketDto;
import com.rhymes.app.store.model.BasketListDto;
import com.rhymes.app.store.service.PurchaseService;
import com.rhymes.app.store.service.StoreService;
import com.rhymes.app.used.Service.UsedService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller

@RequestMapping("/store")
public class BasketController{
	
   @Autowired HttpServletRequest req;
   @Autowired StoreService store;
   @Autowired ProductManageService productmanage;
   @Autowired PurchaseService purchase;
   @Autowired UsedService usedService;

   DecimalFormat formatter = new DecimalFormat("###,###");
   
   // IP ARRAY
   private static final String[] IP_HEADER_CANDIDATES = { 
		    "X-Forwarded-For",
		    "Proxy-Client-IP",
		    "WL-Proxy-Client-IP",
		    "HTTP_X_FORWARDED_FOR",
		    "HTTP_X_FORWARDED",
		    "HTTP_X_CLUSTER_CLIENT_IP",
		    "HTTP_CLIENT_IP",
		    "HTTP_FORWARDED_FOR",
		    "HTTP_FORWARDED",
		    "HTTP_VIA",
		    "REMOTE_ADDR" };
   // IP ADRESS GET FUNCTION
	public static String getClientIpAddress(HttpServletRequest request) {
	    for (String header : IP_HEADER_CANDIDATES) {
	        String ip = request.getHeader(header);
	        if (ip != null && ip.length() != 0 && !"unknown".equalsIgnoreCase(ip)) {
	            return ip;
	        }
	    }
	    return request.getRemoteAddr();
	}

	// 회원 장바구니(AJAX) : 로그인 접속 되어있을 때
   @ResponseBody
   @GetMapping("/insertBasket")
   public List<BasketListDto> insertBasket(BasketDto basket, Principal prc)throws Exception{
	  
      String userId = "";
      if(prc != null) {
         userId = prc.getName();
      }
      
      basket.setId(userId);
      
      String str = "";
      // 장바구니 중복 체크
      boolean bool1 = purchase.chkBasket(basket);
      	
      if(bool1) {
         
         // BASKET DB TABLE에 아이디 존재여부 BOOLEAN값 RETURN	
         int n = purchase.updateBaksetQ(basket);
         // 이미 STOCK SEQ를 접속 ID가 가지고 DB테이블에서 가지고 있다면 수량UPDATE 
         if(n==1) {
            log.info("장바구니 수량 UPDATE 성공");
         }
      }else {
         try {
            boolean bool2 = purchase.insertBasket(basket);
            if(bool2) {
            	log.info("장바구니 INSERT 성공");
            }
         }catch(Exception e) {
            e.printStackTrace();
         }
      }
      List<BasketListDto> blist= purchase.getBasketList(userId);
      
      int unitPrice = 0;
      int basketPcnt = 0;
      int total_price = 0;
      for (int i = 0; i < blist.size(); i++) {
         int price = blist.get(i).getP_price();
         blist.get(i).setP_price2(formatter.format(price));
         // 총액 결제 금액 계산
         unitPrice = blist.get(i).getP_price();
         basketPcnt = blist.get(i).getP_quantity();
         //제품 단가 * 재고번호 수량
         total_price += (unitPrice * basketPcnt);
      }
      blist.get(0).setTotal_price(formatter.format(total_price));
      
      return blist;
   }
   
   // 비회원 SESSION 장바구니 (AJAX)
   @ResponseBody
   @GetMapping("/insertSessionBasket")
   public List<BasketListDto> insertCookieBasket(BasketDto basket, Principal prc,
		   HttpServletRequest request)throws Exception{
	   
	   HttpSession session = request.getSession();
	   
	   String ip = null;
       ip = getClientIpAddress(request);
	   
       // 최초 생성 SESSION 리스트
       List<BasketDto> cBasketList = new ArrayList<BasketDto>();
	   // 복사용 SESSION 리스트
       List<BasketDto> cBasketList2 = new ArrayList<BasketDto>();
	   // FINAL 리스트
	   List<BasketDto> cBasketList3 = new ArrayList<BasketDto>();
	   // DB값 가져와서 BASKETLIST-DTO를 담을 리스트
	   List<BasketListDto> cBasketList4 = new ArrayList<BasketListDto>();
	   // 리스트4에 담을 DTO
	   BasketListDto basketlistDto = new BasketListDto();	   

	   Boolean test = true;

	   if(prc == null) {
		    log.info("CLIENT IP : " + ip);
            // 클라이언트IP SESSION 리스트가 존재하지 않을 때, 생성하면서 INSERT
            if((List<BasketDto>)session.getAttribute(ip) == null) {
               cBasketList.add(basket);
                //SESSION 생성,저장
               session.setAttribute(ip, cBasketList);
            // SESSION 리스트가 존재할 때, 기존 SESSION 리스트를 새롭게 생성한 저장 SESSION 리스트에 옮겨담고 INSERT
            } else {
               cBasketList = (List<BasketDto>)session.getAttribute(ip);
               //SESSION 전체 옮겨담기
               cBasketList2.addAll(cBasketList);
               
               // 기존 SESSION 리스트에 이미 담겨있는 STOCK SEQ가 있는 체크
               for (int i = 0; i < cBasketList2.size(); i++) {
                  int stock_seq = cBasketList2.get(i).getStock_seq();

                  // 이미 담겨있는 STOCK SEQ가 존재할 때, 수량 UPDATE하고 저장 SESSION 리스트로 DTO 옮겨담기
                  if(stock_seq == basket.getStock_seq()) {
                     cBasketList2.get(i).setP_quantity(basket.getP_quantity());
                     test = false;
                  }
              }
               // 기존 SESSION 리스트에 STOCK_SEQ가 담겨있지 않는 경우   
               if(test == true) {  
                  cBasketList2.add(basket);
               }
    
               // IP SESSION 제거
               session.removeAttribute(ip);
               // 다시 IP SESSION 생성하고 합체한 임시저장 리스트를 저장 
               session.setAttribute(ip, cBasketList2);
               session.setMaxInactiveInterval(86400*3); //30일
            }
            
            // FINAL IP SESSION LIST(1+2)
            cBasketList3 = (List<BasketDto>)session.getAttribute(ip);

            // SESSION 장바구니 리스트-DTO(STOCK SEQ, QUANTITY)에 담긴 STOCK SEQ를 꺼내온 다음, 
            // PARAMETER로 STOCK SEQ를 넣어서 PRODUCT,STOCK(JOIN) 장바구니 리스트에 뿌릴 필요한정보를 가져온 다음,
            // 장바구니 페이지에서 필요한 정보들을 담은 DTO를 새로운 리스트에 담는다.
            for (int i = 0; i < cBasketList3.size(); i++) {
            	basketlistDto = purchase.getSessionBasketDto(cBasketList3.get(i).getStock_seq());
            	basketlistDto.setP_quantity(cBasketList3.get(i).getP_quantity());
            	cBasketList4.add(basketlistDto);
			}
            
            int unitPrice = 0;
            int basketPcnt = 0;
            int total_price = 0;
            int quantity = 0; /*재고수량*/
            
            for (int i = 0; i < cBasketList4.size(); i++) {
            	int price = cBasketList4.get(i).getP_price();
            	// 단가
            	unitPrice = cBasketList4.get(i).getP_price();
                // 장바구니 수량
            	basketPcnt = cBasketList4.get(i).getP_quantity();
                // 재고수량
            	quantity = cBasketList4.get(i).getQuantity();
            	if(quantity != 0) {
                    //제품 단가 * 장바구니 수량
                    total_price += (unitPrice * basketPcnt);
                    cBasketList4.get(i).setP_price2(formatter.format(price));
                 }else if(quantity == 0) {
                	 cBasketList4.get(i).setP_price2("SOLD OUT");
                 }
            }
            
            cBasketList4.get(0).setTotal_price(formatter.format(total_price));
            cBasketList4.get(0).setTotal_price2(total_price);
         }   
        return cBasketList4;
     }
   		
	   // SESSION 장바구니 전체삭제 EVENT(AJAX)
	  @ResponseBody
	  @GetMapping("/deleteSessionBasketAll")
	  public String deleteSessionBasketAll(Principal prc, HttpServletRequest request) throws Exception{      
		  HttpSession session = request.getSession();
		  String ip = "";
		  ip = getClientIpAddress(request);
		  session.removeAttribute(ip);
	      
	      return "DELETE";
	   }	
   
   	  // SESSION 장바구니 DELETE EVENT(AJAX)
	  @ResponseBody
	  @GetMapping("/deleteSessionBasket")
	  public int deleteSessionBasket(int stock_seq, Principal prc, HttpServletRequest request) throws Exception{      
		  HttpSession session = request.getSession();
		  String ip = null;
		  ip = getClientIpAddress(request);
		  
		  log.info("장바구니 삭제 STOCKSEQ : " + stock_seq + "");
		  
		  // 기존 SESSION 리스트(DTO-STOCKSEQ, QUANTITY)
		  List<BasketDto> sessionList = new ArrayList<BasketDto>();
		  // 복제 리스트(DELETE STOCKSEQ 제외하고 옮겨담을 리스트)
		  List<BasketDto> sessionList2 = new ArrayList<BasketDto>();
		  // FINAL 리스트
		  List<BasketDto> sessionList3 = new ArrayList<BasketDto>();
		  // 복제리스트 STOCK SEQ로 DB접근해서 BASKETLIST-DTO를 담을 리스트 
		  List<BasketListDto> blist = new ArrayList<BasketListDto>();
		  // blist에 담을 DTO 선언
		  BasketListDto basketlistDto = new BasketListDto();
		  
		  int unitPrice = 0;
		  int basketPcnt = 0;
		  int total_price = 0;
		  int quantity = 0;
		  
		  Boolean test = true;

		 
		  sessionList = (List<BasketDto>)session.getAttribute(ip);
	       //SESSION 전체 옮겨담기
		  sessionList2.addAll(sessionList);
	       
	      // 기존 SESSION 리스트에 이미 담겨있는 STOCK SEQ가 있는 체크
	      for (int i = 0; i < sessionList2.size(); i++) {
	         int session_stockseq = sessionList2.get(i).getStock_seq();
	
	         // 삭제버튼을 누르면 STOCK_SEQ와 세션리스트에 있는 DTO에 담긴 STOCK_SEQ가 일치하면 DTO삭제
	          if(stock_seq == session_stockseq) {
	        	  sessionList2.remove(i);
	             test = false;
	          }
	      }
	
	       // IP SESSION 제거
	       session.removeAttribute(ip);
	       // 다시 IP SESSION 생성하고 임시저장 리스트를 저장 
	       session.setAttribute(ip, sessionList2);
	       session.setMaxInactiveInterval(86400*3); //30일
		    
		   // FINAL IP SESSION LIST(1+2)
	       sessionList3 = (List<BasketDto>)session.getAttribute(ip);
	       
	       log.info("삭제 후 세션 장바구니리스트 사이즈 : " + sessionList3.size() + "");
		  
	       for (int i = 0; i < sessionList3.size(); i++) {
	           	basketlistDto = purchase.getSessionBasketDto(sessionList3.get(i).getStock_seq());
	           	basketlistDto.setP_quantity(sessionList3.get(i).getP_quantity());
	           	blist.add(basketlistDto);
			}
	       
		   for (int i = 0; i< blist.size(); i++) {
		    	int price = blist.get(i).getP_price();
		    	blist.get(i).setP_price2(formatter.format(price)); 
		    	unitPrice =	blist.get(i).getP_price(); 
		    	basketPcnt = blist.get(i).getP_quantity();
		    	quantity = blist.get(i).getQuantity(); 
		    	
		    	if(quantity != 0) { //제품 단가 * 재고번호 수량
		    		total_price += (unitPrice * basketPcnt);
		    	}
		     }
		   
		   if(sessionList3.size()==0) {
			   log.info("장바구니 SESSION REMOVE");
			   session.removeAttribute(ip);
		   }
		  
		  return total_price;
	  }
	   
	   // 장바구니 페이지로 이동
	   @GetMapping("/basket")
	   public String basket(Model model, Principal prc, HttpServletRequest request)throws Exception {
	      String url = "";
		  String userId = "";
	      
	      HttpSession session = request.getSession();
	      String ip = null;
	      ip = getClientIpAddress(request);
	      log.info("PRC : " + prc);
	  
	   //세션 확인 
	     List<BasketDto> chklist= new ArrayList<BasketDto>();
	     if(session.getAttribute(ip)!=null) {
	    	 chklist = (List<BasketDto>)session.getAttribute(ip);
	    	 log.info("기존 SESSIN장바구니 사이즈 : " + chklist.size()+"");
	     }
	      
	      
	   //1.로그인O(회원 : 일반 장바구니 리스트(ID로 DB에서 PRODUCT,STOCK정보를 담은 DTO를 담을 리스트) 
	   //   OR 
	   //2.로그인X(비회원 : SESSION 리스트2-DTO(리스트1 STOCKSEQ로 DB에서 PRODUCT,STOCK정보를 담은 DTO를 담을 리스트)   
	      List<BasketListDto> blist = new ArrayList<BasketListDto>();
	      
	   //2.로그인X(비회원)
	      //SESSION 리스트1-DTO(STOCKSEQ, BASKET QUANTITY)
	      List<BasketDto> sessionList1 = new ArrayList<BasketDto>();
	      //SESSION 리스트1에서 리스트2로 이사할 때, 필요한 BASKET-LIST DTO
	      BasketListDto basketlistDto = new BasketListDto();
	      
	      //로그인O
	      if(prc != null) {
	         userId = prc.getName();
	         blist= purchase.getBasketList(userId);
	         if(blist.size() == 0) {
	        	 blist = null;
	         }
	      }
	      //로그인X
	      else{
	    	  log.info("비회원 IP : " + ip);
	    	  if(session.getAttribute(ip) != null && chklist.size()!=0) {
		          sessionList1 = (List<BasketDto>)session.getAttribute(ip);
		    	  
		    	  for (int i = 0; i < sessionList1.size(); i++) {
		          	basketlistDto = purchase.getSessionBasketDto(sessionList1.get(i).getStock_seq());
		          	basketlistDto.setP_quantity(sessionList1.get(i).getP_quantity());
		          	blist.add(basketlistDto);
				  }
	    	  }else if(session.getAttribute(ip) == null || chklist.size()==0) {
	    		  // SESSION BASKET이 존재하지 않으면 null로 초기화 해서, 바로 밑에 금액연산 IF문을 타지 않게 막아준다.
	    		  blist = null;
	    	  }
	      }
	      
	      // 금액 COMMA + 총액 계산
	      if(blist != null) {
		      int unitPrice = 0;
		      int basketPcnt = 0;
		      int total_price = 0;
		      int quantity = 0; /*재고수량*/
		      
		      for (int i = 0; i < blist.size(); i++) {
		      // 3자리 , 찍어주기 
		    	 int price = blist.get(i).getP_price();
		      // 총액 결제 금액 계산
		         unitPrice = blist.get(i).getP_price();
		         basketPcnt = blist.get(i).getP_quantity();
		         quantity = blist.get(i).getQuantity();
		         // 장바구니에 있는 제품이 품절이 아니면
		         if(quantity != 0) {
		            //총 금액 = 제품 단가 * 장바구니 수량
		        	 blist.get(i).setP_price2(formatter.format(price));
		            total_price += (unitPrice * basketPcnt);
		         }else {
		        	 blist.get(i).setP_price2("SOLD OUT");
		         }
		      }
		      
		      blist.get(0).setTotal_price(formatter.format(total_price));
		      blist.get(0).setTotal_price2(total_price);
	      }
	      
	      model.addAttribute("blist", blist);
	      
	      if(prc != null) {
	    	  url = "basket.tiles";    	  
	      }else if(prc == null) {
	    	  url = "sessionbasket.tiles";
	      }
	      return url;
	   }
	   

   // 장바구니 DELETE EVENT(AJAX)
   @ResponseBody
   @GetMapping("/deleteBasket")
   public int deleteBasket(int b_seq, Principal prc) throws Exception{      
      String userId = "";
      if(prc != null) {
         userId = prc.getName();
      }
      int unitPrice = 0;
      int basketPcnt = 0;
      int total_price = 0;
      int quantity = 0;
      
      try {
         purchase.deleteBasket(b_seq);
         
         List<BasketListDto> blist= purchase.getBasketList(userId);
         for (int i = 0; i < blist.size(); i++) {
            int price = blist.get(i).getP_price();
            blist.get(i).setP_price2(formatter.format(price));
            unitPrice = blist.get(i).getP_price();
            basketPcnt = blist.get(i).getP_quantity();
            quantity = blist.get(i).getQuantity();
            if(quantity != 0) {
               //제품 단가 * 재고번호 수량
               total_price += (unitPrice * basketPcnt);
            }            
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
      return total_price;
   }
	   
   // 회원 장바구니 전체삭제 EVENT(AJAX)
   @ResponseBody
   @GetMapping("/deleteBasketAll")
   public String deleteBasket(Principal prc) throws Exception{      
       String str = "";
	   String userId = "";
      if(prc != null) {
         userId = prc.getName();
      }
      
      BasketDto basket = new BasketDto();
      basket.setId(userId);
      
      try {
         int n = purchase.deleteBasektAll(basket);
         if(n>1) {
            log.info("장바구니전체삭제 성공");
            str = "DELETE";
         }
         
      }catch(Exception e) {
         e.printStackTrace();
      }
      return str;
   }
	   
   // 회원 장바구니 수량변경 EVENT(AJAX)
   @ResponseBody
   @GetMapping("/updateBasketQ")
   public int updateBasketQ(BasketDto basket, Principal prc) throws Exception{
      String userId = "";
      if(prc != null) {
         userId = prc.getName();
      }
      
      int unitPrice = 0;
      int basketPcnt = 0;
      int total_price = 0;
      int quantity = 0;
      
      basket.setId(userId);
      
      try {
         int n = purchase.updateBaksetQ(basket);
   
         if(n==1) {
            List<BasketListDto> blist= purchase.getBasketList(userId);
            for (int i = 0; i < blist.size(); i++) {
               int price = blist.get(i).getP_price();
               blist.get(i).setP_price2(formatter.format(price));
               unitPrice = blist.get(i).getP_price();
               basketPcnt = blist.get(i).getP_quantity();
               quantity = blist.get(i).getQuantity();
               
               if(quantity!=0) {
                  //제품 단가 * 재고번호 수량
                  total_price += (unitPrice * basketPcnt);
               }
            }
         }else {
            log.info("수량변경 실패");
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
      return total_price;
   }
	
   // SESSION 장바구니 수량변경 EVENT(AJAX)
   @ResponseBody
   @GetMapping("/updateSessionBasketQ")
   public int updateSessionBasketQ(BasketDto basket, Principal prc, HttpServletRequest request) throws Exception{
	  HttpSession session = request.getSession();
	  String ip = null;
      ip = getClientIpAddress(request);
	   
       // 기존 SESSION 리스트(DTO-STOCKSEQ, QUANTITY)
	  List<BasketDto> sessionList = new ArrayList<BasketDto>();
	  // 복제 리스트(DELETE STOCKSEQ 제외하고 옮겨담을 리스트)
	  List<BasketDto> sessionList2 = new ArrayList<BasketDto>();
	  // FINAL 리스트
	  List<BasketDto> sessionList3 = new ArrayList<BasketDto>();
	  // 복제리스트 STOCK SEQ로 DB접근해서 BASKETLIST-DTO를 담을 리스트 
	  List<BasketListDto> blist = new ArrayList<BasketListDto>();
	  // blist에 담을 DTO 선언
	  BasketListDto basketlistDto = new BasketListDto();
	  
	  log.info("CLIENT IP : " + ip);
      
	  boolean test = false;
	  
	  sessionList = (List<BasketDto>)session.getAttribute(ip);
         //SESSION 전체 옮겨담기
	  sessionList2.addAll(sessionList);
         
       // 기존 SESSION 리스트에 이미 담겨있는 STOCK SEQ가 있는 체크
      for (int i = 0; i < sessionList2.size(); i++) {
           int stock_seq = sessionList2.get(i).getStock_seq();

           // 이미 담겨있는 STOCK SEQ가 존재할 때, 수량 UPDATE하고 저장 SESSION 리스트로 DTO 옮겨담기
           if(stock_seq == basket.getStock_seq()) {
        	   sessionList2.get(i).setP_quantity(basket.getP_quantity());
              test = false;
            }
      }
      
      // 기존 SESSION 리스트에 STOCK_SEQ가 담겨있지 않는 경우   
      if(test == true) {  
       	 sessionList2.add(basket);
      }

      // IP SESSION 제거
         session.removeAttribute(ip);
         // 장바구니 수량 수정하고 합체한 임시저장 리스트를 저장 
         session.setAttribute(ip, sessionList2);
      
      // 최종 가공
      sessionList3 = (List<BasketDto>)session.getAttribute(ip);

      // SESSION 장바구니 리스트-DTO(STOCK SEQ, QUANTITY)에 담긴 STOCK SEQ를 꺼내온 다음, 
      // PARAMETER로 STOCK SEQ를 넣어서 PRODUCT,STOCK(JOIN) 장바구니 리스트에 뿌릴 필요한정보를 가져온 다음,
      // 장바구니 페이지에서 필요한 정보들을 담은 DTO를 새로운 리스트에 담는다.
      for (int i = 0; i < sessionList3.size(); i++) {
      	basketlistDto = purchase.getSessionBasketDto(sessionList3.get(i).getStock_seq());
      	basketlistDto.setP_quantity(sessionList3.get(i).getP_quantity());
      	blist.add(basketlistDto);
      }

      // 수량변경하고 나서 최종금액 연산
      int unitPrice = 0;
      int basketPcnt = 0;
      int total_price = 0;
      int quantity = 0;
      
      for (int i = 0; i < blist.size(); i++) {
         int price = blist.get(i).getP_price();
         blist.get(i).setP_price2(formatter.format(price));
         unitPrice = blist.get(i).getP_price();
         basketPcnt = blist.get(i).getP_quantity();
         quantity = blist.get(i).getQuantity();
         
         if(quantity!=0) {
            //제품 단가 * 재고번호 수량
            total_price += (unitPrice * basketPcnt);
         }
      }
	   return total_price;
   }
   
   
   //재고체크 : 장바구니 수량 변경시
   @ResponseBody
   @GetMapping("/stockCheck")
   public int stockCheck(int stock_seq)throws Exception{
	   int stock_quantity = purchase.stockCheck(stock_seq);
	   return stock_quantity;
   }
	
	
	
}
