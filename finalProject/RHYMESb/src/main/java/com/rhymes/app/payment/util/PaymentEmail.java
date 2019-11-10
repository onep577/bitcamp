package com.rhymes.app.payment.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.rhymes.app.payment.model.PaymentDTO;

import lombok.extern.slf4j.Slf4j;

// 결제 후 주문한 이메일로 결제내역 보내기 폼도 있는 것
@Slf4j
public class PaymentEmail {
	
    static final String FROM = "ysujin17@naver.com";
    static final String FROMNAME = "Rhymes";
    static String TO = "";
 
    static final String SMTP_USERNAME = "ysujin17@naver.com";
    static final String SMTP_PASSWORD = "rhymes127";
    //static final String SMTP_USERNAME = "ogbgt5@naver.com";
    //static final String SMTP_PASSWORD = "nahdl^*^zrb15";
    
    static final String HOST = "smtp.naver.com";
    static final int PORT = 25;
    
    static String SUBJECT = "";
    
    private static String totalprice;
    private static String payment_code;
    private static String payment_status;
    private static String payment_method;
    private static String receive_name;
    private static String receive_phone;
    private static String receive_postnum;
    private static String receive_address;
    private static String receive_address_request;
    private static String send_email;
    private static String send_name;

    public static String email_send() {
    	String body =
    			
    	"<!DOCTYPE html>\r\n" + 
		"<html>\r\n" + 
		"<head>\r\n" + 
		"<meta charset=\"UTF-8\">\r\n" + 
		"<title>RHYMES</title>\r\n" + 
		"<link rel=\"stylesheet\" href=\"./mailForm.css\">\r\n" + 
		"</head>\r\n" + 
		"<body>\r\n" + 
        "<div style='text-align: left; padding: 10px 30px 10px 30px; padding-bottom: 50px; width: 60%; border: 1px solid #dbdbdb;'>"+
        "<div style='margin-bottom: 50px;'>"+
        "<h1>RHYMESb 쇼핑몰 / " + send_name + "님의 결제내역입니다. "+"총 주문금액 : "+totalprice+"원</h1>"+
		"<div>"+
        "<div style='margin-top: 50px;'>"+
        "<b style='font-family: sans-serif; font-size: 15px;'>결제방법</b>"+
        "</div>"+
        "<div>"+
        "<table class='paymentAf_tb' style='width: 100%; margin: 10px 10px 10px 10px; border-top: 1px solid gray; border-collapse: collapse;'>"+
        "<tr style='border-top: 1px solid #d7fd75; border-bottom: 1px solid #d7fd75;'>"+
        	"<td style='padding: 10px 10px 10px 10px; font-size: 15px; background-color: #d7fd75;'>결제금액</td>"+
        	"<td style='padding: 10px 10px 10px 10px; font-size: 15px; background-color: #d7fd75;'>주문번호</td>"+
        	"<td style='padding: 10px 10px 10px 10px; font-size: 15px; background-color: #d7fd75;'>결제상태</td>"+
        	"<td style='padding: 10px 10px 10px 10px; font-size: 15px; background-color: #d7fd75;'>결제수단</td>"+
        "</tr>"+
        "<tr style='border-top: 1px solid #d7fd75; border-bottom: 1px solid #d7fd75;'>"+
        	"<td style='padding: 10px 10px 10px 10px; font-size: 15px;'>"+totalprice+"원</td>"+
        	"<td style='padding: 10px 10px 10px 10px; font-size: 15px;'>"+payment_code+"</td>"+
        	"<td style='padding: 10px 10px 10px 10px; font-size: 15px;'>"+payment_status+"</td>"+
        	"<td style='padding: 10px 10px 10px 10px; font-size: 15px;'>"+payment_method+"</td>"+

        "</tr>"+
        "</table>"+
        "</div>"+
        "<br><br>"+

        "<div>"+
        "<b style='font-family: sans-serif; font-size: 15px;'>배송지 정보</b>"+
        "</div>"+
        "<div>"+
        "<table class='paymentAf_tb' style='width: 100%; margin: 10px 10px 10px 10px; border-top: 1px solid gray; border-collapse: collapse;'>"+
        "<tr style='border-top: 1px solid #d7fd75; border-bottom: 1px solid #d7fd75;'>"+
        	"<td style='padding: 10px 10px 10px 10px; font-size: 15px; background-color: #d7fd75;'>이름</td>"+
        	"<td style='padding: 10px 10px 10px 10px; font-size: 15px;'>"+receive_name+"</td>"+
        	"<td style='padding: 10px 10px 10px 10px; font-size: 15px; background-color: #d7fd75;'>연락처</td>"+
        	"<td style='padding: 10px 10px 10px 10px; font-size: 15px;'>"+receive_phone+"</td>"+
        "</tr>"+
        "<tr style='border-top: 1px solid #d7fd75; border-bottom: 1px solid #d7fd75;'>"+
        	"<td style='padding: 10px 10px 10px 10px; font-size: 15px; background-color: #d7fd75;'>우편번호</td>"+
        	"<td style='padding: 10px 10px 10px 10px; font-size: 15px;'>"+receive_postnum+"</td>"+
        	"<td style='padding: 10px 10px 10px 10px; font-size: 15px; background-color: #d7fd75;'>주소</td>"+
        	"<td style='padding: 10px 10px 10px 10px; font-size: 15px;'>"+receive_address+"</td>"+
        "</tr>"+
        "<tr style='border-top: 1px solid #d7fd75; border-bottom: 1px solid #d7fd75;'>"+
        	"<td style='padding: 10px 10px 10px 10px; font-size: 15px; background-color: #d7fd75;'>주문시 요청사항</td>"+
        	"<td colspan='3' style='padding: 10px 10px 10px 10px;'>"+receive_address_request+"</td>"+
        "</tr>"+
        "</table>"+
        "</div>"+
        "</div>"+
		"</body>\r\n" +
		"</html>";

    	return body;
    }
    
