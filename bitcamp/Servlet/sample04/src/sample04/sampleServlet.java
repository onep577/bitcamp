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
		// Web Browser에 보낼 데이터가 깨지지 않도록 인코딩한다
		resp.setContentType("text/html;charset=utf-8");
		
		// Web Browser에 문자 형태로 데이터를 보낼 수 있도록 PrintWriter 객체로 리턴한다
		PrintWriter pw = resp.getWriter();
		
		// PrintWriter 객체를 사용해 문자열의 형태로 Web Browser에 내보낸다
		pw.println( createHTML( "GET", req, resp ) );
		pw.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Web Browser에 보낼 데이터가 깨지지 않도록 인코딩한다
		resp.setContentType("text/html;charset=utf-8");

		// Web Browser에 문자 형태로 데이터를 보낼 수 있도록 PrintWriter 객체로 리턴한다
		PrintWriter pw = resp.getWriter();

		// PrintWriter 객체를 사용해 문자열의 형태로 Web Browser에 내보낸다
		pw.println( createHTML( "POST", req, resp ) );
		pw.close();
	}
	
	public String createHTML(String methodType, HttpServletRequest req, HttpServletResponse resp) {
		// 어떻게 가도 GET방식이라고 나온다
		// <a 태그에서는 post방식을 지정할 수 없다 default인 get 방식이 나온다
		String text = req.getParameter("text");
		
		StringBuffer sb = new StringBuffer();
		// StringBuffer ?
		
		// sb.append는 String에 추가하는 것
		sb.append("<html>");

		sb.append("<head>");
		sb.append("<title>제목</title>");
		sb.append("</head>");

		sb.append("<body>");
		sb.append("<h2>여기는 sampleServlet.java입니다</h2>");
		sb.append("<p>" + methodType + "방식 </p>");
		sb.append("<p>helloServlet 입력값 : " + text + "방식 </p>");
		sb.append("</body>");
		
		sb.append("</html>");
		
		// String 생성 후 이제까지 추가했던 걸 전부 리턴한다
		return (new String(sb));
	}

}
