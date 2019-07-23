package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.jws.WebService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Member;

@WebServlet("/info")
public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("HelloServlet doGet입니다");
		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String[] hobby = req.getParameterValues("hobby");
		String age = req.getParameter("age");
		String etc = req.getParameter("etc");
		
		Member mem = new Member(id, pwd, hobby, age, etc);
		
		req.setAttribute("info", mem);
		req.getRequestDispatcher("insertAf.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("HelloServlet doPost입니다");
	}

}
