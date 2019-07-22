package sample08;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Member;

@WebServlet("/location")	// <servlet>과 <servlet-mapping>를 대신해서 쓸 수 있다
// anotation(주석문) : 여기까지 와라 지시 주석문
// servlet 의존성 왜? 우리가 생성하지않고 servlet이 생성했기 때문이다
public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기는 HelloServlet doGet입니다");
		
		// 한글 인코딩 인코딩 안하면 우리가 쓰는 OS의 형태로 들어간다
		// 우리는 window를 쓴다 ms94?
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String mydata = req.getParameter("mydata");
		
		System.out.println("id : " + id);
		System.out.println("pwd : " + pwd);
		System.out.println("mydata : " + mydata);
		/**/
		
		
		
		//req.setAttribute("id", id);
		//req.setAttribute("pwd", pwd);
		req.setAttribute("mem", new Member(id, pwd)); // 짐 싸!
		// forward를 사용하면 setAttribute를 사용할 수 있다
		
		

		//resp.sendRedirect("sample");
		// 가긴 가는데 짐은 놓고 감 doGet으로 들어감
		resp.sendRedirect("sample?id=" + id + "&pwd=" + pwd + "&mydata=" + mydata);
		// sendRedirect : get으로 받던 post로 받던 get으로 간다
		// 파라이터를 통해 데이터를 전송할 수 있다
		// 하지만 데이터가 많을 때는 파라미터를 꾸며주는 것이 껄끄럽다
		
		
		
		//req.getRequestDispatcher("sample?id=" + id + "&pwd=" + "pwd").forward(req, resp);
		// dispatcher안에 파라미터 적어서는 데이터 전송 안된다
		
		//req.getRequestDispatcher("sample").forward(req, resp);  // 잘 가!
  		
		// Servlet(hello) -> Servlet(Sample)로 이동
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기는 HelloServlet doPost입니다");
		
		// 한글 인코딩 인코딩 안하면 우리가 쓰는 OS의 형태로 들어간다
		// 우리는 window를 쓴다 ms94?
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String mydata = req.getParameter("mydata");
		
		System.out.println("id : " + id);
		System.out.println("pwd : " + pwd);
		System.out.println("mydata : " + mydata);
		/**/
		
		
		
		//req.setAttribute("id", id);
		//req.setAttribute("pwd", pwd);
		req.setAttribute("mem", new Member(id, pwd)); // 짐 싸!
		// forward를 사용하면 setAttribute를 사용할 수 있다
		
		

		//resp.sendRedirect("sample");
		// 가긴 가는데 짐은 놓고 감 doGet으로 들어감
		//resp.sendRedirect("sample?id=" + id + "&pwd=" + pwd + "&mydata=" + mydata);
		// sendRedirect : get으로 받던 post로 받던 get으로 간다
		// 파라이터를 통해 데이터를 전송할 수 있다
		// 하지만 데이터가 많을 때는 파라미터를 꾸며주는 것이 껄끄럽다
		
		
		
		//req.getRequestDispatcher("sample?id=" + id + "&pwd=" + "pwd").forward(req, resp);
		// dispatcher안에 파라미터 적어서는 데이터 전송 안된다
		
		req.getRequestDispatcher("sample").forward(req, resp);  // 잘 가!
  		
		// Servlet(hello) -> Servlet(Sample)로 이동
		 
	}

}
