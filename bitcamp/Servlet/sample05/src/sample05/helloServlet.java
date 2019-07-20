package sample05;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class helloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		// 클라이언트에서 받은 데이터
		String code = req.getParameter("code");
		
		// init-param -> web.xml		
		// web.xml에서 받은 데이터
		// Returns a String containing the value of the named initialization parameter
		// 이니셜 파라미터의 이름의 값이 들어있는 문자열을 리턴
		// 				  getInitParameter(String paramName)
		
		// 현재 클래스안에서 파라미터 이름을 변경되지 않는 값으로 설정하고 싶을 때 사용
		String tax = this.getInitParameter("tax");
		
		// this? WebContainer에 같이 있어서인가? this는 helloServlet.java인데...
		// Servlet에서는 xml 데이터를 this로 받을 수 있는 이유는?
		
		// Web Browser에 보낼 데이터가 깨지지 않도록 인코딩한다
		resp.setContentType("text/html; charset=utf-8");

		// Web Browser에 문자 형태로 데이터를 보낼 수 있도록 PrintWriter 객체로 리턴한다
		PrintWriter pw = resp.getWriter();

		// 문자열의 형태로 Web Browser에 내보낸다
		pw.println("<html>");

		pw.println("<head>");
		pw.println("<title>제목</title>");
		pw.println("</head>");

		pw.println("<body>");
		pw.println("<p>tax : " + tax + "</p>");
		pw.println("<p>code : " + code + "</p>");
		
		if(code.equals("200")) {
			// 정상작동
			pw.println("<p>200:SC_OK</p>");
		}
		else {
			// 파일을 못 찾는다
			if(code.equals("404")) {	// 403 : 접근제한
				// final int SC_NOT_FOUND = 404;로 정의되어 있는거다
				resp.sendError(HttpServletResponse.SC_NOT_FOUND, "못 찾았습니다");
				// 문법 오류
			}else if(code.equals("500")) {
				resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Server에서 문제가 있음");
			}
		}
		
		pw.println("</body>");
		pw.println("</html>");
		
		pw.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("post");
	}

}