    public static void PaymentEmailSend(PaymentDTO dto) throws Exception {
    	payment_code = dto.getPayment_code().substring(4);
    	payment_status = dto.getPayment_status();
    	payment_method = dto.getPayment_method();
    	receive_name = dto.getReceive_name();
    	receive_phone = dto.getReceive_phone();
    	receive_postnum = dto.getReceive_postnum();
    	receive_address = dto.getReceive_address();
    	receive_address_request = dto.getReceive_address_request();
    	send_email = dto.getSend_email();
    	send_name = dto.getSend_name();
    	NumberFormatFilter filter = new NumberFormatFilter();
    	totalprice = filter.commaFormat(dto.getTotalprice());
    	SUBJECT = "[Rhymes 결제확인] " +send_name  + "님, (주)Rhymes에서 결제하신 내역 확인바랍니다.";
    	
    	TO = send_email;
		log.warn("보낼 메일 : "+TO);
    	
    	String body = email_send();
		//String body = "123456";
    	
        Properties props = System.getProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.port", PORT); 
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");
 
        Session session = Session.getDefaultInstance(props);
 
        MimeMessage msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(FROM, FROMNAME));
        msg.setRecipient(Message.RecipientType.TO, new InternetAddress(TO));
        msg.setSubject(SUBJECT);
        msg.setContent(body, "text/html;charset=euc-kr");
        
        Transport transport = session.getTransport();
 
        try {
            log.warn("메일 발송 중 ...");
            
            transport.connect(HOST, SMTP_USERNAME, SMTP_PASSWORD);
            transport.sendMessage(msg, msg.getAllRecipients());

            log.warn("메일 발송 성공");
        } catch (Exception ex) {
            ex.printStackTrace();
 
        } finally {
            transport.close();
        }
    }

}
