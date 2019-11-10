package com.rhymes.app.companyadmin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rhymes.app.companyadmin.model.ProductManageDto;
import com.rhymes.app.companyadmin.model.StockManageDto;
import com.rhymes.app.companyadmin.service.ProductManageService;
import com.rhymes.app.member.model.SellerDTO;
import com.rhymes.app.member.util.Coolsms;
import com.rhymes.app.store.dao.PurchaseDao;
import com.rhymes.app.store.model.ProductDto;
import com.rhymes.app.store.model.RestockNotifyDto;
import com.rhymes.app.store.model.StockDto;
import com.rhymes.app.store.model.category.Category2Dto;
import com.rhymes.app.store.model.category.Category3Dto;
import com.rhymes.app.store.service.StoreService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j

@RequestMapping(value = "/admin/company/*")
public class ProductManageController {

	DecimalFormat formatter = new DecimalFormat("###,###");
	
	@Autowired ProductManageService manage;
	@Autowired PurchaseDao store_purchase;
	@Autowired StoreService store;
	
	//5(1).재고수정
	@ResponseBody
	@GetMapping("changestockquantity")
	public String changestockquantity(StockDto stock)throws Exception {
		boolean bool = false;
		List<RestockNotifyDto> pnList = new ArrayList<RestockNotifyDto>();
		
		log.info("---------ISRESTOCK : " + stock.getIsrestock());

		if(stock.getIsrestock().equals("restock")) {
			boolean restockChk = manage.restockcheck(stock);
			if(restockChk) {
				log.info(stock.getStock_seq() + " → IT EXISTS AT RESTOCK-NOTIFY TABLE");
					
				pnList = manage.getrestockphonenumbers(stock);
				
				for (RestockNotifyDto re : pnList) {
					log.info(re.getPhone());
			        
					// SMS
					String api_key = "NCSZABJSTQM6UK15";
					String api_secret = "PGDXXEQ2G6EUVWQWAAS5LGRLXPW7IXAN";
					Coolsms coolsms = new Coolsms(api_key, api_secret);
					HashMap<String, String> set = new HashMap<String, String>();

					set.put("type", "sms");
			        set.put("from", "01096230706"); 
			        set.put("to", re.getPhone());
			        set.put("text", "[RHYMES]재입고 신청하신 " + stock.getP_name() + "("+ stock.getSize() +")입고되었습니다.");
			        
			        JSONObject result = coolsms.send(set); // 보내기&전송결과받기
			        if ((boolean)result.get("status") == true) {
			        	log.info("SMS-MSG SENT SUCCESSFULLY");
			        	log.info(result.get("group_id") + ""); // 그룹아이디
			            log.info(result.get("result_code") + ""); // 결과코드
			            log.info(result.get("result_message") + ""); // 결과 메시지
			            log.info(result.get("success_count") + "");	// 메시지아이디
			            log.info(result.get("error_count") + ""); // 여러개 보낼시 오류난 메시지 수
			            
			            
			        } else {
			            // 메시지 보내기 실패
			            log.info("FAIL TO SEND SMS-MSG");
			            log.info("ERROR CODE TO SEND SMS-MSG : " + result.get("code") + "");	// REST API 에러코드
			            log.info("ERROR MESSAGE TO SEND SMS-MSG : " + result.get("message") + "");	// 에러메시지
			        }        
				}
				
			}else {
				log.info(stock.getStock_seq() + " → IT DOESNT EXIST AT RESTOCK-NOTIFY TABLE");
				
				bool = manage.changestockquantity(stock);
				if(bool) {
					log.info("STOCK UPDATED SUCCESSFULLY");
				}else {
					log.info("FAIL TO UPDATE STOCK-QUANTITY");
				}
				
			}
		}else {
			bool = manage.changestockquantity(stock);
			
			if(bool) {
				log.info("STOCK UPDATED SUCCESSFULLY");
			}else {
				log.info("FAIL TO UPDATE STOCK-QUANTITY");
			}
		}
		
		return "ㅇㅅㅇ";
	}
		
