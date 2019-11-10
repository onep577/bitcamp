package com.rhymes.app.admin.excel.util;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.member.model.SellerDTO;
import com.rhymes.app.payment.model.PaymentDTO;

public class listMemberExcelDownload extends AbstractXlsxView {

	@Override
	protected void buildExcelDocument(Map<String, Object> modelMap, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String sCurTime = null;
        sCurTime = new SimpleDateFormat("yyyyMMdd", Locale.KOREA).format(new Date());
     
        String excelName = sCurTime + "RHYMESb 회원정보_엑셀다운로드.xlsx";
        Sheet worksheet_p = null;
        Sheet worksheet_c = null;
        Row row_p = null;
        Row row_c = null;
        CellStyle style = workbook.createCellStyle(); // 셀 스타일을 위한 변수
        style.setAlignment(CellStyle.ALIGN_CENTER); // 글 위치를 중앙으로 설정
         
        List<P_MemberDTO> mem_p_list = (List<P_MemberDTO>)modelMap.get("mem_p_list");
        List<SellerDTO> mem_c_list = (List<SellerDTO>)modelMap.get("mem_c_list");
         
        // 새로운 sheet를 생성한다.
        worksheet_p = workbook.createSheet("개인 회원 정보");
        worksheet_c = workbook.createSheet("사업자 회원 정보");
         
        // 가장 첫번째 줄에 제목을 만든다.
        row_p = worksheet_p.createRow(0);
        row_c = worksheet_c.createRow(0);
         
        // 칼럼 길이 설정
        int columnIndex = 0;
        while (columnIndex < 12) {             
            if(columnIndex == 0) {
            	worksheet_p.setColumnWidth(columnIndex, 7000);
            }else if (columnIndex == 1) {
            	worksheet_p.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 2) {
            	worksheet_p.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 3) {
            	worksheet_p.setColumnWidth(columnIndex, 8000);
            }else if (columnIndex == 4) {
            	worksheet_p.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 5) {
            	worksheet_p.setColumnWidth(columnIndex, 7000);
            }else if (columnIndex == 6) {
            	worksheet_p.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 7) {
            	worksheet_p.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 8) {
            	worksheet_p.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 9) {
            	worksheet_p.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 10) {
            	worksheet_p.setColumnWidth(columnIndex, 5000);
            }
            columnIndex++;
        }
        
        columnIndex = 0;
        while (columnIndex < 20) {
            if(columnIndex == 0) {
            	worksheet_c.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 1) {
            	worksheet_c.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 2) {
            	worksheet_c.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 3) {
            	worksheet_c.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 4) {
            	worksheet_c.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 5) {
            	worksheet_c.setColumnWidth(columnIndex, 8000);
            }else if (columnIndex == 6) {
            	worksheet_c.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 7) {
            	worksheet_c.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 8) {
            	worksheet_c.setColumnWidth(columnIndex, 6000);
            }else if (columnIndex == 9) {
            	worksheet_c.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 10) {
            	worksheet_c.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 11) {
            	worksheet_c.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 12) {
            	worksheet_c.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 13) {
            	worksheet_c.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 14) {
            	worksheet_c.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 15) {
            	worksheet_c.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 16) {
            	worksheet_c.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 17) {
            	worksheet_c.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 18) {
            	worksheet_c.setColumnWidth(columnIndex, 5000);
            }
            columnIndex++;
        }


        // 헤더 설정
        row_p = worksheet_p.createRow(0);
        //row_p.createCell(0).setCellValue("SEQ");
        row_p.createCell(0).setCellValue("아이디");
        row_p.createCell(1).setCellValue("이름");
        row_p.createCell(2).setCellValue("우편번호");
        row_p.createCell(3).setCellValue("주소");
        row_p.createCell(4).setCellValue("상세주소");
        row_p.createCell(5).setCellValue("이메일");
        row_p.createCell(6).setCellValue("연락처");
        row_p.createCell(7).setCellValue("성별");
        row_p.createCell(8).setCellValue("생년월일");
        row_p.createCell(9).setCellValue("인증횟수");
        row_p.createCell(10).setCellValue("???");
        
        row_c = worksheet_c.createRow(0);
        row_c.createCell(0).setCellValue("아이디");
        row_c.createCell(1).setCellValue("업체명");
        row_c.createCell(2).setCellValue("C_NUM");
        row_c.createCell(3).setCellValue("상품명");
        row_c.createCell(4).setCellValue("C_POSTCODE");
        row_c.createCell(5).setCellValue("C_ADDRESS");
        row_c.createCell(6).setCellValue("C_DETAILADDRESS");
        row_c.createCell(7).setCellValue("C_COND");
        row_c.createCell(8).setCellValue("C_TYPE");
        row_c.createCell(9).setCellValue("IC_NAME");
        row_c.createCell(10).setCellValue("IC_PHONE");
        row_c.createCell(11).setCellValue("IC_EMAIL");
        row_c.createCell(12).setCellValue("S_POSTCODE");
        row_c.createCell(13).setCellValue("S_ADDRESS");
        row_c.createCell(14).setCellValue("S_DETAILADDRESS");
        row_c.createCell(15).setCellValue("R_POSTCODE");
        row_c.createCell(16).setCellValue("R_ADDRESS");
        row_c.createCell(17).setCellValue("R_DETAILADDRESS");
        row_c.createCell(18).setCellValue("C_CODE");
         
        int rowIndex = 1;        
        // 각 해당하는 셀에 값과 스타일을 넣음
        for(P_MemberDTO mem_p : mem_p_list) {
        	row_p = worksheet_p.createRow(rowIndex);
        	row_p.createCell(0).setCellValue(mem_p.getUserid());
        	row_p.createCell(1).setCellValue(mem_p.getUsername());
        	row_p.createCell(2).setCellValue(mem_p.getPostcode());
        	row_p.createCell(3).setCellValue(mem_p.getAddress());
        	row_p.createCell(4).setCellValue(mem_p.getDetailAddress());
        	row_p.createCell(5).setCellValue(mem_p.getUseremail());
            row_p.createCell(6).setCellValue(mem_p.getPhone());
            row_p.createCell(7).setCellValue(mem_p.getUsergender());
            row_p.createCell(8).setCellValue(mem_p.getUserbirth());
            row_p.createCell(9).setCellValue(mem_p.getCount());
            row_p.createCell(10).setCellValue(mem_p.getSubscribe());
             
            rowIndex++;
        }
        
        rowIndex = 1;        
        // 각 해당하는 셀에 값과 스타일을 넣음
        for(SellerDTO mem_c : mem_c_list) {
        	row_c = worksheet_c.createRow(rowIndex);
        	row_c.createCell(0).setCellValue(mem_c.getId());
        	row_c.createCell(1).setCellValue(mem_c.getC_name());
        	row_c.createCell(2).setCellValue(mem_c.getC_num());
        	row_c.createCell(3).setCellValue(mem_c.getP_name());
        	row_c.createCell(4).setCellValue(mem_c.getC_postcode());
        	row_c.createCell(5).setCellValue(mem_c.getC_address());
        	row_c.createCell(6).setCellValue(mem_c.getC_detailaddress());
        	row_c.createCell(7).setCellValue(mem_c.getC_cond());
        	row_c.createCell(8).setCellValue(mem_c.getC_type());
        	row_c.createCell(9).setCellValue(mem_c.getIc_name());
        	row_c.createCell(10).setCellValue(mem_c.getIc_phone());
        	row_c.createCell(11).setCellValue(mem_c.getIc_email());
        	row_c.createCell(11).setCellValue(mem_c.getS_postcode());
        	row_c.createCell(11).setCellValue(mem_c.getS_address());
        	row_c.createCell(11).setCellValue(mem_c.getS_detailaddress());
        	row_c.createCell(11).setCellValue(mem_c.getR_postcode());
        	row_c.createCell(11).setCellValue(mem_c.getR_address());
        	row_c.createCell(11).setCellValue(mem_c.getR_detailaddress());
        	row_c.createCell(11).setCellValue(mem_c.getC_code());
             
            rowIndex++;
        }


        
        
        
        
        

        // 셀 병합 CellRangeAddress(시작 행, 끝 행, 시작 열, 끝 열)
        worksheet_p.addMergedRegion(
                new CellRangeAddress(mem_p_list.size() + 1, mem_p_list.size() + 1, 0, 20));
         
        // 병합 테스트를 위한 설정
        row_p = worksheet_p.createRow(mem_p_list.size() + 1);
        row_p.createCell(0).setCellValue("개인 회원 정보");
        row_p.getCell(0).setCellStyle(style); // 지정한 스타일을 입혀준다.
         
         
        try {
            response.setHeader("Content-Disposition", "attachement; filename=\""
                + java.net.URLEncoder.encode(excelName, "UTF-8") + "\";charset=\"UTF-8\"");
          } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
          }
   
        
        
	
	}
	
}
