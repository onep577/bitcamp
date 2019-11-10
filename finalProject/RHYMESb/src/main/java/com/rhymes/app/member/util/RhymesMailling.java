package com.rhymes.app.member.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

public class RhymesMailling {
	/**
	 * 기본 메일발송 메소드. String html을 발송한다. 송신 : 5739859@naver.com 수신 :
	 * 01068889859@hanmai.net
	 * 
	 * @param html
	 */
	public static void sendMail(String html) {
		//System.out.println("[jejuyaMailling] sendmail start ok");

		String host = "smtp.naver.com";
		final String user = "ysujin17";
		final String password = "rhymes127";

		String to = "ysujin17@naver.com";

		// Get the session object
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");

		//System.out.println("[jejuyaMailling] props set ok");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		//System.out.println("[jejuyaMailling] session set ok");

		// Compose the message
		try {

			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			//System.out.println("[jejuyaMailling] content set ok");

			// Content html
			message.setContent(html, "text/html;charset=UTF-8");

			// Subject
			message.setSubject("Java Mail Test With Json 2");

			// Text
			// message.setText(html);

			// send the message
			Transport.send(message);
			//System.out.println("message sent successfully...");

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 메일발송 메소드. String html을 발송한다. 송신 : 5739859@naver.com 수신 : String dest
	 * 
	 * @param html
	 * @param dest
	 */
	public static void sendMail(String html, String dest) {
		String host = "smtp.naver.com";
		final String user = "ysujin17";
		final String password = "rhymes127";

		String to = dest;

		// Get the session object
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		// Compose the message
		try {

			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// Content html
			message.setContent(html, "text/html;charset=UTF-8");

			// Subject
			message.setSubject("[RHYMES] 이메일 인증번호");

			// Text
			// message.setText(html);

			// send the message
			Transport.send(message);

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	// 아이디 발송
	public static void sendMailId(String html, String dest) {
		String host = "smtp.naver.com";
		final String user = "ysujin17";
		final String password = "rhymes127";

		String to = dest;

		// Get the session object
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		// Compose the message
		try {

			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// Content html
			message.setContent(html, "text/html;charset=UTF-8");

			// Subject
			message.setSubject("[RHYMES] 요청하신 ID입니다.");

			// Text
			// message.setText(html);

			// send the message
			Transport.send(message);

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	
	
	/**메일발송 메소드. String html을 발송한다. 송신 : 5739859@naver.com 수신 : String dest, ID:sel==0 PW:sel==1
	 * @param html
	 * @param dest
	 * @param s
	 */
	public static void sendMail(String html, String dest, int sel) {
		String host = "smtp.naver.com";
		final String user = "ysujin17";
		final String password = "rhymes127";

		String to = dest;

		// Get the session object
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		// Compose the message
		try {

			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// Content html
			message.setContent(html, "text/html;charset=UTF-8");
			
			// Subject
			if( sel == 0 ) {
				message.setSubject("RHYMES 아이디를 알려 드립니다.");
			}else {
				message.setSubject("RHYMES 인증번호를 알려 드립니다.");
			}
			
			

			// Text
			// message.setText(html);

			// send the message
			Transport.send(message);

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 메일발송 메소드. String html을 발송한다. 송신 : String host 송신 호스트는 SMTP 설정이 완료되어야만 발송이 가능
	 * 수신 : String dest
	 * 
	 * @param html
	 * @param dest
	 * @param host
	 */
	public static void sendMail(String html, String dest, String host) {

	}
	
	/** ID찾기 HTML 샘플코드 문자열 리턴 메소드
	 * @return
	 */
	public static String getFindIdSampleHtmlContent(String userId) {
		String str = "";
		
		str = "<!DOCTYPE html>\r\n" + 
				"<html>\r\n" + 
				"<head>\r\n" + 
				"<meta charset=\"UTF-8\">\r\n" + 
				"<title>RHYMES ID &#52286;&#44592;</title>\r\n" + 
				"<link rel=\"stylesheet\" href=\"./mailForm.css\">\r\n" + 
				"</head>\r\n" + 
				"<body>\r\n" + 
				" \r\n" + 
				"<div class=\"wrapFindId\">\r\n" + 
				" \r\n" + 
				"	<div class=\"tblFindIdHeader\">\r\n" + 
				"	<h1>RHYMES &#50500;&#51060;&#46356;&#47484; &#50508;&#47140; &#46300;&#47549;&#45768;&#45796;</h1>\r\n" + 
				"	<hr>\r\n" + 
				"</div>\r\n" + 
				" \r\n" + 
				"	<div class=\"tblFindIdBody\">\r\n" + 
				"		<table id=\"tblFindId\">\r\n" + 
				"<tr>\r\n" + 
				"<td style=\"padding: 10px;\">\r\n" + 
				"					<strong>&#44256;&#44061;&#45784;&#44760;&#49436; &#50836;&#52397;&#54616;&#49888; <a class=\"lblGreen\" style=\"color:#d7fd75;\">&#50500;&#51060;&#46356;</a>&#47484; &#50508;&#47140; &#46300;&#47549;&#45768;&#45796;.</strong>\r\n" + 
				"				</td>\r\n" + 
				"			</tr>\r\n" + 
				"<tr>\r\n" + 
				"<td style=\"padding: 10px;\">\r\n" + 
				"					<p class=\"descAccountInfo\" style=\"padding: 10px;\r\n" + 
				"	width: 700px;\r\n" + 
				"	background-color: #f0ffff;\">\r\n" + 
				"						<b id=\"userId\">&#50500;&#51060;&#46356; : ";
		
		str += userId;
		
		str += "</b>\r\n" + 
				"						<br>\r\n" + 
				"						*&#48708;&#48128;&#48264;&#54840;&#44032; &#44592;&#50613;&#45208;&#51648; &#50506;&#45716; &#44221;&#50864; <a class=\"lblGreen\" style=\"color:#d7fd75;\">&#48708;&#48128;&#48264;&#54840; &#51116;&#48156;&#44553; &#54168;&#51060;&#51648;</a>&#50640;&#49436; &#52286;&#51012; &#49688; &#51080;&#49845;&#45768;&#45796;.\r\n" + 
				"					</p>\r\n" + 
				"				</td>\r\n" + 
				"			</tr>\r\n" + 
				"<tr>\r\n" + 
				"<td style=\"padding: 10px;\">\r\n" + 
				"					RHYMES&#47484; &#51060;&#50857;&#54644; &#51452;&#49492;&#49436; &#44048;&#49324;&#54633;&#45768;&#45796;.<br>\r\n" + 
				"					&#45908;&#50865; &#54200;&#47532;&#54620; &#49436;&#48708;&#49828;&#47484; &#51228;&#44277;&#54616;&#44592; &#50948;&#54644; &#54637;&#49345; &#52572;&#49440;&#51012; &#45796;&#54616;&#44192;&#49845;&#45768;&#45796;.\r\n" + 
				"				</td>\r\n" + 
				"			</tr>\r\n" + 
				"</table>\r\n" + 
				"<hr>\r\n" + 
				"</div>	\r\n" + 
				"</div>\r\n" + 
				" \r\n" + 
				"</body>\r\n" + 
				"</html>";
		
		return str;
	}
	
	
	/** PW찾기 HTML 샘플코드 문자열 리턴 메소드
	 * @param tempPw
	 * @return
	 */
	public static String getFindPwSampleHtmlContent(String tempPw) {
		String str = "";
		
		str = "<!DOCTYPE html>\r\n" + 
				"<html>\r\n" + 
				"<head>\r\n" + 
				"<meta charset=\"UTF-8\">\r\n" + 
				"<title>RHYMES ID &#52286;&#44592;</title>\r\n" + 
				"<link rel=\"stylesheet\" href=\"./mailForm.css\">\r\n" + 
				"</head>\r\n" + 
				"<body>\r\n" + 
				" \r\n" + 
				"<div class=\"wrapFindId\">\r\n" + 
				" \r\n" + 
				"	<div class=\"tblFindIdHeader\">\r\n" + 
				"	<h1>RHYMES &#51076;&#49884; &#48708;&#48128;&#48264;&#54840;&#47484; &#50508;&#47140; &#46300;&#47549;&#45768;&#45796;</h1>\r\n" + 
				"	<hr>\r\n" + 
				"</div>\r\n" + 
				" \r\n" + 
				"	<div class=\"tblFindIdBody\">\r\n" + 
				"		<table id=\"tblFindId\">\r\n" + 
				"<tr>\r\n" + 
				"<td style=\"padding: 10px;\">\r\n" + 
				"					<strong>&#44256;&#44061;&#45784;&#44760;&#49436; &#50836;&#52397;&#54616;&#49888; <a class=\"lblGreen\" style=\"color:#d7fd75;\">&#51076;&#49884; &#48708;&#48128;&#48264;&#54840;</a>&#47484; &#50508;&#47140; &#46300;&#47549;&#45768;&#45796;.</strong>\r\n" + 
				"				</td>\r\n" + 
				"			</tr>\r\n" + 
				"<tr>\r\n" + 
				"<td style=\"padding: 10px;\">\r\n" + 
				"					<p class=\"descAccountInfo\" style=\"padding: 10px;\r\n" + 
				"	width: 700px;\r\n" + 
				"	background-color: #f0ffff;\">\r\n" + 
				"						<b id=\"tempPw\">&#51076;&#49884; &#48708;&#48128;&#48264;&#54840; : ";
		
		str += tempPw;
		
		str += "</b>\r\n" + 
				"						<br></p>\r\n" + 
				"				</td>\r\n" + 
				"			</tr>\r\n" + 
				"<tr>\r\n" + 
				"<td style=\"padding: 10px;\">\r\n" + 
				"					RHYMES&#47484; &#51060;&#50857;&#54644; &#51452;&#49492;&#49436; &#44048;&#49324;&#54633;&#45768;&#45796;.<br>\r\n" + 
				"					&#45908;&#50865; &#54200;&#47532;&#54620; &#49436;&#48708;&#49828;&#47484; &#51228;&#44277;&#54616;&#44592; &#50948;&#54644; &#54637;&#49345; &#52572;&#49440;&#51012; &#45796;&#54616;&#44192;&#49845;&#45768;&#45796;.\r\n" + 
				"				</td>\r\n" + 
				"			</tr>\r\n" + 
				"</table>\r\n" + 
				"<hr>\r\n" + 
				"</div>	\r\n" + 
				"</div>\r\n" + 
				" \r\n" + 
				"</body>\r\n" + 
				"</html>";
		
		return str;
	}
	
	/** 
	 * @return
	 */
	// 인증번호 발송
	public static String getAuthorizationCode(String code) {
		String str = "";
		
		str = "<!DOCTYPE html>\r\n" + 
				"<html>\r\n" + 
				"<head>\r\n" + 
				"<meta charset=\"UTF-8\">\r\n" + 
				"<title>RHYMES ID &#52286;&#44592;</title>\r\n" + 
				"<link rel=\"stylesheet\" href=\"./mailForm.css\">\r\n" + 
				"</head>\r\n" + 
				"<body>\r\n" + 
				" \r\n" + 
				"<div class=\"wrapFindId\">\r\n" + 
				" \r\n" + 
				"	<div class=\"tblFindIdHeader\">\r\n" + 
				"	<h1>RHYMES 인증번호를 알려 드립니다.</h1>\r\n" + 
				"	<hr>\r\n" + 
				"</div>\r\n" + 
				" \r\n" + 
				"	<div class=\"tblFindIdBody\">\r\n" + 
				"		<table id=\"tblFindId\">\r\n" + 
				"<tr>\r\n" + 
				"<td style=\"padding: 10px;\">\r\n" + 
				"					<strong>&#44256;&#44061;&#45784;&#44760;&#49436; &#50836;&#52397;&#54616;&#49888; <a class=\"lblGreen\" style=\"color:green;\">인증번호를</a>&#47484; &#50508;&#47140; &#46300;&#47549;&#45768;&#45796;.</strong>\r\n" + 
				"				</td>\r\n" + 
				"			</tr>\r\n" + 
				"<tr>\r\n" + 
				"<td style=\"padding: 10px;\">\r\n" + 
				"					<p class=\"descAccountInfo\" style=\"padding: 10px;\r\n" + 
				"	width: 700px;\r\n" + 
				"	background-color: #f0ffff;\">\r\n" + 
				"						<b id=\"userId\">인증번호 : ";
		
		str += code;
		
		str += "</b>\r\n" + 
				"						<br>" + 
				"					</p>\r\n" + 
				"				</td>\r\n" + 
				"			</tr>\r\n" + 
				"<tr>\r\n" + 
				"<td style=\"padding: 10px;\">\r\n" + 
				"					RHYMES&#47484; &#51060;&#50857;&#54644; &#51452;&#49492;&#49436; &#44048;&#49324;&#54633;&#45768;&#45796;.<br>\r\n" + 
				"					&#45908;&#50865; &#54200;&#47532;&#54620; &#49436;&#48708;&#49828;&#47484; &#51228;&#44277;&#54616;&#44592; &#50948;&#54644; &#54637;&#49345; &#52572;&#49440;&#51012; &#45796;&#54616;&#44192;&#49845;&#45768;&#45796;.\r\n" + 
				"				</td>\r\n" + 
				"			</tr>\r\n" + 
				"</table>\r\n" + 
				"<hr>\r\n" + 
				"</div>	\r\n" + 
				"</div>\r\n" + 
				" \r\n" + 
				"</body>\r\n" + 
				"</html>";
		
		return str;
	}
	
	
	
	/** 
	 * @return
	 */
	// id찾기 발송
	public static String getAuthorizationid(String userid) {
		String str = "";
		
		str = "<!DOCTYPE html>\r\n" + 
				"<html>\r\n" + 
				"<head>\r\n" + 
				"<meta charset=\"UTF-8\">\r\n" + 
				"<title>RHYMES ID &#52286;&#44592;</title>\r\n" + 
				"<link rel=\"stylesheet\" href=\"./mailForm.css\">\r\n" + 
				"</head>\r\n" + 
				"<body>\r\n" + 
				" \r\n" + 
				"<div class=\"wrapFindId\">\r\n" + 
				" \r\n" + 
				"	<div class=\"tblFindIdHeader\">\r\n" + 
				"	<h1>RHYMES &#50500;&#51060;&#46356;&#47484; &#50508;&#47140; &#46300;&#47549;&#45768;&#45796;</h1>\r\n" + 
				"	<hr>\r\n" + 
				"</div>\r\n" + 
				" \r\n" + 
				"	<div class=\"tblFindIdBody\">\r\n" + 
				"		<table id=\"tblFindId\">\r\n" + 
				"<tr>\r\n" + 
				"<td style=\"padding: 10px;\">\r\n" + 
				"					<strong>&#44256;&#44061;&#45784;&#44760;&#49436; &#50836;&#52397;&#54616;&#49888; <a class=\"lblGreen\" style=\"color:green;\">&#50500;&#51060;&#46356;</a>&#47484; &#50508;&#47140; &#46300;&#47549;&#45768;&#45796;.</strong>\r\n" + 
				"				</td>\r\n" + 
				"			</tr>\r\n" + 
				"<tr>\r\n" + 
				"<td style=\"padding: 10px;\">\r\n" + 
				"					<p class=\"descAccountInfo\" style=\"padding: 10px;\r\n" + 
				"	width: 700px;\r\n" + 
				"	background-color: #f0ffff;\">\r\n" + 
				"						<b id=\"userId\">&#50500;&#51060;&#46356; : ";
		
		str += userid;
		
		str += "</b>\r\n" + 
				"						<br>\r\n" + 
				"						*&#48708;&#48128;&#48264;&#54840;&#44032; &#44592;&#50613;&#45208;&#51648; &#50506;&#45716; &#44221;&#50864; <a class=\"lblGreen\" style=\"color:green;\" href='http://localhost:18080/member/getfindpw'>비밀번호 찾기 페이지</a>&#50640;&#49436; &#52286;&#51012; &#49688; &#51080;&#49845;&#45768;&#45796;.\r\n" + 
				"					</p>\r\n" + 
				"				</td>\r\n" + 
				"			</tr>\r\n" + 
				"<tr>\r\n" + 
				"<td style=\"padding: 10px;\">\r\n" + 
				"					RHYMES&#47484; &#51060;&#50857;&#54644; &#51452;&#49492;&#49436; &#44048;&#49324;&#54633;&#45768;&#45796;.<br>\r\n" + 
				"					&#45908;&#50865; &#54200;&#47532;&#54620; &#49436;&#48708;&#49828;&#47484; &#51228;&#44277;&#54616;&#44592; &#50948;&#54644; &#54637;&#49345; &#52572;&#49440;&#51012; &#45796;&#54616;&#44192;&#49845;&#45768;&#45796;.\r\n" + 
				"				</td>\r\n" + 
				"			</tr>\r\n" + 
				"</table>\r\n" + 
				"<hr>\r\n" + 
				"</div>	\r\n" + 
				"</div>\r\n" + 
				" \r\n" + 
				"</body>\r\n" + 
				"</html>";
		
		return str;
	}
	
	
}
