package sample09;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hello")
public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기는 HelloServlet doGet입니다");
		
		// 한글 인코딩 인코딩 안하면 우리가 쓰는 OS의 형태로 들어간다
		// 우리는 window를 쓴다 ms94?
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		
		
		// Cookie를 생성만 했다
		Cookie cookie = new Cookie("id", "abc123");
		// Cookie에 값을 넣었다
		resp.addCookie(cookie);
		
		cookie = new Cookie("pwd", "qwer");
		resp.addCookie(cookie);
		
		cookie = new Cookie("visited", "1");
		resp.addCookie(cookie);
		
		

		// 문자 형태로 데이터를 보낼 수 있도록 PrintWriter 객체로 리턴한다
		PrintWriter pw = resp.getWriter();

		// println으로 밖으로 내보내는 것		
		pw.println("<html>");

		pw.println("<head>");
		pw.println("<title>제목</title>");
		pw.println("</head>");

		pw.println("<body>");
		pw.println("<p>HelloServlet doGet</p>");
		pw.println("<a href=dispCookies>Cookie를 표시</a>");
		pw.println("</body>");
		
		pw.println("</html>");
		pw.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기는 HelloServlet doPost입니다");
	}

}
