package com.hoteldelluna.web.admin.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoteldelluna.web.entity.CSBoardTO;
import com.hoteldelluna.web.service.CSBoardDAO;

@WebServlet("/csview")
public class CSViewController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("viewAction 호출");
		String c_no = request.getParameter("c_no");

//		CSBoardTO to = new CSBoardTO();
		CSBoardDAO dao = new CSBoardDAO();
		CSBoardTO to = dao.csboardView(c_no);
		to.setC_no(request.getParameter("c_no"));
		
//		to = dao.csboardView(to);
		
		request.setAttribute("to", to);
		
		request.getRequestDispatcher("/WEB-INF/view/admin/cs/cs_manager_view.jsp").forward(request, response);
	}
}
