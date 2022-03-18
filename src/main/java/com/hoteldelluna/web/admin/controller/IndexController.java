package com.hoteldelluna.web.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoteldelluna.web.entity.Booking;
import com.hoteldelluna.web.entity.CSBoard;
import com.hoteldelluna.web.entity.FAQTO;
import com.hoteldelluna.web.entity.Login;
import com.hoteldelluna.web.entity.Notice;
import com.hoteldelluna.web.entity.Room;
import com.hoteldelluna.web.service.BookingService;
import com.hoteldelluna.web.service.CSBoardService;
import com.hoteldelluna.web.service.FAQDAO;
import com.hoteldelluna.web.service.LoginService;
import com.hoteldelluna.web.service.NoticeService;
import com.hoteldelluna.web.service.RoomService;

@WebServlet("/adminIndex")
public class IndexController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		LoginService loginService = new LoginService();
		List<Login> login = loginService.getLoginList();
		int totalLogin = login.size();
		request.setAttribute("totalLogin", totalLogin);
		
		RoomService roomservice = new RoomService();
		ArrayList<Room> room = roomservice.roomList();
		int totalRoom = room.size();
		request.setAttribute("totalRoom", totalRoom);
		
		BookingService bookingService = new BookingService();
		List<Booking> booking = bookingService.bookingList();
		int totalBooking = booking.size();
		request.setAttribute("totalBooking", totalBooking);
		
		CSBoardService csBoardService = new CSBoardService();
		ArrayList<CSBoard> csboard = csBoardService.csboardList();
		int totalcs = csboard.size();
		
		FAQDAO faqdao = new FAQDAO();
		List<FAQTO> faq = faqdao.FAQ_manager();
		int totalfaq = faq.size();
		
		NoticeService noticeService = new NoticeService();
		ArrayList<Notice> notice = noticeService.noticelist();
		int totalnotice = notice.size();
		
		int totalPost = totalcs + totalfaq + totalnotice; 
		request.setAttribute("totalPost", totalPost);
		
		request.getRequestDispatcher("/WEB-INF/view/admin/admin_index.jsp").forward(request, response);
	}
}
