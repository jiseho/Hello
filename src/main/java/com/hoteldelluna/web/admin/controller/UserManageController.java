package com.hoteldelluna.web.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoteldelluna.web.entity.Login;
import com.hoteldelluna.web.service.LoginService;

@WebServlet("/usermanage")
public class UserManageController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		LoginService loginService = new LoginService();
		List<Login> loginList = loginService.getLoginList();
		request.setAttribute("userlist", loginList);
		
		request.getRequestDispatcher("/WEB-INF/view/admin/users_manager.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		LoginService loginService = new LoginService();
		
		String[] delIds = request.getParameterValues("del-id");
		String cmd = request.getParameter("cmd");
		
		if(cmd != null) {
			int flag=loginService.deleteLogin(delIds);
			
			List<Login> loginList = loginService.getLoginList();
			request.setAttribute("userlist", loginList);
			
			response.getWriter().println("<script type='text/javascript'>");
			if(flag==1){
				response.getWriter().println("alert('Success')");
				response.getWriter().println("location.href='usermanage'");
			}else if(flag==0){
				response.getWriter().println("alert('Fail to delete')");
				response.getWriter().println("history.back();");
			}
			response.getWriter().println("</script>");
		}
				
		/* response.sendRedirect("usermanage"); */
	}
}
