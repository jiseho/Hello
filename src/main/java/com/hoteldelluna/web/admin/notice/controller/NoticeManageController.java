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

@WebServlet("/noticemanage")
public class NoticeManageController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeService noticeService = new NoticeService();
		List<Notice> noticelist = noticeService.noticelist();
		
		request.setAttribute("notice", noticelist);
		
		request.getRequestDispatcher("/WEB-INF/view/admin/notice/notice_manager.jsp").forward(request, response);
	}
	
}
