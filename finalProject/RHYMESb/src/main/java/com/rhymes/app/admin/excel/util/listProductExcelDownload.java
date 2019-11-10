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

import com.rhymes.app.admin.excel.model.AdminExcelProductDTO;

public class listProductExcelDownload extends AbstractXlsxView {

	@Override
	protected void buildExcelDocument(Map<String, Object> modelMap, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String sCurTime = null;
        sCurTime = new SimpleDateFormat("yyyyMMdd", Locale.KOREA).format(new Date());
     
        String excelName = sCurTime + "RHYMESb 상품정보_엑셀다운로드.xlsx";
        Sheet worksheet = null;
        Row row = null;
        CellStyle style = workbook.createCellStyle(); // 셀 스타일을 위한 변수
        style.setAlignment(CellStyle.ALIGN_CENTER); // 글 위치를 중앙으로 설정
         
        List<AdminExcelProductDTO> product_list = (List<AdminExcelProductDTO>)modelMap.get("product_list");
         
        // 새로운 sheet를 생성한다.
        worksheet = workbook.createSheet("상품정보");
         
        // 가장 첫번째 줄에 제목을 만든다.
        row = worksheet.createRow(0);
        
        
        
        // 칼럼 길이 설정
        int columnIndex = 0;
        while (columnIndex < 15) {
             
            if(columnIndex == 0) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 1) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 2) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 3) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 4) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 5) {
                worksheet.setColumnWidth(columnIndex, 5000);
			}else if (columnIndex == 6) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 7) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 8) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 9) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 10) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 11) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 12) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 13) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 14) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 15) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }
            columnIndex++;
        }


        // 헤더 설정
        
        row = worksheet.createRow(0);
        row.createCell(0).setCellValue("상품 재고번호");
        row.createCell(1).setCellValue("상품 시퀀스");
        row.createCell(2).setCellValue("사이즈");
        row.createCell(3).setCellValue("재고수량");
        row.createCell(4).setCellValue("업체명");
        row.createCell(5).setCellValue("상품명");
        row.createCell(6).setCellValue("업체_상품일련번호");
        row.createCell(7).setCellValue("결제 금액");
        row.createCell(8).setCellValue("세일 전 금액");
        row.createCell(9).setCellValue("색상");
        row.createCell(10).setCellValue("대분류");
        row.createCell(11).setCellValue("중분류");
        row.createCell(12).setCellValue("소분류");
        row.createCell(13).setCellValue("원산지");
        row.createCell(14).setCellValue("생산일");
        row.createCell(15).setCellValue("등록일");
        
        
        
        int rowIndex = 1;
        
        int i = 0;
        // 각 해당하는 셀에 값과 스타일을 넣음
        for(AdminExcelProductDTO excel : product_list) {
            row = worksheet.createRow(rowIndex);
            row.createCell(0).setCellValue(excel.getStock_seq());
            row.createCell(1).setCellValue(excel.getP_seq());
            row.createCell(2).setCellValue(excel.getSize());
            row.createCell(3).setCellValue(excel.getQuantity());
            row.createCell(4).setCellValue(excel.getC_name());
            row.createCell(5).setCellValue(excel.getP_name());
            row.createCell(6).setCellValue(excel.getCp_code());
            row.createCell(7).setCellValue(excel.getP_price());
            row.createCell(8).setCellValue(excel.getBfs_price());
            row.createCell(9).setCellValue(excel.getP_color());
            row.createCell(10).setCellValue(excel.getC1_name());
            row.createCell(11).setCellValue(excel.getC2_name());
            row.createCell(12).setCellValue(excel.getC3_name());
            row.createCell(13).setCellValue(excel.getNation());
            row.createCell(14).setCellValue(excel.getMdate());
            row.createCell(15).setCellValue(excel.getRdate());
             
            rowIndex++;
        }
        
        
        
        // 셀 병합 CellRangeAddress(시작 행, 끝 행, 시작 열, 끝 열)
        worksheet.addMergedRegion(
                new CellRangeAddress(product_list.size() + 1, product_list.size() + 1, 0, 20));
         
        // 병합 테스트를 위한 설정
        row = worksheet.createRow(product_list.size() + 1);
        row.createCell(0).setCellValue("상품 정보");
        row.getCell(0).setCellStyle(style); // 지정한 스타일을 입혀준다.

        
         
        try {
            response.setHeader("Content-Disposition", "attachement; filename=\""
                + java.net.URLEncoder.encode(excelName, "UTF-8") + "\";charset=\"UTF-8\"");
          } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
          }
   
        
        
	
	}
	
}
