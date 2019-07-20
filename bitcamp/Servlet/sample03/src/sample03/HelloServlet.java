package sample03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

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

	// 여기서 doGet, doPost로 리턴하면 get으로 오던지 post로 오던지 상관없다
	public String createHTML(String methodType, HttpServletRequest req, HttpServletResponse resp) {
		// Web Browser에서 받은 데이터이다
		String name = req.getParameter("name");
		
		// StringBuffer : 문자열을 전송하기 위해 문자열을 담는 일시적인 저장 장치
		StringBuffer sb = new StringBuffer();
		
		// sb.append는 StringBuffer 마지막에 추가하는 것
		sb.append("<html>");

		sb.append("<head>");
		sb.append("<title>제목</title>");
		sb.append("</head>");

		sb.append("<body>");
		sb.append("<h3>Hello Servlet</h3>");
		sb.append("<p>Hello Servlet</p>");		
		sb.append("<p>" + methodType + "방식 </p>");
		sb.append("<p>" + name + "</p>");		
		sb.append("</body>");
		
		sb.append("</html>");
		
		//String s = new String(sb);
		//return s;
		
		// String 생성 후 이제까지 추가했던 걸 전부 리턴한다
		return (new String(sb));
	}
	
}
