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
		String code = req.getParameter("code");
		
		// init-param -> web.xml
		String tax = this.getInitParameter("tax");
		// 현재 클래스안에 파라미터 이름을
		// 변경되지 않는 값을 설정하고 싶을 때 사용
		
		resp.setContentType("text/html; charset-utf-8");
		
		PrintWriter pw = resp.getWriter();
		// println으로 밖으로 내보내는 것		
		pw.println("<html>");

		pw.println("<head>");
		pw.println("<title>제목</title>");
		pw.println("</head>");

		pw.println("<body>");
		//pw.println("<p>code : " + code + "</p>");
		
		if(code.equals("200")) {
			pw.println("<p>200:SC_OK</p>");
		}
		else {
			if(code.equals("404")) {	// 403 : 접근제한
				// final int SC_NOT_FOUND = 404;로 정의되어 있는거다
				resp.sendError(HttpServletResponse.SC_NOT_FOUND, "못 찾았습니다");
			}else if(code.equals("500")) {
				resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
						"Server에서 문제가 있음");
			}
		}
		
		pw.println("<p>tax : " + tax + "</p>");
		
		pw.println("</body>");		
		pw.println("</html>");
		
		pw.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("post");
	}

}