	//5.재고관리
	@GetMapping("/stockmanage")
	public String stockmanage(Model model, StockManageDto stockmanage, Principal prc)throws Exception{
		
		  List<StockDto> slist = new ArrayList<StockDto>();
		  String url = "";
	      String c_id = "";
	 	  String c_name = "";
		   
	 	  if(prc != null) {
	     	  c_id = prc.getName();
	     	  SellerDTO seller = new SellerDTO();
	     	  seller.setId(c_id); 
	     	  seller = manage.getCname(seller);
	     	  c_name = seller.getC_name();
	     	  log.info("업체이름:" + c_name);
	     	 stockmanage.setC_name(c_name);
	     	 
	     	 if(!c_name.equals("") && c_name!=null) {
		
     		 //페이징
			 int sn = stockmanage.getPageNumber();	//0 1 2
			 int start = sn * stockmanage.getRecordCountPerPage() + 1;	
			 int end = (sn + 1) * stockmanage.getRecordCountPerPage(); 
			 int totalRecordCount = manage.stockcnt(stockmanage);
			 stockmanage.setStart(start);
			 stockmanage.setEnd(end);
			
			 // 페이징
	 		 model.addAttribute("pageNumber", sn);
	 		 model.addAttribute("pageCountPerScreen", 10);
	 		 model.addAttribute("recordCountPerPage", 10);
	 		 model.addAttribute("totalRecordCount", totalRecordCount);
	 		 
	 		 slist = manage.stockmanage(stockmanage);
	 		 
	 		 log.info("페이지넘버 : " + sn);
	 		 log.info("리스트 사이즈 : " + slist.size());
			 log.info("재고 총 갯수 : " + totalRecordCount );
			 
			 model.addAttribute("param", stockmanage);
			 model.addAttribute("slist", slist);
			 model.addAttribute("c_name", c_name);
			 
			 url = "CompanyAdminStockManage"; 
			 
	     	 }else if(c_name.equals("") || c_name==null) {
	     		 url = "redirect:/main";
	     	  }
	 	 }else{
	    	  url = "redirect:/main";
	      }	 
		return url;
	}
	
	//4.SALE상품관리
	@GetMapping("/saleproductmanage")
	public String saleproductmanage(Principal prc, Model model, ProductManageDto pParam)throws Exception{
		
		/* ProductParam param = new ProductParam(); */
	      List<ProductDto> plist = new ArrayList<ProductDto>();
	      String url = "";
	      String c_id = "";
	 	  String c_name = "";
		   
	 	  if(prc != null) {
	     	  c_id = prc.getName();
	     	  SellerDTO seller = new SellerDTO();
	     	  seller.setId(c_id); 
	     	  seller = manage.getCname(seller);
	     	  c_name = seller.getC_name();
	     	  log.info("업체이름:" + c_name);
	     	  pParam.setC_name(c_name);
	     	  pParam.setKey("sale");
	     	 
	     	  if(!c_name.equals("") && c_name!=null) {
	   
	     		 //페이징
	     		 int sn = pParam.getPageNumber();	//0 1 2
	     		 int start = sn * pParam.getRecordCountPerPage() + 1;	
	     		 int end = (sn + 1) * pParam.getRecordCountPerPage(); 
	     		 int totalRecordCount = manage.getProductCnt(pParam);
	     		 pParam.setStart(start);
	     		 pParam.setEnd(end);
	     		 
	     		 plist = manage.getProductList(pParam);
	     		 log.info("상품리스트 길이:"+plist.size()+"");	
	     		 log.info("상품총갯수:"+totalRecordCount+"");
	     		 // 페이징
	     		 model.addAttribute("pageNumber", sn);
	     		 model.addAttribute("pageCountPerScreen", 10);
	     		 model.addAttribute("recordCountPerPage", 10);
	     		 model.addAttribute("totalRecordCount", totalRecordCount);
	     		  
	     		 model.addAttribute("param", pParam);
	     		 model.addAttribute("c_name", c_name);
	     		 model.addAttribute("plist", plist);
	     		  
	     		 url = "CompanyAdminSaleProduct";
	     	  }else if(c_name.equals("") || c_name==null) {
	     		 url = "redirect:/main";
	     	  }
	      }else{
	    	  url = "redirect:/main";
	      }
	      
	     return url;
	}
	
