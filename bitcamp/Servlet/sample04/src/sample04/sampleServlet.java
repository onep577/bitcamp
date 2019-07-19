package sample04;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class sampleServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		
		PrintWriter pw = resp.getWriter();
		pw.println( createHTML("GET", req, resp ) );
		pw.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		
		PrintWriter pw = resp.getWriter();
		pw.println( createHTML("POST", req, resp ) );
		pw.close();
	}
	
	public String createHTML(String methodType, HttpServletRequest req, HttpServletResponse resp) {
		// 여기서 doGet, doPost로 리턴하면 get으로 오던지 post로 오던지 상관없다		
		String text = req.getParameter("text");
		
		StringBuffer sb = new StringBuffer();
		// StringBuffer ?
		
		// sb.append는 String에 추가하는 것
		sb.append("<html>");

		sb.append("<head>");
		sb.append("<title>제목</title>");
		sb.append("</head>");

		sb.append("<body>");
		sb.append("<p>" + methodType + "방식 </p>");
		sb.append("</body>");
		
		sb.append("</html>");
		
		// String 생성 후 이제까지 추가했던 걸 전부 리턴한다
		return (new String(sb));
	}

}
