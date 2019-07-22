package cls;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Member;

@WebServlet("/sample")
public class SampleServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기서 SampleServlet doGet입니다");
		
		req.setCharacterEncoding("utf-8");
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String mydata = req.getParameter("mydata");
		
		System.out.println("id : " + id);
		System.out.println("pwd : " + pwd);
		System.out.println("mydata : " + mydata);
		
		//Member mem = (Member)req.getAttribute("mem");
		
		

		resp.setContentType("text/html; charset=utf-8");
		PrintWriter pw = resp.getWriter();
		// println으로 밖으로 내보내는 것
		
		pw.println("<html>");

		pw.println("<head>");
		pw.println("<title>제목</title>");
		pw.println("</head>");

		pw.println("<body>");
		pw.println("<h3>SampleServlet doGet</h3>");
		pw.println("<p>id : " + id + "</p>");
		pw.println("<p>pwd : " + pwd + "</p>");
		pw.println("<p>mydata : " + mydata + "</p>");
		//pw.println("<p>mem:" + mem.toString() + "</p>");
		pw.println("</body>");
		
		pw.println("</html>");
		pw.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기는 SampleServlet doPost입니다");
		
		req.setCharacterEncoding("utf-8");
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String mydata = req.getParameter("mydata");
		
		System.out.println("id : " + id);
		System.out.println("pwd : " + pwd);
		System.out.println("mydata : " + mydata);
		
		//Member mem = (Member)req.getAttribute("mem");
		
		

		resp.setContentType("text/html; charset=utf-8");
		PrintWriter pw = resp.getWriter();
		// println으로 밖으로 내보내는 것
		
		pw.println("<html>");

		pw.println("<head>");
		pw.println("<title>제목</title>");
		pw.println("</head>");

		pw.println("<body>");
		pw.println("<h3>SampleServlet doPost</h3>");
		pw.println("<p>id : " + id + "</p>");
		pw.println("<p>pwd : " + pwd + "</p>");
		pw.println("<p>mydata : " + mydata + "</p>");
		//pw.println("<p>mem:" + mem.toString() + "</p>");
		pw.println("</body>");
		
		pw.println("</html>");
		pw.close();
	}

}
