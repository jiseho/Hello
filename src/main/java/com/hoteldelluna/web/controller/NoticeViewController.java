package com.hoteldelluna.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hoteldelluna.web.entity.Notice;
import com.hoteldelluna.web.service.NoticeService;

@WebServlet("/notice_view")
public class NoticeViewController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//System.out.println(session.getAttribute("sessionId"));
		session.getAttribute("sessionId");
		session.getAttribute("userNo");
		
		// TODO Auto-generated method stub
		String no = request.getParameter("n_no");
		NoticeService service = new NoticeService();
		Notice notice = service.NoticeView(no);
		
		request.setAttribute("n_no", notice);
		
		request.getRequestDispatcher("/WEB-INF/view/Notice_view.jsp").forward(request, response);
	}
}
