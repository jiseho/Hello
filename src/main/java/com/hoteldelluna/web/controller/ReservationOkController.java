package com.hoteldelluna.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoteldelluna.web.entity.Booking;
import com.hoteldelluna.web.service.BookingService;

@WebServlet("/reservationOk")
public class ReservationOkController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		Booking to=new Booking();
		to.setB_u_no(Integer.parseInt(request.getParameter("userNumber")));
		to.setB_r_no(Integer.parseInt(request.getParameter("roomNumber")));
		to.setB_name(request.getParameter("name"));
		to.setB_phone(request.getParameter("phone"));
		to.setB_email(request.getParameter("email"));
		to.setB_requirement(request.getParameter("requirement"));
		
		//카드정보
		if(request.getParameter("cardName")==null) {
			to.setB_cardName("");
		}else {
			to.setB_cardName(request.getParameter("cardName"));
		}
		
		if(request.getParameter("select")==null) {
			to.setB_cardC("");
		}else {
			to.setB_cardC(request.getParameter("select"));
		}
		if(request.getParameter("cardNumber")==null) {
			to.setB_cardN("");
		} else {
			to.setB_cardN(request.getParameter("cardNumber"));
		}
		
		if(request.getParameter("cardMonth")==null || request.getParameter("cardYear")==null) {
			to.setB_expirationD("");
		} else {
			to.setB_expirationD(request.getParameter("cardMonth")+"/"+request.getParameter("cardYear"));
		}
		
		if(request.getParameter("cvc") ==null) {
			to.setB_cvc("");
		}else {
			to.setB_cvc(request.getParameter("cvc"));
		}
		
		to.setB_adult(request.getParameter("adult"));
		to.setB_child(request.getParameter("child"));
		to.setB_chkin(request.getParameter("checkin"));
		to.setB_chkout(request.getParameter("checkout"));
		to.setB_ttlprice(Integer.parseInt(request.getParameter("totalprice")));
		to.setB_nights(Integer.parseInt(request.getParameter("nights")));
		to.setB_room(request.getParameter("room"));
		BookingService dao=new BookingService();
		int flag=dao.reservationOk(to);	

		response.getWriter().println("<script type='text/javascript'>");
		if(flag==0){
			response.getWriter().println("alert('예약이 완료되었습니다.')");
			response.getWriter().println("location.href='mypage?userNumber=" + to.getB_u_no() + "'");
		}else if(flag==1){
			response.getWriter().println("alert('예약에 실패하였습니다.')");
			response.getWriter().println("history.back();");
		}
		response.getWriter().println("</script>");
	}
}
