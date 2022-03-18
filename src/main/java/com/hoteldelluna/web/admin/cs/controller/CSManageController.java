package com.hoteldelluna.web.admin.cs.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoteldelluna.web.entity.CSBoardTO;
import com.hoteldelluna.web.service.CSBoardDAO;

@WebServlet("/csmanage")
public class CSManageController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ListAction 호출");
		
		CSBoardDAO dao = new CSBoardDAO();
		ArrayList<CSBoardTO> csboardLists = dao.csboardList();
		
		request.setAttribute("csboardLists", csboardLists);
		
		request.getRequestDispatcher("/WEB-INF/view/admin/cs/cs_manager.jsp").forward(request, response);
	}
}
