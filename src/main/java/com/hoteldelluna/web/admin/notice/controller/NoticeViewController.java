package com.hoteldelluna.web.admin.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoteldelluna.web.entity.Notice;
import com.hoteldelluna.web.service.NoticeService;

@WebServlet("/noticeview")
public class NoticeViewController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String no = request.getParameter("noticeNo");
		NoticeService noticeService = new NoticeService();
		Notice notice= noticeService.NoticeView(no);
		
		request.setAttribute("notice", notice);
		
		request.getRequestDispatcher("/WEB-INF/view/admin/notice/notice_view.jsp").forward(request, response);
	}
}
