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

@WebServlet("/faqmodify")
public class FAQModifyController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		FAQTO to = new FAQTO();
		to.setQ_no(request.getParameter("q_no"));
		
		FAQDAO dao = new FAQDAO();
		to = dao.FAQ_manager_Modify(to);
		
		request.setAttribute("to",to);
		
		request.getRequestDispatcher("/WEB-INF/view/admin/FAQ/FAQ_manager_modify.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		// TODO Auto-generated method stub
		FAQTO to = new FAQTO();
		   to.setQ_no(request.getParameter("q_no"));
		   to.setQ_subject(request.getParameter("q_subject"));    
		   to.setQ_pwd(request.getParameter("q_pwd"));
		   to.setQ_content(request.getParameter("q_content"));
		   
		   FAQDAO dao = new FAQDAO();
		   int flag = dao.FAQ_manager_Modify_Ok(to);
		   
		   PrintWriter out = response.getWriter();
		   String q_no = request.getParameter("q_no");
		   out.println("<script type='text/javascript'>");
		   if(flag == 0) {
		      out.println("alert('Success');");
		      out.println("location.href='./faqview?q_no=" + q_no + "';");
		   } else if(flag == 1) {
		      out.println("alert('Wrong password');");
		      out.println("history.back();");
		   } else if(flag == 2) {
		      out.println("alert('Fail to edit');");
		      out.println("history.back();");
		   }
		   out.println("</script>");
	}
}
