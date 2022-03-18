package com.hoteldelluna.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.User;

import com.hoteldelluna.web.entity.Booking;
import com.hoteldelluna.web.entity.CSBoard;
import com.hoteldelluna.web.entity.Login;
import com.hoteldelluna.web.service.BookingService;
import com.hoteldelluna.web.service.CSBoardService;
import com.hoteldelluna.web.service.LoginService;
import com.hoteldelluna.web.service.UsersService;

@WebServlet("/mypage")
public class MypageController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int userNumber = Integer.parseInt(request.getParameter("userNumber"));
		BookingService bookingService = new BookingService();
		List<Booking> bookings =  bookingService.foundbooking(userNumber);
		System.out.println(bookings);
		request.setAttribute("bookings", bookings);
		
		LoginService loginService = new LoginService();
		Login users = loginService.getLogin((String)session.getAttribute("sessionId"));
		request.setAttribute("users", users);
		
		CSBoardService boardService = new CSBoardService();
		ArrayList<CSBoard> board = boardService.csboardList(userNumber);
		request.setAttribute("board", board);
		
		request.getRequestDispatcher("/WEB-INF/view/mypage.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		HttpSession session = request.getSession();
		LoginService loginService = new LoginService();
		Login users = loginService.getLogin((String)session.getAttribute("sessionId"));
		
		users.setName((request.getParameter("userName")==null)?" ":request.getParameter("userName"));
		users.setBirth((request.getParameter("birth")==null)?" ":request.getParameter("birth"));
		users.setEmail(request.getParameter("email")==null?" ":request.getParameter("email"));
		users.setPhone((request.getParameter("phone")==null)?" ":request.getParameter("phone"));
		
		UsersService service = new UsersService();
		int flag = service.mypageOK(users);
		
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		if(flag == 0) {
			out.println("alert('success.');");
			out.println("location.href='mypage?userNumber="+users.getNo() +"';");
		} else if(flag == 1) {
			out.println("alert('fail.');");
			out.println("history.back();");
		}
		out.println("</script>");
	}
}
