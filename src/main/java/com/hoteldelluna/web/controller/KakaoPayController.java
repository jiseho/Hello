package com.hoteldelluna.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hoteldelluna.web.entity.Booking;
import com.hoteldelluna.web.service.BookingService;
import com.hoteldelluna.web.service.KaKaoPay;

@WebServlet("/kakaoPay")
public class KakaoPayController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		int userNo= (int)session.getAttribute("userNo");
		Booking to=new Booking();
		to.setB_u_no(Integer.parseInt(request.getParameter("userNumber")));
		to.setB_r_no(Integer.parseInt(request.getParameter("roomNumber")));
		to.setB_name(request.getParameter("name"));
		to.setB_phone(request.getParameter("phone"));
		to.setB_email(request.getParameter("email"));
		to.setB_requirement(request.getParameter("requirement"));
		
		to.setB_adult(request.getParameter("adult"));
		to.setB_child(request.getParameter("child"));
		to.setB_chkin(request.getParameter("checkin"));
		to.setB_chkout(request.getParameter("checkout"));
		to.setB_ttlprice(Integer.parseInt(request.getParameter("totalprice"))); // o
		to.setB_nights(Integer.parseInt(request.getParameter("nights")));
		to.setB_room(request.getParameter("room")); // o
		BookingService dao=new BookingService();
		int flag=dao.reservationOk(to);	
		
		String roomtype = request.getParameter("room");
		String totalprice = request.getParameter("totalprice");
		
		KaKaoPay kp = new KaKaoPay();
		String nextUrl = kp.kakaoPayReady(roomtype , totalprice, userNo);
				
				
		response.sendRedirect(nextUrl);
	}
}
