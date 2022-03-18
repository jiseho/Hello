package com.hoteldelluna.web.admin.resrv.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoteldelluna.web.entity.Booking;
import com.hoteldelluna.web.service.BookingService;

@WebServlet("/resrvmanage")
public class ResrvManageController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		BookingService bookingService = new BookingService();
		List<Booking> bookingList = bookingService.bookingList();
		
		request.setAttribute("booking", bookingList);
		
		
		request.getRequestDispatcher("/WEB-INF/view/admin/reservation_manager.jsp").forward(request, response);
		
	
	}
}
