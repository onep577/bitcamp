package sample07;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class helloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		String name = req.getParameter("name");
		System.out.println("name : " + name);
		
		/*
			html : a, form
			java script : location.href
			jquery : submit()
			java : response.sendRedirect("sampleServlet?name" + name);
			
			forward : 전진 -> servlet, *.jsp
			include : 불러오기. 자기 위치를 고수하면서 갖고온다
		*/

		
		req.setCharacterEncoding("utf-8");		
		resp.setContentType("text/html; charset-utf-8");
		
		PrintWriter pw = resp.getWriter();

		// println으로 밖으로 내보내는 것
		
		pw.println("<html>");

		pw.println("<head>");
		pw.println("<title>제목</title>");
		pw.println("</head>");

		pw.println("<body>");		
		pw.println("<p>여기는 Hello Servlet Start입니다</p>");
		
		
		
		RequestDispatcher dispatch = req.getRequestDispatcher("include");
			// 불러오고자 하는 링크 즉, web.xml의 url-parttern
		dispatch.include(req, resp);
		/**/
		/*
		RequestDispatcher dispatch = req.getRequestDispatcher("forward");
		dispatch.forward(req, resp);
		/**/
		// 위에 코드 한 줄로 썼다
		//req.getRequestDispatcher("forward").forward(req, resp);
		
		
		
		pw.println("<p>여기는 Hello Servlet End입니다</p>");
		pw.println("</body>");
		
		pw.println("</html>");
		pw.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

}
