package com.hoteldelluna.web.admin.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoteldelluna.web.entity.Notice;
import com.hoteldelluna.web.service.NoticeService;

@WebServlet("/noticemodify")
public class NoticeModifyController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String no = request.getParameter("noticeNo");
		NoticeService noticeService = new NoticeService();
		Notice notice= noticeService.NoticeView(no);
		
		request.setAttribute("notice", notice);
		
		request.getRequestDispatcher("/WEB-INF/view/admin/notice/notice_modify.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		// TODO Auto-generated method stub
		Notice notice = new Notice();
		notice.setN_no(request.getParameter("noticeNo"));
		notice.setN_name(request.getParameter("writer"));
		notice.setN_subject(request.getParameter("subject"));
		notice.setN_pwd(request.getParameter("password"));
		notice.setN_content(request.getParameter("content"));
		
		System.out.println(notice.toString());
		NoticeService noticeService = new NoticeService();
		int flag = noticeService.noticeModifyOk(notice);
		
		response.getWriter().println("<script type='text/javascript'>");
		if(flag==0){
			response.getWriter().println("alert('Success.')");
			response.getWriter().println("location.href='noticemanage'");
		}else if(flag==1){
			response.getWriter().println("alert('Fail to edit')");
			response.getWriter().println("history.back();");
		}
		response.getWriter().println("</script>");
	}
}
