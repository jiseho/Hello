package com.hoteldelluna.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hoteldelluna.web.entity.FAQTO;
import com.hoteldelluna.web.service.FAQDAO;

@WebServlet("/faq_view")
public class FaqViewController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//System.out.println(session.getAttribute("sessionId"));
		session.getAttribute("sessionId");
		session.getAttribute("userNo");
		
		// TODO Auto-generated method stub
		FAQTO to=new FAQTO();
		to.setQ_no(request.getParameter("q_no"));
		
		FAQDAO dao=new FAQDAO();
		to=dao.faqView(to);
		
		request.setAttribute("to", to);
		
		request.getRequestDispatcher("/WEB-INF/view/FAQ_view.jsp").forward(request, response);
		
	}
}
