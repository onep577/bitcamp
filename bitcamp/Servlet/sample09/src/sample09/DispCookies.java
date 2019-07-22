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

@WebServlet("/dispCookies")
public class DispCookies extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기는 DispCookies doGet입니다");
		
		req.setCharacterEncoding("utf-8");		
		resp.setContentType("text/html; charset-utf-8");
		
		PrintWriter pw = resp.getWriter();
		// println으로 밖으로 내보내는 것
		
		pw.println("<html>");

		pw.println("<head>");
		pw.println("<title>제목</title>");
		pw.println("</head>");

		pw.println("<body>");
		pw.println("<p>DispCookies doGet</p>");
		
		Cookie cookies[] = req.getCookies();
		
		if(cookies != null) {
			for(int i = 0; i < cookies.length; i++) {
				String value = cookies[i].getValue();
				
				pw.println("<p>");
				pw.println(cookies[i].getName()); // cookie의 key값들
				pw.println(" : ");
				pw.println(value);
				pw.println("</p>");
				// cookie를 전부 다 꺼낼 수 있다
			}
		}
		
		//pw.println("<a href=visitedCookie>방문 횟수</a>");
		pw.println("</body>");		
		pw.println("</html>");
		pw.close();
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기는 DispCookies doPostt입니다");
	}

}
