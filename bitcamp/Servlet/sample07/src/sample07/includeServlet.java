package sample07;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class includeServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기는 includeServlet doGet방식입니다");

		// 보낼 데이터가 깨지지 않도록 인코딩한다
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
		
		pw.println("<h2>여기는 includeServlet get방식입니다</h2>");
		pw.println("</body>");
		
		pw.println("</html>");
		//pw.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기는 includeServlet doPost방식입니다");
	}

}
