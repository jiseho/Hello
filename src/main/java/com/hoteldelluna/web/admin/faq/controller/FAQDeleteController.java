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

@WebServlet("/faqdelete")
public class FAQDeleteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		FAQTO to = new FAQTO();
		to.setQ_no(request.getParameter("q_no"));

		FAQDAO dao = new FAQDAO();
		to = dao.FAQ_manager_Delete(to);
		request.setAttribute("to", to);
		
		request.getRequestDispatcher("/WEB-INF/view/admin/FAQ/FAQ_manager_delete.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		FAQTO to = new FAQTO();
		to.setQ_no(request.getParameter("q_no"));
		to.setQ_pwd(request.getParameter("q_pwd"));
		
		FAQDAO dao = new FAQDAO();
		int flag = dao.FAQ_manager_Delete_Ok(to);
		
		PrintWriter out = response.getWriter();

		out.println("<script type='text/javascript'>");
		if(flag==0){		
			out.println("alert('Success');");
			out.println("location.href='./faqmanage';");
		}else if(flag == 1){
			out.println("alert('Wrong password');");
			out.println("history.back();");		
		}else if(flag == 2){
			out.println("alert('Fail to delete');");
			out.println("history.back();");
		}
		out.println("</script>");
		
	}
}
