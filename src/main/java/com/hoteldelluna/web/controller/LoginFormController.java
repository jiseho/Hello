package com.hoteldelluna.web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoteldelluna.web.entity.Login;
import com.hoteldelluna.web.service.LoginService;


@WebServlet("/loginform")
public class LoginFormController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		request
	    .getRequestDispatcher("/WEB-INF/view/loginform.jsp")
	    .forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("password");
		String name = request.getParameter("first_name") + request.getParameter("last_name");
		String birth = request.getParameter("birth_date");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone_number");
		
		Login login = new Login();
		login.setId(id);
		login.setPwd(pwd);
		login.setName(name);
		login.setBirth(birth);
		login.setGender(gender);
		login.setEmail(email);
		login.setPhone(phone);
		
		System.out.println(login.toString());  
		
		LoginService service = new LoginService();
		
		int flag = service.insertLogin(login);
		
		PrintWriter out = response.getWriter();
		
		out.println("<script type='text/javascript'>");
		if(flag == 1) {
			out.println("alert('Login Sucess!');");
			out.println("location.href='login';");
		} else if(flag == 0) {
			out.println("alert('Login Fail!');");
			out.println("history.back();");
		}
		out.println("</script>");
	}
}
