package sample01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// JSP파일에서 request의 실제 이름은 HttpServletRequest이다
		// String name = request.getParameter("name");
		
		/*
			2가지 방법이 있다 servlet으로 하면 지금처럼 문자열을 적어야한다
			jsp로 하면 문자열을 적는 수고가 없다? 더 편하다
			
			servlet => java(html)
			JSP => html(Java)
		*/
		String name = req.getParameter("name");
		
		req.setCharacterEncoding("utf-8");
		
		resp.setContentType("text/html; charset-utf-8");
		
		PrintWriter pw = resp.getWriter();

		// println으로 밖으로 내보내는 것
		
		pw.println("<html>");

		pw.println("<head>");
		pw.println("<title>제목</title>");
		pw.println("</head>");

		pw.println("<body>");
		pw.println("<h3>Hello Servlet</h3>");
		pw.println("<p>Hello Servlet</p>");		

		pw.println("<p>" + name + "</p>");
		
		pw.println("</body>");
		
		pw.println("</html>");
		pw.close();
		
		//System.out.println("HelloServlet get 방식");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("HelloServlet post 방식");
	}
	
}
