package com.hoteldelluna.web.admin.faq.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoteldelluna.web.entity.FAQTO;
import com.hoteldelluna.web.service.FAQDAO;

@WebServlet("/faqwrite")
public class FAQWriteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.getRequestDispatcher("/WEB-INF/view/admin/FAQ/FAQ_manager_write.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		// TODO Auto-generated method stub
		FAQTO to = new FAQTO();
		to.setQ_name (request.getParameter("q_name"));
		to.setQ_subject (request.getParameter("q_subject"));
		to.setQ_content (request.getParameter("q_content"));	
		to.setQ_pwd (request.getParameter("q_pwd"));
		FAQDAO dao = new FAQDAO();
		int flag = dao.FAQ_manager_Write_Ok(to);
		
		request.setAttribute("flag", flag);
		
		response.getWriter().println("<script type='text/javascript'>");
		if(flag==0){
			//out.println("정상 입력");
			response.getWriter().println("alert('Success');");
			response.getWriter().println("location.href='faqmanage';");
		}else if(flag == 1){
			//out.println("비정상");
			response.getWriter().println("alert('Fail to write');");
			response.getWriter().println("history.back();");		
		}
		response.getWriter().println("</script>");
	}
}
