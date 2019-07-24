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

//@WebServlet("/info")
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
		// resp.sendRedirect("insertAf.jsp");
		// sendRedirect로 주면 get방식으로만 받는다. 데이터를 전송할 순 있지만 파라미터로만
		// 전송할 수 있다 setAttribute 하고 sendRedirect하니까 이동만하고 데이터가 안 간다
		req.getRequestDispatcher("insertAf.jsp").forward(req, resp);
		
		/*
		2가지 방법
		setAttribute로 데이터 묶고 getRequestDispatcher.(path).forward로 이동
		session으로 데이터 저장 후 sendRedirect로 이동 or getRequestDispatcher.(path).forward로 이동
		*/
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("HelloServlet doPost입니다");
		
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

}
