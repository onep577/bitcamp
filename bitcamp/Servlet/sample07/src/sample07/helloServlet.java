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
		System.out.println("여기는 helloServlet doGet입니다");
		
		// 전송 받은 데이터
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
		pw.println("<p>여기는 helloServlet Start Get방식입니다</p>");
		
		
		// 아래코드는 Get방식으로 간다
		
		RequestDispatcher dispatch = req.getRequestDispatcher("include");
			// 불러오고자 하는 링크 즉, web.xml의 url-parttern
		dispatch.include(req, resp);
		/**/
		/*
		RequestDispatcher dispatch = req.getRequestDispatcher("forward");
		dispatch.forward(req, resp);
		/**/
		// 위에 코드 한 줄로 썼다 아래코드는 Get방식으로 간다
		//req.getRequestDispatcher("forward").forward(req, resp);
		
		
		
		pw.println("<p>여기는helloServlet End입니다</p>");
		pw.println("</body>");
		
		pw.println("</html>");
		pw.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기는 helloServlet doPost입니다");
	}

}