	//3(2).상품 수정 페이지로 이동
	@GetMapping("/productupdate")
	public String productDetailList(Principal prc, Model model, ProductDto product)throws Exception{
	
	String url = "";
    String c_id = "";
 	String c_name = "";
	
 	if(prc != null) {
     	  c_id = prc.getName();
     	  SellerDTO seller = new SellerDTO();
     	  seller.setId(c_id); 
     	  seller = manage.getCname(seller);
     	  c_name = seller.getC_name();
     	  log.info("업체이름:" + c_name);
     	 
     	  if(!c_name.equals("") && c_name!=null) {
     		  
     		product = store_purchase.getProductDetail(product.getP_seq());
     		String madeYear = product.getMdate().substring(0,4);
     		String madeMonth = product.getMdate().substring(4);
     		product.setMadeYear(madeYear);
     		product.setMadeMonth(madeMonth);
     		
     		// 2차 카테고리 리스트 초기화
    	     List<Category2Dto> cate2list = new ArrayList<Category2Dto>();
    	     List<Category3Dto> cate3list = new ArrayList<Category3Dto>();
    	     Category2Dto cate2 = new Category2Dto();
    	     
    	     int c2_seq = 0;
     		//*카테고리 리스트 GET
			//2차 카테고리 리스트	
    	     cate2.setC2_name(product.getC2_name());
			if(product.getC1_name().equals("MEN")) { 
				  cate2list = manage.getCate2List(1);
				  cate2.setC1_seq(1);
				  c2_seq = manage.getc2seq(cate2);
			}else if(product.getC1_name().equals("WOMEN")) { 
				  cate2list = manage.getCate2List(2);
				  cate2.setC1_seq(2);
				  c2_seq = manage.getc2seq(cate2);
			}
				
			// 수정했음 확인해야함
			
			
			//3차 카테고리 리스트
			cate3list = manage.getCate3List(c2_seq);
			
			for (Category3Dto c3 : cate3list) {
				System.out.println(c3.getC3_name());;
				System.out.println(c3.getC3_seq());
			}
			
			model.addAttribute("cate2list", cate2list);
			model.addAttribute("cate3list", cate3list);
     		model.addAttribute("c_name", c_name);
     		model.addAttribute("pDto", product);
     		  	
     		url ="CompanyAdminProductupdate";
     		  
     	  }else if(c_name.equals("") || c_name==null) {
     		 url = "redirect:/main";
     	  }
      }else{
    	  url = "redirect:/main";
      }
      
     return url;
	
    }
	
	
	
	
	
