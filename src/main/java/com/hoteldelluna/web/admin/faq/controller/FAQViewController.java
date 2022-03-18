package com.hoteldelluna.web.admin.faq.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoteldelluna.web.entity.FAQTO;
import com.hoteldelluna.web.service.FAQDAO;

@WebServlet("/faqview")
public class FAQViewController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		FAQTO to = new FAQTO();
		to.setQ_no(request.getParameter("q_no"));
		
		FAQDAO dao = new FAQDAO();
		to = dao.FAQ_manager_View(to);
		
		request.setAttribute("to", to);
		
		request.getRequestDispatcher("/WEB-INF/view/admin/FAQ/FAQ_manager_view.jsp").forward(request, response);
	}
}
