package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CoffeeDao;
import dto.CustomerDto;
import dto.PriceDto;

public class CoffeeServlet extends HttpServlet {
	
	CoffeeDao dao = new CoffeeDao();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("CustomerServlet doGet");
		
		String command = req.getParameter("command");
		
		if(command.equals("login")) {
			// 로그인 화면으로 간다
			System.out.println("CustomerServlet login");
			
			resp.sendRedirect("login.jsp");
			return;

		}else if(command.equals("account")) {
			// 회원가입 화면으로 간다
			System.out.println("CustomerServlet account");
			
			resp.sendRedirect("account.jsp");
			return;
		}
		
	} // doGet 오버라이드 함수

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("CustomerServlet doPost");
		
		// 한글깨짐 방지
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");

		
		// 문자 형태로 데이터를 보낼 수 있도록 PrintWriter 객체로 리턴한다
		PrintWriter pw = resp.getWriter();

		
		String command = req.getParameter("command");
		
		if(command.equals("accountAf")) {
			// 회원가입 실행
			System.out.println("CustomerServlet accountAf");
			
			String id = req.getParameter("id");
			String password = req.getParameter("password");
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			
			boolean b = dao.addMember(id, password, name, email);
			
			if(b) {
				System.out.println("가입성공");
				resp.sendRedirect("login.jsp");
				return;
			}else {
				System.out.println("가입실패");
				resp.sendRedirect("account.jsp");
				return;
			}
		}else if(command.equals("loginAf")) {
			// 로그인 실행
			System.out.println("CustomerServlet loginAf");
			
			String id = req.getParameter("id");
			String password = req.getParameter("password");
			
			System.out.println("id : " + id);
			System.out.println("password : " + password);
			
			boolean idok = dao.getUserId(id);
			System.out.println("idok : " + idok);
			List<PriceDto> list = dao.getPrice();
			
			if(idok) {
				boolean pwok = dao.getUserpw(id, password);
				System.out.println("pwok : " + pwok);
				
				if(pwok == true) {
					//pw.println("<%@ page language=\"java\" contentType=\"text/html; charset=UTF-8\" ");
					//pw.println("pageEncoding=\"UTF-8\"%> ");
					//pw.println("<!DOCTYPE html>");
					pw.println("<html>");
					pw.println("<head>");
					pw.println("</head>");
					pw.println("<body>");
					pw.println("<script type='text/javascript'>");
					//pw.println("alert(\"로그인 성공\")");
					pw.println("</script>");
					//pw.println("<%");
					//pw.println("request.setAttribute(\"priceList\", list); ");
					//pw.println("request.getRequestDispatcher(\"orderView.jsp\").forward(req, resp); ");
					//pw.println("%>");
					pw.println("</body>");
					pw.println("</html>");
					//pw.close();
					// pw.close(); 안하니까 alert창은 뜨지만 메시지가 안보인다
					// 중요!!!
					
					req.setAttribute("priceList", list);
					req.getRequestDispatcher("orderView.jsp").forward(req, resp);
				}else {
					System.out.println("pwok false일때");
					pw.println("<html>");
					pw.println("<head>");
					pw.println("</head>");
					pw.println("<body>");
					pw.println("<script type='text/javascript'>");
					pw.println("alert(\"비밀번호가 일치하지 않습니다\")");
					pw.println("</script>");
					pw.println("</body>");
					pw.println("</html>");
					pw.close();
					
					resp.sendRedirect("login.jsp");
					return;
				}
			}else {
				System.out.println("idok false일때");
				pw.println("<html>");
				pw.println("<head>");
				pw.println("</head>");
				pw.println("<body>");
				pw.println("<script type='text/javascript'>");
				pw.println("alert(\"아이디가 일치하지 않습니다\")");
				pw.println("</script>");
				pw.println("</body>");
				pw.println("</html>");
				pw.close();
				
				resp.sendRedirect("login.jsp");
				//req.getRequestDispatcher("login.jsp").forward(req, resp);
				return;
			}
		}
		
		
	} // doPost 오버라이드 함수

}