	//2(2).상품 상세조회로 이동
	@GetMapping("/stocklist")
	public String productDetailList(Principal prc, Model model, StockDto stock)throws Exception{
		log.info("STOCKLIST P_SEQ : " + stock.getP_seq()+"");
		
		List<StockDto> slist = new ArrayList<StockDto>();
		ProductDto pDto = new ProductDto();
		
		String url = "";
	    String c_id = "";
	 	String c_name = "";
		
	 	if(prc != null) {
	     	  c_id = prc.getName();
	     	  SellerDTO seller = new SellerDTO();
	     	  seller.setId(c_id); 
	     	  seller = manage.getCname(seller);
	     	  c_name = seller.getC_name();
	     	  log.info("업체이름:" + c_name);
	     	 
	     	  if(!c_name.equals("") && c_name!=null) {
	     		  
	     		  slist = manage.getStockList(stock);
	     		  pDto = store_purchase.getProductDetail(stock.getP_seq());
	     		  
	     		  log.info("상품 디테일리스트 길이:"+ slist.size()+"");	
	     		  
	     		  model.addAttribute("c_name", c_name);
	     		  model.addAttribute("pDto", pDto);
	     		  model.addAttribute("slist", slist);	
	     		  url ="CompanyAdminStocklist";
	     		  
	     	  }else if(c_name.equals("") || c_name==null) {
	     		 url = "redirect:/main";
	     	  }
	      }else{
	    	  url = "redirect:/main";
	      }
	     return url;
	}
	
	
	//2.상품 조회로 이동
    @GetMapping("/productlist")
	public String productlist(Principal prc, Model model, ProductManageDto pParam)throws Exception{
	  /* ProductParam param = new ProductParam(); */
      List<ProductDto> plist = new ArrayList<ProductDto>();
      String url = "";
      String c_id = "";
 	  String c_name = "";
	   
 	  if(prc != null) {
     	  c_id = prc.getName();
     	  SellerDTO seller = new SellerDTO();
     	  seller.setId(c_id); 
     	  seller = manage.getCname(seller);
     	  c_name = seller.getC_name();
     	  log.info("업체이름:" + c_name);
     	 pParam.setC_name(c_name);
     	 
     	  if(!c_name.equals("") && c_name!=null) {
   
     		  //페이징
     		 int sn = pParam.getPageNumber();	//0 1 2
     		 int start = sn * pParam.getRecordCountPerPage() + 1;	
     		 int end = (sn + 1) * pParam.getRecordCountPerPage(); 
     		 int totalRecordCount = manage.getProductCnt(pParam);
     		 pParam.setStart(start);
     		 pParam.setEnd(end);
     		 
     		 plist = manage.getProductList(pParam);
     		 log.info("상품리스트 길이:"+plist.size()+"");	
     		 log.info("상품총갯수:"+totalRecordCount+"");
     		 // 페이징
     		 model.addAttribute("pageNumber", sn);
     		 model.addAttribute("pageCountPerScreen", 10);
     		 model.addAttribute("recordCountPerPage", 10);
     		 model.addAttribute("totalRecordCount", totalRecordCount);
     		  
     		 model.addAttribute("param", pParam);
     		 model.addAttribute("c_name", c_name);
     		 model.addAttribute("plist", plist);
     		  
     		 url = "CompanyAdminProductlist";
     	  }else if(c_name.equals("") || c_name==null) {
     		 url = "redirect:/main";
     	  }
      }else{
    	  url = "redirect:/main";
      }
      
     return url;
 	   
    }
	
	
	//1.상품등록 페이지로 이동
    @GetMapping("/register")
    public String register(Principal prc, Model model)throws Exception{
      
	   String c_id = "";
	   String c_name = "";
       if(prc != null) {
    	  c_id = prc.getName();
    	  SellerDTO seller = new SellerDTO();
    	  seller.setId(c_id); 
    	  seller = manage.getCname(seller);
    	  c_name = seller.getC_name();
       }
	   model.addAttribute("c_name", c_name); 
       
	   return "CompanyAdminProductregister";
	 }
    
