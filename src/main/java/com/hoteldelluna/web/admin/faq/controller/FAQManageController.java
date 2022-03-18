package com.hoteldelluna.web.admin.faq.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoteldelluna.web.entity.FAQTO;
import com.hoteldelluna.web.service.FAQDAO;

@WebServlet("/faqmanage")
public class FAQManageController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FAQDAO dao = new FAQDAO();
		ArrayList<FAQTO> FAQ_managers=dao.FAQ_manager();
		request.setAttribute("FAQ_managers", FAQ_managers);
		
		request.getRequestDispatcher("/WEB-INF/view/admin/FAQ/FAQ_manager.jsp").forward(request, response);
	}
}
