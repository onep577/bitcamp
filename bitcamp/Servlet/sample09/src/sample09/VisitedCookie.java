package sample09;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/visitedCookie")
public class VisitedCookie extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기는VisitedCookie doGet입니다");
		
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
		pw.println("<p>VisitedCookie doGet</p>");
		
		Cookie cookies[] = req.getCookies();
		Cookie visitCookie = null;
		
		if(cookies != null) {
			// 쿠키가 있음 -> 검색, 갱신
			
			// 쿠키 검색
			for(int i = 0; i < cookies.length; i++) {
				if(cookies[i].getName().equals("visited")) {
					// cookie의 key값이 visited와 같을 때
					// visited는 HelloServlet에서 생성했다
					visitCookie = cookies[i];
					// key값이 visited일 때의 key값과 value값을 넣는다
					// cookie는 중복 허용하지 않는다
					break;
				}
			}
			
			// 찾음
			if(visitCookie != null) {
				int count = Integer.parseInt( visitCookie.getValue() ) + 1;
				pw.println("<p>" + count + "번째 방문입니다</p>");
				
				// 쿠키를 값을 갱신
				visitCookie.setValue(count + ""); // +1 한 count 넣는다
				visitCookie.setMaxAge( 10 );
				// 지속시간을 설정 할 수 있다
				// 365 * 24 * 60 * 60 -> 1년
				resp.addCookie(visitCookie); // 갱신
				// 갱신
			}
			// 못찾음
			else {
				// 쿠키가 없음 -> 생성
				pw.println("<p>첫번째 방문입니다</p>");
				Cookie newCookie = new Cookie("visited", "1"); // key값 value값
				resp.addCookie(newCookie); // 갱신
				// cookie에 집어넣은 이름으로 구분한다
			}
			
		}else {
			// 쿠키가 없음 -> 생성
			pw.println("<p>첫번째 방문입니다</p>");
			Cookie newCookie = new Cookie("visited", "1"); // key값 value값
			resp.addCookie(newCookie); // 갱신
			// cookie에 집어넣은 이름으로 구분한다
		}
		
		pw.println("</body>");		
		pw.println("</html>");
		pw.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기는VisitedCookie doPost입니다");
	}

}
