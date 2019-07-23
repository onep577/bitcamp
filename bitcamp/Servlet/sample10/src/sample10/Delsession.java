package sample10;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/delsession")
public class Delsession extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기는 Delsession get방식입니다");

		// 한글 인코딩 인코딩 안하면 우리가 쓰는 OS의 형태로 들어간다
		// 우리는 window를 쓴다 ms94?
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		

		// 문자 형태로 데이터를 보낼 수 있도록 PrintWriter 객체로 리턴한다
		PrintWriter pw = resp.getWriter();
		
		// println으로 밖으로 내보내는 것		
		pw.println("<html>");

		pw.println("<head>");
		pw.println("<title>제목</title>");
		pw.println("</head>");

		pw.println("<body>");
		
		HttpSession session = req.getSession();
		session.removeAttribute("age");
		pw.println("<p>현재 등록 되어있는 세션 표시</p>");
		
		Enumeration<String> enum_session = session.getAttributeNames();
		
		while(enum_session.hasMoreElements()) {
			String key = enum_session.nextElement();
			String val = (String)session.getAttribute(key);
			
			pw.println("<p>" + key + " : " + val + "</p>");
		}
		
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기는 Delsession get방식입니다");
	}

}
