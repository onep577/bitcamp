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

@WebServlet("/world")
public class WorldServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기는 WorldServlet get방식입니다");

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
		pw.println("<h3>world servlet</h3>");
		
		HttpSession session = null;
		//HttpSession session = req.getSession(false);
		
		if(session == null) {
			pw.println("<p>세션이 존재하지 않습니다. 세션을 시작합니다</p>");
			pw.println("<p>----------------------------- 세션 등록</p>");
			session = req.getSession(true);
			
			session.setAttribute("name", "홍길동");
			session.setAttribute("age", "28");
			// session의 key값 : name, value값 : 홍길동
			// session의 key값 : age, value값 : 28
		}
		
		

		pw.println("<p>등록되어 있는 session의 object를 표시합니다</p>");
		
		String name = (String)session.getAttribute("name");
		pw.println("<p>name : " + name + "</p>");
		pw.println("----------------------- Enumeration");
		
		Enumeration<String> enum_session = session.getAttributeNames();
		// getAttributeNames 이름이 포함된 모든 세션을 문자열 object로 리턴한다
		
		while(enum_session.hasMoreElements()) {
			// 세션이 있으면 들어온다
			String key = enum_session.nextElement();
			// key는 세션의 name이다 nextElement는 값을 주고 다음 Element로 이동한다
			String val = (String)session.getAttribute(key);
			// val은 세션의 value이다
			pw.println("<p>" + key + " : " + val + "</p>");
		}
		
		pw.println("<br>");
		pw.println("<a href=\"delsession\">age object 삭제</a>");

		
		pw.println("<br>");
		pw.println("<a href=\"invalSession\">Session 삭제</a>");
		
		/*
			java		java, html
			servlet	->	servlet
			
			sendRedirect : parameter	sample?id='id'
			
			MemberDto mem
			
			request.serAttribute("dto", mem);	-> getAttribute("dto")
			forward
			잠깐 통에 넣고 털어 넣으면 끝
			
			session.setAttribute("dto", mem);	-> session.getAttribute("dto")
			forward, sendRedirect			
			session은 서버공간에 있는 독립 객체이다
			session.setAttribute session.getAttribute 기한을 정해놓은 시간까지 유지된다
		*/
		
		
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기는 WorldServlet post방식입니다");
	}

}