	//1-2.상품등록 처리
	@RequestMapping(value="/registerInsert", method = RequestMethod.POST)
    public String registerInsert(Model model, ProductDto product, StockDto stock,
      MultipartHttpServletRequest multi, HttpServletRequest req, Principal prc) throws Exception{
      
	 /*
	  String c_id = "";
	  String c_name = "";
      if(prc != null) {
    	  c_id = prc.getName();
    	  
    	  SellerDTO seller = new SellerDTO();
    	  seller = manage.getCname(seller);
    	  c_name = seller.getC_name();
      }
      
	 product.setC_name(c_name);
	 */
     
     int p_seq = manage.getPseq();
           
     String path = req.getServletContext().getRealPath("/upload/store");
     String fileName = "";
      
     File dir = new File(path);
     if(!dir.isDirectory()) {
        dir.mkdir();
     }
      Iterator<String> files = multi.getFileNames();
      
      int cnt = 0;
      while(files.hasNext()) {
         String uploadFile = files.next();
         
         MultipartFile mFile = multi.getFile(uploadFile);
         fileName = mFile.getOriginalFilename();
         //System.out.println("파일이름 : " + fileName);
         String timeFileName = System.currentTimeMillis() + fileName;
        //System.out.println("시간파일이름 : " + timeFileName);
         cnt++;
         
         if(cnt == 1) {
           product.setPhoto1_file(timeFileName);
         }
         if(cnt == 2) {
            product.setPhoto2_file(timeFileName);
          }
         if(cnt == 3) {
            product.setPhoto3_file(timeFileName);
          }
         if(cnt == 4) {
            product.setPhoto4_file(timeFileName);
          }
         if(cnt == 5) {
            product.setPhoto5_file(timeFileName);
          }
        
         try {
            FileOutputStream fs = new FileOutputStream(path + "/" + timeFileName);
            fs.write(mFile.getBytes());
            fs.close();
            
            product.setP_seq(p_seq);
            stock.setP_seq(p_seq);
            
           // System.out.println("!!");
         }catch(Exception e) {
            e.printStackTrace();
         }
      }
      
      try {
         // product INSERT
         boolean bool1 = manage.insertProduct(product);
         if (bool1) {
           // System.out.println("product insert 성공!!");

            // stock INSERT
            String sizeArr[] = stock.getP_size().split("/");
            String quArr[] = stock.getP_quantity2().split("/");
            for (int i = 0; i < quArr.length; i++) {
               stock.setP_seq(p_seq);
               stock.setP_size(sizeArr[i]);
               stock.setP_quantity(Integer.parseInt(quArr[i]));
               boolean bool2 = manage.insertStock(stock);
               if (bool2) {
             //     System.out.println("[" + sizeArr[i] + "사이즈] stock insert 성공!!");
               }
            }
         } else {
           // System.out.println("product insert 실패");	
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return "redirect:/admin/company/main";
   }
	
	// 2.상품 수정/삭제로 이동
    @GetMapping("/productoperlist")
	public String productoperlist(Principal prc, Model model, ProductManageDto pParam)throws Exception{
	  /* ProductParam param = new ProductParam(); */
      List<ProductDto> plist = new ArrayList<ProductDto>();
      String url = "";
      String c_id = "";
 	  String c_name = "";
	   
 	  if(prc != null) {
     	  c_id = prc.getName();
     	  SellerDTO seller = new SellerDTO();
     	  seller.setId(c_id); 
     	  seller = manage.getCname(seller);
     	  c_name = seller.getC_name();
     	  log.info("업체이름:" + c_name);
     	 pParam.setC_name(c_name);
     	 
     	  if(!c_name.equals("") && c_name!=null) {
   
     		  //페이징
     		 int sn = pParam.getPageNumber();	//0 1 2
     		 int start = sn * pParam.getRecordCountPerPage() + 1;	
     		 int end = (sn + 1) * pParam.getRecordCountPerPage(); 
     		 int totalRecordCount = manage.getProductCnt(pParam);
     		 pParam.setStart(start);
     		 pParam.setEnd(end);
     		 
     		 plist = manage.getProductList(pParam);
     		 log.info("상품리스트 길이:"+plist.size()+"");	
     		 log.info("상품총갯수:"+totalRecordCount+"");
     		  
     		 model.addAttribute("pageNumber", sn);
     		 model.addAttribute("pageCountPerScreen", 10);
     		 model.addAttribute("recordCountPerPage", 10);
     		 model.addAttribute("totalRecordCount", totalRecordCount);
     		  
     		 model.addAttribute("param", pParam);
     		 model.addAttribute("c_name", c_name);
     		 model.addAttribute("plist", plist);
     		  
     		 url = "CompanyAdminProductOpertlist";
     	  }else if(c_name.equals("") || c_name==null) {
     		 url = "redirect:/main";
     	  }
      }else{
    	  url = "redirect:/main";
      }
      
     return url;
 	   
    }
	
  //3(2-1). 상품 기본정보 업데이트
  	@RequestMapping(value="/productupdateAf", method = RequestMethod.POST)
  	public String productupdateAf(Model model, ProductDto product, RedirectAttributes redirect)throws Exception {
  		String url = "";
  		
  		product.setMdate(product.getMadeYear() + product.getMadeMonth());
  		
  		try {
  			boolean bool = manage.productBasicInfoUpdate(product);
  			if(bool) {
  				
  				redirect.addAttribute("p_seq", product.getP_seq());
  				log.info("UPDATE O");
  				url = "redirect:/admin/company/productupdate";				
  			}else {
  				log.info("UPDATE X");
  			}
  			
  		} catch (Exception e) {
  			e.printStackTrace();
  		}
  		
  		return url;
  	}
  	
  	//3(2-2). 상품 이미지 업데이트
  	@ResponseBody
  	@PostMapping("/productimgupdate")
  	public String productimgupdate(HttpServletRequest req, ProductDto product, int photoNumber,
  		@RequestParam(value="fileload", required = false)MultipartFile fileload)throws Exception{
  		
  		log.info("------------------------------------이미지 번호 : " + photoNumber + "" );
  		String path = req.getServletContext().getRealPath("/upload/store");
  		String fileName = fileload.getOriginalFilename();	// mydata
  		
  		String timeFileName = System.currentTimeMillis() + fileName;
  		File file = new File(path + "/" + timeFileName);
  		
  		if(photoNumber == 1) {
  			product.setPhoto1_file(timeFileName);
  		}
  		if (photoNumber == 2) {
  			product.setPhoto2_file(timeFileName);
  		}
  		if (photoNumber == 3) {
  			product.setPhoto3_file(timeFileName);
  		}
  		if (photoNumber == 4) {
  			product.setPhoto4_file(timeFileName);
  		}
  		if (photoNumber == 5) {
  			product.setPhoto5_file(timeFileName);
  		}
  		
  		try {
  			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
  		
  			boolean bool = manage.productImgUpdate(product);
  			if(bool) {
  				log.info("상품이미지 업데이트 성공");
  			}else {
  				log.info("상품이미지 업데이트 실패");
  			}
  			
  		} catch (Exception e) {
  			e.printStackTrace();
  		}
  		
  		return timeFileName;
  	}
  	
  	//3(2-3).상품 SALE 적용
  	@ResponseBody
    @GetMapping("/salepriceupdate")
    public String salepriceupdate(ProductDto product)throws Exception {
  		String msg = "";
  		boolean bool = manage.productSalePriceUpdate(product);
  		if(bool) {
  			msg = "UPDATE O";
  		}else {
  			msg = "UPDATE X";
  		}
      	return msg;
      }
  	//3(2-3).상품 SALE 취소
  	@ResponseBody
    @GetMapping("/salepriceupdatecancel")
    public String salepriceupdatecancel(ProductDto product)throws Exception {
  		String msg = "";
  		boolean bool = manage.productSalePriceUpdateCancel(product);
  		if(bool) {
  			log.info("SALE적용 취소");
  			msg = "SUCCESS";
  		}
      	return msg;
      }
  	//3(3).상품 삭제
    @GetMapping("/productDelete")
  	public String productDelete(ProductDto product, Model model) throws Exception{
  		boolean bool = manage.productDelete(product);
  		if(bool) {
  			log.info("상품삭제 성공");
  		}
  		return "redirect:/admin/company/productoperlist";
  	}
    
    @ResponseBody
    @GetMapping("/getProductDetail")
    public ProductDto getProductDetail(int p_seq)throws Exception {
    	
    	ProductDto product = new ProductDto();
    	product = store_purchase.getProductDetail(p_seq);
    	
    	return product;
    }
    
}
