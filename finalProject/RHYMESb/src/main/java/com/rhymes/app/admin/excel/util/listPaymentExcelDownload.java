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

import com.rhymes.app.payment.model.PaymentDTO;

public class listPaymentExcelDownload extends AbstractXlsxView {

	@Override
	protected void buildExcelDocument(Map<String, Object> modelMap, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String sCurTime = null;
        sCurTime = new SimpleDateFormat("yyyyMMdd", Locale.KOREA).format(new Date());
     
        String excelName = sCurTime + "RHYMESb 결제내역_엑셀다운로드.xlsx";
        Sheet worksheet = null;
        Row row = null;
        CellStyle style = workbook.createCellStyle(); // 셀 스타일을 위한 변수
        style.setAlignment(CellStyle.ALIGN_CENTER); // 글 위치를 중앙으로 설정
         
        List<PaymentDTO> listExcel = (List<PaymentDTO>)modelMap.get("payment_list");
         
        // 새로운 sheet를 생성한다.
        worksheet = workbook.createSheet("결제내역");
         
        // 가장 첫번째 줄에 제목을 만든다.
        row = worksheet.createRow(0);
         
        // 칼럼 길이 설정
        int columnIndex = 0;
        while (columnIndex < 20) {
             
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
                worksheet.setColumnWidth(columnIndex, 10000);
            }else if (columnIndex == 9) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 10) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 11) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 12) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 13) {
                worksheet.setColumnWidth(columnIndex, 8000);
            }else if (columnIndex == 14) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 15) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 16) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 17) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 18) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }
            columnIndex++;
        }


        // 헤더 설정
        row = worksheet.createRow(0);
        //row.createCell(0).setCellValue("SEQ");
        row.createCell(0).setCellValue("주문번호");
        row.createCell(1).setCellValue("아이디");
        row.createCell(2).setCellValue("주문하는 사람 이름");
        row.createCell(3).setCellValue("주문하는 사람 연락처");
        row.createCell(4).setCellValue("주문하는 사람 이메일");
        row.createCell(5).setCellValue("받는 사람 이름");
        row.createCell(6).setCellValue("받는 사람 연락처");
        row.createCell(7).setCellValue("받는 사람 우편번호");
        row.createCell(8).setCellValue("받는 사람 주소");
        row.createCell(9).setCellValue("결제방식");
        row.createCell(10).setCellValue("결제상태");
        row.createCell(11).setCellValue("쿠폰으로 차감액");
        row.createCell(12).setCellValue("배송비");
        row.createCell(13).setCellValue("사용한 쿠폰 코드");
        row.createCell(14).setCellValue("사용 적립금");
        row.createCell(15).setCellValue("상품으로 차감액");
        row.createCell(16).setCellValue("추가 적립금");
        row.createCell(17).setCellValue("총 결제금액");
        row.createCell(18).setCellValue("주문일");
         
        int rowIndex = 1;
        
        int i = 0;
        // 각 해당하는 셀에 값과 스타일을 넣음
        for(PaymentDTO excel : listExcel) {
            row = worksheet.createRow(rowIndex);
            //row.createCell(0).setCellValue(excel.getSeq());
            row.createCell(0).setCellValue(excel.getPayment_code().substring(4));
            row.createCell(1).setCellValue(excel.getUserid());
            row.createCell(2).setCellValue(excel.getSend_name());
            row.createCell(3).setCellValue(excel.getSend_phone());
            row.createCell(4).setCellValue(excel.getSend_email());
            row.createCell(5).setCellValue(excel.getReceive_name());
            row.createCell(6).setCellValue(excel.getReceive_phone());
            row.createCell(7).setCellValue(excel.getReceive_postnum());
            row.createCell(8).setCellValue(excel.getReceive_address());
            row.createCell(9).setCellValue(excel.getPayment_method());
            row.createCell(10).setCellValue(excel.getPayment_status());
            row.createCell(11).setCellValue(excel.getDisc_coupon());
            row.createCell(12).setCellValue(excel.getDelivery_price());
            row.createCell(13).setCellValue(excel.getCoupon_code());
            row.createCell(14).setCellValue(excel.getDisc_point());
            row.createCell(15).setCellValue(excel.getDisc_product());
            row.createCell(16).setCellValue(excel.getAdd_point());
            row.createCell(17).setCellValue(excel.getTotalprice());
            row.createCell(18).setCellValue(excel.getRdate());
             
            rowIndex++;
        }



        // 셀 병합 CellRangeAddress(시작 행, 끝 행, 시작 열, 끝 열)
        worksheet.addMergedRegion(
                new CellRangeAddress(listExcel.size() + 1, listExcel.size() + 1, 0, 20));
         
        // 병합 테스트를 위한 설정
        row = worksheet.createRow(listExcel.size() + 1);
        row.createCell(0).setCellValue("결제내역");
        row.getCell(0).setCellStyle(style); // 지정한 스타일을 입혀준다.
         
         
        try {
            response.setHeader("Content-Disposition", "attachement; filename=\""
                + java.net.URLEncoder.encode(excelName, "UTF-8") + "\";charset=\"UTF-8\"");
          } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
          }
   
        
        
	
	}
	
}
