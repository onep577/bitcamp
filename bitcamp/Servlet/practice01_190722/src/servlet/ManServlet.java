package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Member;

@WebServlet("/man")
public class ManServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기는 ManServlet get방식입니다");
		
		// 한글깨짐 방지
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
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

		HttpSession session = req.getSession();
		pw.println("<h3>여기는 ManServlet get방식입니다</h3>");
		
		Member mem = (Member)session.getAttribute("member");
		
		
		pw.println("이름 : <input type='text' value=" + mem.getName() + "><br>");
		pw.println("나이 : <input type='text' value=" + mem.getAge() + "><br>");
		pw.println("성별 : <input type='text' value=" + mem.getGender() + "><br>");
		for (int i = 0; i < mem.getHobby().length; i++) {
			pw.println("취미" + (i+1) + " : <input type='text' value=" + mem.getHobby()[i] + "><br>");
		}
		pw.println("생년월일 : <input type='text' value=" 
				+ mem.getDateYear() + mem.getDateMonth() + mem.getDateDay() + "><br>");
		pw.println("연봉 : <input type='text' value=" + mem.getPay() + "><br>");
		/**/
		pw.println("</body>");
		
		pw.println("</html>");
		//pw.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기는 ManServlet post방식입니다");
	}

}
