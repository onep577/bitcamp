package sample10;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/hello")
public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기는 HelloServlet get방식입니다");

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
		
		/*
			Cookie : id 저장		String			
			Session : user 정보를 저장, 방문 횟수		Object
		*/
		
		HttpSession session = req.getSession(false);
		/*
			getSession(false)
			session object가 존재하면, 현재 HttpSession을 반환한다
			존재하지 않으면, 그냥 null을 반환한다
			
			getSession(true)
			session object가 존재하면, 현재 HttpSession을 반환한다
			존재하지 않으면, 새로 session을 생성한다
		*/
		
		if(session == null) {
			pw.println("<p>세션이 존재하지 않습니다. 세션을 시작합니다</p>");
			session = req.getSession(true);
			session.setMaxInactiveInterval(30);
			session.setAttribute("visited", "1");
		}else {
			String visited = (String)session.getAttribute("visited");
			int count = Integer.parseInt(visited);
			
			count++;
			
			pw.println("<p>방문 횟수는 " + count + "</p>");
			
			session.setAttribute("visited", count + "");
			// 중복되지 않는다
		}

		pw.println("<a href=\"hello\">다시 표시</a>");
		
		pw.println("</body>");		
		pw.println("</html>");
		pw.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기는 HelloServlet post방식입니다");
	}

}
