package com.hoteldelluna.web.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hoteldelluna.web.entity.FAQTO;
import com.hoteldelluna.web.service.FAQDAO;

@WebServlet("/faqlist")
public class FaqListController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//System.out.println(session.getAttribute("sessionId"));
		session.getAttribute("sessionId");
		session.getAttribute("userNo");
		// TODO Auto-generated method stub
		FAQDAO dao=new FAQDAO();
		ArrayList<FAQTO> faqlists=dao.faqlist();
		request.setAttribute("faqlists", faqlists);
		
		request.getRequestDispatcher("/WEB-INF/view/FAQ.jsp").forward(request, response);
	}
}
