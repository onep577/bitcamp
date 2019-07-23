package sample10;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
			Cookie	 : user의 id 저장					String
			Session	 : user의 정보를 저장, 방문 횟수		Object
		*/
		
		//HttpSession session = null;
		HttpSession session = req.getSession(false);
		
		/*
			getSession(false)
			session object가 존재하지 않으면, 그냥 null을 반환한다
			우리가 새로 session을 생성해야한다
			
			getSession(true)
			session object가 존재하면, 현재 HttpSession을 반환한다
		*/
		
		if(session == null) {
			// session 없음
			pw.println("<p>세션이 존재하지 않습니다. 세션을 시작합니다</p>");
			session = req.getSession(true);
			session.setMaxInactiveInterval(30);
			session.setAttribute("visited", "1");
			// session의 key값 : visited, value값 : 1로 새로운 session 생성
		}else {
			// session 있음
			String visited = (String)session.getAttribute("visited");
			// getAttribute는 object로 리턴된다 String으로 형변환하자
			// "1"이 리턴된다
			int count = Integer.parseInt(visited);
			// 숫자 1이 된다
			count++;
			// 방문 횟수이기 때문에 증가시킨다
			pw.println("<p>방문 횟수는 " + count + "</p>");
			
			session.setAttribute("visited", count + "");
			// session은 중복되지 않는다
		}

		pw.println("<a href='hello'>다시 표시</a>");
		// 현재 HelloServlet으로 다시 온다
		// 즉, 세션이 없으면 새로운 세션을 생성하고 세션이 있으면 현재 세션을 증가시킨다
		
		pw.println("</body>");		
		pw.println("</html>");
		pw.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기는 HelloServlet post방식입니다");
	}

}
