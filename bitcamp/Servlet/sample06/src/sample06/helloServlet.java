package sample06;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class helloServlet extends HttpServlet {

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
	
	public String createHTML(String methodType, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// 여기서 doGet, doPost로 리턴하면 get으로 오던지 post로 오던지 상관없다		
		String name = req.getParameter("name");
		
		int age = 0;
		String sage = req.getParameter("age");
		if(name == null || sage == null || name.equals("") || sage.equals("")) {
			resp.sendRedirect("index.html");
			// index.html로 이동
			// servlet 하나당 한번만 호출 가능하다
		}else {
			age = Integer.parseInt(sage);
		}
		
		String[] fruits = req.getParameterValues("fruit");
		if(fruits != null && fruits.length > 0) {
			for (int i = 0; i < fruits.length; i++) {
				System.out.println("과일 : " + fruits[i]);
			}
		}
		
		StringBuffer sb = new StringBuffer();
		// StringBuffer ?
		
		// sb.append는 String에 추가하는 것		
		sb.append("<html>");

		sb.append("<head>");
		sb.append("</script>");

		sb.append("</head>");

		sb.append("<body>");	
		sb.append("<p>" + methodType + "방식 </p>");
		sb.append("<p>이름 : " + name + "</p>");
		sb.append("<p>나이 : " + age + "</p>");
		
		for(int i = 0; i < fruits.length; i++) {
			sb.append("<p>과일 : "  + fruits[i] + "</p>");
		}		
		
		sb.append("</body>");
		sb.append("</html>");
			
		
		// String 생성 후 이제까지 추가했던 걸 전부 리턴한다
		return (new String(sb));
	}

}
