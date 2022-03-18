package com.hoteldelluna.web.admin.faq.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoteldelluna.web.entity.FAQTO;
import com.hoteldelluna.web.service.FAQDAO;

@WebServlet("/faqreply")
public class FAQReplyController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		FAQTO to = new FAQTO();
		to.setQ_no(request.getParameter("q_no"));
		
		
		request.getRequestDispatcher("/WEB-INF/view/admin/FAQ/FAQ_manager_reply.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		// TODO Auto-generated method stub
		FAQTO to = new FAQTO();
		to.setQ_no(request.getParameter("q_no"));
		to.setQ_subject(request.getParameter("q_subject"));
		to.setQ_name(request.getParameter("q_name"));
		to.setQ_pwd(request.getParameter("q_pwd"));
		to.setQ_content(request.getParameter("q_content"));
		
		to.setQ_wip(request.getRemoteAddr());
		
		FAQDAO dao = new FAQDAO();
		int flag = dao.FAQ_manager_Reply_Ok(to);
		
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		if(flag==0){
			//out.println("정상 입력");
			out.println("alert('Success');");
			out.println("location.href='faqmanage';");
		}else if(flag == 1){
			//out.println("비정상");
			out.println("alert('Fail to write');");
			out.println("history.back();");		
		}
		out.println("</script>");
	}
}
