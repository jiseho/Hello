package com.hoteldelluna.web.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hoteldelluna.web.entity.Notice;
import com.hoteldelluna.web.service.NoticeService;

@WebServlet("/noticelist")
public class NoticeListController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.getAttribute("sessionId");
		session.getAttribute("userNo");
		
		// TODO Auto-generated method stub
		NoticeService dao=new NoticeService();
		ArrayList<Notice> noticelists = dao.noticelist();
		request.setAttribute("noticelists", noticelists);
		
		request.getRequestDispatcher("/WEB-INF/view/Notice.jsp").forward(request, response);
	}
}
