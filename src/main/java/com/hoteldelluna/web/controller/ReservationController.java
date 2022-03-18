package com.hoteldelluna.web.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hoteldelluna.web.entity.Login;
import com.hoteldelluna.web.entity.Room;
import com.hoteldelluna.web.service.LoginService;
import com.hoteldelluna.web.service.RoomService;

@WebServlet("/reservation")
public class ReservationController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("pg_token"));
		
		request.getRequestDispatcher("/WEB-INF/view/reservation.jsp")
		.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String u_id = (String)session.getAttribute("sessionId");
		
		if( u_id != null) {
			int roomNo=Integer.parseInt(request.getParameter("roomNo").trim());
			
			RoomService roomService = new RoomService(); // 룸 정보
			Room room = roomService.foundRoom(roomNo);
			request.setAttribute("room", room);
			
			LoginService loginService = new LoginService(); //id로 정보 찾아라.
			Login login = loginService.getLogin(u_id);
			request.setAttribute("users", login);
			System.out.println(login);
			
			
			Date format1;
			Date format2;
			try {
				
				format1 = new SimpleDateFormat("MM/dd/yyyy").parse(request.getParameter("datepicker1"));
				format2 = new SimpleDateFormat("MM/dd/yyyy").parse(request.getParameter("datepicker2"));
				long diff = format2.getTime() - format1.getTime();
				long diffDays = diff / (24 * 60 * 60 * 1000) ;
				int nights = Math.toIntExact(diffDays);
				int price = Integer.parseInt(room.getR_price().replace(",", "").trim()); 
				int totalprice = nights * price;
				request.setAttribute("totalprice", totalprice);
				request.setAttribute("nights", nights);
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher("/WEB-INF/view/reservation.jsp")
			.forward(request, response);
		}
		else {
			response.setContentType("text/html; charset=utf-8");
			
			response.getWriter().println("<script type='text/javascript'>");
			
			response.getWriter().println("alert('로그인이 필요합니다..')");
			response.getWriter().println("location.href='login'");
			
			response.getWriter().println("</script>");
		}
	}
}
