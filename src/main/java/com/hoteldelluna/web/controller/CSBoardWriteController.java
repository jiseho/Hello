package com.hoteldelluna.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hoteldelluna.web.entity.CSBoard;
import com.hoteldelluna.web.entity.Login;
import com.hoteldelluna.web.service.CSBoardService;
import com.hoteldelluna.web.service.LoginService;

@MultipartConfig(
//		location = "/tmp", 절대경로를 써야되는데 보통 설정ㄱ안함.
		fileSizeThreshold = 1024*1024, //1M 바이트 넘으면 디스크쓰자.
		maxFileSize = 1024*1024*50, //하나의 파일 사이즈 (50M)
		maxRequestSize = 1024*1024*50*5 //전체 사이즈 (250M)
)

@WebServlet("/csboardWrite")
public class CSBoardWriteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sessionId");
		
		if(id != null) {
		LoginService loginService = new LoginService();
		Login login = loginService.getLogin(id);
		
		request.setAttribute("user", login);
		
		request.getRequestDispatcher("/WEB-INF/view/cs.jsp").forward(request, response);
		} 
		else {
			response.setContentType("text/html; charset=utf-8");
			
			response.getWriter().println("<script type='text/javascript'>");
			
			response.getWriter().println("alert('Need Login')");
			response.getWriter().println("location.href='login'");
			
			response.getWriter().println("</script>");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sessionId");
		LoginService loginService = new LoginService();
		Login user = loginService.getLogin(id);
		
		System.out.println(request.getParameter("name"));
		
		CSBoard csboard = new CSBoard();
		csboard.setC_u_no(user.getNo());
		csboard.setC_branch(request.getParameter("branch"));
		csboard.setC_name(request.getParameter("name"));
		csboard.setC_subject(request.getParameter("subject"));
		csboard.setC_email(user.getEmail());
		csboard.setC_password(request.getParameter("password"));
		csboard.setC_content(request.getParameter("content"));
		csboard.setC_filename(request.getParameter("file"));
		
		System.out.println(csboard.toString());
		
		CSBoardService boardService = new CSBoardService();
		int flag = boardService.boardWrite(csboard);
		
		response.getWriter().println("<script type='text/javascript'>");
		if(flag == 0) {
			response.getWriter().println("alert('Success')");
			response.getWriter().println("location.href='mypage?userNumber=" + user.getNo()+ "'");
		}else if(flag==1){
			response.getWriter().println("alert('Fail to write')");
			response.getWriter().println("history.back();");
		}
		response.getWriter().println("</script>");
		
		
	}
}
