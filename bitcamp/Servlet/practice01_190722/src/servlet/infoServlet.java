package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Member;

@WebServlet("/infoServlet")
public class infoServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기는 infoServlet Get방식입니다");
		
		// 한글깨짐 방지
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		// 데이터 받기
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		String gender = req.getParameter("gender");
		String hobby[] = req.getParameterValues("hobby");
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		String day = req.getParameter("day");
		String pay = req.getParameter("pay");
		
		//Member mem = new Member(name, age, gender, hobby, year, month, day, pay);
		
		// 문자 형태로 데이터를 보낼 수 있도록 PrintWriter 객체로 리턴한다
		PrintWriter pw = resp.getWriter();
		
		// println으로 밖으로 내보내는 것
		pw.println("<html>");

		pw.println("<head>");
		pw.println("<title>제목</title>");
		pw.println("</head>");

		pw.println("<body>");
		pw.println("<p>infoServlet Get방식</p>");
		pw.println("<p>이름 : " + name + "</p>");
		pw.println("<p>나이 : " + age + "</p>");
		pw.println("<p>성별 : " + gender + "</p>");
		for (int i = 0; i < hobby.length; i++) {
			pw.println("<p>취미 : " + hobby[i] + "</p>");
		}
		pw.println("<p>취미 : " + gender + "</p>");
		
		if(gender.equals("남성")) {
			pw.println("<p>남성 사이트로 이동</p>");
			HttpSession session = req.getSession(true);
			session.setMaxInactiveInterval(10);

			session.setAttribute("member", new Member(name, age, gender, hobby, year, month, day, pay)); // 짐 싸!
			resp.sendRedirect("man");
			// 중복되지 않는다
			//req.getRequestDispatcher("man").forward(req, resp);  // 잘 가!
			// session.setAttribute로 데이터를 저장하면 forward, sendRedirect 둘 다 가능하다
			
		}else {
			pw.println("<p>여성 사이트로 이동</p>");
			req.setAttribute("mem", new Member(name, age, gender, hobby, year, month, day, pay)); // 짐 싸!
			req.getRequestDispatcher("lady").forward(req, resp);  // 잘 가!
		}
		
		pw.println("</body>");
		pw.println("</html>");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기는 infoServlet Post방식입니다");
		
		// 한글깨짐 방지
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		// 데이터 받기
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		String gender = req.getParameter("gender");
		String hobby[] = req.getParameterValues("hobby");
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		String day = req.getParameter("day");
		String pay = req.getParameter("pay");
		
		//Member mem = new Member(name, age, gender, hobby, year, month, day, pay);
		
		// 문자 형태로 데이터를 보낼 수 있도록 PrintWriter 객체로 리턴한다
		PrintWriter pw = resp.getWriter();
		
		// println으로 밖으로 내보내는 것
		pw.println("<html>");

		pw.println("<head>");
		pw.println("<title>제목</title>");
		pw.println("</head>");

		pw.println("<body>");
		pw.println("<p>infoServlet Post방식</p>");
		pw.println("<p>이름 : " + name + "</p>");
		pw.println("<p>나이 : " + age + "</p>");
		pw.println("<p>성별 : " + gender + "</p>");
		for (int i = 0; i < hobby.length; i++) {
			pw.println("<p>취미 : " + hobby[i] + "</p>");
		}
		pw.println("<p>취미 : " + gender + "</p>");
		
		if(gender.equals("남성")) {
			pw.println("<p>남성 사이트로 이동</p>");
			HttpSession session = req.getSession(true);
			session.setMaxInactiveInterval(10);

			session.setAttribute("member", new Member(name, age, gender, hobby, year, month, day, pay)); // 짐 싸!
			resp.sendRedirect("man");
			// 중복되지 않는다
			
		}else {
			pw.println("<p>여성 사이트로 이동</p>");
			req.setAttribute("mem", new Member(name, age, gender, hobby, year, month, day, pay)); // 짐 싸!
			req.getRequestDispatcher("lady").forward(req, resp);  // 잘 가!
		}
		
		pw.println("</body>");	
		pw.println("</html>");
	}

}
