package com.hoteldelluna.web.admin.cs.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoteldelluna.web.entity.CSBoardTO;
import com.hoteldelluna.web.service.CSBoardDAO;


@WebServlet("/csreply")
public class CSReplyController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReplyAction 호출");
		
		request.getRequestDispatcher("/WEB-INF/view/admin/cs/cs_manager_view_reply.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		System.out.println("ReplyOkAction 호출");

		CSBoardTO to = new CSBoardTO();
		String c_no = request.getParameter("c_no");
		
		to.setC_subject(request.getParameter("c_subject"));
		to.setC_name(request.getParameter("c_name"));
		to.setC_password(request.getParameter("c_password"));
		to.setC_content(request.getParameter("c_content"));
		to.setC_wip(request.getRemoteAddr());

		CSBoardDAO dao = new CSBoardDAO();
		int flag = dao.csboardReplyOk(to);
		
		request.setAttribute("flag", flag);
		
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		if(flag == 0) {
			out.println("alert('Success');");
			out.println("location.href='csmanage';");
		} else if(flag == 1) {
			out.println("alert('Fail to write');");
			out.println("history.back();");
		}
		out.println("</script>");
	}
}
